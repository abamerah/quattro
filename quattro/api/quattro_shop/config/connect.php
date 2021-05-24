<?php 

$dsn = 'mysql:host=localhost;dbname=shop_le_quattro';
$user = 'root';
$pass = '';
$option = array(
    PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES UTF8"
 );

try {

    $pdo = new PDO($dsn,$user,$pass,$option);

    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

} catch (PDOException $e) {

    echo $e->getMessage;

}