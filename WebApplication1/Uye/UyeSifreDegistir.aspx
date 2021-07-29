<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UyeSifreDegistir.aspx.cs" Inherits="WebApplication1.Uye.UyeSifreDegistir" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="../bs4/bootstrap.min.css" rel="stylesheet" />
    <script type="text/javascript" src="../bs4/jquery.min.js"></script>
    <script src="../bs4/bootstrap.min.js"></script>
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
        .üyegirişyer{
            left:380px;
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
                              <a class="nav-item nav-link" href="UyeDefault.aspx">Anasayfa</a>
                              <a class="nav-item nav-link active" href="UyeSifreDegistir.aspx">Şifre Değiştir</a>
                              <a class="nav-item nav-link" href="UyeUrunler.aspx">Ürünler</a>
                              <a class="nav-item nav-link" href="UyeSepet.aspx">Sepet</a>
                              <a class="nav-item nav-link" href="UyeOturumuKapat.aspx">Oturumu Kapat</a>
                            </div>
                          </div>
                        </nav>
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
                        <h5>Şifre Değiştir</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="container-fluid bg-white">
            <div class="container">
                <div class="row ">
                        <div class="container col-md-6 bosluk4 text-primary">
                            <form>
                                  <div class="form-group">
                                    <label for="TextBox1">Güncel Şifreniz</label>
                                    <asp:TextBox ID="TextBox1" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                      <asp:Label ID="Label1" Visible="false" runat="server" CssClass="text-danger">Güncel Şifreniz Yanlış!</asp:Label>
                                  </div>
                                  <div class="form-group">
                                    <label for="TextBox2">Yeni Şifreniz</label>
                                    <asp:TextBox ID="TextBox2"  TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                     <asp:Label ID="Label2" Visible="false" runat="server" CssClass="text-danger">Şifreler uyuşmuyor!</asp:Label>
                                  </div>
                                         <div class="form-group">
                                    <label for="TextBox3">Şifrenizi Onaylayın</label>
                                     <asp:TextBox ID="TextBox3"  TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                      <asp:Label ID="Label3" Visible="false" runat="server" CssClass="text-danger">Şifreler uyuşmuyor!</asp:Label>

                                  </div>
                                  <asp:Label ID="Label5" Visible="false" runat="server" CssClass="text-danger">Lütfen boş alan bırakmayın!</asp:Label>
                                        <div class=" text-center">
                                  <asp:Button ID="Button1" runat="server" OnClientClick="BUTTON" CssClass="btn btn-success" OnClick="Button1_Click" Text="Değiştir" />
                                        </div>
                             </form>
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
