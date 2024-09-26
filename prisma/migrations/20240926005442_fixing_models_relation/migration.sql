-- CreateEnum
CREATE TYPE "stateRegistration" AS ENUM ('PENDING', 'REVIEW', 'APPROVED', 'REJECTED');

-- CreateTable
CREATE TABLE "Organization" (
    "id" SERIAL NOT NULL,
    "stateRegistration" "stateRegistration" NOT NULL DEFAULT 'PENDING',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Organization_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NameOrganization" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,
    "nameOrganizationId" INTEGER,

    CONSTRAINT "NameOrganization_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Ruc" (
    "id" SERIAL NOT NULL,
    "text" INTEGER NOT NULL,
    "state" BOOLEAN NOT NULL,
    "rucId" INTEGER NOT NULL,

    CONSTRAINT "Ruc_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Phone" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,
    "phoneId" INTEGER NOT NULL,

    CONSTRAINT "Phone_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Email" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,
    "emailId" INTEGER NOT NULL,

    CONSTRAINT "Email_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Purpose" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,
    "purposeId" INTEGER NOT NULL,

    CONSTRAINT "Purpose_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DependentsBenefit" (
    "id" SERIAL NOT NULL,
    "text" INTEGER NOT NULL,
    "state" BOOLEAN NOT NULL,
    "dependentsBenefitId" INTEGER NOT NULL,

    CONSTRAINT "DependentsBenefit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Motive" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,
    "motiveId" INTEGER NOT NULL,

    CONSTRAINT "Motive_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NumPreRegister" (
    "id" SERIAL NOT NULL,
    "text" INTEGER NOT NULL,
    "state" BOOLEAN NOT NULL,
    "numPreRegisterId" INTEGER NOT NULL,

    CONSTRAINT "NumPreRegister_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Certificates" (
    "id" SERIAL NOT NULL,
    "organizationId" INTEGER NOT NULL,
    "iessCertificationId" INTEGER,
    "sriCertificationId" INTEGER,

    CONSTRAINT "Certificates_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "IESSCertification" (
    "id" SERIAL NOT NULL,
    "imageurl" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,
    "updatedat" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "IESSCertification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SRICertification" (
    "id" SERIAL NOT NULL,
    "imageurl" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,
    "updatedat" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SRICertification_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Address" (
    "id" SERIAL NOT NULL,
    "organizationId" INTEGER NOT NULL,

    CONSTRAINT "Address_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Street" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,
    "streetId" INTEGER NOT NULL,

    CONSTRAINT "Street_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "City" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,
    "cityId" INTEGER NOT NULL,

    CONSTRAINT "City_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Neighborhood" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,
    "neighborhoodId" INTEGER NOT NULL,

    CONSTRAINT "Neighborhood_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Province" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,
    "provinceId" INTEGER NOT NULL,

    CONSTRAINT "Province_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Country" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,
    "countryId" INTEGER NOT NULL,

    CONSTRAINT "Country_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Coordinates" (
    "id" SERIAL NOT NULL,
    "latitude" TEXT NOT NULL,
    "longitude" TEXT NOT NULL,
    "organizationId" INTEGER NOT NULL,

    CONSTRAINT "Coordinates_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Representative" (
    "id" SERIAL NOT NULL,
    "organizationId" INTEGER NOT NULL,

    CONSTRAINT "Representative_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Name" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,
    "nameId" INTEGER NOT NULL,

    CONSTRAINT "Name_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NumDoc" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,
    "numDocId" INTEGER NOT NULL,

    CONSTRAINT "NumDoc_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Role" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,
    "roleId" INTEGER NOT NULL,

    CONSTRAINT "Role_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EmailRepresentative" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,
    "emailId" INTEGER NOT NULL,

    CONSTRAINT "EmailRepresentative_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PhoneRepresentative" (
    "id" SERIAL NOT NULL,
    "text" TEXT NOT NULL,
    "state" BOOLEAN NOT NULL,
    "phoneId" INTEGER NOT NULL,

    CONSTRAINT "PhoneRepresentative_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "NameOrganization_nameOrganizationId_key" ON "NameOrganization"("nameOrganizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Ruc_rucId_key" ON "Ruc"("rucId");

-- CreateIndex
CREATE UNIQUE INDEX "Phone_phoneId_key" ON "Phone"("phoneId");

-- CreateIndex
CREATE UNIQUE INDEX "Email_emailId_key" ON "Email"("emailId");

-- CreateIndex
CREATE UNIQUE INDEX "Purpose_purposeId_key" ON "Purpose"("purposeId");

-- CreateIndex
CREATE UNIQUE INDEX "DependentsBenefit_dependentsBenefitId_key" ON "DependentsBenefit"("dependentsBenefitId");

-- CreateIndex
CREATE UNIQUE INDEX "Motive_motiveId_key" ON "Motive"("motiveId");

-- CreateIndex
CREATE UNIQUE INDEX "NumPreRegister_numPreRegisterId_key" ON "NumPreRegister"("numPreRegisterId");

-- CreateIndex
CREATE UNIQUE INDEX "Certificates_organizationId_key" ON "Certificates"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Certificates_iessCertificationId_key" ON "Certificates"("iessCertificationId");

-- CreateIndex
CREATE UNIQUE INDEX "Certificates_sriCertificationId_key" ON "Certificates"("sriCertificationId");

-- CreateIndex
CREATE UNIQUE INDEX "Address_organizationId_key" ON "Address"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Street_streetId_key" ON "Street"("streetId");

-- CreateIndex
CREATE UNIQUE INDEX "City_cityId_key" ON "City"("cityId");

-- CreateIndex
CREATE UNIQUE INDEX "Neighborhood_neighborhoodId_key" ON "Neighborhood"("neighborhoodId");

-- CreateIndex
CREATE UNIQUE INDEX "Province_provinceId_key" ON "Province"("provinceId");

-- CreateIndex
CREATE UNIQUE INDEX "Country_countryId_key" ON "Country"("countryId");

-- CreateIndex
CREATE UNIQUE INDEX "Coordinates_organizationId_key" ON "Coordinates"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Representative_organizationId_key" ON "Representative"("organizationId");

-- CreateIndex
CREATE UNIQUE INDEX "Name_nameId_key" ON "Name"("nameId");

-- CreateIndex
CREATE UNIQUE INDEX "NumDoc_numDocId_key" ON "NumDoc"("numDocId");

-- CreateIndex
CREATE UNIQUE INDEX "Role_roleId_key" ON "Role"("roleId");

-- CreateIndex
CREATE UNIQUE INDEX "EmailRepresentative_emailId_key" ON "EmailRepresentative"("emailId");

-- CreateIndex
CREATE UNIQUE INDEX "PhoneRepresentative_phoneId_key" ON "PhoneRepresentative"("phoneId");

-- AddForeignKey
ALTER TABLE "NameOrganization" ADD CONSTRAINT "NameOrganization_nameOrganizationId_fkey" FOREIGN KEY ("nameOrganizationId") REFERENCES "Organization"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ruc" ADD CONSTRAINT "Ruc_rucId_fkey" FOREIGN KEY ("rucId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Phone" ADD CONSTRAINT "Phone_phoneId_fkey" FOREIGN KEY ("phoneId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Email" ADD CONSTRAINT "Email_emailId_fkey" FOREIGN KEY ("emailId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Purpose" ADD CONSTRAINT "Purpose_purposeId_fkey" FOREIGN KEY ("purposeId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DependentsBenefit" ADD CONSTRAINT "DependentsBenefit_dependentsBenefitId_fkey" FOREIGN KEY ("dependentsBenefitId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Motive" ADD CONSTRAINT "Motive_motiveId_fkey" FOREIGN KEY ("motiveId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NumPreRegister" ADD CONSTRAINT "NumPreRegister_numPreRegisterId_fkey" FOREIGN KEY ("numPreRegisterId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Certificates" ADD CONSTRAINT "Certificates_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Certificates" ADD CONSTRAINT "Certificates_iessCertificationId_fkey" FOREIGN KEY ("iessCertificationId") REFERENCES "IESSCertification"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Certificates" ADD CONSTRAINT "Certificates_sriCertificationId_fkey" FOREIGN KEY ("sriCertificationId") REFERENCES "SRICertification"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Address" ADD CONSTRAINT "Address_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Street" ADD CONSTRAINT "Street_streetId_fkey" FOREIGN KEY ("streetId") REFERENCES "Address"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "City" ADD CONSTRAINT "City_cityId_fkey" FOREIGN KEY ("cityId") REFERENCES "Address"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Neighborhood" ADD CONSTRAINT "Neighborhood_neighborhoodId_fkey" FOREIGN KEY ("neighborhoodId") REFERENCES "Address"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Province" ADD CONSTRAINT "Province_provinceId_fkey" FOREIGN KEY ("provinceId") REFERENCES "Address"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Country" ADD CONSTRAINT "Country_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "Address"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Coordinates" ADD CONSTRAINT "Coordinates_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Representative" ADD CONSTRAINT "Representative_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Name" ADD CONSTRAINT "Name_nameId_fkey" FOREIGN KEY ("nameId") REFERENCES "Representative"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NumDoc" ADD CONSTRAINT "NumDoc_numDocId_fkey" FOREIGN KEY ("numDocId") REFERENCES "Representative"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Role" ADD CONSTRAINT "Role_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Representative"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmailRepresentative" ADD CONSTRAINT "EmailRepresentative_emailId_fkey" FOREIGN KEY ("emailId") REFERENCES "Representative"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PhoneRepresentative" ADD CONSTRAINT "PhoneRepresentative_phoneId_fkey" FOREIGN KEY ("phoneId") REFERENCES "Representative"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
