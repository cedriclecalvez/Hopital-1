import express from 'express';
import cors from 'cors'

import mainRouter from './router';
import {APP_BASE_URL} from './config';


// Create server and return an Appli Express
export const createServer = async () => {
    //Initialization de mon server Express
    const server: express.Application = express();

    
    //mon serveur parsera les requête entrante en Json
    server.use(express.json()) 
   

    //les cors (qui peut emettre des call depuis notre API)
    server.use(cors({
        origin:"http://localhost:1234" 
    }))


    //ajout du router au server
    //Il sera accessible sur la route APP_BASE_URL, ici -> /api/v1/
    server.use(APP_BASE_URL,mainRouter)
    

    return server
}

