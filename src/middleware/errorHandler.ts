import { ZodError } from "zod";
import { NextFunction, Request, Response } from "express";

export const errorHandler = (
  err: any,
  req: Request,
  res: Response,
  next: NextFunction
) => {
  if (res.headersSent) {
    return next(err);
  }

  // Manejar error de método HTTP incorrecto
  if (err.statusCode === 405 || err.message?.includes("method")) {
    return res.status(405).json({
      status: 405,
      message: "Método no permitido",
      response: `El método ${req.method} no está permitido para esta ruta`,
    });
  }

  if (err instanceof ZodError) {
    // Error de validación de Zod
    res.status(400).json({
      status: 400,
      message: "Error de validación",
      response: "Datos no válidos",
      errors: err.errors,
    });
    next(err);
  }

  const statusServer = res.statusCode !== 200 ? res.statusCode : 500;
  let message: string;
  let response: any;

  switch (statusServer) {
    case 400:
      message = err.message || "Solicitud Incorrecta";
      response =
        err.response || `Datos no válidos: ${JSON.stringify(req.body)}`;
      break;
    case 404:
      message = err.message || "Recurso no encontrado";
      response = `URL inválida. Verifica el endpoint y los parámetros.`;
      break;
    default:
      message = err.message || "Error interno del servidor";
      response = `Error de Servidor`;
      break;
  }

  return res.status(statusServer).json({
    status: statusServer,
    message: message,
    response: response,
  });
};


// Controlador del servidor por ZOD, para manejar errores de validación
export const errorHandlerServer = (
  error: unknown,
  res: Response,
  next: NextFunction
) => {
  if (res.headersSent) {
    return next(error);
  }

  if (error instanceof ZodError) {
    const errores = error.errors;
    
    const erroresFiltrados = errores.map(err => {
  
      return {
        // received: err.message.split("received ")[1]?.replace(/['"]/g, "") || "unknown",
        // path: err.path.join("."),
        message: err.message.includes("Invalid enum value") 
        ? `Invalid value. Expected 'PENDING', received '${err.message.split("received ")[1]?.replace(/['"]/g, "")}'`
        : err.message,
      };
    });


    return res.status(400).json({
      status: 400,
      message: `Error de Syntaxis en la petición`,
      errors: erroresFiltrados,
      response: "El servidor no pudo procesar la solicitud",
    });
  }
  next(error);
};
