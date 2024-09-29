/*
  Warnings:

  - You are about to drop the `Certificates` table. If the table is not empty, all the data it contains will be lost.
  - Made the column `nameOrganizationId` on table `NameOrganization` required. This step will fail if there are existing NULL values in that column.

*/
-- DropForeignKey
ALTER TABLE "Beneficiary" DROP CONSTRAINT "Beneficiary_addressId_fkey";

-- DropForeignKey
ALTER TABLE "Beneficiary" DROP CONSTRAINT "Beneficiary_dependentsBenefitId_fkey";

-- DropForeignKey
ALTER TABLE "Certificates" DROP CONSTRAINT "Certificates_iessCertificationId_fkey";

-- DropForeignKey
ALTER TABLE "Certificates" DROP CONSTRAINT "Certificates_organizationId_fkey";

-- DropForeignKey
ALTER TABLE "Certificates" DROP CONSTRAINT "Certificates_sriCertificateId_fkey";

-- AlterTable
ALTER TABLE "Beneficiary" ALTER COLUMN "dependentsBenefitId" DROP NOT NULL,
ALTER COLUMN "addressId" DROP NOT NULL;

-- AlterTable
ALTER TABLE "NameOrganization" ALTER COLUMN "nameOrganizationId" SET NOT NULL;

-- DropTable
DROP TABLE "Certificates";

-- CreateTable
CREATE TABLE "Certificate" (
    "id" SERIAL NOT NULL,
    "organizationId" INTEGER NOT NULL,
    "iessCertificationId" INTEGER,
    "sriCertificateId" INTEGER,

    CONSTRAINT "Certificate_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Certificate_organizationId_key" ON "Certificate"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Certificate_iessCertificationId_key" ON "Certificate"("iessCertificationId");

-- CreateIndex
CREATE UNIQUE INDEX "Certificate_sriCertificateId_key" ON "Certificate"("sriCertificateId");

-- AddForeignKey
ALTER TABLE "Beneficiary" ADD CONSTRAINT "Beneficiary_addressId_fkey" FOREIGN KEY ("addressId") REFERENCES "Address"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Beneficiary" ADD CONSTRAINT "Beneficiary_dependentsBenefitId_fkey" FOREIGN KEY ("dependentsBenefitId") REFERENCES "DependentsBenefit"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Certificate" ADD CONSTRAINT "Certificate_iessCertificationId_fkey" FOREIGN KEY ("iessCertificationId") REFERENCES "IESSCertification"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Certificate" ADD CONSTRAINT "Certificate_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Certificate" ADD CONSTRAINT "Certificate_sriCertificateId_fkey" FOREIGN KEY ("sriCertificateId") REFERENCES "SRICertification"("id") ON DELETE CASCADE ON UPDATE CASCADE;
