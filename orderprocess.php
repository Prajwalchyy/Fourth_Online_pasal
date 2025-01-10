<?php
session_start();
include "config.php";
$user_id=$_SESSION["user_id"];

$invoice_no=uniqid('', true);

$select_cart_products1=mysqli_query($conn,"SELECT c.*, p.productName, p.price, p.image, p.stock FROM cart c JOIN products p ON c.productId= p.productId WHERE c.user_id= '$user_id'");

if(isset($_POST['order'])) {

  while($fetch_cart_products1=mysqli_fetch_assoc($select_cart_products1)){
    $sql = 'insert into orders (productId, user_id , order_quantity, invoice_no) values ("'.$fetch_cart_products1['productId'].'", "'.$user_id.'", "'.$fetch_cart_products1['quantity'].'", 
    "'.$invoice_no.'")';
    $resultInsert = mysqli_query($conn, $sql);
  }
  $sql1 = "DELETE FROM cart WHERE user_id = $user_id";
  mysqli_query($conn, $sql1);
  header("Location:my_order.php");

} else {
  echo 'error';
}
?>