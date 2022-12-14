-- MySQL dump 10.13  Distrib 5.5.62, for Win64 (AMD64)
--
-- Host: localhost    Database: anubisshop_db1
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `street` varchar(45) NOT NULL,
  `city` varchar(45) NOT NULL,
  `province` varchar(45) NOT NULL,
  `number` varchar(45) NOT NULL,
  `postal_code` varchar(45) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `addresses_userId_IDX` (`user_id`) USING BTREE,
  CONSTRAINT `addresses_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Juguete'),(2,'Accesorios'),(3,'Almohadas y camas'),(4,'Alimentos'),(5,'Higiene'),(11,'peluchin');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updateAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_items_FK` (`order_id`),
  KEY `order_items_FK_1` (`product_id`),
  CONSTRAINT `order_items_FK` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  CONSTRAINT `order_items_FK_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `state` varchar(45) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `orders_FK` (`user_id`),
  CONSTRAINT `orders_FK` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `price` int(11) NOT NULL,
  `description` text DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `promo` varchar(20) DEFAULT NULL,
  `discount` int(11) DEFAULT NULL,
  `images` varchar(45) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL,
  `stock` tinyint(4) DEFAULT NULL,
  `product_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `products_FK` (`category_id`),
  CONSTRAINT `products_FK` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (22,'Hueso de goma',300,'',1,'Ninguno',15,'1656402338051_img_.jpg','2022-08-03 07:41:06',NULL,NULL,NULL),(23,'Pelota de tenis',450,'Pelota de goma maciza que rebota. Este juguete de goma ha sido especialmente dise??ado para satisfacer el natural comportamiento mordedor y dar la m??xima posibilidad de roer que sienten los perros activos, estimulando el juego y el ejercicio, al mismo tiempo que mantiene la salud bucal al al masajear sus enc??as y fortalecer todo el sistema muscular de su mand????bula',1,'Ninguno',40,'1656402419218_img_.jpg','2022-08-03 22:26:08',NULL,NULL,NULL),(24,'Pelotas de soga',200,'Pelota realizada con sogas anudadas que adem??????????????????s de servir para que el perro de divierta ayuda a la limpieza dental.',1,'Ninguno',0,'1656402505960_img_.jpg','2022-06-28 07:48:26',NULL,NULL,NULL),(25,'Rascador',200,'Elaborado con cart??????????????????n corrugado muy resistente ofrece a su gato una superficie ideal donde afilarse las u??????????????????as. Gracias a su dise??????????????????o exclusivo quedar?????????????????? fant??????????????????stico en cualquier lugar de su casa. Los gatos necesitan ara??????????????????ar por instinto. ????????????????????????sto les ayuda a afilar sus u??????????????????as, eliminar las capas muertas de sus garras, estirar y flexionar sus cuerpos. Adem??????????????????s ayuda a proteger los muebles de los ara??????????????????azos. Incluye hierba para gatos.',1,'Oferta',5,'1656402583659_img_.jpg','2022-06-28 07:49:43',NULL,NULL,NULL),(26,'Varita con plumas para gato',300,'Seguramente este sea el juego favorito de los gatos: agita la varita Zootec delante del gato y ver??????????????????s lo r??????????????????pido que reacciona ante las coloridas plumas. Con este juguete despertar??????????????????s el instinto cazador de tu mascota gracias a las ligeras plumas que se mueven suavemente.',1,'Oferta',10,'1656402663385_img_.jpg','2022-06-28 07:51:03',NULL,NULL,NULL),(27,'Arnes con forma de hueso',800,'C??????????????????modo y seguro arn??????????????????s para todo tipo de perros. Les entrega comodidad y libertad de movimientos, pero tambi??????????????????n permite aplicar control facilmente en caso de ser necesario. Totalmente ergon??????????????????mico y extra robusto, est?????????????????? acolchado en su interior y tiene 2 mecanismos de ajuste. Sus l??????????????????neas robustas no alteran la calidad total del tejido, que es impermeable, extra resistente y sin embargo, delicado con la piel del perro, al tener las costuras ocultas para evitar roces y ser un tejido transpirable a la piel. El arn??????????????????s adem??????????????????s, viene provisto de un completo sistema reflectante en sus costuras y acabados. En su parte superior dispone de una medialuna de acero para enganchar la correa, pero, en el caso de querer tener un control m??????????????????s preciso del perro, tambi??????????????????n tiene un agarre muy resistente para sujetar a su mascota y tener el control total, incluso en caso de tirones. Gracias a su dise??????????????????o ergon??????????????????mico, consigue una ??????????????????ptima distribuci??????????????????n de las fuerzas evitando lastimar a tu mascota.',2,'Destacado',60,'1656402734072_img_.jpg','2022-06-28 07:52:14',NULL,NULL,NULL),(28,'Bebedero port??til',500,'Si te gusta salir de paseo con tu mascota, este producto es perfecto para ti. Se trata de una botella de pl??stico unida a una pieza que sirve a la vez como plato y como estuche para la botella.  Es muy pr??ctico para transportar agua limpia para tu perro durante cualquier actividad (paseo en coche, marcha a pie, camping), incluso para el paseo diario en el parque en ??pocas de calor, cuando hay un mayor riesgo de deshidrataci??n. El novedoso dise??o botella y taza en uno proporciona un transporte f??cil y un consumo de agua segura para el animal. Simplemente aprieta la botella para que el agua se descargue en la taza. Tiene una correa que te permite cargarlo c??modamente y tener ambas manos libres. Disponible en tama??o 500ml',1,'Ninguno',0,'1656402953779_img_.jpg','2022-08-01 22:44:40',NULL,NULL,NULL),(29,'Collares de nylon cl??sicos',200,'Collares para perros de alta gama realizados en polipropileno. Este modelo otorga un toque de distinci??n y belleza a la mascota. Excelente terminaci??n y dise??o. Venta mayorista. Modelos y colores variados. Medidas: 15mm de ancho x 30cms de largo. 20mm de ancho x 40cms de largo. 20mm de ancho x 50cms de largo. 30mm de ancho x 60cms de largo. 30mm de ancho x 65cms de largo. 40mm de ancho x 70cms de largo. ',1,'Ninguno',10,'1656402904840_img_.jpg','2022-08-01 22:46:30',NULL,NULL,NULL),(30,'Comedero bebedero con botella',600,'Comedero Bebedero doble con rosca. - para botella de hasta 1.5 litros. - el platito del alimento se saca para lavarlo. - mide: 34cms de largo x 6 cms',2,'Ninguno',10,'1656403049573_img_.jpg','2022-06-28 07:57:29',NULL,NULL,NULL),(31,'Correa de cadena',400,'La uni??????????????????n de la manija est?????????????????? asegurada con remaches. La cadena termina en un mosquet??????????????????n muy seguro para amarrarla al collar. Ideal para perros que muerden la correa. 120 CM',2,'Oferta',5,'1656403120561_img_.jpg','2022-06-28 07:58:40',NULL,NULL,NULL),(32,'Correa trenzada',260,'Esta correa es ideal para perros de gran tama??????????????????o o que tienen mucha fuerza. Con su dise??????????????????o de soga pl??????????????????stica trenzada y su gancho reforzado garantiza resistencia y seguridad para cientos de paseos.  Medidas: 1.35 de largo, aprox 3 cms de di??????????????????metro',2,'Oferta',5,'1656403418217_img_.jpg','2022-06-28 08:03:38',NULL,NULL,NULL),(33,'Mochila transportadora',1600,'Mochila c??????????????????moda y acolchada que para transportar a su mascota en un espacio compacto y seguro, con aberturas para que pueda disfrutar del sol y el aire fresco. Contiene una correa corta con mosquet??????????????????n en su interior para enganchar el collar de su mascota a la mochila y brindar m??????????????????s seguridad. Se ofrece en 2 tama??????????????????os: chico y mediano. Importante: No se puede seleccionar color. Los colores est?????????????????? sujetos a la disponibilidad al momento de armar el pedido.',2,'Destacado',45,'1656403503112_img_.jpg','2022-06-28 08:05:03',NULL,NULL,NULL),(34,'Plato plegable silicona',500,'Pr??????????????????ctico comedero/bebedero para llevar en tus paseos o viajes con tu mascota. Es de silicona, se puede plegar para que sea de f??????????????????cil traslado. Incluye mosquet??????????????????n para enganchar en la correa, collar, en tu mochila o donde prefieras. Tama??????????????????o: -Chico: Di??????????????????metro superior 13cms, Di??????????????????metro base: 9 cms, Altura: 5 cms. -Mediano: Di??????????????????metro superior 17,5cms, Di??????????????????metro base: 12 cms, Altura: 6,5 cms',2,'Ninguno',5,'1656403558482_img_.jpg','2022-06-28 08:05:58',NULL,NULL,NULL),(35,'Cama colchon',800,'Colchonetas 60 x 80 cm, ideal para el perro!, varios modelos.',1,'Oferta',10,'1656403800157_img_.jpg','2022-06-28 08:10:00',NULL,NULL,NULL),(36,'Cama marvel',1000,'La Cama Marvel, es una opci??????????????????n ideal para darle a tu mascota un lugar de descanso donde se sienta c??????????????????moda y relajada. Est?????????????????? fabricada con materiales t??????????????????rmicos que protegen a tu perro de las temperaturas m??????????????????s fr??????????????????as, asegurando que pueda dormir con todas las comodidades. Asimismo, su dise??????????????????o divertido de Spider Man la vuelve una adici??????????????????n moderna y atractiva para cualquier hogar amante de Marvel. Incluye un almohad??????????????????n con un divertido dise??????????????????o de Spider Man. Medidas:         65x45 cm',3,'Destacado',50,'1656413480901_img_.jpg','2022-06-28 10:51:20',NULL,NULL,NULL),(37,'Camas',800,'Colchoneta impermeable gigante. Relleno espuma de polietileno (troqueles), mantiene mejor la altura y mejor aislaci??????????????????n t??????????????????rmica. - Variedad de colores.\r\n      ',3,'Ninguno',10,'1656413573767_img_.jpg','2022-06-28 10:52:53',NULL,NULL,NULL),(38,'Igloo para perro marvel',1300,'Cueva para mascota CAPITAN AM????????????????????????RICA - MARVEL????????????????????. Las cuevas son perfectas para que tu mascota pueda descansar muy c??????????????????moda. Es ideal para las mascotas m??????????????????s FAN y les encante estar acurrucados a la hora de dormir. Su tejido es muy suave y acogedor, har?????????????????? que tu mascota est?????????????????? calentito en su interior. La entrada de la parte frontal proporciona un acceso f??????????????????cil, adem??????????????????s gracias a su relleno esponjoso proporcionar?????????????????? una nuena sensaci??????????????????n de bienestar y su mascota se sentir?????????????????? muy segura. Su base es antideslizante y muy resistente por lo que evitar?????????????????? que se desplace, es aislante total de la humedad, el fr??????????????????o o el calor del suelo. El cojin es extraible. Funda / Cover: 50% POLYESTER 50% COTTON Relleno / Padding: 100% POLYESTER Base / Base: 100% POLYESTER. Medidas: 40x45 Cm\r\n       ',3,'Destacado',55,'1656413627976_img_.jpg','2022-06-28 10:53:47',NULL,NULL,NULL),(39,'Igloo para perro star wars',1300,'Cueva para mascota STAR WARS R2-D2????????????????????. Las cuevas son perfectas para que tu mascota pueda descansar muy c??????????????????moda. Es ideal para las mascotas m??????????????????s FAN y les encante estar acurrucados a la hora de dormir. Su tejido es muy suave y acogedor, har?????????????????? que tu mascota est?????????????????? calentito en su interior. La entrada de la parte frontal proporciona un acceso f??????????????????cil, adem??????????????????s gracias a su relleno esponjoso proporcionar?????????????????? una nuena sensaci??????????????????n de bienestar y su mascota se sentir?????????????????? muy segura. Su base es antideslizante y muy resistente por lo que evitar?????????????????? que se desplace, es aislante total de la humedad, el fr??????????????????o o el calor del suelo. El cojin es extraible. Funda / Cover: 50% POLYESTER 50% COTTON Relleno / Padding: 100% POLYESTER Base / Base: 100% POLYESTER. Medidas: 40x45 Cm\r\n       ',3,'Destacado',45,'1656413688954_img_.jpg','2022-06-28 10:54:48',NULL,NULL,NULL),(40,'proplan cat adult',2500,'Alimento para gatos mayores a 1 a??????????????????o con actividad normal. Calidad Super Premium. Los gatos adultos tienen diferentes h??????????????????bitos y por lo tanto, diferentes necesidades nutricionales que los gatitos o los gatos maduros. Estas necesidades nutricionales pueden ser satisfechas por medio de una alimentaci??????????????????n espec??????????????????ficamente dise??????????????????ada para su estilo de vida y su edad. Cuidar la nutrici??????????????????n de tu gato lo ayudar?????????????????? a mantenerse sano en el futuro. PRO PLAN???????????????????? Cat Adult con OptiDigest formulados con OptiDigest y pollo o salm??????????????????n fresco, proporcionan una nutrici??????????????????n completa, equilibrada y de alta calidad para gatos adultos entre 1 y 7 a??????????????????os.\r\n        ',4,'Ninguno',10,'1656413788091_img_.jpg','2022-06-28 10:56:28',NULL,NULL,NULL),(41,'proplan cat kitten-x7,5-kg',3000,'Alimento rico en vitaminas y minerales para Gatitos hasta el 1???????????????????? a??????????????????o. Calidad Super Premium. Formulado con OptiStart para gatitos en etapa de desarrollo (de 1 a 12 meses de edad) y hembras gestantes y lactantes. Purina Pro Plan???????????????????? Kitten apoya la respuesta inmunol??????????????????gica, gracias a la presencia de anticuerpos naturales del calostro y antioxidantes. Esto produce una mejor respuesta a la vacunaci??????????????????n, mayor protecci??????????????????n frente a pat??????????????????genos, una ??????????????????ptima absorci??????????????????n de nutrientes y en general una mejor salud de los gatitos.\r\n        ',4,'Destacado',40,'1656413893259_img_.jpg','2022-06-28 10:58:13',NULL,NULL,NULL),(42,'proplan cat sterilized x7,5-kg',3000,'Alimento para gatos castrados Super Premium, Salmon y Arroz. Pro Plan???????????????????? Cat Sterilized con Optirenal, esta especialmente elaborado para gatos adultos castrados o esterilizados. Formulado con OptiRenal, ayuda a proteger la funci??????????????????n renal de los gatos. Incluye tambi??????????????????n salm??????????????????n fresco, aportando mayor digestibilidad y manteniendo las caracter??????????????????sticas nutritivas del pescado fresco. Nutrici??????????????????n de vanguardia para una protecci??????????????????n completa y una ??????????????????ptima salud.\r\n       ',4,'Oferta',10,'1656413959360_img_.jpg','2022-06-28 10:59:19',NULL,NULL,NULL),(43,'Royal canin maxi adulto x15-kg',2000,'Alimento para perros de raza grande de 15 meses a 8 a??????????????????os de edad. Promueve una ??????????????????ptima digestibilidad gracias a su f??????????????????rmula exclusiva que incluye prote??????????????????nas de muy alta calidad y un aporte adecuado de fibras dietarias. SOPORTE OSTEOARTICULAR. Contribuye a la salud de los huesos y de las articulaciones, particularmente sometidas al estr??????????????????s en los perros de tama??????????????????o grande. ALTA PALATABILIDAD. Satisface el apetito de los perros de talla grande gracias a sus saborizantes rigurosamente seleccionados. OMEGA 3: EPA - DHA.   F??????????????????rmula enriquecida con ??????????????????cidos grasos omega 3 (EPA-DHA) que ayudan a mantener una piel saludable.\r\n       ',4,'Ninguno',15,'1656414019695_img_.jpg','2022-06-28 11:00:19',NULL,NULL,NULL),(44,'royal canin medium adulto x3-kg',2500,'Alimento para perros adultos de raza mediana de 1 a 7 a??????????????????os de edad. Ayuda a reforzar las defensas naturales gracias a un complejo de antioxidantes patentado (vitamina E, vitamina C, lute??????????????????na y taurina) y a los manano-oligosac??????????????????ridos. ALTA DIGESTIBILIDAD. Ayuda a promover una ??????????????????ptima digestibilidad gracias a su exclusiva f??????????????????rmula que incluye prote??????????????????nas de muy alta calidad y un aporte adecuado de fibras dietarias. OMEGA 3: EPA Y DHA. F??????????????????rmula enriquecida con ??????????????????cidos grasos omega 3 (EPA-DHA) que ayudan a mantener una piel saludable. ALTA PALATABILIDAD. Estimula el apetito de los perros de talla mediana, gracias a la incorporaci??????????????????n de aromas naturales cuidadosamente seleccionados.\r\n       ',4,'Destacado',50,'1656414072614_img_.jpg','2022-06-28 11:01:12',NULL,NULL,NULL),(45,'royal-canin-mini-adulto-x3-kg',2500,'Alimento para perros de raza peque??????????????????a de 10 meses a 8 a??????????????????os de edad. Contribuye a mantener el peso ideal de los perros de talla peque??????????????????a, teniendo en cuenta sus elevadas necesidades energ??????????????????ticas a trav??????????????????s de un contenido adaptado en calor??????????????????as (3914 kcal/kg) y prote??????????????????nas (27%). Se encuentra enriquecido con L-carnitina, que promueve el metabolismo de las grasas. PALATABILIDAD REFORZADA. Ayuda a satisfacer el apetito caprichoso de los perros de talla peque??????????????????a gracias a su f??????????????????rmula y a la selecci??????????????????n de saborizantes exclusivos. CALIDAD DEL PELAJE. Contribuye a mejorar el estado de la piel y el pelo, gracias al aporte de nutrientes espec??????????????????ficos y su alto contenido de EPA-DHA. CONTROL DEL SARRO. Ayuda a reducir la formaci??????????????????n de sarro gracias a la adici??????????????????n en su f??????????????????rmula de agentes quelantes de calcio (politrifosfato de sodio).\r\n       ',4,'Ninguno',10,'1656414159941_img_.jpg','2022-06-28 11:02:39',NULL,NULL,NULL),(46,'royal canin mini junior x3-kg',2000,'Pr??????????????????ctico comedero/bebedero para llevar en tus paseos o viajes con tu mascota. Es de silicona, se puede plegar para que sea de f??????????????????cil traslado. Incluye mosquet??????????????????n para enganchar en la correa, collar, en tu mochila o donde prefieras. Tama??????????????????o: -Chico: Di??????????????????metro superior 13cms, Di??????????????????metro base: 9 cms, Altura: 5 cms. -Mediano: Di??????????????????metro superior 17,5cms, Di??????????????????metro base: 12 cms, Altura: 6,5 cms\r\n      ',4,'Ninguno',10,'1656414211473_img_.jpg','2022-06-28 11:03:31',NULL,NULL,NULL),(47,'Cepillo cardina mango de madera',600,'Cardina con superficie plana, la cual ayuda a sacar los pelos sueltos y a emparejar el pelaje. Si bien sus dientes son met??????????????????licos, son muy suaves y sus puntas no lastiman la piel de su perro. P??????????????????sela a contrapelo para desenredar, quitar la suciedad y soltar los pelos viejos. Y en sentido del pelo para retirar los pelos sueltos, emprolijar y dar brillo. La estructura es met??????????????????lica y el mango es de madera.\r\n       ',5,'Ninguno',10,'1656414264500_img_.jpg','2022-06-28 11:04:24',NULL,NULL,NULL),(48,'cepillo dental perro',800,'Dedo Cepillo De Dientes Suave Mascota Perro Gato Dental x 2 unidades. Se estima que sin un cuidado dental apropiado, el 80% de los perros y el 70% de los gatos mostrar??????????????????n signos de enfermedad bucal a los 3 a??????????????????os. Con tu apoyo, tu mascota puede tener dientes y enc??????????????????as saludables durante toda su vida. El uso regular del cepillo dental evita la formaci??????????????????n de placa y sarro, previene las enfermedades de los dientes y las enc??????????????????as. Tambi??????????????????n el mal aliento en perros y gatos.\r\n       ',5,'Ninguno',10,'1656414367568_img_.jpg','2022-06-28 11:06:07',NULL,NULL,NULL),(49,'cepillo doble madera',850,'Cepillo con mango de madera, para perros o gatos (23 cms de largo)\r\n       ',5,'Ninguno',15,'1656414409266_img_.jpg','2022-06-28 11:06:49',NULL,NULL,NULL),(50,'collar isabelino',1550,'Cuello isabelino de f??????????????????cil colocaci??????????????????n para la recuperaci??????????????????n de perros y gatos despu??????????????????s de operaciones o castraci??????????????????n. Los collares isabelinos se colocan en el cuello de perros o gatos para que no lleguen a lamerse las heridas o sacarse los puntos despu??????????????????s de una operaci??????????????????n o una castraci??????????????????n. As??????????????????, evitan infecciones y lastimaduras y aceleran su recuperaci??????????????????n.\r\n       ',5,'Ninguno',20,'1656414484117_img_.jpg','2022-06-28 11:08:04',NULL,NULL,NULL),(51,'corta u??as tijera',780,'Alicate con Lima mediano.   Tama??o Alicate: 13 cm de largo\r\n       ',1,'Ninguno',20,'1656414553768_img_.jpg','2022-08-01 22:47:07',NULL,NULL,NULL);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_images`
--

DROP TABLE IF EXISTS `products_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `products_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_name` varchar(45) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_79` (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_images`
--

