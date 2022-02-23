-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Versión del servidor:         10.7.1-MariaDB-1:10.7.1+maria~focal - mariadb.org binary distribution
-- SO del servidor:              debian-linux-gnu
-- HeidiSQL Versión:             11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Volcando estructura de base de datos para apidatabase
CREATE DATABASE IF NOT EXISTS `apidatabase` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `apidatabase`;

-- Volcando estructura para tabla apidatabase.api_category
CREATE TABLE IF NOT EXISTS `api_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.api_category: ~4 rows (aproximadamente)
DELETE FROM `api_category`;
/*!40000 ALTER TABLE `api_category` DISABLE KEYS */;
INSERT INTO `api_category` (`id`, `name`) VALUES
	(1, 'belleza'),
	(2, 'higiene'),
	(3, 'videojuegos'),
	(4, 'electronica'),
	(5, 'comida');
/*!40000 ALTER TABLE `api_category` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.api_client
CREATE TABLE IF NOT EXISTS `api_client` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  `address` varchar(250) NOT NULL,
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.api_client: ~3 rows (aproximadamente)
DELETE FROM `api_client`;
/*!40000 ALTER TABLE `api_client` DISABLE KEYS */;
INSERT INTO `api_client` (`id`, `name`, `last_name`, `address`, `age`) VALUES
	(1, 'Russell', 'Arcila', 'sucasa', 20),
	(2, 'Mauricio', 'Noris', 'casadeel', 22),
	(3, 'Pedro', 'Jimenez', 'porahi', 21);
/*!40000 ALTER TABLE `api_client` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.api_employee
CREATE TABLE IF NOT EXISTS `api_employee` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.api_employee: ~0 rows (aproximadamente)
DELETE FROM `api_employee`;
/*!40000 ALTER TABLE `api_employee` DISABLE KEYS */;
INSERT INTO `api_employee` (`id`, `name`, `last_name`) VALUES
	(1, 'Alejandro', 'Noris');
/*!40000 ALTER TABLE `api_employee` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.api_product
CREATE TABLE IF NOT EXISTS `api_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `description` varchar(250) NOT NULL,
  `price` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `category_id` bigint(20) NOT NULL,
  `supplier_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `api_product_supplier_id_6b83e5ee_fk_api_supplier_id` (`supplier_id`),
  KEY `api_product_category_id_a2b9d1e7_fk_api_category_id` (`category_id`),
  CONSTRAINT `api_product_category_id_a2b9d1e7_fk_api_category_id` FOREIGN KEY (`category_id`) REFERENCES `api_category` (`id`),
  CONSTRAINT `api_product_supplier_id_6b83e5ee_fk_api_supplier_id` FOREIGN KEY (`supplier_id`) REFERENCES `api_supplier` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.api_product: ~3 rows (aproximadamente)
DELETE FROM `api_product`;
/*!40000 ALTER TABLE `api_product` DISABLE KEYS */;
INSERT INTO `api_product` (`id`, `name`, `description`, `price`, `stock`, `category_id`, `supplier_id`) VALUES
	(1, 'salchicha', 'grande y jugosa', 25, 100, 5, 1),
	(2, 'laptop', 'buena para videojuegos', 25000, 10, 4, 1),
	(3, 'jabon', 'para limpiar tu carita', 56, 256, 1, 1);
/*!40000 ALTER TABLE `api_product` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.api_sells
CREATE TABLE IF NOT EXISTS `api_sells` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `date` date NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.api_sells: ~3 rows (aproximadamente)
DELETE FROM `api_sells`;
/*!40000 ALTER TABLE `api_sells` DISABLE KEYS */;
INSERT INTO `api_sells` (`id`, `name`, `date`) VALUES
	(1, 'primera venta', '2022-02-22'),
	(2, 'segunda venta', '2021-02-22'),
	(3, 'tercera venta', '2022-02-22');
/*!40000 ALTER TABLE `api_sells` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.api_sells_clients
CREATE TABLE IF NOT EXISTS `api_sells_clients` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sells_id` bigint(20) NOT NULL,
  `client_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_sells_clients_sells_id_client_id_941c2ccd_uniq` (`sells_id`,`client_id`),
  KEY `api_sells_clients_client_id_9260de8a_fk_api_client_id` (`client_id`),
  CONSTRAINT `api_sells_clients_client_id_9260de8a_fk_api_client_id` FOREIGN KEY (`client_id`) REFERENCES `api_client` (`id`),
  CONSTRAINT `api_sells_clients_sells_id_845576bf_fk_api_sells_id` FOREIGN KEY (`sells_id`) REFERENCES `api_sells` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.api_sells_clients: ~3 rows (aproximadamente)
