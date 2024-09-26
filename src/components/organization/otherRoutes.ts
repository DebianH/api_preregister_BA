import { Router, Request, Response, NextFunction } from 'express';
import * as otherService from '../../services/otherServices';

//TODO: Hacer los metodos para la visualizacion de errores
export const getOrgnizationInfo = async (req:Request, res:Response, next:NextFunction) => {
    try{
      const organizationsInfo = await otherService.fetchInfoOrganization()

        res.status(200).json({
            status: 200,
            message: "Informacion de las Organizaciones obtenidas exitosamente",
            response: organizationsInfo
        })

    }catch(error){
        console.error(error);
        res.status(500).json({message: "Error al obtener la información de la organización"});
        next(error);
    }
}


export const getOrgnizationPersonal = async (req:Request, res:Response, next:NextFunction) => {
    try{
      const organizationPersonal = await otherService.fetchPersonalOrganization()

      res.status(200).json({
          status: 200,
          message: "Informacion personal de las Organizaciones obtenidas exitosamente",
          response: organizationPersonal
      })
    }catch(error){
        console.error(error);
        res.status(500).json({message: "Error al obtener la información personal de la organización"});
        next(error);
    }
}


export const getOrgnizationInfoById = async (req:Request, res:Response, next:NextFunction) => {
    try{
        const { id } = req.params;
        const organizationInfo = await otherService.fetchInfoOrganizationById(Number(id))
        res.status(200).json({ 
            status: 200,
            message: "Informacion de la Organización obtenida exitosamente",
            response: organizationInfo
        })
    }catch(error){
        console.error(error);
        res.status(500).json({message: "Error al obtener la información de la organización"});
    }
}
export const getOrgnizationPersonalById = async (req:Request, res:Response, next:NextFunction) => {
    try{

    }catch(error){
        
    }
}
