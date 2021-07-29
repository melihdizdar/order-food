<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApplication1.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="bs4/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="bs4/jquery.min.js"></script>
    <script src="bs4/bootstrap.min.js"></script>
    <style>
        .bosluk2 {
        padding-bottom:15px;
        padding-top:15px;
        }
        .bosluk1{
            padding-top : 10px;
            padding-bottom : 10px;
        }
        .bosluk{
            padding-top : 5px;
            padding-bottom : 5px;
        }
        .bosluk3{
            padding-top : 20px;
            padding-bottom : 20px;
        }
        .bosluk4{
            padding-top : 30px;
            padding-bottom : 30px;
        }
        .topcolor{
            background-color:#001265;
        }
        .toptextcolor {
            background-color:#6c757d;
        }
        .caro {
            top: 140px;
            bottom: auto;
            left: -500px;
        }
        .sliderbgcolor {
            background-color:#c6c6c6;
        }
        .cardcar{
            left: 50px;
        }
        .cardbg {
            background-color:#007bff;
        }
        .maxwidth{
            width:100%;
            background-size:cover;
        }
        .slideryer{
            left:50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div class="container-fluid bg-primary">
            <div class="container">
                <div class="row ">
                    <div class="col-md-12 text-center bosluk1 text-light">
                        <h4></h4>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="container-fluid bg-white">
            <div class="container">
                <div class="row ">
                    <div class="col-md-12 text-secondary bosluk3">
                        <nav class="navbar navbar-expand-lg navbar-white bg-white">
                          <h4>Lezzet Dünyası<h4 class="text-primary">.</h4></h4>
                          <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                            <div class="navbar-nav ml-auto">
                              <a class="nav-item nav-link active" href="Default.aspx">Anasayfa <span class="sr-only">(current)</span></a>
                              <a class="nav-item nav-link" href="Uye/UyeGiris.aspx">Üye Girişi</a>
                              <a class="nav-item nav-link" href="Uye/UyeKayitOl.aspx">Kayıt Ol</a>
                              <a class="nav-item nav-link" href="Yonet/YonetGiris.aspx">Yönetici Girişi</a>
                            </div>
                          </div>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid bg-primary bosluk">
    	<div class="container">
        	<div class="row">
            	<div class="col-md-12">
                	<div id="demo" class="carousel slide" data-ride="carousel">
                    	<ul class="carousel-indicators">
                        	<li data-target="#demo" data-slide-to="0" class="active"></li>
                            <li data-target="#demo" data-slide-to="1"></li>
                            <li data-target="#demo" data-slide-to="2"></li>
                        </ul>
                        <div class="carousel-inner">
                        	<div class="carousel-item active slideryer">
                            	<img src="Resimler/slider/1.jpg" width="1000" height="333"/>
                                <div class="carousel-caption caro">
                                	<h4>Lezzetin Dünyasına Hoşgeldiniz</h4>
                                    <h6>"Lezzetin dünyadaki nirvanası"</h6>
                                </div>
                            </div>
                            <div class="carousel-item slideryer">
                            	<img src="Resimler/slider/1.jpg" width="1000" height="333"/>
                                <div class="carousel-caption caro">
                                	<h4>Lezzetin Dünyasına Hoşgeldiniz</h4>
                                    <h6>"Lezzetin dünyadaki nirvanası"</h6>
                                </div>
                            </div>
                            <div class="carousel-item slideryer">
                            	<img src="Resimler/slider/1.jpg" width="1000" height="333"/>
                                <div class="carousel-caption caro">
                                	<h4>Lezzetin Dünyasına Hoşgeldiniz</h4>
                                    <h6>"Lezzetin dünyadaki nirvanası"</h6>
                                </div>
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#demo" data-slide="prev">
                        <span class="carousel-control-prev-icon"></span></a>
                        <a class="carousel-control-next" href="#demo" data-slide="next">
                        <span class="carousel-control-next-icon"></span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="container-fluid bg-white text-center bosluk4">
            <div class="container">
                <div class="row ">
                    <div class="jumbotron">
                      <h1 class="display-4">Merhabalar, değerli müşterilerimiz!</h1>
                      <p class="lead">Size en kaliteli hizmetleri verebilmek için buradayız eğer sizde bu lezzetleri tatmak isterseniz buttonlardan veya yukarıdaki linklerden tıklayarak giriş sağlayabilirsiniz.</p>
                      <hr class="my-2">
                      <p>Eğer yönetici iseniz, <a href="#" >buradan</a> profilinize giriş yapabilirsiniz.</p>
                      <a class="btn btn-primary" href="Uye/UyeKayit.aspx" role="button">Kayıt Ol</a>
                      <a class="btn btn-primary" href="Uye/UyeGiris.aspx" role="button">Üye Girişi</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="container-fluid bg-primary">
            <div class="container">
                <div class="row ">
                    <div class="col-md-12 text-center bosluk1 text-light">
                        <h7>Bu site Melih Dizdar tarafından kodlanmıştır. © 2021 Tüm hakları saklıdır.</h7>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
