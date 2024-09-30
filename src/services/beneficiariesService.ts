import { PrismaClient } from '@prisma/client';
import { equal } from 'assert';
import { count } from 'console';
import { create } from 'domain';
import { Request, Response, NextFunction } from 'express';

const prisma = new PrismaClient();

export const fetchBeneficiariesOrganization = async () => {
    const beneficiariesInfo = prisma.organization.findMany({
        select: {
            nameOrganization: {
                select: {
                    text: true
                }
            },
            beneficiaries: true
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
            beneficiaries: true
        }
    })
    return beneficiariesInfo;
}

export const putBeneficiariesOrganization = async (id: number, data: any) => {
    try {
        const beneficiariesData = await prisma.beneficiary.update({
            where: { id: id },
            data: {
                age: data.age,
                gender: data.gender,
                phoneNumber: data.phoneNumber,
            }
        })
        return beneficiariesData;
    } catch (error) {
        console.error("Error al actualizar los beneficiarios", error)

        throw new Error("No se pudo actualizar los beneficiarios. Por favor, intente nuevamente.");
    }
}
