import express from "express";
import dotenv from "dotenv";
import organization from "./routes/organization.routes";
import cors from "cors";
import { errorHandler } from "./middleware/errorHandler";
import swaggerUi from 'swagger-ui-express';
import specs from "./swagger/swagger";
import rateLimit from "express-rate-limit";

dotenv.config();

const app = express();
const PORT = process.env.PORT ?? 3005;

// Configuracion del rate limit
const limitRateMinites = 10;
const requestLimit = 10;

// const limiter = rateLimit({
//   windowMs: limitRateMinites * 60 * 1000, // 15 minutos
//   max: requestLimit, // Límite de 100 solicitudes por ventana por IP
//   standardHeaders: true, // Devolver info en los headers 'RateLimit-*'
//   legacyHeaders: false, // Deshabilitar los headers 'X-RateLimit-*'
//   message: 'Demasiadas solicitudes desde esta IP, por favor intente de nuevo después de 15 minutos'
// })

// app.use(limiter);

app.use(cors());
app.use(express.json());

app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(specs));

app.use("/api/organization", organization);
app.use(errorHandler);

app.listen(PORT, () => {
  console.log(`Server started on: http://localhost:${PORT}`);
  console.log(`Docs📃 started on: http://localhost:${PORT}/api-docs`);
});