LOCK TABLES `products_images` WRITE;
/*!40000 ALTER TABLE `products_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `products_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `category_id` int(11) NOT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sub_categories_FK` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categories`
--

LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
INSERT INTO `sub_categories` VALUES (1,'perros',1,'2022-06-10 19:54:13',NULL),(2,'gatos',1,'2022-06-10 19:54:13',NULL),(3,'perros',2,'2022-06-10 19:54:13',NULL),(4,'gatos',2,'2022-06-10 19:54:13',NULL),(5,'perros',3,'2022-06-10 19:54:13',NULL),(6,'gatos',3,'2022-06-10 19:54:13',NULL),(7,'perros',4,'2022-06-10 19:54:13',NULL),(8,'gatos',4,'2022-06-10 19:54:13',NULL),(9,'perros',5,'2022-06-10 19:54:13',NULL),(10,'gatos',5,'2022-06-10 19:54:13',NULL);
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `rol_id` int(11) NOT NULL,
  `email` varchar(60) NOT NULL,
  `password` varchar(70) NOT NULL,
  `avatar` varchar(45) DEFAULT NULL,
  `createdAt` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `updatedAt` timestamp NULL DEFAULT NULL,
  `phone` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_86` (`rol_id`) USING BTREE,
  CONSTRAINT `users_FK` FOREIGN KEY (`rol_id`) REFERENCES `users_rols` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Juancito',1,'juan@mail.com','$2a$10$emEgPGu6V6rCW87Aoe.OSudaCin3j5G4K/i6VjiT7ysJx7l0jHxRe','default-image.jpg','2022-06-07 14:18:24',NULL,'5353456'),(5,'holaaa',2,'selena1@mail.com','$2a$10$diBHun1G6HK0v.Gg3c3H/O0kw1j51GH1L7zsghgTucH46hbeoUQTG','default-image.jpg','2022-07-28 23:15:21',NULL,'1212121212'),(6,'Jhan ',2,'jhan1@mail.com','$2a$10$fvyhoxT1XlUt8sy/CadHI.c//dLyjVH1/kqCpCdrT3iyphF5dU7tW','default-image.jpg','2022-07-08 15:41:13',NULL,NULL),(7,'Sebas',2,'sebastian1@mail.com','$2a$10$ivTlpt2KnOkKdzldflHA/uee/zuVEXdZwfACSO8JQcj5bGTs8LmjO','default-image.jpg','2022-07-25 22:42:10',NULL,'5656456'),(8,'     ',1,'luismi@mail.com','$2a$10$2D.6AXNQVSRT/zdjGN.hSuYz0pnq/gHoBI4dKGDb3lHpjeGpd78Sa','default-image.jpg','2022-07-25 21:01:11',NULL,NULL),(9,'Luismi',1,'luismi1@mail.com','$2a$10$.lIA/ndY7k5gKni91YtDj.S98DtBVJQ54eIqGTqH0oLpczZjZAvHm','default-image.jpg','2022-07-25 21:05:44',NULL,NULL),(10,'prueba',1,'juaan@email.com','$2a$10$oMZgcqrblFn7BB2zMujhHudbywPRsL0QvU5IhsBHOsJ97gqWa8I.m','1658790690512_img_.png','2022-07-25 23:12:35',NULL,'15555555'),(11,'pruebaaa',1,'juan6@mail.com','$2a$10$nrYhw9GZIT.nDAdCJyyfKOTn6Zkv/tFGPAqgTpKRcWUPvPEjI/oJi','default-image.jpg','2022-07-26 23:33:41',NULL,NULL),(12,'selenaaaaaa',1,'selena7@mail.com','$2a$10$g9mond8e3lRVdfbw7R460uxgWT4JOPou3DFWvPN9S/NWoivx9uMHK','default-image.jpg','2022-07-26 23:36:43',NULL,NULL),(13,'holaaa',1,'juan58@mail.com','$2a$10$fi3/fmuBGzfKu2/FV1H0muaJOeKZJaCCdaDlleRci0AjsynUHJaOO','default-image.jpg','2022-07-27 22:18:35',NULL,NULL),(14,'hola',1,'juan36@mail.com','$2a$10$7XLhMhTZXJWNZedirNSwB./Zumvo74Fbcnl5MJ1puWHdKPvD/hpxS','1658960615860_img_.png','2022-07-27 22:23:35',NULL,NULL),(15,'juan',1,'juan15@mail.com','$2a$10$mufKuydk1LPY/rlvChKO2OL5JkQRoT0fF9CLvluevMR46W./gCArW','default-image.jpg','2022-07-27 22:24:49',NULL,NULL),(16,'selena',1,'juan59@mail.com','$2a$10$kV/lC89NnPqnJOuyvpYpS.7b03tr2VR3vwqX3s/e9ttFicuoo/fmu','1658962523694_img_.png','2022-07-27 22:56:10',NULL,'12234567'),(17,'juan',1,'ejemplo20@gmail.com','$2a$10$VbVS0MwzD/gleprcHsmO7ucgpKPqrKyTC93uREGAMub0P7GpNrzaC','1659049352912_img_.png','2022-07-28 23:02:33',NULL,NULL),(18,'selena',1,'selena20@mail.com','$2a$10$wh3kSUgsiHXEXGAuxLi1Ke34OOsNDH/SiJk.psrH1P7d2yXjsYrtS','default-image.jpg','2022-07-29 23:10:52',NULL,'152645781'),(19,'selena',1,'ejemplo3@mail.com','$2a$10$rG44gQzrFsxVX0ig.om.Zev1eu/E8kkWb5.nmqZ18MQoD3IVuqojy','1659310299749_img_.png','2022-07-31 23:33:01',NULL,'2334546677'),(20,'selena',1,'ejemplo4@mail.com','$2a$10$MHQrFAeDE1n8KhJehzBer.BfwBrS3nuvuWSVGUNYcZTlPT/ql6aWa','1659310644785_img_.png','2022-07-31 23:38:35',NULL,'65456454'),(21,'juan',1,'ejemplo5@gmail.com','$2a$10$g6MCxjy9a1gScgmv8X6.G.98O8gDUvH7P/ya5ZkKdpBIOsmKjGo0e','1659312151524_img_.png','2022-08-01 00:02:31',NULL,'1212121212'),(22,'selena',1,'ejemplo6@mail.com','$2a$10$xETDmaHpLBQYY6HHuvXkj./4zbuLZeQsqQCtKtTONOasB/q5p1px6','1659312301253_img_.png','2022-08-01 00:05:51',NULL,'1212121212'),(23,'seelna',1,'ejemplo7@mail.com','$2a$10$axS1Zs8SPr2w4C7ypwh7uOFQxafYLwmjNO.9ASU9hsBrVLQdHpX0K','1659313497717_img_.png','2022-08-01 00:25:55',NULL,'2334546677'),(24,'selena',1,'ejemplo9@mail.com','$2a$10$I4N02XrMTRW0JorHBQfH5OxN7NvRHdXWh2d7iYnHh2LATS4Wi9Gbu','1659476083932_img_.png','2022-08-02 21:35:58',NULL,'1236756845'),(25,'selena',1,'ejemplo11@mail.com','$2a$10$w716Vp80LornUvEGeC9f3ORLhFX/TPqVp09xoQ3YlyvVK.d/t9Q0i','default-image.jpg','2022-08-02 23:50:26',NULL,'123454645'),(26,'selena',1,'ejemplo13@mail.com','$2a$10$u4R2GYXRSR6oqf9yY11MKu8U6ZXOuE.GIy8q5bLXYbanzFAtPhHf6','1659568320814_img_.png','2022-08-03 23:12:51',NULL,'65465464'),(27,'selena',1,'ejemplo14@email.com','$2a$10$H8I2XQNrX8uq5vkSh4TCyeRVVqIpX3QeV653/Ww8r/5FpF2rQDO.W','1659568779937_img_.png','2022-08-03 23:20:30',NULL,'65465465');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_rols`
--

DROP TABLE IF EXISTS `users_rols`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_rols` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rol_name` varchar(45) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_rols`
--

LOCK TABLES `users_rols` WRITE;
/*!40000 ALTER TABLE `users_rols` DISABLE KEYS */;
INSERT INTO `users_rols` VALUES (1,'USER'),(2,'ADMIN');
/*!40000 ALTER TABLE `users_rols` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'anubisshop_db1'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-04 18:30:59
