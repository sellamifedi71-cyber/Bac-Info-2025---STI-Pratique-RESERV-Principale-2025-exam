<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>bilan</title>
    <style>
        tr,td,th{
            border:double red;
        }
    </style>
</head>
<body>

    <?php
//    $conx=mysqli_connect('localhost','root','','bd773344')or die('connexion impossible');
// ou bien
    require('connexion.php');

    echo('<table>');
    echo('
    <tr>
        <th>Nom chef</th>
        <th>Nom plat</th>
        <th>Moyenne notes</th>
        <th>Etat</th>
    </tr>    
    ');

    $req1="select nomchef, nompla,AVG(note),count(*) 
    from chef c, plat p, evaluation e
    where c.codepla=p.codepla and c.cinchef=e.cinchef
    group by c.cinchef
    order by avg(note)";

    $res1=mysqli_query($conx,$req1);

    $req="select * from degustateur";
    $res=mysqli_query($conx,$req);
    $nbres=mysqli_num_rows($res);

    while($tab=mysqli_fetch_array($res1))
       // nomchef $tab[0], nompla $tab[1],AVG(note)$tab[2],count(*)$tab[3]
        {
            if($tab[3]==$nbres)
                {
                    $etat='Evaluation terminée';
                }
            else
                {
                    $etat='Evaluation en cours';
                }
            echo('
            <tr>
        <td>'.$tab[0].'</td>
        <td>'.$tab[1].'</td>
        <td>'.$tab[2].'</td>
        <td>'.$etat.'</td>
    </tr>
            ');
        }
        echo('</table>');

    ?>
</body>
</html>