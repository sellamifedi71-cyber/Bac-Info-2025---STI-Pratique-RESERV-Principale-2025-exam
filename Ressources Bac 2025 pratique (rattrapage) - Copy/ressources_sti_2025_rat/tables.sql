--
-- Création de la table `recette`
--

CREATE TABLE  `plat` (
  `codePla` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nomPla` varchar(50)  NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB ;

--
-- Remplissage des données de la table `recette`
--

INSERT INTO `plat` (`codePla`, `nomPla`, `description`) VALUES
(1, 'Riz Djerbien', 'Un plat à base de riz, de viande, de légumes et d’épices'),
(2, 'Couscous au poisson', 'Une semoule de blé arrosée de bouillon et garnie de poissons et de légumes'),
(3, 'Lablabi', 'Une soupe de pois chiches accompagnée de croûtons de pain, d’huile d’olive, d’harissa, d’ail, du cumin et d’œufs'),
(4, 'Ojja merguez', 'Un plat à base de merguez, de légumes et d’œufs');

--
-- Création de la table `chef`
--

CREATE TABLE  `chef` (
  `cinChef` varchar(8) NOT NULL PRIMARY KEY,
  `nomChef` varchar(50) NOT NULL,
  `genre` varchar(1) NOT NULL check ((genre='F') or (genre='H')),
  `codePla` int NOT NULL 
 )  ENGINE=InnoDB ;

ALTER TABLE chef ADD CONSTRAINT Fk_codePla FOREIGN KEY (codePla) REFERENCES `plat` (`codePla`) ON DELETE CASCADE ON UPDATE CASCADE ;

--
-- Remplissage des données de la table `chef`
--

INSERT INTO `chef` (`cinChef`, `nomChef`, `genre`, `codePla`) VALUES
('22334455', 'Ghassen MLIKA', 'H', 2),
('22446611', 'Salem HAMDI', 'H', 3),
('22550022', 'Mouna GHARBI', 'F', 1),
('22998877', 'Yasser SFAXI', 'H', 4);

-- --------------------------------------------------------

--
-- Création de la table `degustateur`
--


CREATE TABLE  `degustateur` (
  `idDeg` varchar(3) NOT NULL PRIMARY KEY,
  `nomDeg` varchar(50) NOT NULL,
  `tel` varchar(8) NOT NULL
) ENGINE=InnoDB ;

--
-- Remplissage des données de la table `degustateur`
--

INSERT INTO `degustateur` (`idDeg`, `nomDeg`, `tel`) VALUES
('D01', 'Nada BELGACEM', '77100100'),
('D02', 'Rym CHANNOUFI', '88300300'),
('D03', 'Yassine TOUNSI', '66333000');
