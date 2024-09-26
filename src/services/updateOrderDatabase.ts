import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

export const deletedAndResignIds = async (idToDelete: number) => {
    await prisma.$transaction(async (prisma) => {
        await prisma.organization.delete({
            where: {id: idToDelete}
        })
    
        // Obtener todos los registros restantes ordenados
        const remainingRecords = await prisma.organization.findMany({
            orderBy: { id: 'asc'}
        })
    
        // Reasignar los IDS
        const updatePromises = remainingRecords.map((record, index) => {
            const newId = index + 1;
            return prisma.organization.update({
                where: {id: record.id},
                data: {id: newId}
            })
        })
        await Promise.all(updatePromises)
    });
};
