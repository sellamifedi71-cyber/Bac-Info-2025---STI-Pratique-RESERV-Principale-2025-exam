<?php
declare(strict_types=1);
require __DIR__ . '/connexion.php';
?>
<!doctype html>
<html lang="fr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>Évaluation d'un plat</title><link rel="stylesheet" href="mesStyles.css"><script src="mesControles.js" defer></script></head>
<body><main class="container"><form id="f" name="f" action="evaluation.php" method="post" onsubmit="return validation()" onreset="window.setTimeout(moyenne, 0)"><input type="hidden" name="csrf" value="<?= htmlspecialchars(csrf_token(), ENT_QUOTES, 'UTF-8') ?>"><fieldset><legend>Évaluation d'un plat préparé par un chef</legend>
<label for="cin">N° CIN du chef</label><input type="text" inputmode="numeric" id="cin" name="cin" maxlength="8" pattern="[0-9]{8}" placeholder="8 chiffres" required>
<label for="liste">Dégustateur</label><select id="liste" name="liste" required><option value="">Choisir un dégustateur</option><option value="D01">Nada BELGACEM</option><option value="D02">Rym CHANNOUFI</option><option value="D03">Yassine TOUNSI</option></select>
<p>Notes attribuées (de 0 à 20)</p><label for="orig">Originalité</label><input class="note" type="number" id="orig" name="orig" required value="0" min="0" max="20" step="0.01" oninput="moyenne()">
<label for="pres">Présentation</label><input class="note" type="number" id="pres" name="pres" required value="0" min="0" max="20" step="0.01" oninput="moyenne()">
<label for="gout">Goût</label><input class="note" type="number" id="gout" name="gout" required value="0" min="0" max="20" step="0.01" oninput="moyenne()">
<p class="average">Note moyenne : <output id="note" for="orig pres gout">0.00</output> / 20</p><div class="actions"><button type="submit">Évaluer</button><button type="reset" class="secondary">Annuler</button></div></fieldset></form></main></body></html>
