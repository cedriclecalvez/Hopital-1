import express from 'express';

// Create server that return an Appli Express
export const createServer = async () => {
    const server: express.Application = express();
    
    //Notre serveur parsera les requête entrante en Json
    server.use(express.json())
    return server
}

