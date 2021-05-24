<?php

class Users {

    public $dbConn;

    public $id;
    public $email;
    public $pass;
    public $fname;
    public $lname;
    public $phone;
    public $address;
    public $created_at;

    public function __construct($db){

        $this->dbConn = $db;

    }

    public function alreadyExists(){

        $query = "SELECT * FROM `users` WHERE `email`='". $this->email ."'";
        // prepare query statement
        $stmt = $this->dbConn->prepare($query);
        // execute query
        $stmt->execute();

        if($stmt->rowCount() > 0){
            return true;
        }

        else{
            return false;
        }

    }

}

?>