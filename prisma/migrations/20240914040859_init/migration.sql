/*
  Warnings:

  - You are about to drop the column `city` on the `Address` table. All the data in the column will be lost.
  - You are about to drop the column `country` on the `Address` table. All the data in the column will be lost.
  - You are about to drop the column `neighborhood` on the `Address` table. All the data in the column will be lost.
  - You are about to drop the column `province` on the `Address` table. All the data in the column will be lost.
  - You are about to drop the column `street` on the `Address` table. All the data in the column will be lost.
  - You are about to drop the column `dependentsBenefit` on the `Organization` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `Organization` table. All the data in the column will be lost.
  - You are about to drop the column `motive` on the `Organization` table. All the data in the column will be lost.
  - You are about to drop the column `nameOrganization` on the `Organization` table. All the data in the column will be lost.
  - You are about to drop the column `numPreRegister` on the `Organization` table. All the data in the column will be lost.
  - You are about to drop the column `phone` on the `Organization` table. All the data in the column will be lost.
  - You are about to drop the column `purpose` on the `Organization` table. All the data in the column will be lost.
  - You are about to drop the column `ruc` on the `Organization` table. All the data in the column will be lost.
  - You are about to drop the column `stateRegister` on the `Organization` table. All the data in the column will be lost.
  - You are about to drop the column `email` on the `Representative` table. All the data in the column will be lost.
  - You are about to drop the column `name` on the `Representative` table. All the data in the column will be lost.
  - You are about to drop the column `numDoc` on the `Representative` table. All the data in the column will be lost.
  - You are about to drop the column `phone` on the `Representative` table. All the data in the column will be lost.
  - You are about to drop the column `role` on the `Representative` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[streetId]` on the table `Address` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[cityId]` on the table `Address` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[neighborhoodId]` on the table `Address` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[provinceId]` on the table `Address` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[countryId]` on the table `Address` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[nameOrganizationId]` on the table `Organization` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[rucId]` on the table `Organization` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[phoneId]` on the table `Organization` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[emailId]` on the table `Organization` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[purposeId]` on the table `Organization` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[dependentsBenefitId]` on the table `Organization` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[motiveId]` on the table `Organization` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[numPreRegisterId]` on the table `Organization` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[nameId]` on the table `Representative` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[numDocId]` on the table `Representative` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[roleId]` on the table `Representative` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[emailId]` on the table `Representative` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[phoneId]` on the table `Representative` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `cityId` to the `Address` table without a default value. This is not possible if the table is not empty.
  - Added the required column `countryId` to the `Address` table without a default value. This is not possible if the table is not empty.
  - Added the required column `neighborhoodId` to the `Address` table without a default value. This is not possible if the table is not empty.
  - Added the required column `provinceId` to the `Address` table without a default value. This is not possible if the table is not empty.
  - Added the required column `streetId` to the `Address` table without a default value. This is not possible if the table is not empty.
  - Added the required column `dependentsBenefitId` to the `Organization` table without a default value. This is not possible if the table is not empty.
  - Added the required column `emailId` to the `Organization` table without a default value. This is not possible if the table is not empty.
  - Added the required column `motiveId` to the `Organization` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nameOrganizationId` to the `Organization` table without a default value. This is not possible if the table is not empty.
  - Added the required column `numPreRegisterId` to the `Organization` table without a default value. This is not possible if the table is not empty.
  - Added the required column `phoneId` to the `Organization` table without a default value. This is not possible if the table is not empty.
  - Added the required column `purposeId` to the `Organization` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rucId` to the `Organization` table without a default value. This is not possible if the table is not empty.
  - Added the required column `emailId` to the `Representative` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nameId` to the `Representative` table without a default value. This is not possible if the table is not empty.
  - Added the required column `numDocId` to the `Representative` table without a default value. This is not possible if the table is not empty.
  - Added the required column `phoneId` to the `Representative` table without a default value. This is not possible if the table is not empty.
  - Added the required column `roleId` to the `Representative` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "stateRegistration" AS ENUM ('PENDING', 'REVIEW', 'APPROVED', 'REJECTED');

-- DropIndex
DROP INDEX "Organization_email_key";

-- DropIndex
DROP INDEX "Organization_ruc_key";

-- DropIndex
DROP INDEX "Representative_email_key";

-- DropIndex
DROP INDEX "Representative_numDoc_key";

-- AlterTable
ALTER TABLE "Address" DROP COLUMN "city",
DROP COLUMN "country",
DROP COLUMN "neighborhood",
DROP COLUMN "province",
DROP COLUMN "street",
ADD COLUMN     "cityId" INTEGER NOT NULL,
ADD COLUMN     "countryId" INTEGER NOT NULL,
ADD COLUMN     "neighborhoodId" INTEGER NOT NULL,
ADD COLUMN     "provinceId" INTEGER NOT NULL,
ADD COLUMN     "streetId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Organization" DROP COLUMN "dependentsBenefit",
DROP COLUMN "email",
DROP COLUMN "motive",
DROP COLUMN "nameOrganization",
DROP COLUMN "numPreRegister",
DROP COLUMN "phone",
DROP COLUMN "purpose",
DROP COLUMN "ruc",
DROP COLUMN "stateRegister",
ADD COLUMN     "dependentsBenefitId" INTEGER NOT NULL,
ADD COLUMN     "emailId" INTEGER NOT NULL,
ADD COLUMN     "motiveId" INTEGER NOT NULL,
ADD COLUMN     "nameOrganizationId" INTEGER NOT NULL,
ADD COLUMN     "numPreRegisterId" INTEGER NOT NULL,
ADD COLUMN     "phoneId" INTEGER NOT NULL,
ADD COLUMN     "purposeId" INTEGER NOT NULL,
ADD COLUMN     "rucId" INTEGER NOT NULL,
ADD COLUMN     "stateRegistration" "stateRegistration" NOT NULL DEFAULT 'PENDING';

-- AlterTable
ALTER TABLE "Representative" DROP COLUMN "email",
DROP COLUMN "name",
DROP COLUMN "numDoc",
DROP COLUMN "phone",
DROP COLUMN "role",
ADD COLUMN     "emailId" INTEGER NOT NULL,
ADD COLUMN     "nameId" INTEGER NOT NULL,
ADD COLUMN     "numDocId" INTEGER NOT NULL,
ADD COLUMN     "phoneId" INTEGER NOT NULL,
ADD COLUMN     "roleId" INTEGER NOT NULL;

-- DropEnum
DROP TYPE "StateRegister";

-- CreateTable
CREATE TABLE "NameOrganization" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,

    CONSTRAINT "NameOrganization_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Ruc" (
    "id" SERIAL NOT NULL,
    "text" INTEGER NOT NULL,
    "state" BOOLEAN NOT NULL,

    CONSTRAINT "Ruc_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Phone" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,

    CONSTRAINT "Phone_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Email" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,

    CONSTRAINT "Email_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Purpose" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,

    CONSTRAINT "Purpose_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DependentsBenefit" (
    "id" SERIAL NOT NULL,
    "text" INTEGER NOT NULL,
    "state" BOOLEAN NOT NULL,

    CONSTRAINT "DependentsBenefit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Motive" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,

    CONSTRAINT "Motive_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NumPreRegister" (
    "id" SERIAL NOT NULL,
    "text" INTEGER NOT NULL,
    "state" BOOLEAN NOT NULL,

    CONSTRAINT "NumPreRegister_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Street" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,

    CONSTRAINT "Street_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "City" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,

    CONSTRAINT "City_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Neighborhood" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,

    CONSTRAINT "Neighborhood_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Province" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,

    CONSTRAINT "Province_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Country" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,

    CONSTRAINT "Country_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Name" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,

    CONSTRAINT "Name_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NumDoc" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,

    CONSTRAINT "NumDoc_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Role" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EmailRepresentative" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,

    CONSTRAINT "EmailRepresentative_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PhoneRepresentative" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,

    CONSTRAINT "PhoneRepresentative_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Address_streetId_key" ON "Address"("streetId");

-- CreateIndex
CREATE UNIQUE INDEX "Address_cityId_key" ON "Address"("cityId");

-- CreateIndex
CREATE UNIQUE INDEX "Address_neighborhoodId_key" ON "Address"("neighborhoodId");

-- CreateIndex
CREATE UNIQUE INDEX "Address_provinceId_key" ON "Address"("provinceId");

-- CreateIndex
CREATE UNIQUE INDEX "Address_countryId_key" ON "Address"("countryId");

-- CreateIndex
CREATE UNIQUE INDEX "Organization_nameOrganizationId_key" ON "Organization"("nameOrganizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Organization_rucId_key" ON "Organization"("rucId");

-- CreateIndex
CREATE UNIQUE INDEX "Organization_phoneId_key" ON "Organization"("phoneId");

-- CreateIndex
CREATE UNIQUE INDEX "Organization_emailId_key" ON "Organization"("emailId");

-- CreateIndex
CREATE UNIQUE INDEX "Organization_purposeId_key" ON "Organization"("purposeId");

-- CreateIndex
CREATE UNIQUE INDEX "Organization_dependentsBenefitId_key" ON "Organization"("dependentsBenefitId");

-- CreateIndex
CREATE UNIQUE INDEX "Organization_motiveId_key" ON "Organization"("motiveId");

-- CreateIndex
CREATE UNIQUE INDEX "Organization_numPreRegisterId_key" ON "Organization"("numPreRegisterId");

-- CreateIndex
CREATE UNIQUE INDEX "Representative_nameId_key" ON "Representative"("nameId");

-- CreateIndex
CREATE UNIQUE INDEX "Representative_numDocId_key" ON "Representative"("numDocId");

-- CreateIndex
CREATE UNIQUE INDEX "Representative_roleId_key" ON "Representative"("roleId");

-- CreateIndex
CREATE UNIQUE INDEX "Representative_emailId_key" ON "Representative"("emailId");

-- CreateIndex
CREATE UNIQUE INDEX "Representative_phoneId_key" ON "Representative"("phoneId");

-- AddForeignKey
ALTER TABLE "Organization" ADD CONSTRAINT "Organization_nameOrganizationId_fkey" FOREIGN KEY ("nameOrganizationId") REFERENCES "NameOrganization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Organization" ADD CONSTRAINT "Organization_rucId_fkey" FOREIGN KEY ("rucId") REFERENCES "Ruc"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Organization" ADD CONSTRAINT "Organization_phoneId_fkey" FOREIGN KEY ("phoneId") REFERENCES "Phone"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Organization" ADD CONSTRAINT "Organization_emailId_fkey" FOREIGN KEY ("emailId") REFERENCES "Email"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Organization" ADD CONSTRAINT "Organization_purposeId_fkey" FOREIGN KEY ("purposeId") REFERENCES "Purpose"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Organization" ADD CONSTRAINT "Organization_dependentsBenefitId_fkey" FOREIGN KEY ("dependentsBenefitId") REFERENCES "DependentsBenefit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Organization" ADD CONSTRAINT "Organization_motiveId_fkey" FOREIGN KEY ("motiveId") REFERENCES "Motive"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Organization" ADD CONSTRAINT "Organization_numPreRegisterId_fkey" FOREIGN KEY ("numPreRegisterId") REFERENCES "NumPreRegister"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Address" ADD CONSTRAINT "Address_streetId_fkey" FOREIGN KEY ("streetId") REFERENCES "Street"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Address" ADD CONSTRAINT "Address_cityId_fkey" FOREIGN KEY ("cityId") REFERENCES "City"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Address" ADD CONSTRAINT "Address_neighborhoodId_fkey" FOREIGN KEY ("neighborhoodId") REFERENCES "Neighborhood"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Address" ADD CONSTRAINT "Address_provinceId_fkey" FOREIGN KEY ("provinceId") REFERENCES "Province"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Address" ADD CONSTRAINT "Address_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "Country"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Representative" ADD CONSTRAINT "Representative_nameId_fkey" FOREIGN KEY ("nameId") REFERENCES "Name"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Representative" ADD CONSTRAINT "Representative_numDocId_fkey" FOREIGN KEY ("numDocId") REFERENCES "NumDoc"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Representative" ADD CONSTRAINT "Representative_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Role"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Representative" ADD CONSTRAINT "Representative_emailId_fkey" FOREIGN KEY ("emailId") REFERENCES "EmailRepresentative"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Representative" ADD CONSTRAINT "Representative_phoneId_fkey" FOREIGN KEY ("phoneId") REFERENCES "PhoneRepresentative"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
