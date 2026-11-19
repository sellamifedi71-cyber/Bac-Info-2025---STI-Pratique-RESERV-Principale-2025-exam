-- Création de la table `plat`
CREATE TABLE `plat` (
  `codePla` int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `nomPla` varchar(50) NOT NULL,
  `description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `plat` (`codePla`, `nomPla`, `description`) VALUES
(1, 'Riz Djerbien', 'Un plat à base de riz, de viande, de légumes et d’épices'),
(2, 'Couscous au poisson', 'Une semoule de blé arrosée de bouillon et garnie de poissons et de légumes'),
(3, 'Lablabi', 'Une soupe de pois chiches accompagnée de croûtons de pain, d’huile d’olive, d’harissa, d’ail, du cumin et d’œufs'),
(4, 'Ojja merguez', 'Un plat à base de merguez, de légumes et d’œufs');

CREATE TABLE `chef` (
  `cinChef` varchar(8) NOT NULL PRIMARY KEY,
  `nomChef` varchar(50) NOT NULL,
  `genre` varchar(1) NOT NULL CHECK (`genre` IN ('F', 'H')),
  `codePla` int NOT NULL,
  CONSTRAINT `Fk_codePla` FOREIGN KEY (`codePla`) REFERENCES `plat` (`codePla`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `chef` (`cinChef`, `nomChef`, `genre`, `codePla`) VALUES
('22334455', 'Ghassen MLIKA', 'H', 2),
('22446611', 'Salem HAMDI', 'H', 3),
('22550022', 'Mouna GHARBI', 'F', 1),
('22998877', 'Yasser SFAXI', 'H', 4);

CREATE TABLE `degustateur` (
  `idDeg` varchar(3) NOT NULL PRIMARY KEY,
  `nomDeg` varchar(50) NOT NULL,
  `tel` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `degustateur` (`idDeg`, `nomDeg`, `tel`) VALUES
('D01', 'Nada BELGACEM', '77100100'),
('D02', 'Rym CHANNOUFI', '88300300'),
('D03', 'Yassine TOUNSI', '66333000');

CREATE TABLE `evaluation` (
  `iddeg` varchar(3) NOT NULL,
  `cinchef` varchar(8) NOT NULL,
  `note` decimal(5,2) NOT NULL DEFAULT 0.00,
  PRIMARY KEY (`iddeg`, `cinchef`),
  CONSTRAINT `evaluation_fk_degustateur` FOREIGN KEY (`iddeg`) REFERENCES `degustateur` (`idDeg`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `evaluation_fk_chef` FOREIGN KEY (`cinchef`) REFERENCES `chef` (`cinChef`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
