<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YonetYemekEkle.aspx.cs" Inherits="WebApplication1.Yonet.YonetYemekEkle" %>

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
                              <a class="nav-item nav-link active" href="YonetYemekEkle.aspx">Yemek Ekle</a>
                              <a class="nav-item nav-link" href="YonetBildirimler.aspx">Bildirimler</a>
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
                        <h5>Yemek Ekleme Sayfası</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="container-fluid bg-white">
            <div class="container">
                <div class="row ">
                        <a class="mt-2 mb-2 ml-3 btn btn-success"  href="/Yonet/YonetYemekler.aspx">Geri Dön</a>

                    <div class="row mt-5 mb-5 p-3 text-center">
                        <div class="text-center w-100 col-12 mb-3">
                        <asp:Label ID="hatalabel" Text="" CssClass="text-danger" runat="server" />
                        </div>
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control-file text-center upld col-md-6 m-auto" />
                    <img src="/Resimler/noimage.png" class="img-thumbnail col-md-6" style="height:auto; max-width:300px;" alt="Alternate Text" />
      
                            <div class="col-12 mt-3 row mb-3">
                            <label for="yemekadibox" class="col-md-4">Yemek Adı:</label>
                            <asp:TextBox  runat="server" ID="yemekadibox" CssClass="col-md-8"/>
                             </div>
                             <div class="col-12 row mb-3">
                            <label for="yemekkategoribox" class="col-md-4">Yemek Kategorisi:</label>
                            <asp:TextBox Text="" runat="server" ID="yemekkategoribox" CssClass="col-md-8"/>
                             </div>
                              <div class="col-12 row mb-3">
                            <label for="yemekaciklamabox" class="col-md-4">Yemek Açıklaması:</label>
                            <asp:TextBox Text="" runat="server" ID="yemekaciklamabox" Columns="11" Rows="11" CssClass="col-md-8"/>
                             </div>
                              <div class="col-12 row mb-3">
                            <label for="yemekfiyatbox" class="col-md-4">Yemek Fiyatı:</label>
                            <asp:TextBox Text="" runat="server" ID="yemekfiyatbox" TextMode="Number" step="0.1" CssClass="col-md-8"/>
                             </div>
                            <div class="text-center w-100 mt-3">
                            <asp:Button Text="Kaydet" OnClick="Unnamed_Click" runat="server" CssClass="btn btn-primary w-100" /> 
                            </div>
                    </div>
                    <script>
                        function readURL(input) {

                            if (input.files && input.files[0]) {
                                var reader = new FileReader();

                                reader.onload = function (e) {
                                    $(input).next('img').attr('src', e.target.result);
                                }

                                reader.readAsDataURL(input.files[0]);
                            }
                        }
                        $(function () {
                            $(".upld").change(function () { //set up a common class
                                readURL(this);
                            });
                        });
                    </script>
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
