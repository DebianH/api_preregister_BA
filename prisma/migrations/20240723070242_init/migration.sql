-- CreateEnum
CREATE TYPE "StateRegister" AS ENUM ('PENDING', 'REVIEW', 'APPROVED', 'REJECTED');

-- CreateTable
CREATE TABLE "NumPreRegister" (
    "id" SERIAL NOT NULL,
    "state" "StateRegister" NOT NULL DEFAULT 'PENDING',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "numPreRegister" INTEGER NOT NULL,
    "preOrganizationId" INTEGER NOT NULL,

    CONSTRAINT "NumPreRegister_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PreOrganization" (
    "id" SERIAL NOT NULL,
    "nameOrganization" TEXT NOT NULL,
    "ruc" INTEGER,
    "phone" TEXT,
    "email" TEXT NOT NULL,
    "province" TEXT NOT NULL,
    "city" TEXT NOT NULL,
    "neighborhood" TEXT NOT NULL,
    "mainStreet" TEXT NOT NULL,
    "direction" TEXT NOT NULL,
    "purpose" TEXT NOT NULL,
    "dependentsBenefit" TEXT NOT NULL,
    "motive" TEXT NOT NULL,
    "representativeName" TEXT NOT NULL,
    "representativeNumDoc" TEXT NOT NULL,
    "representativeRole" TEXT NOT NULL,
    "representativeEmail" TEXT,
    "representativePhone" TEXT,
    "state" "StateRegister" NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PreOrganization_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "NumPreRegister_numPreRegister_key" ON "NumPreRegister"("numPreRegister");

-- CreateIndex
CREATE UNIQUE INDEX "NumPreRegister_preOrganizationId_key" ON "NumPreRegister"("preOrganizationId");

-- CreateIndex
CREATE UNIQUE INDEX "PreOrganization_email_key" ON "PreOrganization"("email");

-- AddForeignKey
ALTER TABLE "NumPreRegister" ADD CONSTRAINT "NumPreRegister_preOrganizationId_fkey" FOREIGN KEY ("preOrganizationId") REFERENCES "PreOrganization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
