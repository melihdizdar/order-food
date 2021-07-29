<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UyeSepetOnay.aspx.cs" Inherits="WebApplication1.Uye.UyeSepetOnay" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
        .bosluk5{
            padding-top : 200px;
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
                              <a class="nav-item nav-link" href="UyeSifreDegistir.aspx">Şifre Değiştir</a>
                              <a class="nav-item nav-link" href="UyeUrunler.aspx">Ürünler</a>
                              <a class="nav-item nav-link active" href="UyeSepet.aspx">Sepet</a>
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
                        <h5>Ürünler</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="container-fluid bg-white">
            <div class="container mt-3 mb-3 p-3">
              <asp:Label Text="" runat="server" ID="LabelHata" CssClass="text-danger" />
              <div class="form-group">
                <label for="adress">Adres</label>
                <asp:TextBox runat="server" class="form-control" ID="adresbox" aria-describedby="adress"></asp:TextBox>
              </div>
              <div class="form-group">
                <label for="not">Sipariş Notu</label>
                <asp:TextBox runat="server"  class="form-control" ID="notbox" aria-describedby="not"></asp:TextBox>
              </div>
              <asp:Label Text="text" runat="server" ID="LabelSepetFiyat" CssClass="text-success" /><br />
              <asp:LinkButton runat="server" OnClick="Onayla_Click" type="submit" class="btn btn-primary">Onayla</asp:LinkButton>
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
