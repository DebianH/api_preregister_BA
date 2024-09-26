import express, { Router } from "express";
import { PrismaClient } from '@prisma/client'
import { success } from "../network/response";
import * as Organization from "../components/organization/controller";
import * as otherRouter from "../components/organization/otherRoutes";

const prisma = new PrismaClient();
const router = express.Router();

// TODO: Correccion de errores, mandar las verificaciones con ID, al final de la sentencia y las implementaciones antes, porque zod verifica antes esas 
router.get('/all', Organization.getAllOrganizations)

router.get('/organizationres', otherRouter.getOrgnizationInfo)
router.get('/orgworkerpersonal', otherRouter.getOrgnizationPersonal)

router.get('/orgbeneficiariainfo/:id', otherRouter.getOrgnizationInfoById)
router.get('/orgworkerpersonal/:id', otherRouter.getOrgnizationPersonalById)

router.get('/:id', Organization.getOrganizationById)


//router.get('/orgbeneficiariainfo/:id', Organization.getOrgnizationInfoById)


//router.get('/orgworkerpersonal/:id', Organization.getOrgnizationInfoById)

router.post('/create', Organization.createOrganization)

router.put('/:id', Organization.updatePutOrganization )

router.patch('/:id', Organization.updatePatchOrganization)

router.delete('/:id', Organization.deleteOrganization)

export default router