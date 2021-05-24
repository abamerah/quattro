<?php 

include "../config/connect.php";
include "../model/users.php";

$user = new Users($pdo);

if($_SERVER['REQUEST_METHOD'] == "POST"){

    if(isset($_POST['fname'])){

        $user->fname        = filter_var($_POST['fname'],FILTER_SANITIZE_STRING);

    }

    if(isset($_POST['lname'])){

        $user->lname       = filter_var($_POST['lname'],FILTER_SANITIZE_STRING);
    }

    if(isset($_POST['email'])){

        $user->email       = filter_var($_POST['email'],FILTER_SANITIZE_EMAIL);
    }

    if(isset($_POST['pass'])){

        $user->pass        = filter_var($_POST['pass'],FILTER_SANITIZE_STRING);
    }

    if(isset($_POST['phone'])){

        $user->phone       = filter_var($_POST['phone'],FILTER_SANITIZE_STRING);
    }

    if(isset($_POST['address'])){

        $user->address     = filter_var($_POST['address'],FILTER_SANITIZE_STRING);
    }

    if(isset($_POST['created_at'])){
        
        $user->created_at  = filter_var($_POST['created_at'],FILTER_SANITIZE_STRING);
    }

        if($user->alreadyExists()){
            echo json_encode(array('status'=>'email already exists'));
        }

        else{
            
            $insertQuery = "INSERT INTO `users`(`fname`, `lname`, `phone`, `email`, `password`, `address`, `created_at`) VALUES (?,?,?,?,?,?,?)";

            $newStmt = $user->dbConn->prepare($insertQuery);

            $newStmt->execute(array($user->fname,$user->lname,$user->phone,$user->email,$user->pass,$user->address,$user->created_at));

            if($newStmt->rowCount() > 0){

                echo json_encode(array(
                    'fname'=>$user->fname,
                    'lname'=>$user->lname,
                    'phone'=>$user->phone,
                    'email'=>$user->email,
                    'pass'=>$user->pass,
                    'address'=>$user->address,
                    'created_at'=>$user->created_at,
                    'status'=>'success'
                ));
            }else{
                echo json_encode(array('status'=>'Something went wrong'));
            }

        }


}