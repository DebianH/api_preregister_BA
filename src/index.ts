import express from 'express';
import dotenv from 'dotenv';
import organization from "./routes/network";
import beneficiaries from "./routes/beneficiary.routes";
import cors from 'cors';
import { errorHandler } from './utils/errorHandler';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3005;

app.use(cors());
app.use(express.json());

app.use('/api/organization', organization);
app.use('/api/beneficiaries', beneficiaries);

// Middleware para manejar rutas no encontradas
app.use((req, res, next) => {
    const error = new Error('URL inválida. Verifica el endpoint y los parámetros.');
    res.status(404);
    next(error);
  });

app.use(errorHandler);

app.listen(PORT, () => {
    console.log(`Server started on port ${PORT}: http://localhost:${PORT}`);
});
