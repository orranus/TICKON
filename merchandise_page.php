<?php 
    session_start();
    include('server.php');

    $errors = array();

    $_SESSION['allOrder'] = "";

    $_SESSION['merchandise'] = "";
    $query = "SELECT * FROM (merchandise INNER JOIN merchandise_type ON merchandise.mer_type=merchandise_type.ID_mer_type) INNER JOIN merchandise_stock ON merchandise.ID_Mer=merchandise_stock.ID_Mer AND merchandise.mer_name LIKE '%".$_GET['text_search']."%'";
    $result = mysqli_query($conn,$query);
    if (mysqli_num_rows($result)>0){
        while($row = mysqli_fetch_row($result)) {
            $url = "'merchandise.php?id=".$row[0]."'";
            if($row[3] == "MT00001")        // Merchandise type = Accessory
            {
                $_SESSION['merchandise'] .= ' <div class="pf-item charms"><a href="'.$row[5].'" class="pf-style lightbox-image mfp-image"><div class="pf-image"><img src="'.$row[5].'" alt=""><div class="overlay"><div class="overlay-caption"><div class="overlay-content" style="font-family:prompt;"><div class="pf-info white-color">';
                $_SESSION['merchandise'] .= '<h4 class="pf-title" style="font-family:prompt;">'.$row[2].'</h4><p>ประเภท : '.$row[7].'</p><p>ราคา : '.$row[4].' บาท</p><p>สินค้าคงเหลือ : '.$row[9].' ชิ้น</p></div><button class="merchandise-button" onclick="document.location='.$url.'" style="font-family:prompt; border: none; border-radius: 5px; width: 40%;">คลิกเพื่อดูรายละเอียด</button></div></div></div></div></a></div>';
            }
            elseif ($row[3] == "MT00002")   // Merchandise type = clothes
            {
                $_SESSION['merchandise'] .= '<div class="pf-item clothes"><a href="'.$row[5].'" class="pf-style lightbox-image mfp-image"><div class="pf-image"><img src="'.$row[5].'" alt=""><div class="overlay"><div class="overlay-caption"><div class="overlay-content" style="font-family:prompt;"><div class="pf-info white-color">';
                $_SESSION['merchandise'] .= '<h4 class="pf-title" style="font-family:prompt;">'.$row[2].'</h4><p>ประเภท : '.$row[7].'</p><p>ราคา : '.$row[4].' บาท</p><p>สินค้าคงเหลือ : '.$row[9].' ชิ้น</p></div><button class="merchandise-button" onclick="document.location='.$url.'" style="font-family:prompt; border: none; border-radius: 5px; width: 40%;">คลิกเพื่อดูรายละเอียด</button></div></div></div></div></a></div>';
            }
            elseif ($row[3] == "MT00003")   // Merchandise type = Album
            {
                $_SESSION['merchandise'] .= '<div class="pf-item albums"><a href="'.$row[5].'" class="pf-style lightbox-image mfp-image"><div class="pf-image"><img src="'.$row[5].'" alt=""><div class="overlay"><div class="overlay-caption"><div class="overlay-content" style="font-family:prompt;"><div class="pf-info white-color">';
                $_SESSION['merchandise'] .= '<h4 class="pf-title" style="font-family:prompt;">'.$row[2].'</h4><p>ประเภท : '.$row[7].'</p><p>ราคา : '.$row[4].' บาท</p><p>สินค้าคงเหลือ : '.$row[9].' ชิ้น</p></div><button class="merchandise-button" onclick="document.location='.$url.'" style="font-family:prompt; border: none; border-radius: 5px; width: 40%;">คลิกเพื่อดูรายละเอียด</button></div></div></div></div></a></div>';
            }
            elseif ($row[3] == "MT00004")   // Merchandise type = Light stick
            {
                $_SESSION['merchandise'] .= '<div class="pf-item lightsticks"><a href="'.$row[5].'" class="pf-style lightbox-image mfp-image"><div class="pf-image"><img src="'.$row[5].'" alt=""><div class="overlay"><div class="overlay-caption"><div class="overlay-content" style="font-family:prompt;"><div class="pf-info white-color">';
                $_SESSION['merchandise'] .= '<h4 class="pf-title" style="font-family:prompt;">'.$row[2].'</h4><p>ประเภท : '.$row[7].'</p><p>ราคา : '.$row[4].' บาท</p><p>สินค้าคงเหลือ : '.$row[9].' ชิ้น</p></div><button class="merchandise-button" onclick="document.location='.$url.'" style="font-family:prompt; border: none; border-radius: 5px; width: 40%;">คลิกเพื่อดูรายละเอียด</button></div></div></div></div></a></div>';
            }
            else                             // Event type = Poster
            {
                $_SESSION['merchandise'] .= ' <div class="pf-item others"><a href="'.$row[5].'" class="pf-style lightbox-image mfp-image"><div class="pf-image"><img src="'.$row[5].'" alt=""><div class="overlay"><div class="overlay-caption"><div class="overlay-content" style="font-family:prompt;"><div class="pf-info white-color">';
                $_SESSION['merchandise'] .= '<h4 class="pf-title" style="font-family:prompt;">'.$row[2].'</h4><p>ประเภท : '.$row[7].'</p><p>ราคา : '.$row[4].' บาท</p><p>สินค้าคงเหลือ : '.$row[9].' ชิ้น</p></div><button class="merchandise-button" onclick="document.location='.$url.'" style="font-family:prompt; border: none; border-radius: 5px; width: 40%;">คลิกเพื่อดูรายละเอียด</button></div></div></div></div></a></div>';
            }
        }
        
    } 


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
    <link href="css/style.css" rel="stylesheet">
    
  </head>
  <body class="homepage_slider" data-spy="scroll" data-target=".navbar-fixed-top" data-offset="100">
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    
    
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
                                    <li><a href="mainpage.php"><i class='bx bx-home-alt' style="font-size:14px;">&nbsp</i>HOME</a></li>
                                </ul>
                            </div>
                        </div> <!-- /.col -->

                    </div> <!-- /.row -->
                </div> <!--/.container -->
            </div> <!-- /.navigation-overlay -->
        </nav> <!-- /.navbar -->

    </header>
    <!-- End Navigation -->

    
    <!-- Section Title official -->
    <div class="section-title-bg text-center">
        <h2 class="wow fadeInDown no-margin" data-wow-duration="1s" data-wow-delay="0.6s"><strong>OFFICIAL PRODUCT</strong></h2>
        <div class="divider-center-small wow zoomIn" data-wow-duration="1s" data-wow-delay="0.6s"></div>
        <i class="section-subtitle wow fadeInUp" data-wow-duration="1s" data-wow-delay="0.6s" style="font-family:prompt;">สินค้า Official</i>
    </div>


   <!-- Start official product -->
   <section id="official" class="p-top-80 p-bottom-80">
        <div class="container-fluid no-padding">

            <!-- official product-filter -->
            <ul class="pf-filter pf-filter-gray text-center list-inline" style="font-family:prompt;">
                <li><a href="#" data-filter="*" class="iso-active iso-button">All</a></li>
                <li><a href="#" data-filter=".clothes" class="iso-button">CLOTHES</a></li>
                <li><a href="#" data-filter=".albums" class="iso-button">ALBUMS</a></li>
                <li><a href="#" data-filter=".lightsticks" class="iso-button">LIGHT STICKS</a></li>
                <li><a href="#" data-filter=".charms" class="iso-button">CHARMS</a></li>
                <li><a href="#" data-filter=".others" class="iso-button">OTHERs</a></li>
                <div class="widget widget-search">
                    <form action="" class="search-form" >
                     <input type="text" name="text_search" onfocus="if(this.value == 'Search') { this.value = ''; }" onblur="if(this.value == '') { this.value = 'Search'; }"  value="Search" style="font-family:prompt; color: #A799B7; border-bottom: 1px solid #A799B7;">
                     <!--<a href="#"><i class="fi fi-rr-search"></i></a>-->
                   </form>
                </div>
              </ul>

       <!-- official product -->
            <div class="portfolio portfolio-isotope col-3 gutter">

                <?php if (isset($_SESSION['merchandise'])) : ?>
                    <p><?php echo $_SESSION['merchandise']; unset($_SESSION['merchandise']); ?> </p>
                <?php endif ?>

            </div>
        </div>
    </section>

             <!-- official product -->
<br><br><br><br><br>


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
    
  </body>
</html>