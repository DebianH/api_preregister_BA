import express, { Router } from "express";
import { PrismaClient } from '@prisma/client'
import { success } from "../network/response";
import { createOrganization, getAllOrganizations, getOrganizationById } from "../components/organization/controller";

const prisma = new PrismaClient();
const router = express.Router();


router.get('/all', getAllOrganizations)

router.get('/:id', getOrganizationById)

router.post('/create', createOrganization)

export default router