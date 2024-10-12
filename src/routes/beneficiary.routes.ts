import express, { Application } from 'express';
import * as beneficiariesController from '../controller/organization/beneficiaries';


const router: Application = express();



router.get('/orgbeneficiarypersonal', beneficiariesController.getbeneficiariesFromOrganization)
router.get('/orgbeneficiarypersonal/:id', beneficiariesController.getOrgnizationPersonalById)
router.patch('/orgbeneficiarypersonal/:id', beneficiariesController.updateListBeneficiaries)
router.get('/beneficiaryPersonal/:id', beneficiariesController.getDocumentProofById)


export default router;