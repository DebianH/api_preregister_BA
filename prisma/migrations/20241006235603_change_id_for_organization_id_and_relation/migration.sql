/*
  Warnings:

  - You are about to drop the column `cityId` on the `City` table. All the data in the column will be lost.
  - You are about to drop the column `countryId` on the `Country` table. All the data in the column will be lost.
  - You are about to drop the column `emailId` on the `Email` table. All the data in the column will be lost.
  - You are about to drop the column `emailId` on the `EmailRepresentative` table. All the data in the column will be lost.
  - You are about to drop the column `motiveId` on the `Motive` table. All the data in the column will be lost.
  - You are about to drop the column `nameId` on the `Name` table. All the data in the column will be lost.
  - You are about to drop the column `neighborhoodId` on the `Neighborhood` table. All the data in the column will be lost.
  - You are about to drop the column `numDocId` on the `NumDoc` table. All the data in the column will be lost.
  - You are about to drop the column `numPreRegisterId` on the `NumPreRegister` table. All the data in the column will be lost.
  - You are about to drop the column `phoneId` on the `Phone` table. All the data in the column will be lost.
  - You are about to drop the column `phoneId` on the `PhoneRepresentative` table. All the data in the column will be lost.
  - You are about to drop the column `provinceId` on the `Province` table. All the data in the column will be lost.
  - You are about to drop the column `purposeId` on the `Purpose` table. All the data in the column will be lost.
  - You are about to drop the column `roleId` on the `Role` table. All the data in the column will be lost.
  - You are about to drop the column `rucId` on the `Ruc` table. All the data in the column will be lost.
  - You are about to drop the column `sriCertificateId` on the `SRICertification` table. All the data in the column will be lost.
  - You are about to drop the column `streetId` on the `Street` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[id,organizationId]` on the table `Address` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id,organizationId]` on the table `BeneficiaryDocumentProof` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id,organizationId]` on the table `Certificate` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[organizationId]` on the table `City` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id,organizationId]` on the table `City` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id,organizationId]` on the table `Coordinates` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[organizationId]` on the table `Country` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id,organizationId]` on the table `Country` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[organizationId]` on the table `Email` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id,organizationId]` on the table `Email` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[organizationId]` on the table `EmailRepresentative` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id,organizationId]` on the table `EmailRepresentative` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id,iessCertificationId]` on the table `IESSCertification` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[organizationId]` on the table `Motive` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id,organizationId]` on the table `Motive` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[organizationId]` on the table `Name` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id,organizationId]` on the table `Name` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id,nameOrganizationId]` on the table `NameOrganization` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[organizationId]` on the table `Neighborhood` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id,organizationId]` on the table `Neighborhood` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[organizationId]` on the table `NumDoc` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id,organizationId]` on the table `NumDoc` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[organizationId]` on the table `NumPreRegister` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id,organizationId]` on the table `NumPreRegister` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[organizationId]` on the table `Phone` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id,organizationId]` on the table `Phone` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[organizationId]` on the table `PhoneRepresentative` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id,organizationId]` on the table `PhoneRepresentative` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[organizationId]` on the table `Province` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id,organizationId]` on the table `Province` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[organizationId]` on the table `Purpose` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id,organizationId]` on the table `Purpose` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id,organizationId]` on the table `Representative` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[organizationId]` on the table `Role` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id,organizationId]` on the table `Role` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[organizationId]` on the table `Ruc` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id,organizationId]` on the table `Ruc` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[certificateId]` on the table `SRICertification` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id,certificateId]` on the table `SRICertification` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[organizationId]` on the table `Street` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[id,organizationId]` on the table `Street` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `organizationId` to the `City` table without a default value. This is not possible if the table is not empty.
  - Added the required column `organizationId` to the `Country` table without a default value. This is not possible if the table is not empty.
  - Added the required column `organizationId` to the `Email` table without a default value. This is not possible if the table is not empty.
  - Added the required column `organizationId` to the `EmailRepresentative` table without a default value. This is not possible if the table is not empty.
  - Added the required column `organizationId` to the `Motive` table without a default value. This is not possible if the table is not empty.
  - Added the required column `organizationId` to the `Name` table without a default value. This is not possible if the table is not empty.
  - Added the required column `organizationId` to the `Neighborhood` table without a default value. This is not possible if the table is not empty.
  - Added the required column `organizationId` to the `NumDoc` table without a default value. This is not possible if the table is not empty.
  - Added the required column `organizationId` to the `NumPreRegister` table without a default value. This is not possible if the table is not empty.
  - Added the required column `organizationId` to the `Phone` table without a default value. This is not possible if the table is not empty.
  - Added the required column `organizationId` to the `PhoneRepresentative` table without a default value. This is not possible if the table is not empty.
  - Added the required column `organizationId` to the `Province` table without a default value. This is not possible if the table is not empty.
  - Added the required column `organizationId` to the `Purpose` table without a default value. This is not possible if the table is not empty.
  - Added the required column `organizationId` to the `Role` table without a default value. This is not possible if the table is not empty.
  - Added the required column `organizationId` to the `Ruc` table without a default value. This is not possible if the table is not empty.
  - Added the required column `certificateId` to the `SRICertification` table without a default value. This is not possible if the table is not empty.
  - Added the required column `organizationId` to the `Street` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "City" DROP CONSTRAINT "City_cityId_fkey";

-- DropForeignKey
ALTER TABLE "Country" DROP CONSTRAINT "Country_countryId_fkey";

-- DropForeignKey
ALTER TABLE "Email" DROP CONSTRAINT "Email_emailId_fkey";

-- DropForeignKey
ALTER TABLE "EmailRepresentative" DROP CONSTRAINT "EmailRepresentative_emailId_fkey";

-- DropForeignKey
ALTER TABLE "Motive" DROP CONSTRAINT "Motive_motiveId_fkey";

-- DropForeignKey
ALTER TABLE "Name" DROP CONSTRAINT "Name_nameId_fkey";

-- DropForeignKey
ALTER TABLE "Neighborhood" DROP CONSTRAINT "Neighborhood_neighborhoodId_fkey";

-- DropForeignKey
ALTER TABLE "NumDoc" DROP CONSTRAINT "NumDoc_numDocId_fkey";

-- DropForeignKey
ALTER TABLE "NumPreRegister" DROP CONSTRAINT "NumPreRegister_numPreRegisterId_fkey";

-- DropForeignKey
ALTER TABLE "Phone" DROP CONSTRAINT "Phone_phoneId_fkey";

-- DropForeignKey
ALTER TABLE "PhoneRepresentative" DROP CONSTRAINT "PhoneRepresentative_phoneId_fkey";

-- DropForeignKey
ALTER TABLE "Province" DROP CONSTRAINT "Province_provinceId_fkey";

-- DropForeignKey
ALTER TABLE "Purpose" DROP CONSTRAINT "Purpose_purposeId_fkey";

-- DropForeignKey
ALTER TABLE "Role" DROP CONSTRAINT "Role_roleId_fkey";

-- DropForeignKey
ALTER TABLE "Ruc" DROP CONSTRAINT "Ruc_rucId_fkey";

-- DropForeignKey
ALTER TABLE "SRICertification" DROP CONSTRAINT "SRICertification_sriCertificateId_fkey";

-- DropForeignKey
ALTER TABLE "Street" DROP CONSTRAINT "Street_streetId_fkey";

-- DropIndex
DROP INDEX "City_cityId_key";

-- DropIndex
DROP INDEX "Country_countryId_key";

-- DropIndex
DROP INDEX "Email_emailId_key";

-- DropIndex
DROP INDEX "EmailRepresentative_emailId_key";

-- DropIndex
DROP INDEX "Motive_motiveId_key";

-- DropIndex
DROP INDEX "Name_nameId_key";

-- DropIndex
DROP INDEX "Neighborhood_neighborhoodId_key";

-- DropIndex
DROP INDEX "NumDoc_numDocId_key";

-- DropIndex
DROP INDEX "NumPreRegister_numPreRegisterId_key";

-- DropIndex
DROP INDEX "Phone_phoneId_key";

-- DropIndex
DROP INDEX "PhoneRepresentative_phoneId_key";

-- DropIndex
DROP INDEX "Province_provinceId_key";

-- DropIndex
DROP INDEX "Purpose_purposeId_key";

-- DropIndex
DROP INDEX "Role_roleId_key";

-- DropIndex
DROP INDEX "Ruc_rucId_key";

-- DropIndex
DROP INDEX "SRICertification_sriCertificateId_key";

-- DropIndex
DROP INDEX "Street_streetId_key";

-- AlterTable
ALTER TABLE "City" DROP COLUMN "cityId",
ADD COLUMN     "organizationId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Country" DROP COLUMN "countryId",
ADD COLUMN     "organizationId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Email" DROP COLUMN "emailId",
ADD COLUMN     "organizationId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "EmailRepresentative" DROP COLUMN "emailId",
ADD COLUMN     "organizationId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Motive" DROP COLUMN "motiveId",
ADD COLUMN     "organizationId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Name" DROP COLUMN "nameId",
ADD COLUMN     "organizationId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Neighborhood" DROP COLUMN "neighborhoodId",
ADD COLUMN     "organizationId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "NumDoc" DROP COLUMN "numDocId",
ADD COLUMN     "organizationId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "NumPreRegister" DROP COLUMN "numPreRegisterId",
ADD COLUMN     "organizationId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Phone" DROP COLUMN "phoneId",
ADD COLUMN     "organizationId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "PhoneRepresentative" DROP COLUMN "phoneId",
ADD COLUMN     "organizationId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Province" DROP COLUMN "provinceId",
ADD COLUMN     "organizationId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Purpose" DROP COLUMN "purposeId",
ADD COLUMN     "organizationId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Role" DROP COLUMN "roleId",
ADD COLUMN     "organizationId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Ruc" DROP COLUMN "rucId",
ADD COLUMN     "organizationId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "SRICertification" DROP COLUMN "sriCertificateId",
ADD COLUMN     "certificateId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Street" DROP COLUMN "streetId",
ADD COLUMN     "organizationId" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "Address_id_organizationId_key" ON "Address"("id", "organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "BeneficiaryDocumentProof_id_organizationId_key" ON "BeneficiaryDocumentProof"("id", "organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Certificate_id_organizationId_key" ON "Certificate"("id", "organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "City_organizationId_key" ON "City"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "City_id_organizationId_key" ON "City"("id", "organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Coordinates_id_organizationId_key" ON "Coordinates"("id", "organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Country_organizationId_key" ON "Country"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Country_id_organizationId_key" ON "Country"("id", "organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Email_organizationId_key" ON "Email"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Email_id_organizationId_key" ON "Email"("id", "organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "EmailRepresentative_organizationId_key" ON "EmailRepresentative"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "EmailRepresentative_id_organizationId_key" ON "EmailRepresentative"("id", "organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "IESSCertification_id_iessCertificationId_key" ON "IESSCertification"("id", "iessCertificationId");

-- CreateIndex
CREATE UNIQUE INDEX "Motive_organizationId_key" ON "Motive"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Motive_id_organizationId_key" ON "Motive"("id", "organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Name_organizationId_key" ON "Name"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Name_id_organizationId_key" ON "Name"("id", "organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "NameOrganization_id_nameOrganizationId_key" ON "NameOrganization"("id", "nameOrganizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Neighborhood_organizationId_key" ON "Neighborhood"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Neighborhood_id_organizationId_key" ON "Neighborhood"("id", "organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "NumDoc_organizationId_key" ON "NumDoc"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "NumDoc_id_organizationId_key" ON "NumDoc"("id", "organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "NumPreRegister_organizationId_key" ON "NumPreRegister"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "NumPreRegister_id_organizationId_key" ON "NumPreRegister"("id", "organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Phone_organizationId_key" ON "Phone"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Phone_id_organizationId_key" ON "Phone"("id", "organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "PhoneRepresentative_organizationId_key" ON "PhoneRepresentative"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "PhoneRepresentative_id_organizationId_key" ON "PhoneRepresentative"("id", "organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Province_organizationId_key" ON "Province"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Province_id_organizationId_key" ON "Province"("id", "organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Purpose_organizationId_key" ON "Purpose"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Purpose_id_organizationId_key" ON "Purpose"("id", "organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Representative_id_organizationId_key" ON "Representative"("id", "organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Role_organizationId_key" ON "Role"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Role_id_organizationId_key" ON "Role"("id", "organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Ruc_organizationId_key" ON "Ruc"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Ruc_id_organizationId_key" ON "Ruc"("id", "organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "SRICertification_certificateId_key" ON "SRICertification"("certificateId");

-- CreateIndex
CREATE UNIQUE INDEX "SRICertification_id_certificateId_key" ON "SRICertification"("id", "certificateId");

-- CreateIndex
CREATE UNIQUE INDEX "Street_organizationId_key" ON "Street"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Street_id_organizationId_key" ON "Street"("id", "organizationId");

-- AddForeignKey
ALTER TABLE "Ruc" ADD CONSTRAINT "Ruc_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Phone" ADD CONSTRAINT "Phone_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Email" ADD CONSTRAINT "Email_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Purpose" ADD CONSTRAINT "Purpose_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Motive" ADD CONSTRAINT "Motive_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NumPreRegister" ADD CONSTRAINT "NumPreRegister_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SRICertification" ADD CONSTRAINT "SRICertification_certificateId_fkey" FOREIGN KEY ("certificateId") REFERENCES "Certificate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Street" ADD CONSTRAINT "Street_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Address"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "City" ADD CONSTRAINT "City_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Address"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Neighborhood" ADD CONSTRAINT "Neighborhood_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Address"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Province" ADD CONSTRAINT "Province_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Address"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Country" ADD CONSTRAINT "Country_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Address"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Name" ADD CONSTRAINT "Name_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Representative"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NumDoc" ADD CONSTRAINT "NumDoc_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Representative"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Role" ADD CONSTRAINT "Role_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Representative"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmailRepresentative" ADD CONSTRAINT "EmailRepresentative_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Representative"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PhoneRepresentative" ADD CONSTRAINT "PhoneRepresentative_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Representative"("id") ON DELETE CASCADE ON UPDATE CASCADE;
