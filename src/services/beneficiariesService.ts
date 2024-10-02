import { DependentsBenefit, PrismaClient } from '@prisma/client';
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

export const postBeneficiariesOrganization = async (id: number, data: any) => {
    try {
        const newDependentsBenefit = await prisma.dependentsBenefit.create({
            data: {
                text: data.text,
                state: data.state,
                beneficiaries: {
                    create: data.beneficiaries.map((beneficiary: { 
                        age: number; 
                        gender: string; 
                        phoneNumber: string; 
                        address: { 
                            city: string; 
                            country: string; 
                            neighborhood: string; 
                            province: string; 
                            street: string; 
                        };
                    }) => ({
                        age: beneficiary.age,
                        gender: beneficiary.gender,
                        phoneNumber: beneficiary.phoneNumber,
                        address: {
                            create: {
                                city: beneficiary.address.city,
                                country: beneficiary.address.country,
                                neighborhood: beneficiary.address.neighborhood,
                                province: beneficiary.address.province,
                                street: beneficiary.address.street,
                            }
                        }
                    })),
                },
                organization: {
                    connect: { id: id }, // Conectar la organización existente
                },
            },
        });

        return newDependentsBenefit;
    } catch (error) {
        console.log("Error al actualizar los beneficiarios", error)
    }
}

export const createFoodHandlers = async (organizationId: number, foodHandlersData: any) => {
    try {
        const createdFoodHandlers = await prisma.foodHandler.createMany({
            data: foodHandlersData.map((foodHandler: {
                identityCard: string;
                medicalCertification: { imageurl: string; state: boolean };
                foodHandlingCertification: { imageurl: string; state: boolean };
            }) => ({
                identityCard: foodHandler.identityCard,
                medicalCertification: {
                    create: {
                        imageurl: foodHandler.medicalCertification.imageurl,
                        state: foodHandler.medicalCertification.state
                    }
                },
                foodHandlingCertification: {
                    create: {
                        imageurl: foodHandler.foodHandlingCertification.imageurl,
                        state: foodHandler.foodHandlingCertification.state
                    }
                },
                organizationId: organizationId // Conectar al foodHandler con la organización
            }))
        });

        return createdFoodHandlers;
    } catch (error) {
        console.log("Error al crear los food handlers", error);
        throw new Error("No se pudo crear los food handlers");
    }
}