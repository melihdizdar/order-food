<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YonetYemekler.aspx.cs" Inherits="WebApplication1.Yonet.YonetYemekler" %>

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
                              <a class="nav-item nav-link active" href="YonetYemekler.aspx">Yemek Listesi</a>
                              <a class="nav-item nav-link" href="YonetYemekEkle.aspx">Yemek Ekle</a>
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
                        <h5>Yemek Sil/Düzenle</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="container-fluid bg-white">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <br />
                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="YemekId" DataSourceID="SqlDataSource1" CssClass="table table-hover" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" AllowPaging="True" AllowSorting="True">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                                <asp:BoundField DataField="YemekId" HeaderText="YemekId" InsertVisible="False" ReadOnly="True" SortExpression="YemekId" />
                                <asp:BoundField DataField="YemekAd" HeaderText="YemekAd" SortExpression="YemekAd" />
                                <asp:BoundField DataField="YemekFiyat" HeaderText="YemekFiyat" SortExpression="YemekFiyat" />
                                <asp:BoundField DataField="YemekKategori" HeaderText="YemekKategori" SortExpression="YemekKategori" />
                                <asp:BoundField DataField="YemekAciklama" HeaderText="YemekAciklama" SortExpression="YemekAciklama" />
                            </Columns>
                            <FooterStyle BackColor="White" ForeColor="#000066" />
                            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
                            <RowStyle ForeColor="#000066" />
                            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#007DBB" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#00547E" />
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:YemekSiparis %>" DeleteCommand="DELETE FROM [Tbl_Yemekler] WHERE [YemekId] = @YemekId" InsertCommand="INSERT INTO [Tbl_Yemekler] ([YemekAd], [YemekFiyat], [YemekKategori], [YemekAciklama]) VALUES (@YemekAd, @YemekFiyat, @YemekKategori, @YemekAciklama)" SelectCommand="SELECT [YemekId], [YemekAd], [YemekFiyat], [YemekKategori], [YemekAciklama] FROM [Tbl_Yemekler]" UpdateCommand="UPDATE [Tbl_Yemekler] SET [YemekAd] = @YemekAd, [YemekFiyat] = @YemekFiyat, [YemekKategori] = @YemekKategori, [YemekAciklama] = @YemekAciklama WHERE [YemekId] = @YemekId">
                            <DeleteParameters>
                                <asp:Parameter Name="YemekId" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="YemekAd" Type="String" />
                                <asp:Parameter Name="YemekFiyat" Type="Decimal" />
                                <asp:Parameter Name="YemekKategori" Type="String" />
                                <asp:Parameter Name="YemekAciklama" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="YemekAd" Type="String" />
                                <asp:Parameter Name="YemekFiyat" Type="Decimal" />
                                <asp:Parameter Name="YemekKategori" Type="String" />
                                <asp:Parameter Name="YemekAciklama" Type="String" />
                                <asp:Parameter Name="YemekId" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
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
