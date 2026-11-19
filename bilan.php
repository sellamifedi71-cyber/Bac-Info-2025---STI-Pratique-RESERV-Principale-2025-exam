<?php
declare(strict_types=1);
require __DIR__ . '/connexion.php';
$sql = 'SELECT c.cinChef, c.nomChef, p.nomPla, COALESCE(AVG(e.note), 0) AS moyenne, COUNT(e.iddeg) AS nbEval, (SELECT COUNT(*) FROM degustateur) AS totalDeg FROM chef c INNER JOIN plat p ON p.codePla = c.codePla LEFT JOIN evaluation e ON e.cinchef = c.cinChef GROUP BY c.cinChef, c.nomChef, p.nomPla ORDER BY moyenne DESC, c.nomChef ASC';
$result = $conx->query($sql);
?>
<!doctype html><html lang="fr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>Bilan des évaluations</title><link rel="stylesheet" href="mesStyles.css"></head><body><main class="container"><h1>Bilan des évaluations</h1><div class="table-wrap"><table><thead><tr><th>Chef</th><th>Plat</th><th>Moyenne / 20</th><th>Évaluations reçues</th><th>État</th></tr></thead><tbody>
<?php while ($row = $result->fetch_assoc()): $complete = (int)$row['totalDeg'] > 0 && (int)$row['nbEval'] === (int)$row['totalDeg']; ?><tr><td><?= htmlspecialchars($row['nomChef'], ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8') ?></td><td><?= htmlspecialchars($row['nomPla'], ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8') ?></td><td><?= number_format((float)$row['moyenne'], 2, ',', ' ') ?></td><td><?= (int)$row['nbEval'] ?> / <?= (int)$row['totalDeg'] ?></td><td><?= $complete ? 'Évaluation terminée' : 'Évaluation en cours' ?></td></tr><?php endwhile; ?>
</tbody></table></div><p><a href="evaluation.html">Retour à l'évaluation</a></p></main></body></html>
