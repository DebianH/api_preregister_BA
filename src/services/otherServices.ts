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
              sriCertification: {
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
  
  export function fetchPersonalOrganization() {
    try {
      return prisma.organization.findMany({
        // TODO: crear el esquema prisma para obtener los datos del personal de la organizacion
      })
    } catch (error: any) {
      console.error("Error al obtener los datos del personal de la Organizacion", error);
      throw new Error("No se pudo obtener los datos del personal de la Organizacion");
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
            sriCertification: {
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
  