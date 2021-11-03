import { PrismaClient } from '@prisma/client'

// create a conexion with bdd then export
const prisma = new PrismaClient()

export {prisma}
