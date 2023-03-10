<?php 
    session_start();
    include('server.php');

    $errors = array();

    $_SESSION['merchandise'] = "";
    $query = "SELECT * FROM (merchandise INNER JOIN merchandise_type ON merchandise.mer_type=merchandise_type.ID_mer_type) INNER JOIN merchandise_stock ON merchandise.ID_Mer=merchandise_stock.ID_Mer AND merchandise.ID_Mer = '".$_GET['id']."'";
    $result = mysqli_query($conn,$query);
    if (mysqli_num_rows($result)>0){
        while($row = mysqli_fetch_row($result)) {
            $_SESSION['merchandise'] .= '<center><img src="'.$row[5].'" style="width: 40%"></center><br><br><ul class="buy-product"><h4 class="pf-title" style="font-family:prompt; font-size: 25px">'.$row[2].'</h4>';
            $_SESSION['merchandise'] .= '<p>ประเภท : '.$row[7].'</p><p>ราคา : '.$row[4].' บาท</p><p>สินค้าคงเหลือ : '.$row[9].' ชิ้น</p><p>จำนวนที่ต้องการซื้อ : <input type="number" name="quantity" min="1" max="'.$row[9].'" required style="width: 70px; height: 25px;"></p><br></ul>';
            $_SESSION['Mer_price'] = $row[4];
        }
        
    } 
    $_SESSION['idMer'] = $_GET['id'];
    
    

?>


