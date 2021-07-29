<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="YonetDefault.aspx.cs" Inherits="WebApplication1.Yonet.YonetDefault" %>

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
                              <a class="nav-item nav-link active" href="YonetDefault.aspx">Ana Sayfa</a>
                              <a class="nav-item nav-link" href="YonetYemekler.aspx">Yemek Listesi</a>
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
                        <h5>Yönetici Profil Sayfası</h5>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="container-fluid bg-white">
            <div class="container">
                <div class="row ">
                    <div class="col-md-6 text-center bosluk1 text-primary">
                        <h6 class="bg-primary text-white">Yönetici Hesap Ekle</h6>
                        <asp:FormView ID="FormView1" runat="server" DataKeyNames="adminid" DataSourceID="SqlDataSource1" DefaultMode="Insert" HorizontalAlign="Center">
                            <EditItemTemplate>
                                adminid:
                                <asp:Label ID="adminidLabel1" runat="server" Text='<%# Eval("adminid") %>' />
                                <br />
                                admintc:
                                <asp:TextBox ID="admintcTextBox" runat="server" Text='<%# Bind("admintc") %>' />
                                <br />
                                adminsifre:
                                <asp:TextBox ID="adminsifreTextBox" runat="server" Text='<%# Bind("adminsifre") %>' />
                                <br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Güncelleştir" />
                                &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="İptal" />
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                Yönetici TC Kimlik:
                                <asp:TextBox ID="admintcTextBox" runat="server" CssClass="form-control" MaxLength="11" Text='<%# Bind("admintc") %>' TextMode="Number" />
                                <br />
                                Yönetici Parola:
                                <asp:TextBox ID="adminsifreTextBox" runat="server" CssClass="form-control" Text='<%# Bind("adminsifre") %>' TextMode="Password" />
                                <br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" CssClass="btn btn-primary" Text="Ekle" />
                                &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" CssClass="btn btn-danger" Text="İptal" />
                            </InsertItemTemplate>
                            <ItemTemplate>
                                adminid:
                                <asp:Label ID="adminidLabel" runat="server" Text='<%# Eval("adminid") %>' />
                                <br />
                                admintc:
                                <asp:Label ID="admintcLabel" runat="server" Text='<%# Bind("admintc") %>' />
                                <br />
                                adminsifre:
                                <asp:Label ID="adminsifreLabel" runat="server" Text='<%# Bind("adminsifre") %>' />
                                <br />
                                <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Düzenle" />
                                &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Sil" />
                                &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Yeni" />
                            </ItemTemplate>
                        </asp:FormView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:YemekSiparis %>" DeleteCommand="DELETE FROM [Tbl_Admin] WHERE [adminid] = @adminid" InsertCommand="INSERT INTO [Tbl_Admin] ([admintc], [adminsifre]) VALUES (@admintc, @adminsifre)" SelectCommand="SELECT * FROM [Tbl_Admin]" UpdateCommand="UPDATE [Tbl_Admin] SET [admintc] = @admintc, [adminsifre] = @adminsifre WHERE [adminid] = @adminid">
                            <DeleteParameters>
                                <asp:Parameter Name="adminid" Type="Int32" />
                            </DeleteParameters>
                            <InsertParameters>
                                <asp:Parameter Name="admintc" Type="String" />
                                <asp:Parameter Name="adminsifre" Type="String" />
                            </InsertParameters>
                            <UpdateParameters>
                                <asp:Parameter Name="admintc" Type="String" />
                                <asp:Parameter Name="adminsifre" Type="String" />
                                <asp:Parameter Name="adminid" Type="Int32" />
                            </UpdateParameters>
                        </asp:SqlDataSource>
                    </div>
                    <div class="col-md-6 text-center bosluk1 text-primary">
                        <h6 class="bg-primary text-white">Yönetici Hesap Düzenle/Sil</h6>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="adminid" DataSourceID="SqlDataSource1" HorizontalAlign="Center">
                            <Columns>
                                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                                <asp:BoundField DataField="adminid" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="adminid" />
                                <asp:BoundField DataField="admintc" HeaderText="TC Kimlik" SortExpression="admintc" />
                                <asp:BoundField DataField="adminsifre" HeaderText="Parola" SortExpression="adminsifre" />
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
