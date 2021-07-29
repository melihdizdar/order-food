using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Uye
{
    public partial class UyeUrunler : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["YemekSiparis"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    

  

        protected void LinkButton1_Command(object sender, CommandEventArgs e)
        {
            baglanti.Open();
            SqlCommand sepetcmd = new SqlCommand("Select * From Tbl_Sepet Where MusteriId=@musteriId",baglanti);
            string kullaniciId = Session["KullaniciId"].ToString();
            sepetcmd.Parameters.AddWithValue("@musteriId",kullaniciId);
            SqlDataReader sepetreader = sepetcmd.ExecuteReader();
            int sepetid = 0;
            while (sepetreader.Read())
            {
                sepetid = int.Parse(sepetreader["SepetId"].ToString());
            }
            sepetreader.Close();
            int yemekid = Convert.ToInt32(e.CommandArgument);
            SqlCommand ekle = new SqlCommand("INSERT INTO Tbl_Sepet_Urunler(SepetId,YemekId,Adet)  VALUES (@SepetId,@YemekId,@Adet)", baglanti);
            ekle.Parameters.AddWithValue("@SepetId", sepetid);
            ekle.Parameters.AddWithValue("@YemekId", yemekid);
            ekle.Parameters.AddWithValue("@Adet", 1);
            ekle.ExecuteNonQuery();
            baglanti.Close();
        }
    }
}