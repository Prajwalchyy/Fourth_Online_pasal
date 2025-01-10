<?php
error_reporting(0);
session_start();
include 'config.php';

$user_id=$_SESSION["user_id"];
  if(isset($_POST['add_to_cart'])){
    $products_id=$_POST['product_id'];
    $products_name=$_POST['product_name'];
    $products_price=$_POST['product_price'];
    $products_image=$_POST['product_image'];
    $productType=$_POST['productType'];
    $products_quantity=1;


    //select cart data based on condition
    $select_cart=mysqli_query($conn,"select * from `cart` where productId='$products_id' and user_id='$user_id'");
    if(mysqli_num_rows($select_cart)>0){
        // echo"<div class='empty_text'>products already added to cart</div>";
        echo "<script type='text/javascript'>alert('products already added to cart')</script>";
    }else{
        //insert cart data in cart table
    $insert_products=mysqli_query($conn, "insert into `cart` (productId,user_id,quantity)values
    ('$products_id','$user_id','$products_quantity')");
    echo "<script type='text/javascript'>alert('product added to cart successfully')</script>";
    }
}
        
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>products page</title>
    <link rel="stylesheet" href="index.css">
    <style>
      .menu{
         background: gray;
         text-align: center;
      }
      .menu ul{
         display: inline-flex;
         list-style: none;
         color: white;
      }
      .menu ul li{
          width: 300px;
      } 
      .menu ul li a{
         text-decoration: none;
         color: white;
        font-size: 25px;
      }
      .active, .menu ul li:hover{
         background: lightgreen;
         border-radius: 3px;
         margin: 10px;
      }
    </style>
</head>
<body>
<div class="header">
    <?php include 'header.php'; ?>
    <div class="menu">
        <ul>
            <li><a href="products.php">Brand New Product</a></li>
            <li class="active"><a href="second_hand_product.php">Second Hand product</a></li>
        </ul>
    </div>
    <?php include 'headerone.php'; ?>
</div>
    
    <div class="products-container">
        <?php
       if(isset($_GET['cat'])){
        $category = $_GET['cat'];
       $select_products=mysqli_query($conn,"Select * from `products` WHERE category = '{$category}' && productType='old'");
      }else{
        $select_products =mysqli_query($conn, "select * from products WHERE productType='old'");}
      
       if(mysqli_num_rows($select_products)>0){
       while($fetch_product=mysqli_fetch_assoc($select_products)){
        // echo $fetch_product['name'];
        ?>
      <form method="post" action="">
        <div class="products-wrapper">
            <div class="product-frame">
                <img src="img/productimage/<?php echo $fetch_product["image"]; ?>" class="products-img">
                <div class="products-body">
                    <h4 class="products-title"><?php echo $fetch_product["productName"]; ?></h4>
                    <p class="products-price">price:<?php echo $fetch_product["price"]; ?></p>
                    <input type="hidden" name="product_id" value="<?php echo $fetch_product["productId"]; ?>">
                    <input type="hidden" name="product_name" value="<?php echo $fetch_product["productName"]; ?>">
                    <input type="hidden" name="product_price" value="<?php echo $fetch_product["price"]; ?>">
                    <input type="hidden" name="product_image" value="<?php echo $fetch_product["image"]; ?>">

                    <?php 
                    if(isset($_SESSION['user_id'])){ ?>
                    <button type="submit" class="add-to-cart-btn" name="add_to_cart">Add To Cart</button>
                    <?php
                    } else{ ?>
                        <button onclick="alert('Login To Continue')" type="submit" class="add-to-cart-btn">Add To Cart</button>
                
                   <?php }
                    ?>
                    <a href='details.php?details=<?php echo $fetch_product['productId']?>'><button type="button" class="details-btn" name="details">Details</button></a>
                </div>
            </div>
        </div>
      </form>
      <?php
       }
    }else{
        echo"<div class='empty_text'>No products Available</div>";
       }
        ?>
    </div>
    <?php
     include 'foot.php';
    ?>
</body>
</html>