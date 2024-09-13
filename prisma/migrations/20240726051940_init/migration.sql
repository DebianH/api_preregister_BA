/*
  Warnings:

  - You are about to drop the column `coordinatesId` on the `Address` table. All the data in the column will be lost.
  - You are about to drop the `NumPreRegister` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `PreOrganization` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[organizationId]` on the table `Address` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[organizationId]` on the table `Coordinates` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `organizationId` to the `Address` table without a default value. This is not possible if the table is not empty.
  - Added the required column `organizationId` to the `Coordinates` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Address" DROP CONSTRAINT "Address_coordinatesId_fkey";

-- DropForeignKey
ALTER TABLE "PreOrganization" DROP CONSTRAINT "PreOrganization_addressId_fkey";

-- DropForeignKey
ALTER TABLE "PreOrganization" DROP CONSTRAINT "PreOrganization_numPreRegisterId_fkey";

-- DropIndex
DROP INDEX "Address_coordinatesId_key";

-- AlterTable
ALTER TABLE "Address" DROP COLUMN "coordinatesId",
ADD COLUMN     "organizationId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Coordinates" ADD COLUMN     "organizationId" INTEGER NOT NULL;

-- DropTable
DROP TABLE "NumPreRegister";

-- DropTable
DROP TABLE "PreOrganization";

-- DropEnum
DROP TYPE "StateRegister";

-- CreateTable
CREATE TABLE "Organization" (
    "id" SERIAL NOT NULL,
    "nameOrganization" TEXT NOT NULL,
    "ruc" INTEGER NOT NULL,
    "phone" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "purpose" TEXT NOT NULL,
    "dependentsBenefit" TEXT NOT NULL,
    "motive" TEXT NOT NULL,
    "numPreRegister" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Organization_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Representative" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "numDoc" TEXT NOT NULL,
    "role" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "phone" TEXT NOT NULL,
    "organizationId" INTEGER NOT NULL,

    CONSTRAINT "Representative_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Organization_ruc_key" ON "Organization"("ruc");

-- CreateIndex
CREATE UNIQUE INDEX "Organization_email_key" ON "Organization"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Representative_numDoc_key" ON "Representative"("numDoc");

-- CreateIndex
CREATE UNIQUE INDEX "Representative_email_key" ON "Representative"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Representative_organizationId_key" ON "Representative"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Address_organizationId_key" ON "Address"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Coordinates_organizationId_key" ON "Coordinates"("organizationId");

-- AddForeignKey
ALTER TABLE "Address" ADD CONSTRAINT "Address_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Coordinates" ADD CONSTRAINT "Coordinates_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Representative" ADD CONSTRAINT "Representative_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
