import { z } from "zod";
// Esquema Zod para validar la creación y actualización de organizaciones
export const OrganizationSchema = z.object({
    nameOrganization: z.object({
        text: z.string().min(1, "El nombre de la organización es requerido").optional(),
        state: z.boolean(),
    }),
    ruc: z.object({
        text: z.string().min(10, "El RUC debe tener 13 dígitos"),
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
        text: z.string().optional(),
        state: z.boolean(),
    }),
    dependentsBenefit: z.object({
        text: z.number().optional(),
        state: z.boolean(),
    }),
    motive: z.object({
        text: z.string().optional(),
        state: z.boolean(),
    }),
    numPreRegister: z.object({
        text: z.number().optional(),
        state: z.boolean(),
    }),
    address: z.object({
        street: z.object({
            text: z.string().optional(),
            state: z.boolean(),
        }),
        city: z.object({
            text: z.string().optional(),
            state: z.boolean(),
        }),
        neighborhood: z.object({
            text: z.string().optional(),
            state: z.boolean(),
        }),
        province: z.object({
            text: z.string().optional(),
            state: z.boolean(),
        }),
        country: z.object({
            text: z.string().optional(),
            state: z.boolean(),
        }),
    }).optional(),
    coordinates: z.object({
        latitude: z.string(),
        longitude: z.string(),
    }).optional(),
    representative: z.object({
        name: z.object({
            text: z.string().optional(),
            state: z.boolean(),
        }),
        numDoc: z.object({
            text: z.string().optional(),
            state: z.boolean(),
        }),
        role: z.object({
            text: z.string().optional(),
            state: z.boolean(),
        }),
        emailRepresentative: z.object({
            text: z.string().email(),
            state: z.boolean(),
        }),
        phoneRepresentative: z.object({
            text: z.string().optional(),
            state: z.boolean(),
        }),
    }).optional(),
    stateRegistration: z.enum(["PENDING", "REVIEW", "APPROVED", "REJECTED"]),
});


// Esquema para validar IDs
export const IdSchema = z.object({
    id: z.string(), // Acepta cualquier string
});
