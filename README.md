# Compétition culinaire — évaluation des chefs

Application pédagogique PHP/MySQL pour enregistrer les notes des dégustateurs et consulter le bilan des chefs.

## Installation

1. Installer XAMPP/WAMP/Laragon avec PHP 8+ et MySQL/MariaDB.
2. Importer `bd773344.sql` dans phpMyAdmin. Le nom de la base doit être `bd773344`.
3. Vérifier les identifiants dans `connexion.php`.
4. Placer le dossier dans le répertoire web local et ouvrir `http://localhost/<nom-du-dossier>/`.

## Fonctionnalités

- Validation du CIN du chef (8 chiffres), du dégustateur et des trois notes (0 à 20).
- Calcul de la moyenne sur 20 et refus d'une deuxième évaluation du même chef par le même dégustateur.
- Bilan de tous les chefs, y compris ceux qui n'ont pas encore reçu d'évaluation.
- Requêtes préparées pour les données saisies et échappement HTML des données affichées.

`tables.sql` contient également le schéma de base, avec la table `evaluation` et ses clés étrangères, pour une installation sans les données d'exemple.
