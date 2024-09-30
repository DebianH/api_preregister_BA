/*
  Warnings:

  - You are about to drop the column `addressId` on the `Beneficiary` table. All the data in the column will be lost.
  - You are about to drop the column `dependentsBenefitId` on the `Beneficiary` table. All the data in the column will be lost.
  - You are about to drop the `DependentsBenefit` table. If the table is not empty, all the data it contains will be lost.
  - A unique constraint covering the columns `[organizationId]` on the table `Beneficiary` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `organizationId` to the `Beneficiary` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Beneficiary" DROP CONSTRAINT "Beneficiary_addressId_fkey";

-- DropForeignKey
ALTER TABLE "Beneficiary" DROP CONSTRAINT "Beneficiary_dependentsBenefitId_fkey";

-- DropForeignKey
ALTER TABLE "DependentsBenefit" DROP CONSTRAINT "DependentsBenefit_dependentsBenefitId_fkey";

-- AlterTable
ALTER TABLE "Beneficiary" DROP COLUMN "addressId",
DROP COLUMN "dependentsBenefitId",
ADD COLUMN     "organizationId" INTEGER NOT NULL;

-- DropTable
DROP TABLE "DependentsBenefit";

-- CreateIndex
CREATE UNIQUE INDEX "Beneficiary_organizationId_key" ON "Beneficiary"("organizationId");

-- AddForeignKey
ALTER TABLE "Beneficiary" ADD CONSTRAINT "Beneficiary_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;
