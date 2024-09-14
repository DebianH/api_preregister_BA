import { Request, Response } from "express";
import { PrismaClient } from '@prisma/client'
import { getAllOrganizations as fetchAllOrganizations, createOrganization as addNewOrganization  } from '../../services/services';
const prisma = new PrismaClient();


export const createOrganization = async (req: Request, res: Response) => {
    try {
        const data = req.body;
        const newOrganization = await addNewOrganization(data);

        res.statusCode = 201;
        res.end(JSON.stringify({
          status: 201,
          message: 'Organizacion creada correctamente',
          response: newOrganization
        }));
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Error al crear la organización' });
    }
};

export const getAllOrganizations = async (req: Request, res: Response) => {
    try {
        const organizations = await fetchAllOrganizations();
        res.statusCode = 200;
        res.end(JSON.stringify({
          status: 200,
          message: 'Todas las Organizaciones obtenidas correctamente',
          response: organizations,
        }));
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Error al obtener las Organizaciones' });
    }
};

export const getOrganizationById = async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const organization = await prisma.organization.findUnique({
            where: { id: Number(id) },
            select: {
                stateRegistration: true,
                address: {
                    select: {
                        city: true,
                    }
                },
                representative: {
                    select: {
                        name: true,
                    }
                }
            },

        });
        if (!organization) {
            return res.status(404).json({ message: 'Organización no encontrada' });
        }
        res.json(organization);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Error al obtener la organización' });
    }
}