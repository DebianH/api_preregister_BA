import prisma from "../utils/prismaClient";
import { deletedAndResignIds } from "./updateOrderDatabase";
import { z } from "zod";

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
        address: {
          include: {
            street: true,
            city: true,
            neighborhood: true,
            province: true,
            country: true
          }
        },
        coordinates: true,
        representative: {
          include: {
            name: true,
            numDoc: true,
            role: true,
            emailRepresentative: true,
            phoneRepresentative: true
          }
        }
      }
    });
  } catch (error: any) {
    console.error("Error al obtener las organizaciones", error);
    throw new Error("No se pudieron obtener las organizaciones");
  }
};

export const createOrganization = async (data: any) => {
  try {
    const newOrganization = await prisma.organization.create({
      data: {
        nameOrganization: {
          create: {
            text: data.nameOrganization.text,
            state: data.nameOrganization.state
          }
        },
        ruc: {
          create: {
            text: parseInt(data.ruc.text),
            state: data.ruc.state
          }
        },
        phone: {
          create: {
            text: data.phone.text,
            state: data.phone.state
          }
        },
        email: {
          create: {
            text: data.email.text,
            state: data.email.state,
          }
        },
        purpose: {
          create: {
            text: data.purpose.text,
            state: data.purpose.state
          }
        },
        dependentsBenefit: {
          create: {
            text: parseInt(data.dependentsBenefit.text),
            state: data.dependentsBenefit.state,
            beneficiaries: {
              create: data.dependentsBenefit.beneficiaries
            }
          }
        },
        motive: {
          create: {
            text: data.motive.text,
            state: data.motive.state
          }
        },
        numPreRegister: {
          create: {
            text: parseInt(data.numPreRegister.text),
            state: data.numPreRegister.state
          }
        },
        address: {
          create: {
            street: {
              create: {
                text: data.address.street.text,
                state: data.address.street.state
              }
            },
            city: {
              create: {
                text: data.address.city.text,
                state: data.address.city.state
              }
            },
            neighborhood: {
              create: {
                text: data.address.neighborhood.text,
                state: data.address.neighborhood.state
              }
            },
            province: {
              create: {
                text: data.address.province.text,
                state: data.address.province.state
              }
            },
            country: {
              create: {
                text: data.address.country.text,
                state: data.address.country.state
              }
            }
          }
        },
        coordinates: {
          create: {
            latitude: data.coordinates.latitude,
            longitude: data.coordinates.longitude
          }
        },
        representative: {
          create: {
            name: {
              create: {
                text: data.representative.name.text,
                state: data.representative.name.state
              }
            },
            numDoc: {
              create: {
                text: data.representative.numDoc.text,
                state: data.representative.numDoc.state
              }
            },
            role: {
              create: {
                text: data.representative.role.text,
                state: data.representative.role.state
              }
            },
            emailRepresentative: {
              create: {
                text: data.representative.emailRepresentative.text,
                state: data.representative.emailRepresentative.state
              }
            },
            phoneRepresentative: {
              create: {
                text: data.representative.phoneRepresentative.text,
                state: data.representative.phoneRepresentative.state
              }
            }
          }
        },
        stateRegistration: data.stateRegistration
      }
    });
    console.log("Nueva organización creada", newOrganization);
    return newOrganization;
  } catch (error: any) {
    if(error instanceof z.ZodError){
      throw new Error("Error de validación de datos");
    }
  }
};

export const putDataOrganization = async (id: number, data: any) => {
  try {
    const updatedOrganization = await prisma.organization.update({
      where: {
        id: id // Aquí puedes usar la variable id para actualizar la organización específica
      },
      data: {
        nameOrganization: {
          update: {
            text: data.nameOrganization.text,
            state: data.nameOrganization.state
          }
        },
        ruc: {
          update: {
            text: parseInt(data.ruc.text),
            state: data.ruc.state
          }
        },
        phone: {
          update: {
            text: data.phone.text,
            state: data.phone.state
          }
        },
        email: {
          update: {
            text: data.email.text,
            state: data.email.state
          }
        },
        purpose: {
          update: {
            text: data.purpose.text,
            state: data.purpose.state
          }
        },
        dependentsBenefit: {
          update: {
            text: data.dependentsBenefit.text,
            state: data.dependentsBenefit.state
          }
        },
        motive: {
          update: {
            text: data.motive.text,
            state: data.motive.state
          }
        },
        numPreRegister: {
          update: {
            text: parseInt(data.numPreRegister.text),
            state: data.numPreRegister.state
          }
        },
        address: {
          update: {
            street: {
              update: {
                text: data.address.street.text,
                state: data.address.street.state
              }
            },
            city: {
              update: {
                text: data.address.city.text,
                state: data.address.city.state
              }
            },
            neighborhood: {
              update: {
                text: data.address.neighborhood.text,
                state: data.address.neighborhood.state
              }
            },
            province: {
              update: {
                text: data.address.province.text,
                state: data.address.province.state
              }
            },
            country: {
              update: {
                text: data.address.country.text,
                state: data.address.country.state
              }
            }
          }
        },
        coordinates: {
          update: {
            latitude: data.coordinates.latitude,
            longitude: data.coordinates.longitude
          }
        },
        representative: {
          update: {
            name: {
              update: {
                text: data.representative.name.text,
                state: data.representative.name.state
              }
            },
            numDoc: {
              update: {
                text: data.representative.numDoc.text,
                state: data.representative.numDoc.state
              }
            },
            role: {
              update: {
                text: data.representative.role.text,
                state: data.representative.role.state
              }
            },
            emailRepresentative: {
              update: {
                text: data.representative.emailRepresentative.text,
                state: data.representative.emailRepresentative.state
              }
            },
            phoneRepresentative: {
              update: {
                text: data.representative.phoneRepresentative.text,
                state: data.representative.phoneRepresentative.state
              }
            }
          }
        },
        stateRegistration: data.stateRegistration
      }
    });
    return updatedOrganization;
  } catch (error: any) {
    console.error("Error al actualizar la organización", error);
    throw new Error("No se pudo actualizar la organización");
  }
};


export const patchDataOrganization = async (id: number, data: any) => {
  try {
    const updatedData = createPrismaUpdateObject(data);

    if (!updatedData) {
      throw new Error("No valid data provided for update");
    }

    const updatedOrganization = await prisma.organization.update({
      where: { id },
      data: updatedData,
    });
    return updatedOrganization;
  } catch (error: any) {
    console.error("Error al actualizar parcialmente la organización", error);
    throw new Error("No se pudo actualizar parcialmente la organización");
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
      if (key === "address" || key === "representative" || key === "dependentsBenefit") {
        updateData[key] = {
          update: createPrismaUpdateObject(data[key]), // Llamada recursiva para objetos anidados
        };
      } else {
        updateData[key] = { update: data[key] };
      }
    } else if (data[key] !== undefined && data[key] !== null) {
      updateData[key] = data[key]; // Ajustado para prisma.update
    }
  }

  return Object.keys(updateData).length ? updateData : undefined;
}

export const deleteOrganizationData = async (id: number) => {
  try {
    await prisma.$transaction(async (prisma) => {
      
      const deletedOrganization = await deletedAndResignIds(id)
      return deletedOrganization;
    })
  } catch (error: any) {
    console.error("Error al eliminar la organización", error);
    throw new Error("No se pudo eliminar la organización");
  }
};
