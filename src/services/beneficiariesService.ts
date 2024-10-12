import { PrismaClient } from '@prisma/client';
import { Request, Response, NextFunction } from 'express';
import { read } from 'fs';
import { Readable } from 'stream';



const prisma = new PrismaClient();

export const fetchBeneficiariesOrganization = async () => {
    const beneficiariesInfo = prisma.organization.findMany({
        select: {
            nameOrganization: {
                select: {
                    text: true
                }
            },
            beneficiaryDocument: true
        }
    })
    return beneficiariesInfo;
}

export const fetchBeneficiariesOrganizationById = async (id: number) => {
    const beneficiariesInfo = prisma.organization.findUnique({
        where: { id: id },
        select: {
            nameOrganization: {
                select: {
                    text: true
                }
            },
            beneficiaryDocument: true
        }
    })
    return beneficiariesInfo;
}

export const updateListBeneficiaries = async (id: number, data: any) => {

    const buffer = Buffer.from(data.beneficiaryDocument.documentProof, "base64");

    return prisma.beneficiaryDocumentProof.update({
        where: { id: id },
        data: {
            documentProof: buffer
        }
    })
}



