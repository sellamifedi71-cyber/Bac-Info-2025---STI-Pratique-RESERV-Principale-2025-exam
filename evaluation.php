<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>eval php</title>
</head>
<body>
    <?php

//    $conx=mysqli_connect('localhost','root','','bd773344')or die('connexion impossible');
    require('connexion.php');

    $cin=$_POST['cin'];
    $deg=$_POST['liste'];
    $orig=$_POST['orig'];
    $pres=$_POST['pres'];
    $gout=$_POST['gout'];

    $note=($orig+$pres+$gout)/3;

    $req1="select cinchef from chef where cinchef= '$cin' ";
    $res1=mysqli_query($conx,$req1);

    $nbres1=mysqli_num_rows($res1);
    if($nbres1==0) //chef n'existe pas
        {
            echo('Erreur : Chef inexistant !');
        }
    else{ //chef existe
        $req2="select iddeg,cinchef from evaluation where cinchef='$cin' and iddeg='$deg' ";
        $res2=mysqli_query($conx,$req2);

        $nbres2=mysqli_num_rows($res2);
        if($nbres2!=0) //chef evalué par ce degustateur
            {
                echo('Erreur : Chef déjà évalué par ce dégustateur');
            }
            else{
                $req3="insert into evaluation values('$deg','$cin','$note')";
                $res3=mysqli_query($conx,$req3);
              //  if(mysqli_affected_rows($conx)!=null)
                echo('L\'évaluation du plat est effectuée avec succès');
            }
    }
    mysqli_close($conx);
   ?>
</body>
</html>