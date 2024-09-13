/*
  Warnings:

  - You are about to drop the column `city` on the `PreOrganization` table. All the data in the column will be lost.
  - You are about to drop the column `direction` on the `PreOrganization` table. All the data in the column will be lost.
  - You are about to drop the column `mainStreet` on the `PreOrganization` table. All the data in the column will be lost.
  - You are about to drop the column `neighborhood` on the `PreOrganization` table. All the data in the column will be lost.
  - You are about to drop the column `province` on the `PreOrganization` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[addressId]` on the table `PreOrganization` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[numPreRegisterId]` on the table `PreOrganization` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `addressId` to the `PreOrganization` table without a default value. This is not possible if the table is not empty.
  - Added the required column `numPreRegisterId` to the `PreOrganization` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "NumPreRegister" DROP CONSTRAINT "NumPreRegister_preOrganizationId_fkey";

-- AlterTable
ALTER TABLE "PreOrganization" DROP COLUMN "city",
DROP COLUMN "direction",
DROP COLUMN "mainStreet",
DROP COLUMN "neighborhood",
DROP COLUMN "province",
ADD COLUMN     "addressId" INTEGER NOT NULL,
ADD COLUMN     "numPreRegisterId" INTEGER NOT NULL,
ALTER COLUMN "state" SET DEFAULT 'PENDING';

-- CreateTable
CREATE TABLE "Address" (
    "id" SERIAL NOT NULL,
    "street" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "neighborhood" TEXT NOT NULL,
    "province" TEXT NOT NULL,
    "country" TEXT NOT NULL,
    "coordinatesId" INTEGER NOT NULL,

    CONSTRAINT "Address_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Coordinates" (
    "id" SERIAL NOT NULL,
    "latitude" TEXT NOT NULL,
    "longitude" TEXT NOT NULL,

    CONSTRAINT "Coordinates_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Address_coordinatesId_key" ON "Address"("coordinatesId");

-- CreateIndex
CREATE UNIQUE INDEX "PreOrganization_addressId_key" ON "PreOrganization"("addressId");

-- CreateIndex
CREATE UNIQUE INDEX "PreOrganization_numPreRegisterId_key" ON "PreOrganization"("numPreRegisterId");

-- AddForeignKey
ALTER TABLE "PreOrganization" ADD CONSTRAINT "PreOrganization_addressId_fkey" FOREIGN KEY ("addressId") REFERENCES "Address"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PreOrganization" ADD CONSTRAINT "PreOrganization_numPreRegisterId_fkey" FOREIGN KEY ("numPreRegisterId") REFERENCES "NumPreRegister"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Address" ADD CONSTRAINT "Address_coordinatesId_fkey" FOREIGN KEY ("coordinatesId") REFERENCES "Coordinates"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
