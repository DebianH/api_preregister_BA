import { stateRegistration } from "@prisma/client";
import prisma from "../utils/prismaClient";
import { create } from "domain";

export const fetchAllOrganizations = async () => {
  try {
    return await prisma.organization.findMany({
      include: {
        nameOrganization: true,
        ruc: true,
        phone: true,
        email: true,
        purpose: true,
        dependentsBenefit: true,
        motive: true,
        numPreRegister: true,
        address: true,
        coordinates: true,
        representative: true,
      },
    });
  } catch (error: any) {
    console.error("Error al obtener las organizaciones", error);
    throw new Error("No se pudieron obtener las organizaciones");
  }
};

export const createOrganization = async (data: any) => {
  const Organization = await prisma.organization.create({
    data: {
      ...data,
      nameOrganization: {
        create: data.nameOrganization,
      },
      ruc: {
        create: data.ruc,
      },
      phone: {
        create: data.phone,
      },
      email: {
        create: data.email,
      },
      purpose: {
        create: data.purpose,
      },
      dependentsBenefit: {
        create: data.dependentsBenefit,
      },
      motive: {
        create: data.motive,
      },
      numPreRegister: {
        create: data.numPreRegister,
      },
      address: {
        create: {
          street: {
            create: data.address.street,
          },
          city: {
            create: data.address.city,
          },
          neighborhood: {
            create: data.address.neighborhood,
          },
          province: {
            create: data.address.province,
          },
          country: {
            create: data.address.country,
          },
        },
      },
      coordinates: {
        create: data.coordinates,
      },
      representative: {
        create: {
          name: {
            create: data.representative.name,
          },
          numDoc: {
            create: data.representative.numDoc,
          },
          role: {
            create: data.representative.role,
          },
          emailRepresentative: {
            create: data.representative.emailRepresentative,
          },
          phoneRepresentative: {
            create: data.representative.phoneRepresentative,
          },
        },
      },
      stateRegistration: data.stateRegister,
    },
  });
  return Organization;
};

export const putDataOrganization = async (id: number, data: any) => {// complete update 
  // Construir el objeto de actualización para address
  const addressUpdateData = data.address ? buildUpdateData(data.address) : undefined;

  // Construir el objeto de actualización para representative
  const representativeUpdateData = data.representative ? buildUpdateData(data.representative) : undefined;

  // Actualizar la organización
  const updatedOrganization = await prisma.organization.update({
    where: { id },
    data: {
      ...buildUpdateData(data),
      address: addressUpdateData ? { update: addressUpdateData } : undefined,
      representative: representativeUpdateData ? { update: representativeUpdateData } : undefined,
    },
  });

  return updatedOrganization;
}

const buildUpdateData = (data: any) => {
  const updateData: any = {};

  for (const key in data) {
    if (data[key] !== undefined) {
      updateData[key] = { update: data[key] };
    }
  }

  return updateData;
};


export const patchDataOrganization = async (id: number, data: any) => {
  
  const updatedData = createPrismaUpdateObject(data);
  
  if (!updatedData) {
    throw new Error("No valid data provided for update");
  }

  return await prisma.organization.update({
    where: { id },
    data: updatedData,
  });
};

function createPrismaUpdateObject(data:any){
  const updateData: { [key: string]: any } = {};

  for(const key in data){
    if(data[key] && typeof data[key] === 'object' && !Array.isArray(data[key])){ 
      if (key === 'address' || key === 'representative') {
        updateData[key] = {
          update: createPrismaUpdateObject(data[key]), // Llamada recursiva para objetos anidados
        };
      } else {
        updateData[key] = { update: data[key] };
      }
    } else if (data[key] !== undefined && data[key] !== null) {
      updateData[key] = { update: data[key] };
    }
  }

  return Object.keys(updateData).length ? updateData : undefined;
}

export const deleteOrganizationData = async (id: number) => {
  //aplicar eliminacion en cascada para las claves relacionadas
  await prisma.address.deleteMany({ where: { organizationId: id } });
  await prisma.coordinates.deleteMany({ where: { organizationId: id } });
  await prisma.representative.deleteMany({ where: { organizationId: id } });
  return await prisma.organization.delete({ where: { id } });
};
