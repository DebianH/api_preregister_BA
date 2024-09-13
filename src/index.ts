import express from 'express';
import dotenv from 'dotenv';
import organization from "./components/organization/network";
import cors from 'cors';
dotenv.config();

const app = express();
const PORT = process.env.PORT || 3005;
app.use(cors());
app.use(express.json());
app.use('/api/organization', organization)

app.listen(PORT, () => {
    console.log(`Server started on port ${PORT}`);
});