DELETE FROM `api_sells_clients`;
/*!40000 ALTER TABLE `api_sells_clients` DISABLE KEYS */;
INSERT INTO `api_sells_clients` (`id`, `sells_id`, `client_id`) VALUES
	(1, 1, 1),
	(2, 2, 3),
	(3, 3, 2);
/*!40000 ALTER TABLE `api_sells_clients` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.api_sells_employees
CREATE TABLE IF NOT EXISTS `api_sells_employees` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sells_id` bigint(20) NOT NULL,
  `employee_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_sells_employees_sells_id_employee_id_9cf35f4a_uniq` (`sells_id`,`employee_id`),
  KEY `api_sells_employees_employee_id_0bbff8ee_fk_api_employee_id` (`employee_id`),
  CONSTRAINT `api_sells_employees_employee_id_0bbff8ee_fk_api_employee_id` FOREIGN KEY (`employee_id`) REFERENCES `api_employee` (`id`),
  CONSTRAINT `api_sells_employees_sells_id_0c4b995f_fk_api_sells_id` FOREIGN KEY (`sells_id`) REFERENCES `api_sells` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.api_sells_employees: ~3 rows (aproximadamente)
DELETE FROM `api_sells_employees`;
/*!40000 ALTER TABLE `api_sells_employees` DISABLE KEYS */;
INSERT INTO `api_sells_employees` (`id`, `sells_id`, `employee_id`) VALUES
	(1, 1, 1),
	(2, 2, 1),
	(3, 3, 1);
/*!40000 ALTER TABLE `api_sells_employees` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.api_sells_products
CREATE TABLE IF NOT EXISTS `api_sells_products` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `sells_id` bigint(20) NOT NULL,
  `product_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `api_sells_products_sells_id_product_id_e8e3f971_uniq` (`sells_id`,`product_id`),
  KEY `api_sells_products_product_id_c7484272_fk_api_product_id` (`product_id`),
  CONSTRAINT `api_sells_products_product_id_c7484272_fk_api_product_id` FOREIGN KEY (`product_id`) REFERENCES `api_product` (`id`),
  CONSTRAINT `api_sells_products_sells_id_7c932b92_fk_api_sells_id` FOREIGN KEY (`sells_id`) REFERENCES `api_sells` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.api_sells_products: ~3 rows (aproximadamente)
DELETE FROM `api_sells_products`;
/*!40000 ALTER TABLE `api_sells_products` DISABLE KEYS */;
INSERT INTO `api_sells_products` (`id`, `sells_id`, `product_id`) VALUES
	(1, 1, 1),
	(2, 2, 2),
	(3, 3, 3);
/*!40000 ALTER TABLE `api_sells_products` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.api_supplier
CREATE TABLE IF NOT EXISTS `api_supplier` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `last_name` varchar(250) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.api_supplier: ~0 rows (aproximadamente)
DELETE FROM `api_supplier`;
/*!40000 ALTER TABLE `api_supplier` DISABLE KEYS */;
INSERT INTO `api_supplier` (`id`, `name`, `last_name`) VALUES
	(1, 'Abraham', 'Ortega');
