import { NextFunction, Request, Response } from "express";

export const errorHandler = (err: any, req: Request, res: Response, next: NextFunction) => {
  //Determina el estado por defecto del servidor
  const statusServer = err.status || 500;

  // Manejo de erorres en servidor
  let message: string;
  let response: any;

  switch (statusServer) {
    case 400:
      message = err.message || "Bad Request: Solicitud Incorrecta";
      response = err.response || `Invalid data ${JSON.stringify(req.body)}`;
      break; 

    case 401:
      message = err.message || "No autorizado";
      response = err.response || `Authorization error`;
      break;

    case 403:
      message = err.message || "Prohibido";
      response = err.response || `Access denied`;
      break;

    case 404:
      message = err.message || "Recurso no encontrado";
      response = err.response || `Resource not found: ${req.originalUrl}`;
      break;

    default:
      message = err.message || "Error interno del servidor";
      response = err.response || `Unexpected error`;
      break;
  }

  // Repuesta del servidor
  res.status(statusServer).json({
    status: statusServer,
    message: message,
    response: response,
  });
  next();
};
