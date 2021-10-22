import dotenv from 'dotenv';
import path from 'path';


import {createServer} from './server';
console.log("qu'est ce que createServer: ",createServer)


// librairie path est natif de nodejs
// Le fichier .env que nous utiliserons ici se trouve à la racine de notre mono repo
const envPath= path.join(__dirname,'../../');
dotenv.config({path:envPath+ './.env'});


const main = async () => {
    // Create server
    const server = await createServer();
    //console.log("voir info server: ",server)

    server.listen(process.env.PORT,()=> {
        console.log(`Server is now running in port ${process.env.PORT} in ${process.env.NODE_ENV} mode`);
    })
}
main()