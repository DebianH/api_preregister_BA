/*
  Warnings:

  - You are about to drop the column `iessCertificationId` on the `Certificate` table. All the data in the column will be lost.
  - You are about to drop the column `sriCertificateId` on the `Certificate` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[dependentsBenefitId]` on the table `DependentsBenefit` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[iessCertificationId]` on the table `IESSCertification` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[sriCertificateId]` on the table `SRICertification` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `iessCertificationId` to the `IESSCertification` table without a default value. This is not possible if the table is not empty.
  - Added the required column `sriCertificateId` to the `SRICertification` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Beneficiary" DROP CONSTRAINT "Beneficiary_addressId_fkey";

-- DropForeignKey
ALTER TABLE "Beneficiary" DROP CONSTRAINT "Beneficiary_dependentsBenefitId_fkey";

-- DropForeignKey
ALTER TABLE "Certificate" DROP CONSTRAINT "Certificate_iessCertificationId_fkey";

-- DropForeignKey
ALTER TABLE "Certificate" DROP CONSTRAINT "Certificate_sriCertificateId_fkey";

-- DropIndex
DROP INDEX "Certificate_iessCertificationId_key";

-- DropIndex
DROP INDEX "Certificate_sriCertificateId_key";

-- AlterTable
ALTER TABLE "Certificate" DROP COLUMN "iessCertificationId",
DROP COLUMN "sriCertificateId";

-- AlterTable
ALTER TABLE "IESSCertification" ADD COLUMN     "iessCertificationId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "SRICertification" ADD COLUMN     "sriCertificateId" INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "DependentsBenefit_dependentsBenefitId_key" ON "DependentsBenefit"("dependentsBenefitId");

-- CreateIndex
CREATE UNIQUE INDEX "IESSCertification_iessCertificationId_key" ON "IESSCertification"("iessCertificationId");

-- CreateIndex
CREATE UNIQUE INDEX "SRICertification_sriCertificateId_key" ON "SRICertification"("sriCertificateId");

-- AddForeignKey
ALTER TABLE "Beneficiary" ADD CONSTRAINT "Beneficiary_dependentsBenefitId_fkey" FOREIGN KEY ("dependentsBenefitId") REFERENCES "DependentsBenefit"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Beneficiary" ADD CONSTRAINT "Beneficiary_addressId_fkey" FOREIGN KEY ("addressId") REFERENCES "Address"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "IESSCertification" ADD CONSTRAINT "IESSCertification_iessCertificationId_fkey" FOREIGN KEY ("iessCertificationId") REFERENCES "Certificate"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SRICertification" ADD CONSTRAINT "SRICertification_sriCertificateId_fkey" FOREIGN KEY ("sriCertificateId") REFERENCES "Certificate"("id") ON DELETE CASCADE ON UPDATE CASCADE;
