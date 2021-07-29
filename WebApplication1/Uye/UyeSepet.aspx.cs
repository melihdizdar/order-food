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
    public partial class UyeSepet : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["YemekSiparis"].ConnectionString); //bağlantı cümlesi
        protected void Page_Load(object sender, EventArgs e)
        {
            int kId = Convert.ToInt32(Session["KullaniciId"]); //sqldeki KullanıcıId'sini integer'a çevirdik
            baglanti.Open(); //bağlantı açılır
            int sepetId = 0; //integer sepetid'yi 0 dan başlatıyoruz
            SqlCommand commandkontrol = new SqlCommand("Select * From Tbl_Sepet Where MusteriId=@musteri", baglanti); //Tbl_Sepet'teki musterid'yi alan bir sql komut oluşturuyoruz.
            commandkontrol.Parameters.AddWithValue("@musteri", Convert.ToInt32(Session["KullaniciId"])); //@musteri'ile KullanıcıId'yi kontrol ediyoruz.
            var readerkontrol = commandkontrol.ExecuteReader(); // commdandkontrol'ün execute edildiği bir readerkontrol oluşturuyoruz.
            if (!readerkontrol.Read()) //Eğer uyuşmazsa
            {
                Response.Redirect("/Uye/UyeDefault.aspx"); //ÜyeDeafult'u aç
                baglanti.Close();
                return;
            }
            else
            {
                sepetId = (int)readerkontrol["SepetId"]; //readerkontrolü sepetId ile eşle
            }
            readerkontrol.Close();

            SqlCommand sepet = new SqlCommand("Select YemekFiyat*Adet as Fiyat,* from Tbl_Sepet_Urunler s INNER JOIN Tbl_Yemekler y on s.YemekId = y.YemekId Where SepetId=@id", baglanti);
            sepet.Parameters.AddWithValue("@id", sepetId); // Fiyat hesaplaması yapıldı ve Tbl_Sepet ile Tbl_Sepet_Urunler'i birleştirdik.
            var reader = sepet.ExecuteReader(); //executeledik

            myRepeater.DataSource = reader; //güncellenen veriyi repeater'a ekledik
            myRepeater.DataBind();
            reader.Close();
            decimal sepetToplam = 0; // Sepet toplamını sıfırdan başladık.
            SqlCommand sepet2 = new SqlCommand("Select YemekFiyat*Adet as Fiyat,* from Tbl_Sepet_Urunler s INNER JOIN Tbl_Yemekler y on s.YemekId = y.YemekId Where SepetId=@id", baglanti);
            sepet2.Parameters.AddWithValue("@id", sepetId); // Fiyat hesaplaması yapıldı ve Tbl_Sepet ile Tbl_Sepet_Urunler'i birleştirdik.
            var reader2 = sepet.ExecuteReader(); //reader2 için sepeti executeledik
            while (reader2.Read())//eğer reader2 okunursa aşağıyı yap
            {
                sepetToplam += (decimal)reader2["Fiyat"]; //reader2 ile Fiyat'ı alıp decimale çevir ve sepetToplam'ı ona göre değiştir.
            }
            reader2.Close();
            Label2.Text = $"Sepet Toplamı : {sepetToplam.ToString("C", CultureInfo.CreateSpecificCulture("tr-TR"))}"; // Label2ye sepet toplamı yazdır.
            baglanti.Close(); //bağlantıyı kapat
        }
        protected void LinkButton1_Click(object sender, CommandEventArgs e)
        {
			//Sepetteki ürünü silme kodu
            baglanti.Open(); //bağlantıyı aç
            int id = Convert.ToInt32(e.CommandArgument); //CommandArgument,html kodundaki repeaterin içinde id'nin bulunduğu yerde.
            SqlCommand sil = new SqlCommand("Delete from Tbl_Sepet_Urunler Where Id=@id", baglanti); //Tbl_Sepet_Urunler'deki id'yi sil.
            sil.Parameters.AddWithValue("@id", id);
            sil.ExecuteNonQuery();
            baglanti.Close();
            Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);

        }
        protected void LinkButton2_Click(object sender, CommandEventArgs e)
        {
			//Adet Düşürme
            baglanti.Open();
            int id = Convert.ToInt32(e.CommandArgument); //CommandArgument,html kodundaki repeaterin içinde id'nin bulunduğu yerde.
            SqlCommand kontrol = new SqlCommand("Select * from Tbl_Sepet_Urunler Where Id=@id", baglanti); //Tbl_Sepet_Urunler'deki id için sqlkomut oluşturduk
            kontrol.Parameters.AddWithValue("@id", id); //kontrol için parametre oluşturuyoruz
            var reader = kontrol.ExecuteReader(); //parametreyi execute ediyoruz.
            if (reader.Read()) //eğer okursa
            {
                int adet = (int)reader["Adet"]; //Adet'i integera çevirdik
                if (adet == 1) 
                {
                    reader.Close(); //eğer adet=1 den başlarsa reader'i kapat
                }
                else
                {
                    reader.Close();
                    SqlCommand dusur = new SqlCommand("Update Tbl_Sepet_Urunler Set Adet=Adet-1 Where Id=@id", baglanti); //adet'i düşür
                    dusur.Parameters.AddWithValue("@id", id);
                    dusur.ExecuteNonQuery();
                }
            }
            baglanti.Close();
            Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);

        }
        protected void LinkButton3_Click(object sender, CommandEventArgs e)
        {
			//Adet Yükselt
            baglanti.Open();
            int id = Convert.ToInt32(e.CommandArgument);
            SqlCommand yukselt = new SqlCommand("Update Tbl_Sepet_Urunler Set Adet=Adet+1 Where Id=@id", baglanti);
            yukselt.Parameters.AddWithValue("@id", id);
            yukselt.ExecuteNonQuery();
            baglanti.Close();
            Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);

        }
        protected void sepetonay_Click(object sender, EventArgs e)
        {
        }
    }
}