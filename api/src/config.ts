import dotenv from 'dotenv';
import path from 'path';

// librairie path est natif de nodejs
// Le fichier .env que j'utilise ici se trouve à la racine de notre mono repo
const envPath= path.join(__dirname,'../../');
dotenv.config({path:envPath+ './.env'});

export const PORT = process.env.PORT
export const NODE_ENV = process.env.NODE_ENV
export const APP_BASE_URL = process.env.APP_base_URL || '/api/v1/'