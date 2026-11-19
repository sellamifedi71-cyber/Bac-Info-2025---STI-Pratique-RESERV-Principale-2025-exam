<?php
declare(strict_types=1);
require __DIR__ . '/connexion.php';
if ($_SERVER['REQUEST_METHOD'] !== 'POST') { header('Location: evaluation.html'); exit; }
verify_csrf();
$cinRaw = $_POST['cin'] ?? '';
$degRaw = $_POST['liste'] ?? '';
if (!is_string($cinRaw) || !is_string($degRaw)) { http_response_code(422); exit('CIN ou dégustateur invalide.'); }
$cin = trim($cinRaw);
$deg = trim($degRaw);
$rawScores = [$_POST['orig'] ?? null, $_POST['pres'] ?? null, $_POST['gout'] ?? null];
$scores = [];
foreach ($rawScores as $raw) {
    if (!is_scalar($raw) || !is_numeric((string)$raw)) { http_response_code(422); exit('Les trois notes doivent être numériques.'); }
    $score = (float)$raw;
    if (!is_finite($score) || $score < 0 || $score > 20) { http_response_code(422); exit('Chaque note doit être comprise entre 0 et 20.'); }
    $scores[] = $score;
}
if (!preg_match('/^[0-9]{8}$/', $cin) || !preg_match('/^D[0-9]{2}$/', $deg)) { http_response_code(422); exit('CIN ou dégustateur invalide.'); }
$chef = $conx->prepare('SELECT cinChef, nomChef FROM chef WHERE cinChef = ?');
$chef->bind_param('s', $cin); $chef->execute(); $chefRow = $chef->get_result()->fetch_assoc();
if (!$chefRow) { http_response_code(404); exit('Chef inexistant. Vérifiez le numéro CIN.'); }
$taster = $conx->prepare('SELECT idDeg FROM degustateur WHERE idDeg = ?');
$taster->bind_param('s', $deg); $taster->execute();
if (!$taster->get_result()->fetch_assoc()) { http_response_code(422); exit('Dégustateur inconnu.'); }
$duplicate = $conx->prepare('SELECT 1 FROM evaluation WHERE cinchef = ? AND iddeg = ?');
$duplicate->bind_param('ss', $cin, $deg); $duplicate->execute();
if ($duplicate->get_result()->fetch_row()) { http_response_code(409); exit('Ce chef a deja ete evalue par ce degustateur.'); }
$note = round(array_sum($scores) / count($scores), 2);
try {
    $insert = $conx->prepare('INSERT INTO evaluation (iddeg, cinchef, note) VALUES (?, ?, ?)');
    $insert->bind_param('ssd', $deg, $cin, $note); $insert->execute();
} catch (Throwable $exception) {
    if ((int)$exception->getCode() === 1062) { http_response_code(409); exit('Une evaluation existe deja pour ce chef et ce degustateur.'); }
    throw $exception;
}
$chefName = htmlspecialchars($chefRow['nomChef'], ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
?>
<!doctype html><html lang="fr"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>Évaluation enregistrée</title><link rel="stylesheet" href="mesStyles.css"></head><body><main class="container"><p class="success">L evaluation de <strong><?= $chefName ?></strong> a ete enregistree avec succès.</p><p>Note moyenne : <strong><?= number_format($note, 2, ',', ' ') ?>/20</strong></p><p><a href="evaluation.html">Effectuer une autre évaluation</a> · <a href="bilan.php">Consulter le bilan</a></p></main></body></html>
