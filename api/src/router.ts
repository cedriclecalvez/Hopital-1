import { Router, Request, Response } from "express";
import { prisma } from "./database/index";

const mainRouter: Router = Router();

// racine de l'api
mainRouter.get("/", (_: Request, res: Response) => {
  //console.log("req:",req );
  //console.log("res:",res );
  res.send("Voici la racine de mon api");
});

// get all patients
mainRouter.get("/patients", async (_: Request, res: Response) => {
  const patients = await prisma.patient.findMany();
  console.log("route get all patients:", patients);
  
  res.send(patients);
});

// get all services
mainRouter.get("/services", async (_: Request, res: Response) => {
  const services = await prisma.service.findMany();
  console.log("route get all services:", services);

  res.send(services);
});

export default mainRouter;
