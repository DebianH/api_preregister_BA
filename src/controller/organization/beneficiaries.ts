import { NextFunction, Request, Response } from "express";
import * as benificaryService from "../../services/beneficiariesService";
import { IdSchema, OrganizationSchema } from "../../types/globalTypes";
import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient({ log: ['query', 'info', 'warn', 'error'] });
export const getbeneficiariesFromOrganization = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const organizationPersonal = await benificaryService.fetchBeneficiariesOrganization()
        
        res.status(200).json({
            status: 200,
            message: "Informacion de las personas beneficiarias las Organizaciones obtenidas exitosamente",
            response: organizationPersonal
        })

    } catch (error: unknown) {
        if (error instanceof Error) {
            res.status(400).json({ error: error.message });
        } else {
            res.status(400).json({ error: "Unknown error" });
        }
    }
};

export const getOrgnizationPersonalById = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const id = parseInt(req.params.id);
        const organizationPersonal = await benificaryService.fetchBeneficiariesOrganizationById(id)

        res.status(200).json({
            status: 200,
            message: "Informacion de las personas beneficiarias las Organizaciones obtenidas exitosamente",
            response: organizationPersonal
        })

    } catch (error: unknown) {
        if (error instanceof Error) {
            res.status(400).json({ error: error.message });
        } else {
            res.status(400).json({ error: "Unknown error" });
        }
    }
}

//TODO: Arreglar el metodo update, para que se pueda actualizar la lista beneficiarios, revisar claves foraneas
export const createBeneficiariesOrganization = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { id } = req.params;

        const beneficiariesData = await benificaryService.postBeneficiariesOrganization(Number(id), req.body);

        if(beneficiariesData === null) {
            res.status(400).json({
                status: 400,
                message: "Error al actualizar los beneficiarios",
                response: beneficiariesData
            });
        }
        
        res.status(200).json({
            status: 200,
            message: "Beneficiarios actualizados correctamente",
            response: beneficiariesData,
        });
    } catch (error) {
        console.error("Error al actualizar los beneficiarios", error);
        res.status(500).json({
            status: 500,
            message: "Error al actualizar los beneficiarios",
        });
    }
}

