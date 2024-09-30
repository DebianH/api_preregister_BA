import express, { Application } from 'express';
import * as beneficiariesController from '../controller/organization/beneficiaries';


const router: Application = express();



router.get('/orgbeneficiarypersonal', beneficiariesController.getbeneficiariesFromOrganization)
router.get('/orgbeneficiarypersonal/:id', beneficiariesController.getOrgnizationPersonalById)
router.put('/orgbeneficiarypersonal/:id', beneficiariesController.createBeneficiariesOrganization)


export default router;