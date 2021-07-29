using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Uye
{
    public partial class UyeSifreDegistir : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["YemekSiparis"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(TextBox1.Text) || string.IsNullOrEmpty(TextBox2.Text) || string.IsNullOrEmpty(TextBox3.Text))
            {
                Label5.Visible = true;
                return;
            }
            baglanti.Open();
            var tc = Session["OturumTc"];
            SqlCommand command = new SqlCommand("SELECT * FROM Tbl_Musteriler where TcKimlik=@tc and MusteriSifre=@Sif", baglanti);
            command.Parameters.AddWithValue("@tc", tc);
            command.Parameters.AddWithValue("@Sif", TextBox1.Text);
            var reader = command.ExecuteReader();
            if (reader.Read())
            {
                if (TextBox2.Text != TextBox3.Text)
                {
                    Label2.Visible = true;
                    Label3.Visible = true;
                    return;
                }
                reader.Close();
                SqlCommand sifredegistir = new SqlCommand("Update Tbl_Musteriler Set MusteriSifre=@Sifre Where TcKimlik=@tc", baglanti);
                sifredegistir.Parameters.AddWithValue("@tc", tc);
                sifredegistir.Parameters.AddWithValue("@Sifre", TextBox2.Text);
                sifredegistir.ExecuteNonQuery();
                Session.Abandon();
                Response.Redirect("~/Uye/UyeGiris.aspx");
            }
            else
            {
                Label1.Visible = true;
                return;
            }
            baglanti.Close();
        }
    }
}