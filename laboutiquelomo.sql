-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : dim. 17 avr. 2022 à 12:54
-- Version du serveur :  5.7.34
-- Version de PHP : 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `laboutiquelomo`
--
CREATE DATABASE IF NOT EXISTS `laboutiquelomo` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `laboutiquelomo`;

-- --------------------------------------------------------

--
-- Structure de la table `adress`
--

CREATE TABLE `adress` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `adress` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `adress`
--

INSERT INTO `adress` (`id`, `user_id`, `name`, `firstname`, `lastname`, `company`, `adress`, `postal`, `city`, `country`, `phone`) VALUES
(10, 3, 'Maison', 'Jane', 'Doe', NULL, '13 rue du paradis', '38000', 'Grenoble', 'FR', '0666662314'),
(11, 3, 'Boulot', 'Jane', 'Doe', 'Apple', '18 rue de la Paix', '38000', 'Grenoble', 'FR', '0666662314'),
(12, 8, 'Maison', 'Raphael', 'Roux', 'x', '13 rue du paradis', '38000', 'Grenoble', 'FR', '0666662314'),
(13, 10, 'MAISON', 'YO', 'APOIX', NULL, '13 rue de la paix', '69001', 'lyon', 'FR', '0666662314'),
(14, 11, 'Maison', 'Pixel', 'Phoenix', NULL, '245 rue du paradis', '38000', 'Grenoble', 'FR', '0666662314');

-- --------------------------------------------------------

--
-- Structure de la table `carrier`
--

CREATE TABLE `carrier` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `carrier`
--

INSERT INTO `carrier` (`id`, `name`, `description`, `price`) VALUES
(1, 'Colissimo', 'Livraison premium à domicile sous 48h/ 72h en France métropolitaine.', 9.9),
(2, 'Chronopost', 'Livraison express à domicile sous 24h en France métropolitaine.', 14.9);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'appareils'),
(2, 'pellicules'),
(3, 'objectifs'),
(4, 'accessoires');

-- --------------------------------------------------------

--
-- Structure de la table `hero`
--

CREATE TABLE `hero` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `illustration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `hero`
--

INSERT INTO `hero` (`id`, `title`, `content`, `btn_title`, `btn_url`, `illustration`) VALUES
(1, 'Appareils', 'Notre sélection pour les créatifs', 'Découvrir', '/nos-produits', '3b0e3ea29f177abe1c1501e4050950ff6d0bbc16.jpg'),
(2, 'Objectifs', 'Quel objectif est fait pour vous?', 'Découvrir', '/nos-produits', 'c6798dce5a539e478824a03dd39cc1c11f7bfb8f.jpg'),
(3, 'Concours', 'L\'émotion à travers le sombre', 'Découvrir', '/nos-produits', '8dc1dcff1ab12bef0c45c141a7fc2643e805d71e.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `carrier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_price` double NOT NULL,
  `delivery` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_paid` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `user_id`, `created_at`, `carrier_name`, `carrier_price`, `delivery`, `is_paid`) VALUES
