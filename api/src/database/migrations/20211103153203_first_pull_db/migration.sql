-- CreateTable
CREATE TABLE `Allergie` (
    `idAllergie` INTEGER NOT NULL,
    `name` VARCHAR(45) NOT NULL,

    PRIMARY KEY (`idAllergie`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Allergie_has_Medicament` (
    `Allergie_idAllergie` INTEGER NOT NULL,
    `Medicament_idMedicament` INTEGER NOT NULL,

    INDEX `fk_Allergie_has_Medicament_Allergie1_idx`(`Allergie_idAllergie`),
    INDEX `fk_Allergie_has_Medicament_Medicament1_idx`(`Medicament_idMedicament`),
    PRIMARY KEY (`Allergie_idAllergie`, `Medicament_idMedicament`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Consultaion` (
    `idConsultaion` INTEGER NOT NULL,
    `date` DATE NOT NULL,
    `Medecin_idMedecin` INTEGER NOT NULL,
    `Medecin_Service_idService` INTEGER NOT NULL,
    `Patient_idPatient` INTEGER NOT NULL,

    INDEX `fk_Consultaion_Medecin1_idx`(`Medecin_idMedecin`, `Medecin_Service_idService`),
    INDEX `fk_Consultaion_Patient1_idx`(`Patient_idPatient`),
    PRIMARY KEY (`idConsultaion`, `Medecin_idMedecin`, `Medecin_Service_idService`, `Patient_idPatient`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Medecin` (
    `idMedecin` INTEGER NOT NULL,
    `name` VARCHAR(45) NOT NULL,
    `speciality` VARCHAR(45) NOT NULL,
    `Service_idService` INTEGER NOT NULL,

    INDEX `fk_Medecin_Service_idx`(`Service_idService`),
    PRIMARY KEY (`idMedecin`, `Service_idService`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Medicament` (
    `idMedicament` INTEGER NOT NULL,
    `name` VARCHAR(45) NOT NULL,
    `description` VARCHAR(45) NULL,

    PRIMARY KEY (`idMedicament`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Patient` (
    `idPatient` INTEGER NOT NULL,
    `name` VARCHAR(45) NOT NULL,
    `age` INTEGER NOT NULL,
    `phone` INTEGER NULL,
    `address` VARCHAR(45) NULL,
    `email` VARCHAR(45) NULL,
    `Service_idService` INTEGER NOT NULL,

    INDEX `fk_Patient_Service1_idx`(`Service_idService`),
    PRIMARY KEY (`idPatient`, `Service_idService`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Patient_has_Allergie` (
    `Patient_idPatient` INTEGER NOT NULL,
    `Allergie_idAllergie` INTEGER NOT NULL,

    INDEX `fk_Patient_has_Allergie_Allergie1_idx`(`Allergie_idAllergie`),
    INDEX `fk_Patient_has_Allergie_Patient1_idx`(`Patient_idPatient`),
    PRIMARY KEY (`Patient_idPatient`, `Allergie_idAllergie`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Prescription` (
    `idPrescription` INTEGER NOT NULL,
    `date` DATE NOT NULL,
    `description` VARCHAR(45) NULL,
    `quantity` VARCHAR(45) NULL,
    `Prescriptioncol` INTEGER NULL,
    `Consultaion_idConsultaion` INTEGER NOT NULL,
    `Consultaion_Medecin_idMedecin` INTEGER NOT NULL,
    `Consultaion_Medecin_Service_idService` INTEGER NOT NULL,
    `Consultaion_Patient_idPatient` INTEGER NOT NULL,

    INDEX `fk_Prescription_Consultaion1_idx`(`Consultaion_idConsultaion`, `Consultaion_Medecin_idMedecin`, `Consultaion_Medecin_Service_idService`, `Consultaion_Patient_idPatient`),
    PRIMARY KEY (`idPrescription`, `Consultaion_idConsultaion`, `Consultaion_Medecin_idMedecin`, `Consultaion_Medecin_Service_idService`, `Consultaion_Patient_idPatient`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Prescription_has_Medicament` (
    `Prescription_idPrescription` INTEGER NOT NULL,
    `Medicament_idMedicament` INTEGER NOT NULL,

    INDEX `fk_Prescription_has_Medicament_Medicament1_idx`(`Medicament_idMedicament`),
    INDEX `fk_Prescription_has_Medicament_Prescription1_idx`(`Prescription_idPrescription`),
    PRIMARY KEY (`Prescription_idPrescription`, `Medicament_idMedicament`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Service` (
    `idService` INTEGER NOT NULL,
    `name` VARCHAR(45) NOT NULL,
    `localisation` VARCHAR(45) NOT NULL,
    `description` VARCHAR(45) NOT NULL,

    PRIMARY KEY (`idService`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Allergie_has_Medicament` ADD CONSTRAINT `fk_Allergie_has_Medicament_Allergie1` FOREIGN KEY (`Allergie_idAllergie`) REFERENCES `Allergie`(`idAllergie`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Allergie_has_Medicament` ADD CONSTRAINT `fk_Allergie_has_Medicament_Medicament1` FOREIGN KEY (`Medicament_idMedicament`) REFERENCES `Medicament`(`idMedicament`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Consultaion` ADD CONSTRAINT `fk_Consultaion_Medecin1` FOREIGN KEY (`Medecin_idMedecin`, `Medecin_Service_idService`) REFERENCES `Medecin`(`idMedecin`, `Service_idService`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Consultaion` ADD CONSTRAINT `fk_Consultaion_Patient1` FOREIGN KEY (`Patient_idPatient`) REFERENCES `Patient`(`idPatient`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Medecin` ADD CONSTRAINT `fk_Medecin_Service` FOREIGN KEY (`Service_idService`) REFERENCES `Service`(`idService`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Patient` ADD CONSTRAINT `fk_Patient_Service1` FOREIGN KEY (`Service_idService`) REFERENCES `Service`(`idService`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Patient_has_Allergie` ADD CONSTRAINT `fk_Patient_has_Allergie_Allergie1` FOREIGN KEY (`Allergie_idAllergie`) REFERENCES `Allergie`(`idAllergie`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Patient_has_Allergie` ADD CONSTRAINT `fk_Patient_has_Allergie_Patient1` FOREIGN KEY (`Patient_idPatient`) REFERENCES `Patient`(`idPatient`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Prescription` ADD CONSTRAINT `fk_Prescription_Consultaion1` FOREIGN KEY (`Consultaion_idConsultaion`, `Consultaion_Medecin_idMedecin`, `Consultaion_Medecin_Service_idService`, `Consultaion_Patient_idPatient`) REFERENCES `Consultaion`(`idConsultaion`, `Medecin_idMedecin`, `Medecin_Service_idService`, `Patient_idPatient`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Prescription_has_Medicament` ADD CONSTRAINT `fk_Prescription_has_Medicament_Medicament1` FOREIGN KEY (`Medicament_idMedicament`) REFERENCES `Medicament`(`idMedicament`) ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE `Prescription_has_Medicament` ADD CONSTRAINT `fk_Prescription_has_Medicament_Prescription1` FOREIGN KEY (`Prescription_idPrescription`) REFERENCES `Prescription`(`idPrescription`) ON DELETE NO ACTION ON UPDATE NO ACTION;
