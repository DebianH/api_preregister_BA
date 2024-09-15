import { NextFunction, Request, response, Response } from "express";
import { Prisma, PrismaClient } from "@prisma/client";
import * as service from "../../services/services";
const prisma = new PrismaClient();

export const createOrganization = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const data = req.body;
    const newOrganization = await service.createOrganization(data);

    res.statusCode = 201;
    res.end(
      JSON.stringify({
        status: 201,
        message: "Organizacion creada correctamente",
        response: newOrganization,
      })
    );
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error al crear la organización" });
    next(error);
  }
};

export const getAllOrganizations = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const organizations = await service.fetchAllOrganizations();
    res.statusCode = 200;
    res.end(
      JSON.stringify({
        status: 200,
        message: "Todas las Organizaciones obtenidas correctamente",
        response: organizations,
      })
    );
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error al obtener las Organizaciones" });
    next(error);
  }
};

export const getOrganizationById = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const { id } = req.params;
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
    console.error(error);
    res.status(500).json({ message: "Error al obtener la organización" });
    next(error);
  }
};

export const updatePatchOrganization = async (
  req: Request,
  res: Response,
  next: NextFunction
) => {
  try {
    const { id } = req.params;
    const idOrganization = Number(id);

    const onUpdateOrganization = await service.patchDataOrganization(idOrganization, req.body);

    return res.status(200).json({
      message: "La organización ha sido actualizada correctamente",
      response: onUpdateOrganization,
    })

  } catch (error) {
    console.error("Error updating organization:", error);
    next(new Error("Invalid data structure or data base error"));
  }
};

export const updatePutOrganization = async ( req: Request, res: Response, next: NextFunction ) => {
  try{
    const { id } = req.params;
    const productId = Number(id);

    const onUpdateOrganization = await service.putDataOrganization(productId, req.body);

    res.status(200).json({
      message: "La Organizacion ha sido actualizada correctamente",
      response: onUpdateOrganization,
    })

  }catch(error){
    next(new Error("Invalid data structure or data base error"));
  }
}


export const deleteOrganization = async ( req: Request, res: Response, next: NextFunction ) => {
  try {
    const { id } = req.params;
    const idOrganization = Number(id);
    
    if(isNaN(idOrganization)){
      return res.status(400).json({ 
        message: "ID de la organizacion invalido",
        response: {},
      })
    }
    
    const onDeleteOrganization = service.deleteOrganizationData(idOrganization);
    return res.status(200).json({
      message: "La organización ha sido eliminada correctamente",
      response: onDeleteOrganization,
    });
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: "Error al eliminar la organización" });
    next(error);
  }
};
