import express, { Router } from "express";
import { PrismaClient } from '@prisma/client'
import { success } from "../../network/response";
import { createOrganization, getAllOrganizations, getOrganizationById } from "./controller";
const prisma = new PrismaClient();
const router = Router();

router.get('/', (req, res) => {
    success(req, res, "Hola mundo", 200);
})

router.get('/all', getAllOrganizations)

router.get('/:id', getOrganizationById)

router.post('/create', createOrganization)

export default router