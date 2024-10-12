/*
  Warnings:

  - Changed the type of `documentProof` on the `BeneficiaryDocumentProof` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.
  - Changed the type of `documentProof` on the `Ruc` table. No cast exists, the column would be dropped and recreated, which cannot be done if there is data, since the column is required.

*/
-- AlterTable
ALTER TABLE "BeneficiaryDocumentProof" DROP COLUMN "documentProof",
ADD COLUMN     "documentProof" BYTEA NOT NULL;

-- AlterTable
ALTER TABLE "Ruc" DROP COLUMN "documentProof",
ADD COLUMN     "documentProof" BYTEA NOT NULL;
