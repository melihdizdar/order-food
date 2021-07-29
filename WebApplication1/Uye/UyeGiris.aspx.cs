using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace WebApplication1.Uye
{
    public partial class UyeGiris : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["YemekSiparis"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM Tbl_Musteriler where TcKimlik=@Tc and MusteriSifre=@Sif";
            SqlCommand komut = new SqlCommand();
            komut.CommandText = sql;
            komut.Connection = baglanti;
            komut.Parameters.AddWithValue("@Tc", TextBox1.Text);
            komut.Parameters.AddWithValue("@Sif", TextBox2.Text);
            baglanti.Open();
            SqlDataReader satir = komut.ExecuteReader();
            if (satir.Read())
            {
                Session["KullanıcıTipi"] = "Musteri";
                Session["KullaniciId"] = satir["MusteriId"].ToString();
                Session["OturumTc"] = satir["TcKimlik"].ToString();
                Session.Timeout = 120;
                Label3.Text = "Giriş işleminiz başarılı!";
                Response.Redirect("~/Uye/UyeDefault.aspx");
            }
            else
            {
                Label3.Text = "Hatalı Giriş.";
            }
        }
    }
}