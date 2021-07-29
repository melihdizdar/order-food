﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="YonetBildirimler.aspx.cs" Inherits="WebApplication1.Yonet.YonetBildirimler" %>

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
                              <a class="nav-item nav-link" href="YonetDefault.aspx">Ana Sayfa</a>
                              <a class="nav-item nav-link" href="YonetYemekler.aspx">Yemek Listesi</a>
                              <a class="nav-item nav-link" href="YonetYemekEkle.aspx">Yemek Ekle</a>
                              <a class="nav-item nav-link active" href="YonetBildirimler.aspx">Bildirimler</a>
                              <a class="nav-item nav-link" href="YonetBildirimDuzenle.aspx">Bildirim Düzenle/Sil</a>
                              <a class="nav-item nav-link" href="YonetOturumuKapat.aspx">Oturumu Kapat</a>
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
                        <h5>Bildirim Sayfası</h5>
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
                        <div class="row mt-3 mb-3 ">
                            <asp:Repeater runat="server" ID="bildirimrepetear2">
                                <ItemTemplate>
                                    <asp:Panel runat="server" CssClass='<% # (bool)Eval("BildirimOkundu") == false ? "col-12 alert alert-danger" : "col-12 alert alert-success" %>'>
                                        <div class="text-left h-50">
                                    <asp:Label Text='<% # System.Web.HttpUtility.HtmlDecode(Eval("BildirimText").ToString()) %>' CssClass="text-left" runat="server" />
                                        </div>
                                         <div class="text-right">
                                    <asp:LinkButton Text='<% # (bool)Eval("BildirimOkundu") == false ? Eval("BildirimTarih","{0:dd/MM/yyyy hh:mm}") + "&#10004" : Eval("BildirimTarih","{0:dd/MM/yyyy hh:mm}") %>' OnCommand="Unnamed_Command"  CommandArgument='<% # Eval("Id") %>' CssClass="pull-right cursor-pointer" runat="server" />
                                        </div>
                                    </asp:Panel>
                                </ItemTemplate>
                            </asp:Repeater>
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
