<?php
session_start();
echo $_SESSION['admin'];
    if(isset($_SESSION['admin'])){
        session_destroy(); 
    }
header('Location: index.php');
?>