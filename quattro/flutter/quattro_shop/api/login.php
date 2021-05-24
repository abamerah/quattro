<?php 

include "../config/connect.php";
include "../model/users.php";

$user = new Users($pdo);

if($_SERVER['REQUEST_METHOD'] == "POST"){

    if(isset($_POST['email'])){

        $user->email       = filter_var($_POST['email'],FILTER_SANITIZE_EMAIL);
    }

    if(isset($_POST['pass'])){

        $user->pass        = filter_var($_POST['pass'],FILTER_SANITIZE_STRING);
    }

    $query = "SELECT * FROM `users` WHERE `email`=? AND `password`=?";

    $stmt = $user->dbConn->prepare($query);

    $stmt->execute(array($user->email,$user->pass));

    $users = $stmt->fetch();

    $row = $stmt->rowcount() ;

    if($row >0){
        $user->id = $users['id'];
        $user->email = $users['email'];
        $user->pass= $users['password'];
        $user->fname= $users['fname'];
        $user->lname= $users['lname'];
        $user->phone= $users['phone'];
        $user->address= $users['address'];
        $user->created_at= $users['created_at'];

        echo json_encode(array(
            'id'=>$user->id,
            'fname'=>$user->fname,
            'lname'=>$user->lname,
            'phone'=>$user->phone,
            'email'=>$user->email,
            'pass'=>$user->pass,
            'address'=>$user->address,
            'created_at'=>$user->created_at,
            'status'=>'login success'
        ));
    }
    else {
        echo json_encode (array('status' => "failed, email not found" , 'email' => $user->email  , 'password' => $user->pass) );
    }

}