/*!40000 ALTER TABLE `api_supplier` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.auth_group
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.auth_group: ~0 rows (aproximadamente)
DELETE FROM `auth_group`;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.auth_group_permissions
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.auth_group_permissions: ~0 rows (aproximadamente)
DELETE FROM `auth_group_permissions`;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.auth_permission
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.auth_permission: ~0 rows (aproximadamente)
DELETE FROM `auth_permission`;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
	(1, 'Can add log entry', 1, 'add_logentry'),
	(2, 'Can change log entry', 1, 'change_logentry'),
	(3, 'Can delete log entry', 1, 'delete_logentry'),
	(4, 'Can view log entry', 1, 'view_logentry'),
	(5, 'Can add permission', 2, 'add_permission'),
	(6, 'Can change permission', 2, 'change_permission'),
	(7, 'Can delete permission', 2, 'delete_permission'),
	(8, 'Can view permission', 2, 'view_permission'),
	(9, 'Can add group', 3, 'add_group'),
	(10, 'Can change group', 3, 'change_group'),
	(11, 'Can delete group', 3, 'delete_group'),
	(12, 'Can view group', 3, 'view_group'),
	(13, 'Can add user', 4, 'add_user'),
	(14, 'Can change user', 4, 'change_user'),
	(15, 'Can delete user', 4, 'delete_user'),
	(16, 'Can view user', 4, 'view_user'),
	(17, 'Can add content type', 5, 'add_contenttype'),
	(18, 'Can change content type', 5, 'change_contenttype'),
	(19, 'Can delete content type', 5, 'delete_contenttype'),
	(20, 'Can view content type', 5, 'view_contenttype'),
	(21, 'Can add session', 6, 'add_session'),
	(22, 'Can change session', 6, 'change_session'),
	(23, 'Can delete session', 6, 'delete_session'),
	(24, 'Can view session', 6, 'view_session'),
	(25, 'Can add API key', 7, 'add_apikey'),
	(26, 'Can change API key', 7, 'change_apikey'),
	(27, 'Can delete API key', 7, 'delete_apikey'),
	(28, 'Can view API key', 7, 'view_apikey'),
	(29, 'Can add category', 8, 'add_category'),
	(30, 'Can change category', 8, 'change_category'),
	(31, 'Can delete category', 8, 'delete_category'),
	(32, 'Can view category', 8, 'view_category'),
	(33, 'Can add client', 9, 'add_client'),
	(34, 'Can change client', 9, 'change_client'),
	(35, 'Can delete client', 9, 'delete_client'),
	(36, 'Can view client', 9, 'view_client'),
	(37, 'Can add employee', 10, 'add_employee'),
	(38, 'Can change employee', 10, 'change_employee'),
	(39, 'Can delete employee', 10, 'delete_employee'),
	(40, 'Can view employee', 10, 'view_employee'),
	(41, 'Can add product', 11, 'add_product'),
	(42, 'Can change product', 11, 'change_product'),
	(43, 'Can delete product', 11, 'delete_product'),
	(44, 'Can view product', 11, 'view_product'),
	(45, 'Can add supplier', 12, 'add_supplier'),
	(46, 'Can change supplier', 12, 'change_supplier'),
	(47, 'Can delete supplier', 12, 'delete_supplier'),
	(48, 'Can view supplier', 12, 'view_supplier'),
	(49, 'Can add sells', 13, 'add_sells'),
	(50, 'Can change sells', 13, 'change_sells'),
	(51, 'Can delete sells', 13, 'delete_sells'),
	(52, 'Can view sells', 13, 'view_sells');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.auth_user
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.auth_user: ~0 rows (aproximadamente)
DELETE FROM `auth_user`;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
	(1, 'pbkdf2_sha256$320000$661hqfdLveIM80SvuKSANq$MSF4lPV0zyHctz4O/xFteJj+jPTcBYBBpTXHmcsSIQs=', '2022-02-23 02:50:14.300564', 1, 'admin', '', '', 'admin@admin.com', 1, 1, '2022-02-23 02:49:53.079845');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.auth_user_groups
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.auth_user_groups: ~0 rows (aproximadamente)
DELETE FROM `auth_user_groups`;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.auth_user_user_permissions
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.auth_user_user_permissions: ~0 rows (aproximadamente)
DELETE FROM `auth_user_user_permissions`;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.django_admin_log
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.django_admin_log: ~0 rows (aproximadamente)
DELETE FROM `django_admin_log`;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
	(1, '2022-02-23 02:51:45.354335', 'wxDVsrcr.pbkdf2_sha256$320000$rMK5S17jKsFL1WQ8MI6kHG$ofT0bHnNjU6Hhx5qxp3qDztvHlEikn99DLE17EWUdsk=', 'Api1', 1, '[{"added": {}}]', 7, 1),
	(2, '2022-02-23 03:06:09.524660', 'ByuVwrdD.pbkdf2_sha256$320000$q73gvsAzwfnu2HKliKKiaH$nOn2BkirQhpx0/0osxff5tykVXIgGIoOyXV9GzPkxHo=', 'api2', 1, '[{"added": {}}]', 7, 1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.django_content_type
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.django_content_type: ~0 rows (aproximadamente)
DELETE FROM `django_content_type`;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
	(1, 'admin', 'logentry'),
	(8, 'api', 'category'),
	(9, 'api', 'client'),
	(10, 'api', 'employee'),
	(11, 'api', 'product'),
	(13, 'api', 'sells'),
	(12, 'api', 'supplier'),
	(3, 'auth', 'group'),
	(2, 'auth', 'permission'),
	(4, 'auth', 'user'),
	(5, 'contenttypes', 'contenttype'),
	(7, 'rest_framework_api_key', 'apikey'),
	(6, 'sessions', 'session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.django_migrations
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.django_migrations: ~23 rows (aproximadamente)
DELETE FROM `django_migrations`;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
	(1, 'contenttypes', '0001_initial', '2022-02-23 02:40:16.309765'),
	(2, 'auth', '0001_initial', '2022-02-23 02:40:16.671435'),
	(3, 'admin', '0001_initial', '2022-02-23 02:40:16.752794'),
	(4, 'admin', '0002_logentry_remove_auto_add', '2022-02-23 02:40:16.766753'),
	(5, 'admin', '0003_logentry_add_action_flag_choices', '2022-02-23 02:40:16.775082'),
	(6, 'api', '0001_initial', '2022-02-23 02:40:17.204599'),
	(7, 'contenttypes', '0002_remove_content_type_name', '2022-02-23 02:40:17.260663'),
	(8, 'auth', '0002_alter_permission_name_max_length', '2022-02-23 02:40:17.307302'),
	(9, 'auth', '0003_alter_user_email_max_length', '2022-02-23 02:40:17.332557'),
	(10, 'auth', '0004_alter_user_username_opts', '2022-02-23 02:40:17.339538'),
	(11, 'auth', '0005_alter_user_last_login_null', '2022-02-23 02:40:17.365498'),
	(12, 'auth', '0006_require_contenttypes_0002', '2022-02-23 02:40:17.367182'),
	(13, 'auth', '0007_alter_validators_add_error_messages', '2022-02-23 02:40:17.374470'),
	(14, 'auth', '0008_alter_user_username_max_length', '2022-02-23 02:40:17.392418'),
	(15, 'auth', '0009_alter_user_last_name_max_length', '2022-02-23 02:40:17.409935'),
	(16, 'auth', '0010_alter_group_name_max_length', '2022-02-23 02:40:17.428416'),
	(17, 'auth', '0011_update_proxy_permissions', '2022-02-23 02:40:17.441552'),
	(18, 'auth', '0012_alter_user_first_name_max_length', '2022-02-23 02:40:17.459188'),
	(19, 'rest_framework_api_key', '0001_initial', '2022-02-23 02:40:17.485444'),
	(20, 'rest_framework_api_key', '0002_auto_20190529_2243', '2022-02-23 02:40:17.505133'),
	(21, 'rest_framework_api_key', '0003_auto_20190623_1952', '2022-02-23 02:40:17.508480'),
	(22, 'rest_framework_api_key', '0004_prefix_hashed_key', '2022-02-23 02:40:17.635930'),
	(23, 'sessions', '0001_initial', '2022-02-23 02:40:17.661601');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.django_session
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.django_session: ~1 rows (aproximadamente)
DELETE FROM `django_session`;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
	('5gniwwjvnda5rg09nb01vajdju8m8bzc', '.eJxVjMsOwiAQRf-FtSEwyMul-34DGWCQqqFJaVfGf1eSLnR7z7nnxQLuWw17pzXMmV2YZKffLWJ6UBsg37HdFp6Wtq1z5EPhB-18WjI9r4f7F6jY68iShOKVRIqEZ-NltEIWnQQQWB-FB6GU0TZp68lJoOiKA0BTVPn-BHt_ANDGN0I:1nMhjK:kSI1bEd4Cx5Al_NESCg9X2iXd0c8ofalxrnf3s57ylw', '2022-03-09 02:50:14.302504');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;

-- Volcando estructura para tabla apidatabase.rest_framework_api_key_apikey
CREATE TABLE IF NOT EXISTS `rest_framework_api_key_apikey` (
  `id` varchar(100) NOT NULL,
  `created` datetime(6) NOT NULL,
  `name` varchar(50) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expiry_date` datetime(6) DEFAULT NULL,
  `hashed_key` varchar(100) NOT NULL,
  `prefix` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `prefix` (`prefix`),
  KEY `rest_framework_api_key_apikey_created_c61872d9` (`created`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Volcando datos para la tabla apidatabase.rest_framework_api_key_apikey: ~0 rows (aproximadamente)
DELETE FROM `rest_framework_api_key_apikey`;
/*!40000 ALTER TABLE `rest_framework_api_key_apikey` DISABLE KEYS */;
INSERT INTO `rest_framework_api_key_apikey` (`id`, `created`, `name`, `revoked`, `expiry_date`, `hashed_key`, `prefix`) VALUES
	('ByuVwrdD.pbkdf2_sha256$320000$q73gvsAzwfnu2HKliKKiaH$nOn2BkirQhpx0/0osxff5tykVXIgGIoOyXV9GzPkxHo=', '2022-02-23 03:06:09.524113', 'api2', 0, NULL, 'pbkdf2_sha256$320000$q73gvsAzwfnu2HKliKKiaH$nOn2BkirQhpx0/0osxff5tykVXIgGIoOyXV9GzPkxHo=', 'ByuVwrdD'),
	('wxDVsrcr.pbkdf2_sha256$320000$rMK5S17jKsFL1WQ8MI6kHG$ofT0bHnNjU6Hhx5qxp3qDztvHlEikn99DLE17EWUdsk=', '2022-02-23 02:51:45.353763', 'Api1', 0, '2022-02-23 02:51:40.000000', 'pbkdf2_sha256$320000$rMK5S17jKsFL1WQ8MI6kHG$ofT0bHnNjU6Hhx5qxp3qDztvHlEikn99DLE17EWUdsk=', 'wxDVsrcr');
/*!40000 ALTER TABLE `rest_framework_api_key_apikey` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
