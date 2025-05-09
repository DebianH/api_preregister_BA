/*
  Warnings:

  - The primary key for the `Organization` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - A unique constraint covering the columns `[id]` on the table `Organization` will be added. If there are existing duplicate values, this will fail.

*/
-- AlterTable
ALTER TABLE "Organization" DROP CONSTRAINT "Organization_pkey",
ALTER COLUMN "id" DROP DEFAULT,
ALTER COLUMN "id" SET DATA TYPE TEXT,
ALTER COLUMN "stateRegistration" SET DEFAULT 'PENDING',
ADD CONSTRAINT "Organization_pkey" PRIMARY KEY ("id");
DROP SEQUENCE "Organization_id_seq";

-- CreateTable
CREATE TABLE "FileBeneficiaries" (
    "id" SERIAL NOT NULL,
    "state" BOOLEAN NOT NULL DEFAULT false,
    "beneficiariesFileId" TEXT NOT NULL,

    CONSTRAINT "FileBeneficiaries_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "FileCertification" (
    "id" SERIAL NOT NULL,
    "state" BOOLEAN NOT NULL DEFAULT false,
    "certificationFileId" TEXT NOT NULL,

    CONSTRAINT "FileCertification_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "FileBeneficiaries_beneficiariesFileId_key" ON "FileBeneficiaries"("beneficiariesFileId");

-- CreateIndex
CREATE UNIQUE INDEX "FileBeneficiaries_id_beneficiariesFileId_key" ON "FileBeneficiaries"("id", "beneficiariesFileId");

-- CreateIndex
CREATE UNIQUE INDEX "FileCertification_certificationFileId_key" ON "FileCertification"("certificationFileId");

-- CreateIndex
CREATE UNIQUE INDEX "FileCertification_id_certificationFileId_key" ON "FileCertification"("id", "certificationFileId");

-- CreateIndex
CREATE UNIQUE INDEX "Organization_id_key" ON "Organization"("id");

-- AddForeignKey
ALTER TABLE "FileBeneficiaries" ADD CONSTRAINT "FileBeneficiaries_beneficiariesFileId_fkey" FOREIGN KEY ("beneficiariesFileId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "FileCertification" ADD CONSTRAINT "FileCertification_certificationFileId_fkey" FOREIGN KEY ("certificationFileId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;
