/*
  Warnings:

  - You are about to drop the column `state` on the `Ruc` table. All the data in the column will be lost.
  - You are about to drop the column `text` on the `Ruc` table. All the data in the column will be lost.
  - You are about to drop the `Beneficiary` table. If the table is not empty, all the data it contains will be lost.
  - Added the required column `documentProof` to the `Ruc` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "Beneficiary" DROP CONSTRAINT "Beneficiary_organizationId_fkey";

-- AlterTable
ALTER TABLE "Ruc" DROP COLUMN "state",
DROP COLUMN "text",
ADD COLUMN     "documentProof" TEXT NOT NULL;

-- DropTable
DROP TABLE "Beneficiary";

-- CreateTable
CREATE TABLE "BeneficiaryDocumentProof" (
    "id" SERIAL NOT NULL,
    "documentProof" TEXT NOT NULL,
    "organizationId" INTEGER NOT NULL,

    CONSTRAINT "BeneficiaryDocumentProof_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "BeneficiaryDocumentProof_organizationId_key" ON "BeneficiaryDocumentProof"("organizationId");

-- AddForeignKey
ALTER TABLE "BeneficiaryDocumentProof" ADD CONSTRAINT "BeneficiaryDocumentProof_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;
