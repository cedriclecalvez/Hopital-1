import {createServer} from './server';
console.log("qu'est ce que createServer: ",createServer)

import {PORT,NODE_ENV} from './config'




const main = async () => {
    // Create server
    const server = await createServer();
    //console.log("voir info server: ",server)

    server.listen(PORT,()=> {
        console.log(`Server is now running in port ${PORT} in ${NODE_ENV} mode`);
    })
}
main()