<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UyeKayit.aspx.cs" Inherits="WebApplication1.Uye.UyeKayit" %>

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
                              <a class="nav-item nav-link" href="../Default.aspx">Anasayfa <span class="sr-only">(current)</span></a>
                              <a class="nav-item nav-link" href="UyeGiris.aspx">Üye Girişi</a>
                              <a class="nav-item nav-link active" href="UyeKayit.aspx">Kayıt Ol</a>
                              <a class="nav-item nav-link" href="../Yonet/YonetGiris.aspx">Yönetici Girişi</a>
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
                        <h5>Üye Kayıt Sayfası</h5>
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

                        <asp:FormView ID="FormView1" runat="server" DataKeyNames="MusteriId" DataSourceID="SqlDataSource1" DefaultMode="Insert" HorizontalAlign="Center" OnItemInserted="FormView1_ItemInserted">
                            <EditItemTemplate>
                                MusteriId:
                                <asp:Label ID="MusteriIdLabel1" runat="server" Text='<%# Eval("MusteriId") %>' />
                                <br />
                                TcKimlik:
                                <asp:TextBox ID="TcKimlikTextBox" runat="server" Text='<%# Bind("TcKimlik") %>' />
                                <br />
                                MusteriSifre:
                                <asp:TextBox ID="MusteriSifreTextBox" runat="server" Text='<%# Bind("MusteriSifre") %>' />
                                <br />
                                Adi:
                                <asp:TextBox ID="AdiTextBox" runat="server" Text='<%# Bind("Adi") %>' />
                                <br />
                                Soyadi:
                                <asp:TextBox ID="SoyadiTextBox" runat="server" Text='<%# Bind("Soyadi") %>' />
                                <br />
                                Telefon:
                                <asp:TextBox ID="TelefonTextBox" runat="server" Text='<%# Bind("Telefon") %>' />
                                <br />
                                Adres:
                                <asp:TextBox ID="AdresTextBox" runat="server" Text='<%# Bind("Adres") %>' />
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Güncelleştir" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="İptal" />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                TC Kimlik:
                                <asp:TextBox ID="TcKimlikTextBox" runat="server" CssClass="form-control" Text='<%# Bind("TcKimlik") %>' TextMode="Number" />
                                <br />
                                Şifre:
                                <asp:TextBox ID="MusteriSifreTextBox" runat="server" CssClass="form-control" Text='<%# Bind("MusteriSifre") %>' TextMode="Password" />
                                <br />
                                Adı:
                                <asp:TextBox ID="AdiTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Adi") %>' />
                                <br />
                                Soyadı:
                                <asp:TextBox ID="SoyadiTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Soyadi") %>' />
                                <br />
                                Telefon:
                                <asp:TextBox ID="TelefonTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Telefon") %>' TextMode="Number" />
                                <br />
                                Adres:
                                <asp:TextBox ID="AdresTextBox" runat="server" CssClass="form-control" Text='<%# Bind("Adres") %>' TextMode="MultiLine" />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-success" Text="Ekle" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-danger" Text="İptal" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                MusteriId:
                                <asp:Label ID="MusteriIdLabel" runat="server" Text='<%# Eval("MusteriId") %>' />
                                <br />
                                TcKimlik:
                                <asp:Label ID="TcKimlikLabel" runat="server" Text='<%# Bind("TcKimlik") %>' />
                                <br />
                                MusteriSifre:
                                <asp:Label ID="MusteriSifreLabel" runat="server" Text='<%# Bind("MusteriSifre") %>' />
                                <br />
                                Adi:
                                <asp:Label ID="AdiLabel" runat="server" Text='<%# Bind("Adi") %>' />
                                <br />
                                Soyadi:
                                <asp:Label ID="SoyadiLabel" runat="server" Text='<%# Bind("Soyadi") %>' />
                                <br />
                                Telefon:
                                <asp:Label ID="TelefonLabel" runat="server" Text='<%# Bind("Telefon") %>' />
                                <br />
                                Adres:
                                <asp:Label ID="AdresLabel" runat="server" Text='<%# Bind("Adres") %>' />
                                <br />
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Düzenle" />
                                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Sil" />
                                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Yeni" />
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:YemekSiparis %>" DeleteCommand="DELETE FROM [Tbl_Musteriler] WHERE [MusteriId] = @MusteriId" InsertCommand="INSERT INTO [Tbl_Musteriler] ([TcKimlik], [MusteriSifre], [Adi], [Soyadi], [Telefon], [Adres]) VALUES (@TcKimlik, @MusteriSifre, @Adi, @Soyadi, @Telefon, @Adres)" SelectCommand="SELECT * FROM [Tbl_Musteriler]" UpdateCommand="UPDATE [Tbl_Musteriler] SET [TcKimlik] = @TcKimlik, [MusteriSifre] = @MusteriSifre, [Adi] = @Adi, [Soyadi] = @Soyadi, [Telefon] = @Telefon, [Adres] = @Adres WHERE [MusteriId] = @MusteriId">
                            <DeleteParameters>
                                <asp:Parameter Name="MusteriId" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="TcKimlik" Type="String" />
                                <asp:Parameter Name="MusteriSifre" Type="String" />
                                <asp:Parameter Name="Adi" Type="String" />
                                <asp:Parameter Name="Soyadi" Type="String" />
                                <asp:Parameter Name="Telefon" Type="String" />
                                <asp:Parameter Name="Adres" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="TcKimlik" Type="String" />
                                <asp:Parameter Name="MusteriSifre" Type="String" />
                                <asp:Parameter Name="Adi" Type="String" />
                                <asp:Parameter Name="Soyadi" Type="String" />
                                <asp:Parameter Name="Telefon" Type="String" />
                                <asp:Parameter Name="Adres" Type="String" />
                                <asp:Parameter Name="MusteriId" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                        <br />
                        <asp:Label ID="Label1" runat="server" CssClass="text-success"></asp:Label>

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
