import prisma from "../utils/prismaClient";
import { z } from "zod";

export const fetchAllOrganizations = async () => {
  const selectFields = {
    select: {
      text: true,
      state: true,
    },
  };
  try {
    const organizations = await prisma.organization.findMany({
      select: {
        id: true,
        nameOrganization: selectFields,
        ruc: selectFields,
        phone: selectFields,
        email: selectFields,
        purpose: selectFields,
        dependentsBenefit: selectFields,
        motive: selectFields,
        numPreRegister: selectFields,
        address: {
          select: {
            street: selectFields,
            city: selectFields,
            neighborhood: selectFields,
            province: selectFields,
            country: selectFields,
          },
        },
        coordinates: {
          select: {
            latitude: true,
            longitude: true,
          },
        },
        representative: {
          select: {
            name: selectFields,
            numDoc: selectFields,
            role: selectFields,
            emailRepresentative: selectFields,
            phoneRepresentative: selectFields,
          },
        },
        stateRegistration: true,
      },
    });

    return organizations;
  } catch (error: any) {
    throw new Error("No se encontraron organizaciones");
  }
};

const createNestedField = (field: any) => ({
  create: {
    text: field.text,
    state: field.state,
  },
});

export const createOrganization = async (data: any) => {
  try {
    const {
      nameOrganization,
      ruc,
      phone,
      email,
      purpose,
      dependentsBenefit,
      motive,
      numPreRegister,
      address,
      coordinates,
      representative,
      stateRegistration,
    } = data;

    // Check if organization with same RUC exists
    const existingOrganization = await prisma.organization.findFirst({
      where: {
        OR: [
          { nameOrganization: { text: nameOrganization.text } },
          { ruc: { text: ruc.text } },
          { email: { text: email.text } },
          { phone: { text: phone.text } },
          { numPreRegister: { text: parseInt(numPreRegister.text) } },
          {
            representative: {
              numDoc: { text: representative.numDoc.text },
            },
          },
        ],
      },
    });

    if (existingOrganization) {
      throw new Error(
        "Ya existe una organización con algunos de estos datos Colocados"
      );
    }

    const newOrganization = await prisma.organization.create({
      data: {
        nameOrganization: createNestedField(nameOrganization),
        ruc: createNestedField(ruc),
        phone: createNestedField(phone),
        email: createNestedField(email),
        purpose: createNestedField(purpose),
        dependentsBenefit: createNestedField(dependentsBenefit),
        motive: createNestedField(motive),
        numPreRegister: {
          create: {
            text: parseInt(numPreRegister.text),
            state: numPreRegister.state,
          },
        },
        address: {
          create: {
            street: createNestedField(address.street),
            city: createNestedField(address.city),
            neighborhood: createNestedField(address.neighborhood),
            province: createNestedField(address.province),
            country: createNestedField(address.country),
          },
        },
        coordinates: {
          create: {
            latitude: coordinates.latitude,
            longitude: coordinates.longitude,
          },
        },
        representative: {
          create: {
            name: createNestedField(representative.name),
            numDoc: createNestedField(representative.numDoc),
            role: createNestedField(representative.role),
            emailRepresentative: createNestedField(
              representative.emailRepresentative
            ),
            phoneRepresentative: createNestedField(
              representative.phoneRepresentative
            ),
          },
        },
        stateRegistration,
      },
    });
    return newOrganization;
  } catch (error) {
    throw new Error(
      `No se pudo crear la organización, verifique los campos completos.  ${error}`
    );
  }
};

const updateNestedField = (field: any) => ({
  update: {
    text: field.text,
    state: field.state,
  },
});


