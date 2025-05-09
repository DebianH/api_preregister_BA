/*
  Warnings:

  - A unique constraint covering the columns `[fileBeneficiariesId]` on the table `FileBeneficiaries` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[filecertificationId]` on the table `FileCertification` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `fileBeneficiariesId` to the `FileBeneficiaries` table without a default value. This is not possible if the table is not empty.
  - Added the required column `filecertificationId` to the `FileCertification` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "FileBeneficiaries" ADD COLUMN     "fileBeneficiariesId" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "FileCertification" ADD COLUMN     "filecertificationId" TEXT NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX "FileBeneficiaries_fileBeneficiariesId_key" ON "FileBeneficiaries"("fileBeneficiariesId");

-- CreateIndex
CREATE UNIQUE INDEX "FileCertification_filecertificationId_key" ON "FileCertification"("filecertificationId");
