-- DropForeignKey
ALTER TABLE "Address" DROP CONSTRAINT "Address_organizationId_fkey";

-- DropForeignKey
ALTER TABLE "Certificates" DROP CONSTRAINT "Certificates_iessCertificationId_fkey";

-- DropForeignKey
ALTER TABLE "Certificates" DROP CONSTRAINT "Certificates_organizationId_fkey";

-- DropForeignKey
ALTER TABLE "Certificates" DROP CONSTRAINT "Certificates_sriCertificationId_fkey";

-- DropForeignKey
ALTER TABLE "City" DROP CONSTRAINT "City_cityId_fkey";

-- DropForeignKey
ALTER TABLE "Coordinates" DROP CONSTRAINT "Coordinates_organizationId_fkey";

-- DropForeignKey
ALTER TABLE "Country" DROP CONSTRAINT "Country_countryId_fkey";

-- DropForeignKey
ALTER TABLE "DependentsBenefit" DROP CONSTRAINT "DependentsBenefit_dependentsBenefitId_fkey";

-- DropForeignKey
ALTER TABLE "Email" DROP CONSTRAINT "Email_emailId_fkey";

-- DropForeignKey
ALTER TABLE "EmailRepresentative" DROP CONSTRAINT "EmailRepresentative_emailId_fkey";

-- DropForeignKey
ALTER TABLE "Motive" DROP CONSTRAINT "Motive_motiveId_fkey";

-- DropForeignKey
ALTER TABLE "Name" DROP CONSTRAINT "Name_nameId_fkey";

-- DropForeignKey
ALTER TABLE "NameOrganization" DROP CONSTRAINT "NameOrganization_nameOrganizationId_fkey";

-- DropForeignKey
ALTER TABLE "Neighborhood" DROP CONSTRAINT "Neighborhood_neighborhoodId_fkey";

-- DropForeignKey
ALTER TABLE "NumDoc" DROP CONSTRAINT "NumDoc_numDocId_fkey";

-- DropForeignKey
ALTER TABLE "NumPreRegister" DROP CONSTRAINT "NumPreRegister_numPreRegisterId_fkey";

-- DropForeignKey
ALTER TABLE "Phone" DROP CONSTRAINT "Phone_phoneId_fkey";

-- DropForeignKey
ALTER TABLE "PhoneRepresentative" DROP CONSTRAINT "PhoneRepresentative_phoneId_fkey";

-- DropForeignKey
ALTER TABLE "Province" DROP CONSTRAINT "Province_provinceId_fkey";

-- DropForeignKey
ALTER TABLE "Purpose" DROP CONSTRAINT "Purpose_purposeId_fkey";

-- DropForeignKey
ALTER TABLE "Representative" DROP CONSTRAINT "Representative_organizationId_fkey";

-- DropForeignKey
ALTER TABLE "Role" DROP CONSTRAINT "Role_roleId_fkey";

-- DropForeignKey
ALTER TABLE "Ruc" DROP CONSTRAINT "Ruc_rucId_fkey";

-- DropForeignKey
ALTER TABLE "Street" DROP CONSTRAINT "Street_streetId_fkey";

-- AddForeignKey
ALTER TABLE "NameOrganization" ADD CONSTRAINT "NameOrganization_nameOrganizationId_fkey" FOREIGN KEY ("nameOrganizationId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Ruc" ADD CONSTRAINT "Ruc_rucId_fkey" FOREIGN KEY ("rucId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Phone" ADD CONSTRAINT "Phone_phoneId_fkey" FOREIGN KEY ("phoneId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Email" ADD CONSTRAINT "Email_emailId_fkey" FOREIGN KEY ("emailId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Purpose" ADD CONSTRAINT "Purpose_purposeId_fkey" FOREIGN KEY ("purposeId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DependentsBenefit" ADD CONSTRAINT "DependentsBenefit_dependentsBenefitId_fkey" FOREIGN KEY ("dependentsBenefitId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Motive" ADD CONSTRAINT "Motive_motiveId_fkey" FOREIGN KEY ("motiveId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NumPreRegister" ADD CONSTRAINT "NumPreRegister_numPreRegisterId_fkey" FOREIGN KEY ("numPreRegisterId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Certificates" ADD CONSTRAINT "Certificates_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Certificates" ADD CONSTRAINT "Certificates_iessCertificationId_fkey" FOREIGN KEY ("iessCertificationId") REFERENCES "IESSCertification"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Certificates" ADD CONSTRAINT "Certificates_sriCertificationId_fkey" FOREIGN KEY ("sriCertificationId") REFERENCES "SRICertification"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Address" ADD CONSTRAINT "Address_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Street" ADD CONSTRAINT "Street_streetId_fkey" FOREIGN KEY ("streetId") REFERENCES "Address"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "City" ADD CONSTRAINT "City_cityId_fkey" FOREIGN KEY ("cityId") REFERENCES "Address"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Neighborhood" ADD CONSTRAINT "Neighborhood_neighborhoodId_fkey" FOREIGN KEY ("neighborhoodId") REFERENCES "Address"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Province" ADD CONSTRAINT "Province_provinceId_fkey" FOREIGN KEY ("provinceId") REFERENCES "Address"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Country" ADD CONSTRAINT "Country_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "Address"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Coordinates" ADD CONSTRAINT "Coordinates_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Representative" ADD CONSTRAINT "Representative_organizationId_fkey" FOREIGN KEY ("organizationId") REFERENCES "Organization"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Name" ADD CONSTRAINT "Name_nameId_fkey" FOREIGN KEY ("nameId") REFERENCES "Representative"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NumDoc" ADD CONSTRAINT "NumDoc_numDocId_fkey" FOREIGN KEY ("numDocId") REFERENCES "Representative"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Role" ADD CONSTRAINT "Role_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "Representative"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EmailRepresentative" ADD CONSTRAINT "EmailRepresentative_emailId_fkey" FOREIGN KEY ("emailId") REFERENCES "Representative"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PhoneRepresentative" ADD CONSTRAINT "PhoneRepresentative_phoneId_fkey" FOREIGN KEY ("phoneId") REFERENCES "Representative"("id") ON DELETE CASCADE ON UPDATE CASCADE;
