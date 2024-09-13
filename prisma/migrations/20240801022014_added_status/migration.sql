-- CreateEnum
CREATE TYPE "StateRegister" AS ENUM ('PENDING', 'REVIEW', 'APPROVED', 'REJECTED');

-- AlterTable
ALTER TABLE "Address" ALTER COLUMN "country" SET DEFAULT 'Ecuador';

-- AlterTable
ALTER TABLE "Organization" ADD COLUMN     "stateRegister" "StateRegister" NOT NULL DEFAULT 'PENDING';
