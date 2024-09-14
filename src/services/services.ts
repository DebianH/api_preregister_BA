import { stateRegistration } from '@prisma/client';
import prisma from '../utils/prismaClient';
import { create } from 'domain';

export const getAllOrganizations = async () => {
    try {
      return await prisma.organization.findMany({
        include :{
            nameOrganization : true,
            ruc : true,
            phone : true,
            email : true,
            purpose : true,
            dependentsBenefit : true,
            motive : true,
            numPreRegister : true,
            address : true,
            coordinates : true ,
            representative : true ,
        }
    });
      
    } catch (error: any) {
      console.error('Error al obtener las organizaciones', error);
      throw new Error('No se pudieron obtener las organizaciones');
    }
  };
  

  export const createOrganization = async(data : any) =>{
    const Organization = await prisma.organization.create({
        data: {
            ...data,
            nameOrganization: {
                create : data.nameOrganization
            },
            ruc: {
                create : data.ruc
            },
            phone: {
                create : data.phone
            },
            email: {
                create : data.email
            },
            purpose: {
                create : data.purpose
            },
            dependentsBenefit: {
                create : data.dependentsBenefit
            },
            motive: {
                create : data.motive
            },
            numPreRegister: {
                create : data.numPreRegister
            },
            address: {
                create: {
                    street: {
                        create: data.address.street
                    },
                    city: {
                        create: data.address.city

                    },
                    neighborhood: {
                        create: data.address.neighborhood
                    },
                    province: {
                        create : data.address.province
                    },
                    country: {
                        create: data.address.country
                    },
                },
            },
            coordinates: {
                create: data.coordinates
            },
            representative: {
                create: {
                    name: {
                        create: data.representative.name
                    },
                    numDoc: {
                        create: data.representative.numDoc

                    },
                    role: {
                        create: data.representative.role
                    },
                    emailRepresentative: {
                        create : data.representative.emailRepresentative
                    },
                    phoneRepresentative: {
                        create: data.representative.phoneRepresentative
                    },
                },
            },
            stateRegistration : data.stateRegister
        }});
    return Organization;
  }