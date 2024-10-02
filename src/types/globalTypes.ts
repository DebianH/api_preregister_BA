import { z } from "zod";

// Esquema Zod para validar la creación y actualización de organizaciones
export const OrganizationSchema = z.object({
    stateRegistration: z.string().optional(),
    nameOrganization: z.object({
        text: z.string().min(1, "El nombre de la organización es requerido"),
        state: z.boolean(),
    }),
    ruc: z.object({
        text: z.string().regex(/^\d{10}$/, "RUC inválido"), // Ajuste para un RUC correcto de 10 dígitos
        state: z.boolean(),
    }),
    phone: z.object({
        text: z.string().optional(),
        state: z.boolean(),
    }),
    email: z.object({
        text: z.string().email("Correo electrónico no válido"),
        state: z.boolean(),
    }),
    purpose: z.object({
        text: z.string(),
        state: z.boolean(),
    }),
    dependentsBenefit: z.object({
        text: z.number(),
        state: z.boolean(),
        beneficiaries: z.array(z.object({
            age: z.number(),
            gender: z.string(),
            phoneNumber: z.string(),
            address: z.object({
                street: z.string(),
                city: z.string(),
                neighborhood: z.string(),
                province: z.string(),
                country: z.string(),
            }),
        })).optional(),
    }).optional(),
    motive: z.object({
        text: z.string(),
        state: z.boolean(),
    }),
    numPreRegister: z.object({
        text: z.number(),
        state: z.boolean(),
    }),
    certificates: z.object({
        iessCertificate: z.object({
            imageurl: z.string(),
            state: z.boolean(),
        }).optional(),
        sriCertificate: z.object({
            imageurl: z.string(),
            state: z.boolean(),
        }).optional(),
    }).optional(),
    constitutionData: z.array(z.object({
        MIESConstitution: z.object({
            imageurl: z.string(),
            state: z.boolean(),
        }).optional(),
        CURIAConstitution: z.object({
            imageurl: z.string(),
            state: z.boolean(),
        }).optional(),
        MSPConstitution: z.object({
            imageurl: z.string(),
            state: z.boolean(),
        }).optional(),
        MINEDUCConstitution: z.object({
            imageurl: z.string(),
            state: z.boolean(),
        }).optional(),
    })).optional(),
    foodHandler: z.array(z.object({
        identityCard: z.string(),
        medicalCertification: z.object({
            imageurl: z.string(),
            state: z.boolean(),
        }).optional(),
        foodHandlingCertification: z.object({
            imageurl: z.string(),
            state: z.boolean(),
        }).optional(),
    })).optional(),
    address: z.object({
        street: z.object({
            text: z.string(),
            state: z.boolean(),
        }),
        city: z.object({
            text: z.string(),
            state: z.boolean(),
        }),
        neighborhood: z.object({
            text: z.string(),
            state: z.boolean(),
        }),
        province: z.object({
            text: z.string(),
            state: z.boolean(),
        }),
        country: z.object({
            text: z.string(),
            state: z.boolean(),
        }),
    }).optional(),
    coordinates: z.object({
        latitude: z.string(),
        longitude: z.string(),
    }).optional(),
    manipulationArea: z.object({
        imageUrl: z.string(),
        state: z.boolean(),
    }).optional(),
    representative: z.object({
        name: z.object({
            text: z.string(),
            state: z.boolean(),
        }),
        numDoc: z.object({
            text: z.string(),
            state: z.boolean(),
        }),
        role: z.object({
            text: z.string(),
            state: z.boolean(),
        }),
        emailRepresentative: z.object({
            text: z.string().email(),
            state: z.boolean(),
        }),
        phoneRepresentative: z.object({
            text: z.string(),
            state: z.boolean(),
        }),
    }).optional(),
});

// Esquema para validar IDs
export const IdSchema = z.object({
    id: z.string().regex(/^\d+$/, "ID incorrecto"),  // Acepta solo dígitos
});