export const putDataOrganization = async (id: string, data: any) => {
  try {
    const {
      nameOrganization,
      ruc,
      phone,
      email,
      purpose,
      dependentsBenefit,
      motive,
      numPreRegister,
      address,
      coordinates,
      representative,
      stateRegistration,
    } = data;

    // Check if organization with same RUC exists
    const existingOrganization = await prisma.organization.findFirst({
      where: {
        OR: [
          { ruc: { text: ruc.text } },
          { email: { text: email.text } },
          { phone: { text: phone.text } },
          { numPreRegister: { text: parseInt(numPreRegister.text) } },
          {
            representative: {
              numDoc: { text: representative.numDoc.text },
            },
          },
        ],
      },
    });

    if (existingOrganization) {
      throw new Error(
        "Ya existe una organización con algunos de estos datos Colocados"
      );
    }

    const updatedOrganization = await prisma.organization.update({
      where: {
        id: id, // Aquí puedes usar la variable id para actualizar la organización específica
      },
      data: {
        nameOrganization: updateNestedField(nameOrganization),
        ruc: updateNestedField(ruc),
        phone: updateNestedField(phone),
        email: updateNestedField(email),
        purpose: updateNestedField(purpose),
        dependentsBenefit: updateNestedField(dependentsBenefit),
        motive: updateNestedField(motive),
        numPreRegister: {
          update: {
            text: parseInt(numPreRegister.text),
            state: numPreRegister.state,
          },
        },
        address: {
          update: {
            street: updateNestedField(address.street),
            city: updateNestedField(address.city),
            neighborhood: updateNestedField(address.neighborhood),
            province: updateNestedField(address.province),
            country: updateNestedField(address.country),
          },
        },
        coordinates: {
          update: {
            latitude: coordinates.latitude,
            longitude: coordinates.longitude,
          },
        },
        representative: {
          update: {
            name: updateNestedField(representative.name),
            numDoc: updateNestedField(representative.numDoc),
            role: updateNestedField(representative.role),
            emailRepresentative: updateNestedField(
              representative.emailRepresentative
            ),
            phoneRepresentative: updateNestedField(
              representative.phoneRepresentative
            ),
          },
        },
        stateRegistration,
      },
    });

    return updatedOrganization;
  } catch (error: any) {
    throw new Error(
      `No se pudo actualizar la organización, verifique los campos completos.  ${error}`
    );
  }
};

export const patchDataOrganization = async (id: string, data: any) => {
  try {
    const organization = await prisma.organization.findUnique({
      where: { id },
    });

    if (!organization) {
      throw new Error("Organización no encontrada para actualizar");
    }

    const updatedData = createPrismaUpdateObject(data);

    if (!updatedData) {
      throw new Error("Datos no validos para actualizar");
    }

    const updatedOrganization = await prisma.organization.update({
      where: { id },
      data: updatedData,
    });
    return updatedOrganization;
  } catch (error: any) {
    throw new Error("No se pudo actualizar la organización");
  }
};

function createPrismaUpdateObject(data: any) {
  const updateData: { [key: string]: any } = {};

  for (const key in data) {
    if (
      data[key] &&
      typeof data[key] === "object" &&
      !Array.isArray(data[key])
    ) {
      if (
        key === "nameOrganization" ||
        key === "ruc" ||
        key === "phone" ||
        key === "email" ||
        key === "purpose" ||
        key === "dependentsBenefit" || // Asegúrate de que el nombre del campo sea correcto
        key === "motive" ||
        key === "numPreRegister" ||
        key === "address" ||
        key === "coordinates" ||
        key === "representative"
      ) {
        updateData[key] = {
          upsert: {
            create: createPrismaUpdateObject(data[key]), // Llamada recursiva para objetos anidados
            update: createPrismaUpdateObject(data[key]),
          },
        };
      } else {
        updateData[key] = {
          upsert: {
            create: data[key],
            update: data[key],
          },
        };
      }
    } else if (data[key] !== undefined && data[key] !== null) {
      updateData[key] = data[key];
    }
  }

  return Object.keys(updateData).length ? updateData : undefined;
}

export const deleteOrganizationData = async (id: string) => {
  try {
    const deletedOrganization = await prisma.organization.delete({
      where: { id },
    });

    return deletedOrganization;
  } catch (error: any) {
    throw new Error("No se encontró la organización para eliminarla");
  }
};
