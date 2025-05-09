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
        }
      });
    } catch (error: any) {
      console.error("Error al obtener los datos de la Organizacion beneficiaria", error);
      throw new Error("No se pudo obtener los datos de la Organizacion beneficiaria");
    }
  }
  

export async function fetchInfoOrganizationById(id: string) {
  try {
    return await prisma.organization.findUnique({
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
      }
    })
  } catch (error: any) {
    throw new Error("No se pudo obtener los datos del personal de la Organizacion");
  }
}


