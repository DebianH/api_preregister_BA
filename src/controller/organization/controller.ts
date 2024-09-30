import { NextFunction, Request, Response } from "express";
import { PrismaClient } from "@prisma/client";
import * as service from "../../services/services";
import { IdSchema, OrganizationSchema } from "../../types/globalTypes";
import { z } from "zod";

const prisma = new PrismaClient();


// Middleware para manejar URLs malformadas o no encontradas
export const notFoundHandler = (req: Request, res: Response) => {
  return res.status(404).json({ message: "URL incorrecta" });
};

// Crear nueva organización
export const createOrganization = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    // Validación con Zod
    const parsedData = OrganizationSchema.parse(req.body);

    const newOrganization = await service.createOrganization(parsedData);

    if (!newOrganization) {
      return res.status(400).json({ message: "Los datos no pudieron ser procesados correctamente" });
    }
    res.status(201).json({
      status: 201,
      message: "Organización creada correctamente",
      response: newOrganization,
    });
  } catch (error: any) {
    if (error instanceof z.ZodError) {
      return res.status(400).json({ message: "Error de validación", errors: error.errors });
    }
    console.error(error);
    res.status(500).json({ message: "Error al crear la organización" });
    next(error);
  }
};

// Obtener todas las organizaciones
export const getAllOrganizations = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const organizations = await service.fetchAllOrganizations();
    res.status(200).json({
      status: 200,
      message: "Todas las Organizaciones obtenidas correctamente",
      response: organizations,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error al obtener las Organizaciones" });
    next(error);
  }
};

// Obtener organización por ID con verificación de existencia
export const getOrganizationById = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    // Validación del ID con Zod
    const { id } = IdSchema.parse(req.params);

    // Verificar si la organización existe en la base de datos
    const organization = await prisma.organization.findUnique({
      where: { id: Number(id) },
      select: {
        stateRegistration: true,
        address: {
          select: {
            city: true,
          },
        },
        representative: {
          select: {
            name: true,
          },
        },
      },
    });

    if (!organization) {
      return res.status(404).json({ message: "Organización no encontrada" });
    }

    res.json(organization);
  } catch (error) {
    if (error instanceof z.ZodError) {
      return res.status(400).json({
        message: "Error de validación de parámetros",
        errors: error.errors,
      });
    }
    console.error(error);
    res.status(500).json({ message: "Error al obtener la organización" });
    next(error);
  }
};

// Actualización parcial de una organización (PATCH)
export const updatePatchOrganization = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const { id } = req.params;
    const idOrganization = Number(id);

    // Validación parcial con Zod
    const parsedData = OrganizationSchema.partial().parse(req.body);

    const onUpdateOrganization = await service.patchDataOrganization(idOrganization, parsedData);

    return res.status(200).json({
      message: "La organización ha sido actualizada correctamente",
      response: onUpdateOrganization,
    });

  } catch (error) {
    if (error instanceof z.ZodError) {
      return res.status(400).json({ message: "Error de validación", errors: error.errors });
    }
    console.error("Error updating organization:", error);
    next(new Error("Invalid data structure or database error"));
  }
};

// Actualización completa de una organización (PUT)
export const updatePutOrganization = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const { id } = req.params;
    const productId = Number(id);

    // Validación completa con Zod
    const parsedData = OrganizationSchema.parse(req.body);

    const onUpdateOrganization = await service.putDataOrganization(productId, parsedData);

    res.status(200).json({
      message: "La organización ha sido actualizada correctamente",
      response: onUpdateOrganization,
    });
  } catch (error) {
    if (error instanceof z.ZodError) {
      return res.status(400).json({ message: "Error de validación", errors: error.errors });
    }
    console.error(error);
    next(new Error("Invalid data structure or database error"));
  }
};

// Eliminar una organización
export const deleteOrganization = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const { id } = IdSchema.parse(req.params); // Validación del ID

    const onDeleteOrganization = await service.deleteOrganizationData(Number(id));
    return res.status(200).json({
      status: 200,
      message: `La organización con el id ${id} sido eliminada correctamente`,
      response: onDeleteOrganization,
    });
  } catch (error) {
    if (error instanceof z.ZodError) {
      return res.status(400).json({
        status: 400,
        message: "Error de validación de parámetros",
        response: "Datos no válidos",
      });
    }
    res.status(500).json({
      status: 500,
      message: "Invalid data structure or database error",
      response: "Error inesperado",
    });
  }
};


