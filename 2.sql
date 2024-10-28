-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: laptopshop2
-- ------------------------------------------------------
-- Server version	8.0.37

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cart_detail`
--

DROP TABLE IF EXISTS `cart_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `quantity` bigint NOT NULL,
  `cart_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKbql1m2v2po7hcawonqsgqex88` (`cart_id`),
  KEY `FKclb1c0wg3mofxnpgidib1t987` (`product_id`),
  CONSTRAINT `FKbql1m2v2po7hcawonqsgqex88` FOREIGN KEY (`cart_id`) REFERENCES `carts` (`id`),
  CONSTRAINT `FKclb1c0wg3mofxnpgidib1t987` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_detail`
--

LOCK TABLES `cart_detail` WRITE;
/*!40000 ALTER TABLE `cart_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carts`
--

DROP TABLE IF EXISTS `carts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carts` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `sum` int NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_64t7ox312pqal3p7fg9o503c2` (`user_id`),
  CONSTRAINT `FKb5o626f86h46m4s7ms6ginnop` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`),
  CONSTRAINT `carts_chk_1` CHECK ((`sum` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carts`
--

LOCK TABLES `carts` WRITE;
/*!40000 ALTER TABLE `carts` DISABLE KEYS */;
/*!40000 ALTER TABLE `carts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `price` double NOT NULL,
  `quantity` bigint NOT NULL,
  `order_id` bigint DEFAULT NULL,
  `product_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKrws2q0si6oyd6il8gqe2aennc` (`order_id`),
  KEY `FKc7q42e9tu0hslx6w4wxgomhvn` (`product_id`),
  CONSTRAINT `FKc7q42e9tu0hslx6w4wxgomhvn` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  CONSTRAINT `FKrws2q0si6oyd6il8gqe2aennc` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (1,15490000,1,1,2),(2,26999000,1,1,9);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `receiver_address` varchar(255) DEFAULT NULL,
  `receiver_name` varchar(255) DEFAULT NULL,
  `receiver_phone` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `total_price` double NOT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK32ql8ubntj5uh44ph9659tiih` (`user_id`),
  CONSTRAINT `FK32ql8ubntj5uh44ph9659tiih` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'108 Mieu Binh Dong','Nguyen Tien Dat','0349214711','PENDING',42489000,1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `detail_desc` mediumtext NOT NULL,
  `factory` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `price` double NOT NULL,
  `quantity` bigint NOT NULL,
  `short_desc` varchar(255) NOT NULL,
  `sold` bigint NOT NULL,
  `target` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `products_chk_1` CHECK ((`quantity` >= 1))
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'ASUS TUF Gaming F15 FX506HF HN017W là chiếc laptop gaming giá rẻ nhưng vô cùng mạnh mẽ. Không chỉ bộ vi xử lý Intel thế hệ thứ 11, card đồ họa RTX 20 series mà điểm mạnh còn đến từ việc trang bị sẵn 16GB RAM, cho bạn hiệu năng xuất sắc mà không cần nâng cấp máy.','ASUS','1711078092373-asus-01.png','Laptop Asus TUF Gaming',17490000,100,'Intel, Core i5, 11400H',0,'GAMING'),(2,'Khám phá sức mạnh tối ưu từ Dell Inspiron 15 N3520, chiếc laptop có cấu hình cực mạnh với bộ vi xử lý Intel Core i5 1235U thế hệ mới và dung lượng RAM lên tới 16GB. Bạn có thể thoải mái xử lý nhiều tác vụ, nâng cao năng suất trong công việc mà không gặp bất kỳ trở ngại nào.','DELL','1711078452562-dell-01.png','Laptop Dell Inspiron 15',15490000,200,'i5 1235U/16GB/512GB/15.6\"FHD',0,'SINHVIEN-VANPHONG'),(3,'Mới đây, Lenovo đã tung ra thị trường một sản phẩm gaming thế hệ mới với hiệu năng mạnh mẽ, thiết kế tối giản, lịch lãm phù hợp cho những game thủ thích sự đơn giản. Tản nhiệt mát mẻ với hệ thống quạt kép kiểm soát được nhiệt độ máy luôn mát mẻ khi chơi game.','LENOVO','1711079073759-lenovo-01.png','Lenovo IdeaPad Gaming 3',19500000,150,'i5-10300H, RAM 8G',0,'GAMING'),(4,'Tận hưởng cảm giác mát lạnh sành điệu với thiết kế kim loại Được thiết kế để đáp ứng những nhu cầu điện toán hàng ngày của bạn, dòng máy tính xách tay ASUS K Series sở hữu thiết kế tối giản, gọn nhẹ và cực mỏng với một lớp vỏ họa tiết vân kim loại phong cách. Hiệu năng của máy rất mạnh mẽ nhờ trang bị bộ vi xử lý Intel® Core™ i7 processor và đồ họa mới nhất. Bên cạnh đó, các công nghệ sáng tạo độc quyền của ASUS đưa thiết bị lên đẳng cấp mới, cho bạn một trải nghiệm người dùng trực quan và tính năng công thái học vượt trội.','ASUS','1711079496409-asus-02.png','Asus K501UX',11900000,99,'VGA NVIDIA GTX 950M- 4G',0,'THIET-KE-DO-HOA'),(5,'Chiếc MacBook Air có hiệu năng đột phá nhất từ trước đến nay đã xuất hiện. Bộ vi xử lý Apple M1 hoàn toàn mới đưa sức mạnh của MacBook Air M1 13 inch 2020 vượt xa khỏi mong đợi người dùng, có thể chạy được những tác vụ nặng và thời lượng pin đáng kinh ngạc.','APPLE','1711079954090-apple-01.png','MacBook Air 13',17690000,99,'Apple M1 GPU 7 nhân',0,'GAMING'),(6,'14.0 Chính: inch, 2880 x 1800 Pixels, OLED, 90 Hz, OLED','LG','1711080386941-lg-01.png','Laptop LG Gram Style',31490000,99,'Intel Iris Plus Graphics',0,'DOANH-NHAN'),(7,'Không chỉ khơi gợi cảm hứng qua việc cách tân thiết kế, MacBook Air M2 2022 còn chứa đựng nguồn sức mạnh lớn lao với chip M2 siêu mạnh, thời lượng pin chạm ngưỡng 18 giờ, màn hình Liquid Retina tuyệt đẹp và hệ thống camera kết hợp cùng âm thanh tân tiến.','APPLE','1711080787179-apple-02.png','MacBook Air 13',24990000,99,'Apple M2 GPU 8 nhân',0,'MONG-NHE'),(8,'Là chiếc laptop gaming thế hệ mới nhất thuộc dòng Nitro 5 luôn chiếm được rất nhiều cảm tình của game thủ trước đây, Acer Nitro Gaming AN515-58-769J nay còn ấn tượng hơn nữa với bộ vi xử lý Intel Core i7 12700H cực khủng và card đồ họa RTX 3050, sẵn sàng cùng bạn chinh phục những đỉnh cao.','ACER','1711080948771-acer-01.png','Laptop Acer Nitro',23490000,99,'AN515-58-769J i7 12700H',0,'SINHVIEN-VANPHONG'),(9,'15.6 inch, FHD (1920 x 1080), IPS, 144 Hz, 250 nits, Acer ComfyView LED-backlit','ASUS','1711081080930-asus-03.png','Laptop Acer Nitro V',26999000,99,'NVIDIA GeForce RTX 4050',0,'MONG-NHE'),(10,'Dell Inspiron N3520 là chiếc laptop lý tưởng cho công việc hàng ngày. Bộ vi xử lý Intel Core i5 thế hệ thứ 12 hiệu suất cao, màn hình lớn 15,6 inch Full HD 120Hz mượt mà, thiết kế bền bỉ sẽ giúp bạn giải quyết công việc nhanh chóng mọi lúc mọi nơi.','DELL','1711081278418-dell-02.png','Laptop Dell Latitude 3420',21399000,99,'Intel Iris Xe Graphics',0,'MONG-NHE'),(11,'aaaaaaaaaa','APPLE','1729706068295-Screenshot 2024-09-12 135937.png','aaaa',4,2,'aaaa',0,'GAMING'),(12,'bbbbb','LG','1729706207415-Screenshot 2024-09-12 140031.png','bbbbbbbbbbb',3,3,'bbbb',0,'GAMING');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Admin thì full quyền','ADMIN'),(2,'User thông thường','USER');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session`
--

DROP TABLE IF EXISTS `spring_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spring_session` (
  `PRIMARY_ID` char(36) NOT NULL,
  `SESSION_ID` char(36) NOT NULL,
  `CREATION_TIME` bigint NOT NULL,
  `LAST_ACCESS_TIME` bigint NOT NULL,
  `MAX_INACTIVE_INTERVAL` int NOT NULL,
  `EXPIRY_TIME` bigint NOT NULL,
  `PRINCIPAL_NAME` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PRIMARY_ID`),
  UNIQUE KEY `SPRING_SESSION_IX1` (`SESSION_ID`),
  KEY `SPRING_SESSION_IX2` (`EXPIRY_TIME`),
  KEY `SPRING_SESSION_IX3` (`PRINCIPAL_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session`
--

LOCK TABLES `spring_session` WRITE;
/*!40000 ALTER TABLE `spring_session` DISABLE KEYS */;
INSERT INTO `spring_session` VALUES ('2956ba76-4f4d-4445-a969-a1759e42aab1','bffc3852-52d3-426f-9b7d-b17a13ecd2b3',1729705598776,1729705721989,1800,1729707521989,NULL),('5e8211bc-c76a-4645-96ed-16c54b26657f','3b68d514-ab34-4177-89db-b9077085f758',1729705757602,1729705770264,1800,1729707570264,NULL),('91921518-2821-4c22-93b7-e2136153dde8','9edaf963-aa70-4524-a912-9fbbb7fbfc74',1729705919745,1729706232554,2592000,1732298232554,'thuha@gmail.com');
/*!40000 ALTER TABLE `spring_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spring_session_attributes`
--

DROP TABLE IF EXISTS `spring_session_attributes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spring_session_attributes` (
  `SESSION_PRIMARY_ID` char(36) NOT NULL,
  `ATTRIBUTE_NAME` varchar(200) NOT NULL,
  `ATTRIBUTE_BYTES` blob NOT NULL,
  PRIMARY KEY (`SESSION_PRIMARY_ID`,`ATTRIBUTE_NAME`),
  CONSTRAINT `SPRING_SESSION_ATTRIBUTES_FK` FOREIGN KEY (`SESSION_PRIMARY_ID`) REFERENCES `spring_session` (`PRIMARY_ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_session_attributes`
--

LOCK TABLES `spring_session_attributes` WRITE;
/*!40000 ALTER TABLE `spring_session_attributes` DISABLE KEYS */;
INSERT INTO `spring_session_attributes` VALUES ('2956ba76-4f4d-4445-a969-a1759e42aab1','jakarta.servlet.jsp.jstl.fmt.request.charset',_binary '�\�\0t\0UTF-8'),('2956ba76-4f4d-4445-a969-a1759e42aab1','org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN',_binary '�\�\0sr\06org.springframework.security.web.csrf.DefaultCsrfTokenZ\�\�/��\�\0L\0\nheaderNamet\0Ljava/lang/String;L\0\rparameterNameq\0~\0L\0tokenq\0~\0xpt\0X-CSRF-TOKENt\0_csrft\0$cb6af282-f55f-410f-a9aa-0cb9018938fe'),('2956ba76-4f4d-4445-a969-a1759e42aab1','SPRING_SECURITY_LAST_EXCEPTION',_binary '�\�\0sr\0Corg.springframework.security.authentication.BadCredentialsException&N�d�]\0\0xr\09org.springframework.security.core.AuthenticationExceptionQ0\�gT\0\0xr\0\Zjava.lang.RuntimeException�_G\n4�\�\0\0xr\0java.lang.Exception\��>\Z;\�\0\0xr\0java.lang.Throwable\�\�5\'9w�\�\0L\0causet\0Ljava/lang/Throwable;L\0\rdetailMessaget\0Ljava/lang/String;[\0\nstackTracet\0[Ljava/lang/StackTraceElement;L\0suppressedExceptionst\0Ljava/util/List;xpq\0~\0	t\0Bad credentialsur\0[Ljava.lang.StackTraceElement;F*<<�\"9\0\0xp\0\0\0Esr\0java.lang.StackTraceElementa	Ś&6݅\0B\0formatI\0\nlineNumberL\0classLoaderNameq\0~\0L\0declaringClassq\0~\0L\0fileNameq\0~\0L\0\nmethodNameq\0~\0L\0\nmoduleNameq\0~\0L\0\rmoduleVersionq\0~\0xp\0\0\0�t\0appt\0Yorg.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvidert\0.AbstractUserDetailsAuthenticationProvider.javat\0authenticateppsq\0~\0\r\0\0\0�q\0~\0t\0;org.springframework.security.authentication.ProviderManagert\0ProviderManager.javaq\0~\0ppsq\0~\0\r\0\0\0\�q\0~\0q\0~\0q\0~\0q\0~\0ppsq\0~\0\r\0\0\0Uq\0~\0t\0Torg.springframework.security.web.authentication.UsernamePasswordAuthenticationFiltert\0)UsernamePasswordAuthenticationFilter.javat\0attemptAuthenticationppsq\0~\0\r\0\0\0\�q\0~\0t\0Vorg.springframework.security.web.authentication.AbstractAuthenticationProcessingFiltert\0+AbstractAuthenticationProcessingFilter.javat\0doFilterppsq\0~\0\r\0\0\0\�q\0~\0q\0~\0q\0~\0q\0~\0ppsq\0~\0\r\0\0vq\0~\0t\0Dorg.springframework.security.web.FilterChainProxy$VirtualFilterChaint\0FilterChainProxy.javaq\0~\0ppsq\0~\0\r\0\0\0kq\0~\0t\0Corg.springframework.security.web.authentication.logout.LogoutFiltert\0LogoutFilter.javaq\0~\0ppsq\0~\0\r\0\0\0]q\0~\0q\0~\0$q\0~\0%q\0~\0ppsq\0~\0\r\0\0vq\0~\0q\0~\0!q\0~\0\"q\0~\0ppsq\0~\0\r\0\0\0�q\0~\0t\00org.springframework.security.web.csrf.CsrfFiltert\0CsrfFilter.javat\0doFilterInternalppsq\0~\0\r\0\0\0tq\0~\0t\03org.springframework.web.filter.OncePerRequestFiltert\0OncePerRequestFilter.javaq\0~\0ppsq\0~\0\r\0\0vq\0~\0q\0~\0!q\0~\0\"q\0~\0ppsq\0~\0\r\0\0\0[q\0~\0t\0)org.springframework.web.filter.CorsFiltert\0CorsFilter.javaq\0~\0+ppsq\0~\0\r\0\0\0tq\0~\0q\0~\0-q\0~\0.q\0~\0ppsq\0~\0\r\0\0vq\0~\0q\0~\0!q\0~\0\"q\0~\0ppsq\0~\0\r\0\0\0Zq\0~\0t\0:org.springframework.security.web.header.HeaderWriterFiltert\0HeaderWriterFilter.javat\0doHeadersAfterppsq\0~\0\r\0\0\0Kq\0~\0q\0~\06q\0~\07q\0~\0+ppsq\0~\0\r\0\0\0tq\0~\0q\0~\0-q\0~\0.q\0~\0ppsq\0~\0\r\0\0vq\0~\0q\0~\0!q\0~\0\"q\0~\0ppsq\0~\0\r\0\0\0Rq\0~\0t\0Dorg.springframework.security.web.context.SecurityContextHolderFiltert\0 SecurityContextHolderFilter.javaq\0~\0ppsq\0~\0\r\0\0\0Eq\0~\0q\0~\0=q\0~\0>q\0~\0ppsq\0~\0\r\0\0vq\0~\0q\0~\0!q\0~\0\"q\0~\0ppsq\0~\0\r\0\0\0>q\0~\0t\0Worg.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFiltert\0%WebAsyncManagerIntegrationFilter.javaq\0~\0+ppsq\0~\0\r\0\0\0tq\0~\0q\0~\0-q\0~\0.q\0~\0ppsq\0~\0\r\0\0vq\0~\0q\0~\0!q\0~\0\"q\0~\0ppsq\0~\0\r\0\0\0-q\0~\0t\0Horg.springframework.security.web.session.ForceEagerSessionCreationFiltert\0$ForceEagerSessionCreationFilter.javaq\0~\0+ppsq\0~\0\r\0\0\0tq\0~\0q\0~\0-q\0~\0.q\0~\0ppsq\0~\0\r\0\0vq\0~\0q\0~\0!q\0~\0\"q\0~\0ppsq\0~\0\r\0\0\0*q\0~\0t\0?org.springframework.security.web.session.DisableEncodeUrlFiltert\0DisableEncodeUrlFilter.javaq\0~\0+ppsq\0~\0\r\0\0\0tq\0~\0q\0~\0-q\0~\0.q\0~\0ppsq\0~\0\r\0\0vq\0~\0q\0~\0!q\0~\0\"q\0~\0ppsq\0~\0\r\0\0\0\�q\0~\0t\01org.springframework.security.web.FilterChainProxyq\0~\0\"q\0~\0+ppsq\0~\0\r\0\0\0�q\0~\0q\0~\0Qq\0~\0\"q\0~\0ppsq\0~\0\r\0\0\0qq\0~\0t\0Aorg.springframework.web.filter.CompositeFilter$VirtualFilterChaint\0CompositeFilter.javaq\0~\0ppsq\0~\0\r\0\0\0\�q\0~\0t\0Borg.springframework.web.servlet.handler.HandlerMappingIntrospectort\0HandlerMappingIntrospector.javat\0\Zlambda$createCacheFilter$3ppsq\0~\0\r\0\0\0qq\0~\0q\0~\0Tq\0~\0Uq\0~\0ppsq\0~\0\r\0\0\0Jq\0~\0t\0.org.springframework.web.filter.CompositeFilterq\0~\0Uq\0~\0ppsq\0~\0\r\0\0\0\�q\0~\0t\0vorg.springframework.security.config.annotation.web.configuration.WebMvcSecurityConfiguration$CompositeFilterChainProxyt\0 WebMvcSecurityConfiguration.javaq\0~\0ppsq\0~\0\r\0\0`q\0~\0t\04org.springframework.web.filter.DelegatingFilterProxyt\0\ZDelegatingFilterProxy.javat\0invokeDelegateppsq\0~\0\r\0\0q\0~\0q\0~\0aq\0~\0bq\0~\0ppsq\0~\0\r\0\0\0�q\0~\0t\0/org.apache.catalina.core.ApplicationFilterChaint\0ApplicationFilterChain.javat\0internalDoFilterppsq\0~\0\r\0\0\0�q\0~\0q\0~\0fq\0~\0gq\0~\0ppsq\0~\0\r\0\0\0�q\0~\0t\0<org.springframework.session.web.http.SessionRepositoryFiltert\0SessionRepositoryFilter.javaq\0~\0+ppsq\0~\0\r\0\0\0Rq\0~\0t\09org.springframework.session.web.http.OncePerRequestFilterq\0~\0.q\0~\0ppsq\0~\0\r\0\0`q\0~\0q\0~\0aq\0~\0bq\0~\0cppsq\0~\0\r\0\0q\0~\0q\0~\0aq\0~\0bq\0~\0ppsq\0~\0\r\0\0\0�q\0~\0q\0~\0fq\0~\0gq\0~\0hppsq\0~\0\r\0\0\0�q\0~\0q\0~\0fq\0~\0gq\0~\0ppsq\0~\0\r\0\0\0\�q\0~\0t\06org.springframework.web.filter.CharacterEncodingFiltert\0CharacterEncodingFilter.javaq\0~\0+ppsq\0~\0\r\0\0\0tq\0~\0q\0~\0-q\0~\0.q\0~\0ppsq\0~\0\r\0\0\0�q\0~\0q\0~\0fq\0~\0gq\0~\0hppsq\0~\0\r\0\0\0�q\0~\0q\0~\0fq\0~\0gq\0~\0ppsq\0~\0\r\0\0\0�q\0~\0t\0-org.apache.catalina.core.StandardWrapperValvet\0StandardWrapperValve.javat\0invokeppsq\0~\0\r\0\0\0Zq\0~\0t\0-org.apache.catalina.core.StandardContextValvet\0StandardContextValve.javaq\0~\0|ppsq\0~\0\r\0\0\�q\0~\0t\03org.apache.catalina.authenticator.AuthenticatorBaset\0AuthenticatorBase.javaq\0~\0|ppsq\0~\0\r\0\0\0sq\0~\0t\0*org.apache.catalina.core.StandardHostValvet\0StandardHostValve.javaq\0~\0|ppsq\0~\0\r\0\0\0]q\0~\0t\0+org.apache.catalina.valves.ErrorReportValvet\0ErrorReportValve.javaq\0~\0|ppsq\0~\0\r\0\0\0Jq\0~\0t\0,org.apache.catalina.core.StandardEngineValvet\0StandardEngineValve.javaq\0~\0|ppsq\0~\0\r\0\0Tq\0~\0t\0+org.apache.catalina.connector.CoyoteAdaptert\0CoyoteAdapter.javat\0serviceppsq\0~\0\r\0\0�q\0~\0t\0(org.apache.coyote.http11.Http11Processort\0Http11Processor.javaq\0~\0�ppsq\0~\0\r\0\0\0?q\0~\0t\0(org.apache.coyote.AbstractProcessorLightt\0AbstractProcessorLight.javat\0processppsq\0~\0\r\0\0�q\0~\0t\04org.apache.coyote.AbstractProtocol$ConnectionHandlert\0AbstractProtocol.javaq\0~\0�ppsq\0~\0\r\0\0\�q\0~\0t\06org.apache.tomcat.util.net.NioEndpoint$SocketProcessort\0NioEndpoint.javat\0doRunppsq\0~\0\r\0\0\04q\0~\0t\0.org.apache.tomcat.util.net.SocketProcessorBaset\0SocketProcessorBase.javat\0runppsq\0~\0\r\0\0�q\0~\0t\01org.apache.tomcat.util.threads.ThreadPoolExecutort\0ThreadPoolExecutor.javat\0	runWorkerppsq\0~\0\r\0\0�q\0~\0t\08org.apache.tomcat.util.threads.ThreadPoolExecutor$Workerq\0~\0�q\0~\0�ppsq\0~\0\r\0\0\0=q\0~\0t\0:org.apache.tomcat.util.threads.TaskThread$WrappingRunnablet\0TaskThread.javaq\0~\0�ppsq\0~\0\r\0\0Jpt\0java.lang.Threadt\0Thread.javaq\0~\0�t\0	java.baset\017.0.9sr\0java.util.Collections$EmptyListz��<��\�\0\0xpx'),('5e8211bc-c76a-4645-96ed-16c54b26657f','jakarta.servlet.jsp.jstl.fmt.request.charset',_binary '�\�\0t\0UTF-8'),('5e8211bc-c76a-4645-96ed-16c54b26657f','org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN',_binary '�\�\0sr\06org.springframework.security.web.csrf.DefaultCsrfTokenZ\�\�/��\�\0L\0\nheaderNamet\0Ljava/lang/String;L\0\rparameterNameq\0~\0L\0tokenq\0~\0xpt\0X-CSRF-TOKENt\0_csrft\0$b0166d7e-5c7b-4c0f-9695-0645adccc27c'),('5e8211bc-c76a-4645-96ed-16c54b26657f','SPRING_SECURITY_LAST_EXCEPTION',_binary '�\�\0sr\0Corg.springframework.security.authentication.BadCredentialsException&N�d�]\0\0xr\09org.springframework.security.core.AuthenticationExceptionQ0\�gT\0\0xr\0\Zjava.lang.RuntimeException�_G\n4�\�\0\0xr\0java.lang.Exception\��>\Z;\�\0\0xr\0java.lang.Throwable\�\�5\'9w�\�\0L\0causet\0Ljava/lang/Throwable;L\0\rdetailMessaget\0Ljava/lang/String;[\0\nstackTracet\0[Ljava/lang/StackTraceElement;L\0suppressedExceptionst\0Ljava/util/List;xpq\0~\0	t\0Bad credentialsur\0[Ljava.lang.StackTraceElement;F*<<�\"9\0\0xp\0\0\0Esr\0java.lang.StackTraceElementa	Ś&6݅\0B\0formatI\0\nlineNumberL\0classLoaderNameq\0~\0L\0declaringClassq\0~\0L\0fileNameq\0~\0L\0\nmethodNameq\0~\0L\0\nmoduleNameq\0~\0L\0\rmoduleVersionq\0~\0xp\0\0\0�t\0appt\0Yorg.springframework.security.authentication.dao.AbstractUserDetailsAuthenticationProvidert\0.AbstractUserDetailsAuthenticationProvider.javat\0authenticateppsq\0~\0\r\0\0\0�q\0~\0t\0;org.springframework.security.authentication.ProviderManagert\0ProviderManager.javaq\0~\0ppsq\0~\0\r\0\0\0\�q\0~\0q\0~\0q\0~\0q\0~\0ppsq\0~\0\r\0\0\0Uq\0~\0t\0Torg.springframework.security.web.authentication.UsernamePasswordAuthenticationFiltert\0)UsernamePasswordAuthenticationFilter.javat\0attemptAuthenticationppsq\0~\0\r\0\0\0\�q\0~\0t\0Vorg.springframework.security.web.authentication.AbstractAuthenticationProcessingFiltert\0+AbstractAuthenticationProcessingFilter.javat\0doFilterppsq\0~\0\r\0\0\0\�q\0~\0q\0~\0q\0~\0q\0~\0ppsq\0~\0\r\0\0vq\0~\0t\0Dorg.springframework.security.web.FilterChainProxy$VirtualFilterChaint\0FilterChainProxy.javaq\0~\0ppsq\0~\0\r\0\0\0kq\0~\0t\0Corg.springframework.security.web.authentication.logout.LogoutFiltert\0LogoutFilter.javaq\0~\0ppsq\0~\0\r\0\0\0]q\0~\0q\0~\0$q\0~\0%q\0~\0ppsq\0~\0\r\0\0vq\0~\0q\0~\0!q\0~\0\"q\0~\0ppsq\0~\0\r\0\0\0�q\0~\0t\00org.springframework.security.web.csrf.CsrfFiltert\0CsrfFilter.javat\0doFilterInternalppsq\0~\0\r\0\0\0tq\0~\0t\03org.springframework.web.filter.OncePerRequestFiltert\0OncePerRequestFilter.javaq\0~\0ppsq\0~\0\r\0\0vq\0~\0q\0~\0!q\0~\0\"q\0~\0ppsq\0~\0\r\0\0\0[q\0~\0t\0)org.springframework.web.filter.CorsFiltert\0CorsFilter.javaq\0~\0+ppsq\0~\0\r\0\0\0tq\0~\0q\0~\0-q\0~\0.q\0~\0ppsq\0~\0\r\0\0vq\0~\0q\0~\0!q\0~\0\"q\0~\0ppsq\0~\0\r\0\0\0Zq\0~\0t\0:org.springframework.security.web.header.HeaderWriterFiltert\0HeaderWriterFilter.javat\0doHeadersAfterppsq\0~\0\r\0\0\0Kq\0~\0q\0~\06q\0~\07q\0~\0+ppsq\0~\0\r\0\0\0tq\0~\0q\0~\0-q\0~\0.q\0~\0ppsq\0~\0\r\0\0vq\0~\0q\0~\0!q\0~\0\"q\0~\0ppsq\0~\0\r\0\0\0Rq\0~\0t\0Dorg.springframework.security.web.context.SecurityContextHolderFiltert\0 SecurityContextHolderFilter.javaq\0~\0ppsq\0~\0\r\0\0\0Eq\0~\0q\0~\0=q\0~\0>q\0~\0ppsq\0~\0\r\0\0vq\0~\0q\0~\0!q\0~\0\"q\0~\0ppsq\0~\0\r\0\0\0>q\0~\0t\0Worg.springframework.security.web.context.request.async.WebAsyncManagerIntegrationFiltert\0%WebAsyncManagerIntegrationFilter.javaq\0~\0+ppsq\0~\0\r\0\0\0tq\0~\0q\0~\0-q\0~\0.q\0~\0ppsq\0~\0\r\0\0vq\0~\0q\0~\0!q\0~\0\"q\0~\0ppsq\0~\0\r\0\0\0-q\0~\0t\0Horg.springframework.security.web.session.ForceEagerSessionCreationFiltert\0$ForceEagerSessionCreationFilter.javaq\0~\0+ppsq\0~\0\r\0\0\0tq\0~\0q\0~\0-q\0~\0.q\0~\0ppsq\0~\0\r\0\0vq\0~\0q\0~\0!q\0~\0\"q\0~\0ppsq\0~\0\r\0\0\0*q\0~\0t\0?org.springframework.security.web.session.DisableEncodeUrlFiltert\0DisableEncodeUrlFilter.javaq\0~\0+ppsq\0~\0\r\0\0\0tq\0~\0q\0~\0-q\0~\0.q\0~\0ppsq\0~\0\r\0\0vq\0~\0q\0~\0!q\0~\0\"q\0~\0ppsq\0~\0\r\0\0\0\�q\0~\0t\01org.springframework.security.web.FilterChainProxyq\0~\0\"q\0~\0+ppsq\0~\0\r\0\0\0�q\0~\0q\0~\0Qq\0~\0\"q\0~\0ppsq\0~\0\r\0\0\0qq\0~\0t\0Aorg.springframework.web.filter.CompositeFilter$VirtualFilterChaint\0CompositeFilter.javaq\0~\0ppsq\0~\0\r\0\0\0\�q\0~\0t\0Borg.springframework.web.servlet.handler.HandlerMappingIntrospectort\0HandlerMappingIntrospector.javat\0\Zlambda$createCacheFilter$3ppsq\0~\0\r\0\0\0qq\0~\0q\0~\0Tq\0~\0Uq\0~\0ppsq\0~\0\r\0\0\0Jq\0~\0t\0.org.springframework.web.filter.CompositeFilterq\0~\0Uq\0~\0ppsq\0~\0\r\0\0\0\�q\0~\0t\0vorg.springframework.security.config.annotation.web.configuration.WebMvcSecurityConfiguration$CompositeFilterChainProxyt\0 WebMvcSecurityConfiguration.javaq\0~\0ppsq\0~\0\r\0\0`q\0~\0t\04org.springframework.web.filter.DelegatingFilterProxyt\0\ZDelegatingFilterProxy.javat\0invokeDelegateppsq\0~\0\r\0\0q\0~\0q\0~\0aq\0~\0bq\0~\0ppsq\0~\0\r\0\0\0�q\0~\0t\0/org.apache.catalina.core.ApplicationFilterChaint\0ApplicationFilterChain.javat\0internalDoFilterppsq\0~\0\r\0\0\0�q\0~\0q\0~\0fq\0~\0gq\0~\0ppsq\0~\0\r\0\0\0�q\0~\0t\0<org.springframework.session.web.http.SessionRepositoryFiltert\0SessionRepositoryFilter.javaq\0~\0+ppsq\0~\0\r\0\0\0Rq\0~\0t\09org.springframework.session.web.http.OncePerRequestFilterq\0~\0.q\0~\0ppsq\0~\0\r\0\0`q\0~\0q\0~\0aq\0~\0bq\0~\0cppsq\0~\0\r\0\0q\0~\0q\0~\0aq\0~\0bq\0~\0ppsq\0~\0\r\0\0\0�q\0~\0q\0~\0fq\0~\0gq\0~\0hppsq\0~\0\r\0\0\0�q\0~\0q\0~\0fq\0~\0gq\0~\0ppsq\0~\0\r\0\0\0\�q\0~\0t\06org.springframework.web.filter.CharacterEncodingFiltert\0CharacterEncodingFilter.javaq\0~\0+ppsq\0~\0\r\0\0\0tq\0~\0q\0~\0-q\0~\0.q\0~\0ppsq\0~\0\r\0\0\0�q\0~\0q\0~\0fq\0~\0gq\0~\0hppsq\0~\0\r\0\0\0�q\0~\0q\0~\0fq\0~\0gq\0~\0ppsq\0~\0\r\0\0\0�q\0~\0t\0-org.apache.catalina.core.StandardWrapperValvet\0StandardWrapperValve.javat\0invokeppsq\0~\0\r\0\0\0Zq\0~\0t\0-org.apache.catalina.core.StandardContextValvet\0StandardContextValve.javaq\0~\0|ppsq\0~\0\r\0\0\�q\0~\0t\03org.apache.catalina.authenticator.AuthenticatorBaset\0AuthenticatorBase.javaq\0~\0|ppsq\0~\0\r\0\0\0sq\0~\0t\0*org.apache.catalina.core.StandardHostValvet\0StandardHostValve.javaq\0~\0|ppsq\0~\0\r\0\0\0]q\0~\0t\0+org.apache.catalina.valves.ErrorReportValvet\0ErrorReportValve.javaq\0~\0|ppsq\0~\0\r\0\0\0Jq\0~\0t\0,org.apache.catalina.core.StandardEngineValvet\0StandardEngineValve.javaq\0~\0|ppsq\0~\0\r\0\0Tq\0~\0t\0+org.apache.catalina.connector.CoyoteAdaptert\0CoyoteAdapter.javat\0serviceppsq\0~\0\r\0\0�q\0~\0t\0(org.apache.coyote.http11.Http11Processort\0Http11Processor.javaq\0~\0�ppsq\0~\0\r\0\0\0?q\0~\0t\0(org.apache.coyote.AbstractProcessorLightt\0AbstractProcessorLight.javat\0processppsq\0~\0\r\0\0�q\0~\0t\04org.apache.coyote.AbstractProtocol$ConnectionHandlert\0AbstractProtocol.javaq\0~\0�ppsq\0~\0\r\0\0\�q\0~\0t\06org.apache.tomcat.util.net.NioEndpoint$SocketProcessort\0NioEndpoint.javat\0doRunppsq\0~\0\r\0\0\04q\0~\0t\0.org.apache.tomcat.util.net.SocketProcessorBaset\0SocketProcessorBase.javat\0runppsq\0~\0\r\0\0�q\0~\0t\01org.apache.tomcat.util.threads.ThreadPoolExecutort\0ThreadPoolExecutor.javat\0	runWorkerppsq\0~\0\r\0\0�q\0~\0t\08org.apache.tomcat.util.threads.ThreadPoolExecutor$Workerq\0~\0�q\0~\0�ppsq\0~\0\r\0\0\0=q\0~\0t\0:org.apache.tomcat.util.threads.TaskThread$WrappingRunnablet\0TaskThread.javaq\0~\0�ppsq\0~\0\r\0\0Jpt\0java.lang.Threadt\0Thread.javaq\0~\0�t\0	java.baset\017.0.9sr\0java.util.Collections$EmptyListz��<��\�\0\0xpx'),('91921518-2821-4c22-93b7-e2136153dde8','email',_binary '�\�\0t\0thuha@gmail.com'),('91921518-2821-4c22-93b7-e2136153dde8','fullName',_binary '�\�\0t\0Thu Ha'),('91921518-2821-4c22-93b7-e2136153dde8','id',_binary '�\�\0sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0'),('91921518-2821-4c22-93b7-e2136153dde8','jakarta.servlet.jsp.jstl.fmt.request.charset',_binary '�\�\0t\0UTF-8'),('91921518-2821-4c22-93b7-e2136153dde8','org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository.CSRF_TOKEN',_binary '�\�\0sr\06org.springframework.security.web.csrf.DefaultCsrfTokenZ\�\�/��\�\0L\0\nheaderNamet\0Ljava/lang/String;L\0\rparameterNameq\0~\0L\0tokenq\0~\0xpt\0X-CSRF-TOKENt\0_csrft\0$9d4343a6-2e66-4345-84d5-b825b4abe28b'),('91921518-2821-4c22-93b7-e2136153dde8','SPRING_SECURITY_CONTEXT',_binary '�\�\0sr\0=org.springframework.security.core.context.SecurityContextImpl\0\0\0\0\0\0l\0L\0authenticationt\02Lorg/springframework/security/core/Authentication;xpsr\0Oorg.springframework.security.authentication.UsernamePasswordAuthenticationToken\0\0\0\0\0\0l\0L\0credentialst\0Ljava/lang/Object;L\0	principalq\0~\0xr\0Gorg.springframework.security.authentication.AbstractAuthenticationTokenӪ(~nGd\0Z\0\rauthenticatedL\0authoritiest\0Ljava/util/Collection;L\0detailsq\0~\0xpsr\0&java.util.Collections$UnmodifiableList�%1�\�\0L\0listt\0Ljava/util/List;xr\0,java.util.Collections$UnmodifiableCollectionB\0�\�^�\0L\0cq\0~\0xpsr\0java.util.ArrayListx�\��\�a�\0I\0sizexp\0\0\0w\0\0\0sr\0Borg.springframework.security.core.authority.SimpleGrantedAuthority\0\0\0\0\0\0l\0L\0rolet\0Ljava/lang/String;xpt\0\nROLE_ADMINxq\0~\0\rsr\0Horg.springframework.security.web.authentication.WebAuthenticationDetails\0\0\0\0\0\0l\0L\0\rremoteAddressq\0~\0L\0	sessionIdq\0~\0xpt\00:0:0:0:0:0:0:1t\0$dbed0fb8-7cad-4254-b817-baa1bab5c34epsr\02org.springframework.security.core.userdetails.User\0\0\0\0\0\0l\0Z\0accountNonExpiredZ\0accountNonLockedZ\0credentialsNonExpiredZ\0enabledL\0authoritiest\0Ljava/util/Set;L\0passwordq\0~\0L\0usernameq\0~\0xpsr\0%java.util.Collections$UnmodifiableSet��я��U\0\0xq\0~\0\nsr\0java.util.TreeSetݘP��\�[\0\0xpsr\0Forg.springframework.security.core.userdetails.User$AuthorityComparator\0\0\0\0\0\0l\0\0xpw\0\0\0q\0~\0xpt\0thuha@gmail.com'),('91921518-2821-4c22-93b7-e2136153dde8','sum',_binary '�\�\0sr\0java.lang.Integer⠤���8\0I\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0'),('91921518-2821-4c22-93b7-e2136153dde8','user',_binary '�\�\0sr\0\"vn.hoidanit.laptopshop.domain.User\0\0\0\0\0\0\0\0\nJ\0idL\0addresst\0Ljava/lang/String;L\0avatarq\0~\0L\0cartt\0$Lvn/hoidanit/laptopshop/domain/Cart;L\0emailq\0~\0L\0fullNameq\0~\0L\0orderst\0Ljava/util/List;L\0passwordq\0~\0L\0phoneq\0~\0L\0rolet\0$Lvn/hoidanit/laptopshop/domain/Role;xp\0\0\0\0\0\0\0pppt\0thuha@gmail.comt\0Thu Hasr\0*org.hibernate.collection.spi.PersistentBag�<a#:rA�\0L\0bagq\0~\0L\0providedCollectiont\0Ljava/util/Collection;xr\09org.hibernate.collection.spi.AbstractPersistentCollection3��J<�F\0Z\0allowLoadOutsideTransactionI\0\ncachedSizeZ\0dirtyZ\0elementRemovedZ\0initializedZ\0\risTempSessionL\0keyt\0Ljava/lang/Object;L\0ownerq\0~\0L\0roleq\0~\0L\0sessionFactoryUuidq\0~\0L\0storedSnapshott\0Ljava/io/Serializable;xp\0����\0\0\0\0sr\0java.lang.Long;�\�̏#\�\0J\0valuexr\0java.lang.Number����\��\0\0xp\0\0\0\0\0\0\0q\0~\0t\0)vn.hoidanit.laptopshop.domain.User.ordersppppt\0<$2a$10$1I5d9UkOPS2zl1jthhN9Eu0qJD1C4OXWLgNGmMel9TxU8kqdmQbHKpsr\0\"vn.hoidanit.laptopshop.domain.Role\0\0\0\0\0\0\0\0J\0idL\0descriptionq\0~\0L\0nameq\0~\0L\0usersq\0~\0xp\0\0\0\0\0\0\0t\0Admin thì full quyềnt\0ADMINsq\0~\0\0����\0\0\0\0sq\0~\0\0\0\0\0\0\0\0q\0~\0t\0(vn.hoidanit.laptopshop.domain.Role.userspppp');
/*!40000 ALTER TABLE `spring_session_attributes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `address` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `full_name` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `role_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKp56c1712k691lhsyewcssf40f` (`role_id`),
  CONSTRAINT `FKp56c1712k691lhsyewcssf40f` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,NULL,NULL,'dat@gmail.com','Dat Nguyen','$2a$10$a2Aqp3oqZODy4/pAGWTEz.uZySuObVZ3mjFTBuO0n2UW5jQ64F5nq',NULL,2),(2,NULL,NULL,'admin@gmail.com','pla pla','$2a$10$1I5d9UkOPS2zl1jthhN9Eu0qJD1C4OXWLgNGmMel9TxU8kqdmQbHK',NULL,1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-26 16:00:28