<!DOCTYPE html>
<html lang="en">
  <head>
  <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>TICKON</title>

    <!-- login -->
    <meta charset="UTF-8">

    <!--<title> Login and Registration Form in HTML & CSS | CodingLab </title>-->
    <link rel="stylesheet" href="style.css">
    <!-- Favicons -->
    <link rel="shortcut icon" href="img/logotickon.png" sizes="80x40">
    <!-- Fontawesome CDN Link -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet" />
    
    <!-- Google Web Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" />
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700" rel="stylesheet" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Prompt">

    <!-- Icon -->
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-bold-rounded/css/uicons-bold-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-rounded/css/uicons-regular-rounded.css'>
    <link rel='stylesheet' href='https://cdn-uicons.flaticon.com/uicons-regular-straight/css/uicons-regular-straight.css'>
    
    <!-- Bootstrap CSS -->
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    
    <!-- CSS Files For Plugin -->
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/font-awesome/font-awesome.min.css" rel="stylesheet">
    <link href="css/magnific-popup.css" rel="stylesheet" />
    <link href="css/YTPlayer.css" rel="stylesheet" />
    <link href="inc/owlcarousel/css/owl.carousel.min.css" rel="stylesheet" />
    <link href="inc/owlcarousel/css/owl.theme.default.min.css" rel="stylesheet" />
    <link href="inc/revolution/css/settings.css" rel="stylesheet" />
    <link href="inc/revolution/css/layers.css" rel="stylesheet" />
    <link href="inc/revolution/css/navigation.css" rel="stylesheet" />
    
    <!-- Custom CSS -->
    <link href="css/style2.css" rel="stylesheet">
    
  </head>
  <body class="homepage_slider" data-spy="scroll" data-target=".navbar-fixed-top" data-offset="100">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    <style>
        p {
            font-family: prompt;
        }
    </style>
    
    <!-- Preloader -->
    <div id="preloader">
        <div id="spinner"></div>
    </div>
    <!-- End Preloader-->

    
    <!-- Start Navigation -->
    <header class="nav-solid" id="home">
        <nav class="navbar navbar-fixed-top">
            <header class="header">

                <div class="icons">
                    <div class="nav-icon">
                        
                    <img class="icon-bar"style = "width : 75px; height :40px; margin-bottom: 5px;" src="img/logotickon.png">
                        
                    </div>
                    <p style="font-family: prompt; text-align: right; color: whitesmoke; font-size: 12px; padding-top: 9px;">Copyright © 2022 TICKON. All rights reserved.</p>
                </div>
                
               </header>
            <div class="navigation">
                <div class="container-fluid">
                    <div class="row">

                        <div class="navbar-header">
                            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-collapse">
                                <span class="sr-only">TICKON</span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                                <span class="icon-bar"></span>
                            </button>

                           
                        </div> <!-- end navbar-header -->

                        <div class="col-md-8 col-xs-12 nav-wrap">
                            <div class="collapse navbar-collapse" id="navbar-collapse">

                                <ul class="nav navbar-nav navbar-right">
                                    <!--<li><a href="#box"> <i class='bx bx-basket' id="shopping-cart" style="font-size: 16px;"><span style="font-size: 10px; color: red; font-family: prompt;">&nbsp(NEW)</span></i></a></li>-->
                                    <li><a href="mainpage.php"><i class='bx bx-home-alt' style="font-size:14px;">&nbsp</i>HOME</a></li>
                                    <li><a href="merchandise_page.php"><i class='bx bx-cart-alt' style="font-size:15px;">&nbsp</i>PREVIOUS</a></li>
                                </ul>
                            </div>
                        </div> <!-- /.col -->

                    </div> <!-- /.row -->
                </div> <!--/.container -->
            </div> <!-- /.navigation-overlay -->
        </nav> <!-- /.navbar -->

    <!-- cart -->
    
    <!--<div class="shopping-cart">

      <section>
      <br>
      <div id="close-cart" ><span><i class='bx bx-x-circle' style="font-size:18px;"></i></span></div>
      <p style="font-family:prompt; text-align: center; font-size: 16px;">รายการสินค้าในตะกร้าของคุณ</p>
      <div class="box">
         <a href="#" class="fas fa-times"></a>
         <img src="img/tb-album.jpg" alt="">
         <div class="content">
            <p>ALBUM Tilly Birds <br><span>( 360 บาท x1 )</span></p>
            <form action="" method="post">
               <input type="number" class="qty" name="qty" min="1" value="2" max="100">
            </form>
         </div>
      </div>

      <div class="box">
         <a href="#" class="fas fa-times"></a>
         <img src="img/tb-light.jpg" alt="">
         <div class="content">
            <p>แท่งไฟวง Tilly Birds <br><span>( 500 บาท x1 )</span></p>
            <form action="" method="post">
               <input type="number" class="qty" name="qty" min="1" value="1" max="100">
            </form>
         </div>
      </div>

      <div class="box">
         <a href="#" class="fas fa-times"></a>
         <img src="img/tb-charm.jpg" alt="">
         <div class="content">
            <p>เครื่องประดับวง Tilly Birds <br><span>( 1,890 บาท x1 )</span></p>
            <form action="" method="post">
               <input type="number" class="qty" name="qty" min="1" value="2" max="100">
            </form>
         </div>
      </div>

      <center><a href="pay.html" class="btn" style="width: 100px; background-color: #FB3640; border-radius: 40px; border: 0px; color: white; font-family: prompt; margin-top: 15px;">order now</a></center>

   </section>

    </div>-->
    <!-- end cart -->

    </header>
    <!-- End Navigation -->
    
    <!-- Section Title buy product -->
    <div class="section-title-bg text-center">
        <h2 class="wow fadeInDown no-margin" data-wow-duration="1s" data-wow-delay="0.6s" style="font-family:prompt;"><strong>รายละเอียดสินค้า</strong></h2>
        <div class="divider-center-small wow zoomIn" data-wow-duration="1s" data-wow-delay="0.6s"></div>
    </div>

    <!-- Start buy product -->
    <form action="mer_buy.php". method="post">
    <div class="moneyrefund">
    <section id="portfolio" class="p-top-80 p-bottom-80">
        <div class="container">

            <!-- buy product-filter -->
            <div class="buy-product-bg">
                <?php if (isset($_SESSION['merchandise'])) : ?>
                    <p><?php echo $_SESSION['merchandise']; unset($_SESSION['merchandise']); ?> </p>
                <?php endif ?>
                <div class="buy-product-button"> <!--<input type="button" onclick="document.location='merchandise_page.php'" value="ใส่ตะกร้า" id="cartbutton" style="width: 100px; background-color: #FB3640; border-radius: 40px; border: 0px; color: white; font-family: prompt; position: center;">-->
                    <center>&emsp;<input type="button" value="สั่งซื้อ" id="buyproductbutton" style="width: 100px; background-color: #4c8a77; border-radius: 40px; border: 0px; color: white; font-family: prompt; position: center;" data-toggle="modal" data-target="#exampleModal"></center>
                </div>
            </div>
        </div>
    </section>
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                                aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel" style="font-family: 'Prompt', sans-serif;">ยืนยัน</h5>
                                    </div>
                                    <div class="modal-body">
                                        กดเพื่อยืนยันการสั่งซื้อ
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" style="width: 50px; background-color: #666666; border-radius: 40px; border: 0px; color: white; font-family: prompt; position: center;"
                                        data-dismiss="modal">ปิด</button>
                                        <button type="button"  style="width: 90px; background-color: #FB3640; border-radius: 40px; border: 0px; color: white; font-family: prompt; position: center;"
                                        data-dismiss="modal" data-toggle="modal" data-target="#exampleModal2" data-scroll href="#">ยืนยัน</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal2" tabindex="-1" role="dialog"
                                aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel" style="font-family: 'Prompt', sans-serif;">ยืนยัน</h5>
                                    </div>
                                    <div class="modal-body">
                                            ทำการสั่งซื้อสินค้าเรียบร้อย
                                    </div>
                                    <div class="modal-footer">
                                        <button type="submit" name="Buy"  style="width: 50px; background-color: #666666; border-radius: 40px; border: 0px; color: white; font-family: prompt; position: center;">
                                        ปิด</button>
                                    </div>
                                </div>
                            </div>
                        </div>
    </div>
    </form>


    <!-- Start Footer -->
    <footer class="site-footer">
        <div class="container">
            <div class="social-icon pull-right">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-pinterest"></i></a>
                <a href="#"><i class="fa fa-google"></i></a>
                <a href="#"><i class="fa fa-rss"></i></a>
                <a href="#"><i class="fa fa-globe"></i></a>
            </div>
            <!-- /social-icon -->
        </div>
        <!-- /container -->
    </footer>
    <!-- End Footer -->


    <!-- Back to top -->
    <a href="#" id="back-to-top" title="Back to top"><i class="fa fa-angle-up"></i></a>
    <!-- /Back to top -->

    
    <!-- jQuery -->
    <script src="js/jquery.min.js"></script>
    
    <!-- Bootstrap -->
    <script src="bootstrap/js/bootstrap.min.js"></script>
    
    <!-- Components Plugin -->
    <script src="js/jquery.easing.1.3.js"></script>
    <script src="js/smooth-scroll.js"></script>
    <script src="js/jquery.appear.js"></script>
    <script src="js/jquery.countTo.js"></script>
    <script src="js/jquery.stellar.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/imagesloaded.pkgd.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/jquery.mb.YTPlayer.js"></script>
    <script src="js/retina.min.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="inc/owlcarousel/js/owl.carousel.min.js"></script>

    <!-- Contact Form -->
    <script src="js/contact.js"></script>
    
    <!-- Custom Plugin -->
    <script src="js/custom.js"></script>

    <!-- cart -->
    <script>
        let cart = document.querySelector('.shopping-cart');

        document.querySelector('#shopping-cart').onclick = () =>{
        cart.classList.add('active');
        }

        document.querySelector('#close-cart').onclick = () =>{
        cart.classList.remove('active');
        }

        window.onscroll = () =>{
        navbar.classList.remove('active');
        myOrders.classList.remove('active');
        cart.classList.remove('active');
        };
    </script>
    
    
  </body>
</html>