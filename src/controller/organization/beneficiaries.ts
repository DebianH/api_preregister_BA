import { NextFunction, Request, Response } from "express";
import * as benificaryService from "../../services/beneficiariesService";
import { IdSchema, OrganizationSchema } from "../../types/globalTypes";
import { PrismaClient } from "@prisma/client";
import { ReadStream } from "fs";
import { Readable } from "stream";

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
export const updateListBeneficiaries = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { id } = req.params;
        const data = req.body;

        const beneficiariesData = await benificaryService.updateListBeneficiaries(Number(id), data);

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
        next(error);
    }
}

export const getDocumentProofById = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { id } = req.params;

        const file = await prisma.beneficiaryDocumentProof.findUnique({
            where: { id: Number(id) }
        });        
    
        if (!file || !file.documentProof) {
            return res.status(404).send('Archivo no encontrado');
        }
    
        // Configurar el encabezado para la descarga de archivo
        res.setHeader('Content-Type', 'application/pdf');
        res.setHeader('Content-Disposition', 'attachment; filename=document.pdf');
    
        // Crear un Readable stream a partir del Buffer almacenado en `file.documentProof`
        const readStream = new Readable({
            read() {
                this.push(file.documentProof);
                this.push(null);
            }
        });
        readStream.pipe(res.status(200).json({
            status: 200,
            message: "Documento obtenido correctamente",
            response: "Descargarlo por el navegador"
        }));
    
    } catch (error) {
        console.error("Error al obtener el documento", error);
        res.status(500).json({
            error: "Error de servidor"  
        })
    }

}

