import express, { Router } from "express";
import { PrismaClient } from '@prisma/client'
import { success } from "../network/response";
import * as Organization from "../components/organization/controller";

const prisma = new PrismaClient();
const router = express.Router();


router.get('/all', Organization.getAllOrganizations)

router.get('/:id', Organization.getOrganizationById)

router.post('/create', Organization.createOrganization)

router.put(':/id', Organization.updatePutOrganization )

router.patch('/:id', Organization.updatePatchOrganization)

router.delete('/:id', Organization.deleteOrganization)

export default router