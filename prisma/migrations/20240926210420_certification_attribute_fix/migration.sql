/*
  Warnings:

  - You are about to drop the column `sriCertificationId` on the `Certificates` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[sriCertificateId]` on the table `Certificates` will be added. If there are existing duplicate values, this will fail.

*/
-- DropForeignKey
ALTER TABLE "Certificates" DROP CONSTRAINT "Certificates_sriCertificationId_fkey";

-- DropIndex
DROP INDEX "Certificates_sriCertificationId_key";

-- AlterTable
ALTER TABLE "Certificates" DROP COLUMN "sriCertificationId",
ADD COLUMN     "sriCertificateId" INTEGER;

-- CreateIndex
CREATE UNIQUE INDEX "Certificates_sriCertificateId_key" ON "Certificates"("sriCertificateId");

-- AddForeignKey
ALTER TABLE "Certificates" ADD CONSTRAINT "Certificates_sriCertificateId_fkey" FOREIGN KEY ("sriCertificateId") REFERENCES "SRICertification"("id") ON DELETE CASCADE ON UPDATE CASCADE;