(1, 3, '2021-02-18 09:39:09', 'Colissimo', 9.9, 'JaneDoe<br/>0666662314<br/>13 rue du paradis<br/>38000Grenoble<br/>FR', 0),
(2, 8, '2021-02-18 14:18:37', 'Chronopost', 14.9, 'RaphaelRoux<br/>0666662314<br/>x<br/>13 rue du paradis<br/>38000Grenoble<br/>FR', 0),
(3, 3, '2021-02-25 16:25:48', 'Chronopost', 14.9, 'JaneDoe<br/>0666662314<br/>Apple<br/>18 rue de la Paix<br/>38000Grenoble<br/>FR', 0),
(4, 3, '2021-02-26 14:40:46', 'Chronopost', 14.9, 'JaneDoe<br/>0666662314<br/>Apple<br/>18 rue de la Paix<br/>38000Grenoble<br/>FR', 0),
(5, 3, '2021-02-28 15:12:26', 'Chronopost', 14.9, 'JaneDoe<br/>0666662314<br/>Apple<br/>18 rue de la Paix<br/>38000Grenoble<br/>FR', 0),
(6, 3, '2021-03-03 12:17:27', 'Colissimo', 9.9, 'JaneDoe<br/>0666662314<br/>13 rue du paradis<br/>38000Grenoble<br/>FR', 0),
(7, 3, '2021-03-03 20:41:49', 'Colissimo', 9.9, 'JaneDoe<br/>0666662314<br/>Apple<br/>18 rue de la Paix<br/>38000Grenoble<br/>FR', 0),
(8, 10, '2021-03-03 21:02:06', 'Colissimo', 9.9, 'YOAPOIX<br/>0666662314<br/>13 rue de la paix<br/>69001lyon<br/>FR', 0),
(9, 11, '2021-03-04 07:47:35', 'Chronopost', 14.9, 'PixelPhoenix<br/>0666662314<br/>245 rue du paradis<br/>38000Grenoble<br/>FR', 0),
(10, 3, '2021-03-09 10:07:40', 'Colissimo', 9.9, 'JaneDoe<br/>0666662314<br/>Apple<br/>18 rue de la Paix<br/>38000Grenoble<br/>FR', 0),
(11, 3, '2021-04-02 16:22:18', 'Colissimo', 9.9, 'JaneDoe<br/>0666662314<br/>13 rue du paradis<br/>38000Grenoble<br/>FR', 0);

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `my_order_id` int(11) NOT NULL,
  `product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`id`, `my_order_id`, `product`, `quantity`, `price`, `total`) VALUES
(1, 1, 'Diana Instant Square', 2, 6900, 13800),
(2, 2, 'Diana Instant Square', 1, 6900, 6900),
(3, 3, 'Diana Instant Square', 3, 6900, 20700),
(4, 4, 'Diana Instant Square', 3, 6900, 20700),
(5, 5, 'Diana Instant Square', 2, 6900, 13800),
(6, 5, 'Kit instantané LC', 1, 1900, 1900),
(7, 6, 'Diana Instant Square', 1, 6900, 6900),
(8, 7, 'Diana Instant Square', 1, 6900, 6900),
(9, 8, 'Metropolis 35 mm', 1, 12900, 12900),
(10, 8, 'Petzval 80.5 mm f/1.9', 2, 49900, 99800),
(11, 9, 'Diana Instant Square', 1, 6900, 6900),
(12, 9, 'Petzval 80.5 mm f/1.9', 1, 49900, 49900),
(13, 10, 'Diana Instant Square', 1, 6900, 6900),
(14, 10, 'Lomo\'Instant Wide', 3, 14900, 44700),
(15, 11, 'Lomo\'Instant Wide', 2, 14900, 29800);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `illustration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `is_best` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `slug`, `illustration`, `subtitle`, `description`, `price`, `is_best`) VALUES
(2, 1, 'Diana Instant Square', 'appareil-diana-instant-square', 'dd8cae40c35cdaddbcd4e02f747fe177ec7119e5.jpg', 'Design iconique des années 1960.', 'Inspiré par l’appareil moyen format des années 1960, le Diana, notre tout nouveau boitier de magie instantanée imprègne vos photos de tous les effets qui ont fait de son prédécesseur un classique analogique. Bousculez vos habitudes et laissez le Diana Instant Square imprégner vos photos d’une beauté imprévisible. Il n’y a pas de reprise possible, pas de polissage post-production — vous prenez la photo et quelques secondes plus tard vous tenez dans vos mains une superbe photographie aux couleurs vives et douces ainsi qu’un beau vignettage. Le Diana Instant Square électrifie votre vie d’un amour lo-fi et vous donne les clefs pour une plus grande liberté créative.', 6900, 1),
(3, 1, 'Lomo\'Instant Wide', 'lomoinstant-wide-black', '561eacb4a436872bce1465672bef6ba9db749329.jpg', '\"Take a ride on the wide side\"', 'Vous avez trop d’amis et vous ne parvenez pas à les faire tous rentrer dans le cadre d’un Instax Mini et vous avez envie d’immortaliser toute cette joie instantanément ? Alors “Take a ride on the wide side” et capturez tous ces moments saisissants, émouvants ou encore étonnants grâce à un format plus large. L’expérience d’une photo instantanée parfaitement exposée est à votre portée.\r\n\r\nLe Lomo’Instant Wide n’est pas uniquement équipé de fonctionnalités manuelles pour les libres-penseurs mais il est aussi équipé d’un obturateur entièrement automatique sur lequel vous pouvez vous appuyer pour savourer simplement le moment qui s’offre à vous. Expositions longues et multiples, filtres colorés pour flash : cet appareil est un appel à la créativité.', 14900, 0),
(4, 2, 'Babylon B&W 35 mm', 'babylon-kino-bw-35-mm-iso-13', 'e6f3a6b81c8fffeb3902a5371618c6f8509f1541.jpg', 'Délicatesse et maitrise des N&B.', 'Comme cette pellicule a un ISO très bas (13 ISO), il est préférable de l\'utiliser avec un appareil et un objectif avec des réglages manuels pour plus de contrôle sur l\'exposition. Vous devez pouvoir régler manuellement la vitesse sur votre appareil et l\'ouverture sur votre objectif. Nous vous recommandons aussi d\'utiliser un objectif lumineux avec une ouverture d\'au moins f/1.4 - f/2.8. Cette émulsion évocatrice peut être développée en laboratoire ou à la maison avec le procédé Noir & Blanc standard. Que vous soyez un débutant dans la chambre noire ou que vous souhaitiez accroître vos compétences de développement, nous sommes là pour vous aider et nous avons préparé un Guide de la pellicule Babylon Kino B&W avec nos conseils pour la prise de vue, notre guide pour le développement et nos astuces pour la numérisation.', 8900, 0),
(5, 2, 'Metropolis 35 mm', 'lomochrome-metropolis-35-mm-iso-100-400', '0db39cc56476d97ac7c5893add98b03d44c41cf6.jpg', 'Une formule chimique unique.', 'Pas besoin de filtres pour métamorphoser les couleurs #nofilter\r\nOpposez-vous à l\'avalanche d\'images artificielles, prenez une grande bouffée d\'air et retournez aux fondamentaux avec la photographie argentique. Renouez avec les sentiments de surprise et d\'incertitude, établissez de véritables relations avec vos sujets et appréciez la juste valeur des images.\r\n\r\nDéveloppement standard\r\nConçu pour le processus universel C-41, la LomoChrome Metropolis peut facilement être développée à la maison ou dans presque tous les laboratoires photo. Indépendamment de l\'ISO que vous choisissez, le processus de développement reste le même.', 12900, 0),
(6, 3, 'Petzval 80.5 mm f/1.9', 'petzval-805-mm-f19-mkii', '5cc2aca36c7011855aa4c3dfc365183423ef7a59.jpg', 'Contrôle total de bokeh.', '180 années d\'héritage depuis l\'invention révolutionnaire de Joseph Petzval\r\nPour célébrer le 180ème anniversaire de cette emblématique invention, le Lomography Petzval 80.5 mm f/1.9 MKII n’est pas seulement fidèle au système optique et aux matériaux de l’objectif original de Joseph Petzval, il permet aussi une expérimentation créative comme jamais auparavant, ouvrant grand ses portes aux réalisateurs.', 49900, 0),
(7, 3, 'Diana+ 75mm Premium', 'diana-75mm-premium-en-verre', '783f33c670d56a9a8d902e8f0f78d5e47531acac.jpg', 'Vignettage emblématique.', 'Vous pensiez ne pas pouvoir obtenir des photos à la netteté très précise avec votre Diana F+ ? Ceci est à reconsidérer grâce au nouvel objectif Diana+ 75mm Premium en verre grâce auquel vous pouvez prendre des photos claires et précises tout en conservant le rendu Diana rêveur unique. Cet objectif est constitué de 3 couches de verre et est entièrement compatible avec les appareil Diana F+ et les accessoires.', 4900, 0),
(8, 4, 'Diana F+ Flash Black', 'diana-f-flash-black', '0d5c0a6b317f398b222be1f799058084499e2fbb.jpg', 'Filtres en gel colorés.', 'Style rétro : Ce Flash Diana F+ est designé comme le flash du Diana original : deux tiges métalliques pour le fixer et une lumière qui s\'allume quand il est prêt à prendre une photo.\r\n\r\nUne classique de l’explosion de couleurs : le flash Diana F+ est accompagné de filtres colorés pour facilement prendre des photos en Colorsplashing et baigner vos clichés de couleurs.\r\n\r\nAppareils compatibles : Il est parfait avec le Diana F+ et le Diana Mini ! Il fonctionne aussi très bien avec le LC-A+ et le Lubitel 166+. Il est vendu avec un adaptateur pour l\'utiliser en hot shoe alors il peut être monteésur tous les appareils avec un sabot hot shoe standard.', 4900, 1),
(9, 4, 'Kit instantané LC', 'kit-instantane-lc-wide', 'b17379f0841b902f061012de8086cc315ca5983e.jpg', 'Le kit instantané unique.', 'Montez le kit LC-Wide Instant & Le LC-A Instant Back+ sur votre Appareil LC-Wide et préparez-vous à une expérience instantanée unique. Utilisez le dos instantané LC-A pour utiliser votre LC-Wide d\'une manière totalement différente. Plus besoin d\'attendre le développement puisque vous obtiendrez immédiatement des instantanés.', 1900, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES
(3, 'jane@doe.fr', '[]', '$argon2id$v=19$m=65536,t=4,p=1$Lix4JxybW6d0NB7fvtP3Ew$3xWt7Cr36OCAEUaOGd9SsVEAMcvlL63BZmVahak3jOo', 'Jane', 'Doe'),
(8, 'r.roux@gmail.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$G0Kk7HdM2t1Whr3gzZ3zgQ$KhcAHCONFTgfLBwjQUOLmeq50HXmpFQv4q8wvNpIyu4', 'Raphael', 'Roux'),
(9, 'yo@apoix.fr', '[]', '$argon2id$v=19$m=65536,t=4,p=1$dK6wal5PGEplLHf92jJeuQ$Yje6bTWK1Chzi+FeJCoAa0wGArr/pxLUkcY9n3+AVHI', 'Yohann', 'Apoix'),
(10, 'yo@greatV.com', '[]', '$argon2id$v=19$m=65536,t=4,p=1$tS4M91RyrB0tvpchrmWMkw$5tPUXznjFyfbhFUTA8RxkpvVPM3M80DcwUOCbYTHsnU', 'yO', 'GreatV'),
(11, 'pix@pix.fr', '[]', '$argon2id$v=19$m=65536,t=4,p=1$QIVVjo8xu13+lKH5xw5Z3g$omU8ENp1cqMociD1xGtpRDJVwRx8HslkdnQzDg7SsiQ', 'Pixel', 'Phoenix');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `adress`
--
ALTER TABLE `adress`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_5CECC7BEA76ED395` (`user_id`);

--
-- Index pour la table `carrier`
--
ALTER TABLE `carrier`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `hero`
--
ALTER TABLE `hero`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398A76ED395` (`user_id`);

--
-- Index pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_845CA2C1BFCDF877` (`my_order_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `adress`
--
ALTER TABLE `adress`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `carrier`
--
ALTER TABLE `carrier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `hero`
--
ALTER TABLE `hero`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adress`
--
ALTER TABLE `adress`
  ADD CONSTRAINT `FK_5CECC7BEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK_845CA2C1BFCDF877` FOREIGN KEY (`my_order_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
