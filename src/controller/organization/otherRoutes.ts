import { Router, Request, Response, NextFunction } from 'express';
import * as otherService from '../../services/otherServices';

//TODO: Hacer los metodos para la visualizacion de errores
export const getOrganizationInfo = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const organizationsInfo = await otherService.fetchInfoOrganization()

        res.status(200).json({
            status: 200,
            message: "Informacion de las Organizaciones obtenidas exitosamente",
            response: organizationsInfo
        })

    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error al obtener la información de la organización" });
        next(error);
    }
}


export const getOrgnizationInfoById = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { id } = req.params;
        const organizationInfo = await otherService.fetchInfoOrganizationById(Number(id))
        res.status(200).json({
            status: 200,
            message: "Informacion de la Organización obtenida exitosamente",
            response: organizationInfo
        })
    } catch (error) {
        console.error(error);
        res.status(500).json({ message: "Error al obtener la información de la organización" });
    }
}

export const getStateOrganizationById = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { id } = req.params;
        const statusRegistration = await otherService.fetchStateOrganization(Number(id))
        res.status(200).json({
            status: 200,
            message: "Informacion del estado obtenido exitosamente",
            response: statusRegistration
        })
    } catch (error: any) {
        console.error(error);
        res.status(500).json({ message: "Error al obtener la información del estado la organización" });
    }
}

export const getManipulationAreaById = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { id } = req.params;
        const manipulationArea = await otherService.fetchManipulationArea(Number(id))
        res.status(200).json({
            status: 200,
            message: "URL obtenido exitosamente",
            response: manipulationArea
        })
    } catch (error: any) {
        console.error(error);
        res.status(500).json({ message: "Error al obtener la URL de la organización" });
    }
}

export const getConstitutionById = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { id } = req.params;
        const constitutionData = await otherService.fetchConstitution(Number(id));

        if (!constitutionData || Object.keys(constitutionData).length === 0) {
            return res.status(404).json({
                status: 404,
                message: "No se encontraron datos de constitución para esta organización"
            });
        }

        const { miesConstitution, curiaConstitution, mspConstitution, mineducConstitution } = constitutionData;

        if (!miesConstitution && !curiaConstitution && !mspConstitution && !mineducConstitution) {
            return res.status(404).json({
                status: 404,
                message: "No se encontraron datos de constitución en MIES, CURIA, MSP, MINEDUC para esta organización"
            });
        }

        res.status(200).json({
            status: 200,
            message: "Constitución obtenida exitosamente",
            response: { miesConstitution, curiaConstitution, mspConstitution, mineducConstitution }
        });
    } catch (error: any) {
        console.error("Error al obtener los datos de constitución", error);
        res.status(500).json({ message: "Error al obtener los datos de constitución" });
        next(error);
    }
};



export const getFoodHandlerById = async (req: Request, res: Response, next: NextFunction) => {
    try {
        const { id } = req.params;
        const foodHandlers = await otherService.fetchFoodHandler(Number(id));

        if (!foodHandlers || foodHandlers.length === 0) {
            return res.status(404).json({
                status: 404,
                message: "No se encontró personal de manejo de alimentos para esta organización"
            });
        }

        // Accede al primer manipulador de alimentos en el array
        const foodHandler = foodHandlers[0];
        const { identityCard, medicalCertification, foodHandlingCertification } = foodHandler;

        if (!identityCard && !medicalCertification && !foodHandlingCertification) {
            return res.status(404).json({
                status: 404,
                message: "No se encontraron datos del personal de manejo de alimentos"
            });
        }

        res.status(200).json({
            status: 200,
            message: "Información del personal de manejo de alimentos obtenida exitosamente",
            response: { identityCard, medicalCertification, foodHandlingCertification }
        });
    } catch (error: any) {
        console.error("Error al obtener los datos del personal de manejo de alimentos", error);
        res.status(500).json({ message: "Error al obtener los datos del personal de manejo de alimentos" });
        next(error);
    }
};


