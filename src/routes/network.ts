import express, { Router } from "express";
import { PrismaClient } from '@prisma/client'
import * as Organization from "../controller/organization/controller";
import * as OtherRouter from "../controller/organization/otherRoutes";
import * as beneficiariesController from '../controller/organization/beneficiaries';


const prisma = new PrismaClient();
const router = express.Router();

// TODO: Correccion de errores, mandar las verificaciones con ID, al final de la sentencia y las implementaciones antes, porque zod verifica antes esas 

router.get('/all', Organization.getAllOrganizations)

//From Tickets
router.get('/organizationinfo', OtherRouter.getOrganizationInfo)
router.get('/organizationinfo/:id', OtherRouter.getOrgnizationInfoById)


// From MS
router.get('/:id', Organization.getOrganizationById)

router.post('/create', Organization.createOrganization)

router.put('/:id', Organization.updatePutOrganization )

router.patch('/:id', Organization.updatePatchOrganization)

router.delete('/:id', Organization.deleteOrganization)

export default router