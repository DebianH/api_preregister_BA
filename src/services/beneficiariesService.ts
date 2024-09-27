import { DependentsBenefit, PrismaClient } from '@prisma/client';
import { equal } from 'assert';

const prisma = new PrismaClient();

export const fetchBeneficiariesOrganization = async () => {
    const beneficiariesInfo = prisma.organization.findMany({
        select: {
            nameOrganization: {
                select: {
                    text: true
                }
            },
            dependentsBenefit: {
                select: {
                    beneficiaries: true
                }
            }
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
            dependentsBenefit: {
                select: {
                    beneficiaries: true
                }
            }
        }
    })
    return beneficiariesInfo;
}

export const patchBeneficiariesOrganization = async (id: number, data: Partial<DependentsBenefit & { beneficiaries: any }>) => {
    try {
        const oncreateBeneficiary = prisma.dependentsBenefit.create({
            data: {
                text: data.text ?? 0,
                state: data.state ?? false,
                beneficiaries: {
                    create: data.beneficiaries
                },
                organization: {
                    connect: { id: id }
                }
            }
        })
        return oncreateBeneficiary;
    } catch (error) {
        console.error('Error updating beneficiaries', error);
        throw error;
    }
}
