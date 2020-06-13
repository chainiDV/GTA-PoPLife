INSERT INTO `addon_account` (name, label, shared) VALUES 
	('society_police','Policia',1)
;

INSERT INTO `datastore` (name, label, shared) VALUES 
	('society_police','Policia',1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES 
	('society_police', 'Policia', 1)
;

INSERT INTO `jobs` (name, label) VALUES 
	('police','Policia')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('police',0,'recruit','Recluta',20,'{\"tshirt_1\":57,\"torso_1\":55,\"arms\":0,\"pants_1\":35,\"glasses\":0,\"decals_2\":0,\"hair_color_2\":0,\"helmet_2\":0,\"hair_color_1\":5,\"face\":19,\"glasses_2\":1,\"torso_2\":0,\"shoes\":24,\"hair_1\":2,\"skin\":34,\"sex\":0,\"glasses_1\":0,\"pants_2\":0,\"hair_2\":0,\"decals_1\":0,\"tshirt_2\":0,\"helmet_1\":8}','{\"tshirt_1\":34,\"torso_1\":48,\"shoes\":24,\"pants_1\":34,\"torso_2\":0,\"decals_2\":0,\"hair_color_2\":0,\"glasses\":0,\"helmet_2\":0,\"hair_2\":3,\"face\":21,\"decals_1\":0,\"glasses_2\":1,\"hair_1\":11,\"skin\":34,\"sex\":1,\"glasses_1\":5,\"pants_2\":0,\"arms\":14,\"hair_color_1\":10,\"tshirt_2\":0,\"helmet_1\":57}'),
	('police',1,'sergeant','Sargento',40,'{\"tshirt_1\":58,\"torso_1\":55,\"shoes\":24,\"pants_1\":35,\"pants_2\":0,\"decals_2\":1,\"hair_color_2\":0,\"face\":19,\"helmet_2\":0,\"hair_2\":0,\"arms\":0,\"decals_1\":8,\"torso_2\":0,\"hair_1\":2,\"skin\":34,\"sex\":0,\"glasses_1\":0,\"glasses_2\":1,\"hair_color_1\":5,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":11}','{\"tshirt_1\":35,\"torso_1\":48,\"arms\":14,\"pants_1\":34,\"pants_2\":0,\"decals_2\":1,\"hair_color_2\":0,\"shoes\":24,\"helmet_2\":0,\"hair_2\":3,\"decals_1\":7,\"torso_2\":0,\"face\":21,\"hair_1\":11,\"skin\":34,\"sex\":1,\"glasses_1\":5,\"glasses_2\":1,\"hair_color_1\":10,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":57}'),
	('police',2,'lieutenant','Teniente',65,'{\"tshirt_1\":58,\"torso_1\":55,\"shoes\":24,\"pants_1\":35,\"pants_2\":0,\"decals_2\":2,\"hair_color_2\":0,\"face\":19,\"helmet_2\":0,\"hair_2\":0,\"glasses\":0,\"decals_1\":8,\"hair_color_1\":5,\"hair_1\":2,\"skin\":34,\"sex\":0,\"glasses_1\":0,\"glasses_2\":1,\"torso_2\":0,\"arms\":41,\"tshirt_2\":0,\"helmet_1\":11}','{\"tshirt_1\":35,\"torso_1\":48,\"arms\":44,\"pants_1\":34,\"hair_2\":3,\"decals_2\":2,\"hair_color_2\":0,\"hair_color_1\":10,\"helmet_2\":0,\"face\":21,\"shoes\":24,\"torso_2\":0,\"glasses_2\":1,\"hair_1\":11,\"skin\":34,\"sex\":1,\"glasses_1\":5,\"pants_2\":0,\"decals_1\":7,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":57}'),
	('police',3,'boss','Capitán',80,'{\"tshirt_1\":58,\"torso_1\":55,\"shoes\":24,\"pants_1\":35,\"pants_2\":0,\"decals_2\":3,\"hair_color_2\":0,\"face\":19,\"helmet_2\":0,\"hair_2\":0,\"arms\":41,\"torso_2\":0,\"hair_color_1\":5,\"hair_1\":2,\"skin\":34,\"sex\":0,\"glasses_1\":0,\"glasses_2\":1,\"decals_1\":8,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":11}','{\"tshirt_1\":35,\"torso_1\":48,\"arms\":44,\"pants_1\":34,\"pants_2\":0,\"decals_2\":3,\"hair_color_2\":0,\"face\":21,\"helmet_2\":0,\"hair_2\":3,\"decals_1\":7,\"torso_2\":0,\"hair_color_1\":10,\"hair_1\":11,\"skin\":34,\"sex\":1,\"glasses_1\":5,\"glasses_2\":1,\"shoes\":24,\"glasses\":0,\"tshirt_2\":0,\"helmet_1\":57}')
;

CREATE TABLE `fine_types` (
  
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `label` varchar(255) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  
  PRIMARY KEY (`id`)
);

INSERT INTO `fine_types` (`id`, `label`, `amount`, `category`) VALUES
	(1, 'Uso abusivo del claxon', 45, 0),
	(2, 'Invadir una línea continua', 50, 0),
	(3, 'Circulación en sentido contrario', 250, 0),
	(4, 'Giro de 180º no autorizado', 175, 0),
	(5, 'Circulación prohíbida', 225, 0),
	(6, 'No respetar la distancia de seguridad', 45, 0),
	(7, 'Detenerse de manera imprudente / prohibido', 125, 0),
	(8, 'Estacionamiento indebido / prohibido', 75, 0),
	(9, 'No respetar el derecho de paso', 50, 0),
	(10, 'No respetar a un vehículo prioritario', 90, 0),
	(11, 'Saltarse un stop', 75, 0),
	(12, 'Saltarse un semáforo', 75, 0),
	(13, 'Adelantamiento imprudente', 75, 0),
	(14, 'Conducir con un vehículo en mal estado', 75, 0),
	(15, 'Conducir sin permiso de conducir', 1500, 0),
	(16, 'Fuga de la policía', 1000, 0),
	(17, 'Exceso de velocidad < 5 km/h', 50, 0),
	(18, 'Exceso de velocidad 5-15 km/h', 100, 0),
	(19, 'Exceso de velocidad 15-30 km/h', 150, 0),
	(20, 'Exceso de velocidad > 30 km/h', 250, 0),
	(21, 'Impedir la circulación', 100, 1),
	(22, 'Deterioro de la vía pública', 90, 1),
	(23, 'Disturbios', 250, 1),
	(24, 'Obstrucción a la justicia', 400, 1),
	(25, 'Insultos', 150, 1),
	(26, 'Desacato a la autoridad', 300, 1),
	(27, 'Amenazas', 200, 1),
	(28, 'Amenazar a un funcionario del estado', 250, 1),
	(29, 'Manifestación ilegal', 250, 1),
	(30, 'Sobornar a un funcionario del estado', 1750, 1),
	(31, 'Posesión de arma blanca', 400, 2),
	(32, 'Posesión de arma corta', 2500, 2),
	(33, 'Posesión de arma media', 5750, 2),
	(34, 'Posesión de arma larga', 8500, 2),
	(35, 'Posesión de material ilegal', 300, 2),
	(36, 'Robo de vehículo', 1800, 2),
	(37, 'Venta de drogas', 2750, 2),
	(38, 'Fabricación de drogas', 1500, 2),
	(39, 'Posesión de drogas', 2000, 2),
	(40, 'Secuestro', 3500, 2),
	(41, 'Secuestro de un funcionario del estado', 4000, 2),
	(42, 'Hurto menor', 850, 2),
	(43, 'Atraco a un comercio', 2500, 2),
	(44, 'Atraco al banco', 25000, 2),
	(45, 'Disparar a un civil', 2000, 3),
	(46, 'Disparar a un funcionario del estado', 2500, 3),
	(47, 'Intento de homicidio', 3000, 3),
	(48, 'Intento de homicidio a un funcionario del estado', 4500, 3),
	(49, 'Homicidio', 7500, 3),
	(50, 'Homicidio a un funcionario del estado', 10000, 3),
	(51, 'Homicidio involuntario', 3500, 3),
	(52, 'Estafar a la compañía', 2500, 2);
/*!40000 ALTER TABLE `fine_types` ENABLE KEYS */;