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

// Middleware para validar JSON
app.use((err:any, req:any, res:any, next:any) => {
  if (err instanceof SyntaxError && 'body' in err) {
    return res.status(400).send({ message: 'Invalid JSON' });
  }
  next();
});

app.use(errorHandler);

app.listen(PORT, () => {
    console.log(`Server started on port ${PORT}: http://localhost:${PORT}`);
});
