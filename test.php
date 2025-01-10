<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .slider{
             /* background: lightblue; */
             background: transparent;
            height: 100vh;
            width: 110px;
            transition: all 0.5s linear;
        } 
         .slider:hover{
            width: 210px;
            background: gray;
        }
        span{
            color: white;
        }
        ul li a{
            text-decoration: none;
        }
        li{
            list-style-type: none;
        }
    </style>
</head>
<body>
    <div class="slider">
       <ul class="menu" >
          <li><a href=""><span>Home</span></a></li>
          <li><a href=""><span>Home</span></a></li>
          <li><a href=""><span>Home</span></a></li>
       </ul>
    </div>
    
    
</body>
</html>