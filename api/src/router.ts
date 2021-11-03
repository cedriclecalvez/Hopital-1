import { Router, Request, Response } from "express";

const mainRouter: Router = Router();

mainRouter.get("/", (_: Request, res: Response) => {
  //console.log("req:",req );
  //console.log("res:",res );
  res.send("Voici la racine de mon api");
});

export default mainRouter;
