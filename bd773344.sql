-- XAMPP-Lite
-- version 8.4.5
-- https://xampplite.sf.net/
--
-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 31 mars 2026 à 10:54
-- Version du serveur : 11.4.5-MariaDB-log
-- Version de PHP : 8.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bd773344`
--

-- --------------------------------------------------------

--
-- Structure de la table `chef`
--

CREATE TABLE `chef` (
  `cinChef` varchar(8) NOT NULL,
  `nomChef` varchar(50) NOT NULL,
  `genre` varchar(1) NOT NULL CHECK (`genre` = 'F' or `genre` = 'H'),
  `codePla` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `chef`
--

INSERT INTO `chef` (`cinChef`, `nomChef`, `genre`, `codePla`) VALUES
('22334455', 'Ghassen MLIKA', 'H', 2),
('22446611', 'Salem HAMDI', 'H', 3),
('22550022', 'Mouna GHARBI', 'F', 1),
('22998877', 'Yasser SFAXI', 'H', 4);

-- --------------------------------------------------------

--
-- Structure de la table `degustateur`
--

CREATE TABLE `degustateur` (
  `idDeg` varchar(3) NOT NULL,
  `nomDeg` varchar(50) NOT NULL,
  `tel` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `degustateur`
--

INSERT INTO `degustateur` (`idDeg`, `nomDeg`, `tel`) VALUES
('D01', 'Nada BELGACEM', '77100100'),
('D02', 'Rym CHANNOUFI', '88300300'),
('D03', 'Yassine TOUNSI', '66333000');

-- --------------------------------------------------------

--
-- Structure de la table `evaluation`
--

CREATE TABLE `evaluation` (
  `iddeg` varchar(3) NOT NULL,
  `cinchef` varchar(8) NOT NULL,
  `note` decimal(5,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `evaluation`
--

INSERT INTO `evaluation` (`iddeg`, `cinchef`, `note`) VALUES
('D01', '22334455', 15.00),
('D01', '22446611', 17.00),
('D01', '22998877', 12.16),
('D02', '22334455', 16.50),
('D02', '22998877', 13.00),
('D03', '22446611', 17.66),
('D03', '22998877', 12.50);

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

CREATE TABLE `plat` (
  `codePla` int(11) NOT NULL,
  `nomPla` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`codePla`, `nomPla`, `description`) VALUES
(1, 'Riz Djerbien', 'Un plat à base de riz, de viande, de légumes et d’épices'),
(2, 'Couscous au poisson', 'Une semoule de blé arrosée de bouillon et garnie de poissons et de légumes'),
(3, 'Lablabi', 'Une soupe de pois chiches accompagnée de croûtons de pain, d’huile d’olive, d’harissa, d’ail, du cumin et d’œufs'),
(4, 'Ojja merguez', 'Un plat à base de merguez, de légumes et d’œufs');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `chef`
--
ALTER TABLE `chef`
  ADD PRIMARY KEY (`cinChef`),
  ADD KEY `Fk_codePla` (`codePla`);

--
-- Index pour la table `degustateur`
--
ALTER TABLE `degustateur`
  ADD PRIMARY KEY (`idDeg`);

--
-- Index pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD PRIMARY KEY (`iddeg`,`cinchef`),
  ADD KEY `fk2` (`cinchef`);

--
-- Index pour la table `plat`
--
ALTER TABLE `plat`
  ADD PRIMARY KEY (`codePla`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `plat`
--
ALTER TABLE `plat`
  MODIFY `codePla` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `chef`
--
ALTER TABLE `chef`
  ADD CONSTRAINT `Fk_codePla` FOREIGN KEY (`codePla`) REFERENCES `plat` (`codePla`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `evaluation`
--
ALTER TABLE `evaluation`
  ADD CONSTRAINT `fk1` FOREIGN KEY (`iddeg`) REFERENCES `degustateur` (`idDeg`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk2` FOREIGN KEY (`cinchef`) REFERENCES `chef` (`cinChef`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
