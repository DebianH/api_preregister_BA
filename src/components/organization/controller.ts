import { Request, Response } from "express";
import { PrismaClient } from '@prisma/client'
const prisma = new PrismaClient();

export const createOrganization = async (req: Request, res: Response) => {
    try {
        const { nameOrganization, ruc, phone, email, address, coordinates, representative, purpose, dependentsBenefit, motive, numPreRegister } = req.body;

        const newOrganization = await prisma.organization.create({
            data: {
                nameOrganization,
                ruc,
                phone,
                email,
                purpose,
                dependentsBenefit,
                motive,
                numPreRegister,
                address: {
                    create: {
                        street: address.street,
                        city: address.city,
                        neighborhood: address.neighborhood,
                        province: address.province,
                        country: address.country,
                    }
                },
                coordinates: {
                    create: {
                        latitude: coordinates.latitude,
                        longitude: coordinates.longitude,
                    }
                },
                representative: {
                    create: {
                        name: representative.name,
                        numDoc: representative.numDoc,
                        role: representative.role,
                        email: representative.email,
                        phone: representative.phone,
                    }
                }
            }
        });

        res.status(201).json(newOrganization);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Error al crear la organización' });
    }
};

export const getAllOrganizations = async (req: Request, res: Response) => {
    try {
        const organizations = await prisma.organization.findMany({
            include: {
                address: true,
                coordinates: true,
                representative: true
            }
        });
        res.json(organizations);
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: 'Error al obtener las organizaciones' });
    }
};

export const getOrganizationById = async (req: Request, res: Response) => {
    try {
        const { id } = req.params;
        const organization = await prisma.organization.findUnique({
            where: { id: Number(id) },
            select: {
                stateRegister: true,
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