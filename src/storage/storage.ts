import express, { Request, response, Response } from "express";
import { getSupabase, supabaseMiddleWare } from "../middleware/supabase";
import { v4 as uuidv4 } from "uuid";
import prisma from "../utils/prismaClient";

const app = express();


app.use(supabaseMiddleWare);

app.get("/getBeneficiaries/:organizationId", async (req: Request, res: Response) => {
  try {
    const { organizationId } = req.params;

    const supabase = getSupabase(req);

    const organizationIdentifier = await prisma.organization.findUnique({
      where: { id: organizationId },
      select: {
        fileBeneficiaries: {
          select: {
            fileBeneficiariesId: true,
          },
        }
      }
    });

    if (!organizationIdentifier) {
      return res.status(404).json({ error: "No existe la organización" });
    }

    const file = organizationIdentifier?.fileBeneficiaries?.fileBeneficiariesId;

    const { data, error } = await supabase.storage
      .from(process.env.BUCKET_NAME ?? "")
      .download(`beneficiaries/${file}.pdf`);

    if (error) {
      throw error;
    }

    const fileBuffer = await data.arrayBuffer();
    const buffer = Buffer.from(fileBuffer); 

    res.setHeader("Content-Type", "application/pdf");
    res.setHeader("Content-Disposition", `attachment; filename=${file}`);

    res.status(200).send(buffer);
  } catch (error) {
    res.status(500).json({ error: "No existe el archivo solicitado perteneciente a la organizacion" });
  }
});


app.get("/getCertifications/:organizationId", async (req: Request, res: Response) => {
  try {
    const { organizationId } = req.params;

    const supabase = getSupabase(req);

    const organizationIdentifier = await prisma.organization.findUnique({
      where: { id: organizationId },
      select: {
        fileCertification: {
          select: {
            filecertificationId: true,
          },
        }
      }
    });

    if (!organizationIdentifier) {
      return res.status(404).json({ error: "No existe la organización" });
    }

    const file = organizationIdentifier?.fileCertification?.filecertificationId;

    const { data, error } = await supabase.storage
      .from(process.env.BUCKET_NAME ?? "")
      .download(`certifications/${file}.pdf`);

    if (error) {
      throw error;
    }

    const fileBuffer = await data.arrayBuffer();
    const buffer = Buffer.from(fileBuffer);

    res.setHeader("Content-Type", "application/pdf");
    res.setHeader("Content-Disposition", `attachment; filename=${file}`);

    res.status(200).send(buffer);

  } catch (error) {
    res.status(500).json({ error: "No existe el archivo solicitado" });
  }
});


app.post(
  "/uploadBeneficiaries/:organizationId",
  express.raw({ type: ['application/pdf', 'application/octet-stream']}),
  async (req: Request, res: Response) => {
    try {
      const { organizationId } = req.params;
      const supabase = getSupabase(req);

      const uniqueFileName = `${uuidv4()}`;
      
      // Colocate with prisma el id del usuario que sube el archivo

      const organizationResponse = await prisma.organization.findUnique({
        where: { id: organizationId },
      });

      if(!organizationResponse) {
        return res.status(404).json({ error: "No existe la organización" });
      }

      await prisma.organization.update({
        where: { id: organizationId },
        data: {
          fileBeneficiaries: {
            create: {
              state: true,
              fileBeneficiariesId: uniqueFileName,
            }
          }
        },
      })

      const contentType = req.headers['content-type'] ?? 'application/octet-stream';

      let fileExtension = 'bin';
      if (contentType.includes('pdf')) fileExtension = 'pdf';
      
      const fileName = `${uniqueFileName}.${fileExtension}`;

      // upload the binary data to Supabase Storage
      const { error } = await supabase.storage
        .from(process.env.BUCKET_NAME ?? "")
        .upload(`beneficiaries/${fileName}`, req.body, {
          upsert: true,
          contentType: 'application/pdf'
        });

      if (error) {
        throw error;
      }

      // Return success response with the generated file ID
      res.status(200).json({
        message: "El archivo se subió exitosamente",
        fileId: fileName
      });
    } catch (error: any) {
      res
        .status(500)
        .json({ error: "Error al subir el archivo.", message: error.message });
    }
  }
);

app.post(
  "/uploadCertifications",
  express.raw({ type: ['application/pdf', 'application/octet-stream']}),
  async (req: Request, res: Response) => {
    try {
      const { organizationId } = req.params;
      const supabase = getSupabase(req);

      const uniqueFileName = `${uuidv4()}`;
      
      // Colocate with prisma el id del usuario que sube el archivo

      const organizationResponse = await prisma.organization.findUnique({
        where: { id: organizationId },
      });

      if(!organizationResponse) {
        return res.status(404).json({ error: "No existe la organización" });
      }

      await prisma.organization.update({
        where: { id: organizationId },
        data: {
          fileCertification: {
            create: {
              state: true,
              filecertificationId: uniqueFileName,
            }
          }
        },
      })

      const contentType = req.headers['content-type'] ?? 'application/octet-stream';

      let fileExtension = 'bin';
      if (contentType.includes('pdf')) fileExtension = 'pdf';
      
      const fileName = `${uniqueFileName}.${fileExtension}`;

      // upload the binary data to Supabase Storage
      const { error } = await supabase.storage
        .from(process.env.BUCKET_NAME ?? "")
        .upload(`beneficiaries/${fileName}`, req.body, {
          upsert: true,
          contentType: 'application/pdf'
        });

      if (error) {
        throw error;
      }

      // Return success response with the generated file ID
      res.status(200).json({
        message: "El archivo se subió exitosamente",
        fileId: fileName
      });
    } catch (error: any) {
      res
        .status(500)
        .json({ error: "Error al subir el archivo.", message: error.message });
    }
  }
);

export default app;
