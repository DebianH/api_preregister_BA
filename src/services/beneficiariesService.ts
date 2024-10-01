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

export const createBeneficiariesOrganization = async (id: number, data: any) => {

    // for (const beneficiary of data.beneficiaries) {
    //     console.log(`Age: ${beneficiary.age}, Gender: ${beneficiary.gender}, Phone: ${beneficiary.phoneNumber}`);
    // }


    // Crear el nuevo beneficiario sin necesidad de pasar id ni organizationId en el JSON
    if (Array.isArray(data.beneficiaries)) {
        for (const beneficiary of data.beneficiaries) {
            const beneficiaryData = await prisma.beneficiary.create({
                data: {
                    age: beneficiary.age,
                    gender: beneficiary.gender,
                    phoneNumber: beneficiary.phoneNumber,
                    organizationId: id
                }
            });
            return beneficiaryData;

            console.log('Beneficiary created:', beneficiaryData);
        }
    } else {
        console.error('Beneficiaries should be an array.');
    }
}
