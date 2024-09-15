import express from 'express';
import dotenv from 'dotenv';
import organization from "./routes/network";
import cors from 'cors';
import { errorHandler } from './utils/errorHandler';
dotenv.config();

const app = express();
const PORT = process.env.PORT || 3005;
app.use(cors());
app.use(express.json());
app.use('/api/organization', organization)

//Middleware manejo de errores
app.use(errorHandler)


app.listen(PORT, () => {
    console.log(`Server started on port ${PORT}: http://localhost:${PORT}`);
});