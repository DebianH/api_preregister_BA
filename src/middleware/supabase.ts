import { Request, Response, NextFunction } from "express";
import { createClient, SupabaseClient } from "@supabase/supabase-js";
import dotenv from "dotenv";

dotenv.config();

export const idContextSupabase = "supabase-context";

export const supabaseMiddleWare = async (
  req: Request,
  res: Response,
  next: NextFunction,
) => {
  try {
    const supabaseUrl = process.env.SUPABASE_URL as string;
    const supabaseKey = process.env.SUPABASE_KEY as string;

    if (!supabaseUrl || !supabaseKey) {
      res.status(500).send('Supabase URL or Key is not defined');
      return;
    }

    const supabase = createClient(supabaseUrl, supabaseKey);
    (req as any)[idContextSupabase] = supabase;
    next();
  } catch (error) {
    res.json("Error al obtener la información de la organización");
    next(error);
  }
};

export const getSupabase = (req: Request): SupabaseClient => {
    return (req as any)[idContextSupabase];
};
