<?php
declare(strict_types=1);
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
try {
    $conx = new mysqli('localhost', 'root', '', 'bd773344');
    $conx->set_charset('utf8mb4');
} catch (mysqli_sql_exception $exception) {
    http_response_code(500);
    exit('Connexion à la base bd773344 impossible. Vérifiez connexion.php et importez bd773344.sql.');
}
