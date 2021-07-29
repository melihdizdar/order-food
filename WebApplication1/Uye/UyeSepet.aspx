<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UyeSepet.aspx.cs" Inherits="WebApplication1.Uye.UyeSepet" %>

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
            <div class="container">
                <div class="row ">
                    <div class="col-md-12 text-center bosluk1 text-primary">
                            <asp:Repeater ID="myRepeater" runat="server">
                                <ItemTemplate>
                                    <div class="col-md-12">
                                      <div class="card">
                                          <div class="card-body row text-center align-items-center">
                                              <div class="col-md-3"><img src='/Resimler/<%# Eval("YemekResim") %>' class="card-img-top" alt="..." style="width:70px; height:auto;">
                                              </div>
                                              <div class="col-md-3"> Ürün :  <%# Eval("YemekAd") %></div> 
                                              <div class="col-md-3"> <asp:LinkButton CommandArgument='<%# Eval("Id") %>'  ID="LinkButton2" runat="server" Text="-" CssClass="btn btn-sm btn-danger" OnCommand="LinkButton2_Click">
                                                  </asp:LinkButton> Adet :  <%# Eval("Adet") %> <asp:LinkButton CommandArgument='<%# Eval("Id") %>'  ID="LinkButton3" runat="server" Text="+" CssClass="btn btn-sm btn-success" OnCommand="LinkButton3_Click">
                                                  </asp:LinkButton>
                                              </div>
                                              <div class="col-md-3"> 
                                                  <asp:Label ID="Label1" runat="server" Text='<%# String.Format( new System.Globalization.CultureInfo("tr-TR"), "{0:C}", Eval("Fiyat") ) %>'></asp:Label>
                                                  <asp:LinkButton CommandArgument='<%# Eval("Id") %>'  ID="LinkButton1" runat="server" Text="Kaldır" CssClass="btn btn-danger" OnCommand="LinkButton1_Click">
                                                  </asp:LinkButton>
                                              </div>
                                          </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                                    <div class="row w-100">
                                        <div class="col-md-6 w-100 text-left">
                                        </div>
                                        <div class="col-md-6 w-100 text-right">  <asp:Label ID="Label2" runat="server" CssClass="text-success text-right" Text=""></asp:Label>
                                             <asp:Button ID="sepetonay" OnClick="sepetonay_Click" Text="Sepeti Onayla" runat="server" CssClass="btn btn-success ml-3"/>
                                        </div>
                                    </div>
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
