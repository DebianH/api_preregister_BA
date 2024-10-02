import prisma from "../utils/prismaClient";


//Este servicio se encarga de obtener los datos de la organizacion beneficiaria
export const fetchInfoOrganization = async () => {
  try {
    return await prisma.organization.findMany({
      include: {
        address: {
          include: {
            city: true,
            street: true,
          }
        },
        representative: {
          select: {
            name: true,
            role: true,
            emailRepresentative: {
              select: {
                text: true
              }
            },
          }
        },
        certificates: {
          select: {
            iessCertificate: {
              select: {
                state: true
              }
            },
            sriCertificate: {
              select: {
                state: true
              }
            }
          }
        }
      }
    });
  } catch (error: any) {
    console.error("Error al obtener los datos de la Organizacion beneficiaria", error);
    throw new Error("No se pudo obtener los datos de la Organizacion beneficiaria");
  }
}


export function fetchInfoOrganizationById(id: number) {
  try {
    return prisma.organization.findUnique({
      where: {
        id: id
      },
      include: {
        address: {
          include: {
            city: true,
            street: true,
          }
        },
        representative: {
          select: {
            name: true,
            role: true,
            emailRepresentative: {
              select: {
                text: true
              }
            },
          }
        },
        certificates: {
          select: {
            iessCertificate: {
              select: {
                state: true
              }
            },
            sriCertificate: {
              select: {
                state: true
              }
            }
          }
        }
      }
    })
  } catch (error: any) {
    console.error("Error al obtener los datos del personal de la Organizacion", error);
    throw new Error("No se pudo obtener los datos del personal de la Organizacion");
  }
}

export const fetchStateOrganization = async (id: number) => {
  try {
    return prisma.organization.findUnique({
      where: {
        id: id,
      },
      select: {
        stateRegistration: true
      }
    });
  } catch (error: any) {
    console.error("Error al obtener el estado de la ong", error)
    throw new Error("No se pudo obtener el estado de la ong")
  }
}

export const fetchManipulationArea = async (id: number) => {
  try {
    return prisma.organization.findUnique({
      where: {
        id: id,
      },
      select: {
        manipulationArea: true
      }
    });
  } catch (error: any) {
    console.error("Error al obtener la url de la ong", error)
    throw new Error("No se pudo obtener la url de la ong")
  }
}

export const fetchConstitution= async (id: number) => {
  try {
    return prisma.constitutionData.findUnique({
      where: {
        organizationId: id,
      },
      select: {
        miesConstitution: {
          select: {
            imageurl: true,
            state: true
          }
        },
        curiaConstitution: {
          select: {
            imageurl: true,
            state: true
          }
        },
        mspConstitution: {
          select: {
            imageurl: true,
            state: true
          }
        },
        mineducConstitution: {
          select: {
            imageurl: true,
            state: true
          }
        }
      }
    });
    
  } catch (error: any) {
    console.error("Error al obtener la url", error)
    throw new Error("No se pudo obtener la url")
  }
}

export const fetchFoodHandler = async (id: number) => {
  try {
    return prisma.foodHandler.findMany({
      where: {
        organizationId: id,
      },
      select: {
        identityCard: true,
        medicalCertification: {
          select: {
            imageurl: true,
            state: true
          }
        },
        foodHandlingCertification: {
          select: {
            imageurl: true,
            state: true
          }
        }
      }
    });
  } catch (error: any) {
    console.error("Error al obtener la url", error)
    throw new Error("No se pudo obtener la url")
  }
}