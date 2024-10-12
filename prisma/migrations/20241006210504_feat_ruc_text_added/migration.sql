/*
  Warnings:

  - Added the required column `rucText` to the `Ruc` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Ruc" ADD COLUMN     "rucText" TEXT NOT NULL;
