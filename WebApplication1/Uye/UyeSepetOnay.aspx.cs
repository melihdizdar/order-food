using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;
using WebApplication1;
using WebApplication1.Uye;

namespace WebApplication1.Uye
{
    public partial class UyeSepetOnay : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["YemekSiparis"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            baglanti.Open();
            int sepetId = 0;
            SqlCommand commandkontrol = new SqlCommand("Select * From Tbl_Sepet Where MusteriId=@musteri", baglanti);
            commandkontrol.Parameters.AddWithValue("@musteri", Convert.ToInt32(Session["KullaniciId"]));
            var readerkontrol = commandkontrol.ExecuteReader();
            if (!readerkontrol.Read())
            {
                Response.Redirect("/Uye/UyeDefault.aspx");
                baglanti.Close();
                return;
            }
            else
            {
                sepetId = (int)readerkontrol["SepetId"];
            }
            readerkontrol.Close();

            decimal sepetToplam = 0;
            SqlCommand sepet2 = new SqlCommand("Select YemekFiyat*Adet as Fiyat,* from Tbl_Sepet_Urunler s INNER JOIN Tbl_Yemekler y on s.YemekId = y.YemekId Where SepetId=@id", baglanti);
            sepet2.Parameters.AddWithValue("@id", sepetId);
            var reader2 = sepet2.ExecuteReader();
            while (reader2.Read())
            {
                sepetToplam += (decimal)reader2["Fiyat"];
            }
            reader2.Close();
            LabelSepetFiyat.Text = $"Sepet Toplamı : {sepetToplam.ToString("C", CultureInfo.CreateSpecificCulture("tr-TR"))}";
            baglanti.Close();
        }
        protected void Onayla_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(adresbox.Text))
            {
                LabelHata.Text = "Adres boş bırakılamaz.";
                return;
            }
            baglanti.Open();



            SqlCommand yenisiparis = new SqlCommand($"INSERT Into Tbl_Siparis (SiparisTarihi,SiparisAdres,SiparisToplam,MusteriId,SiparisNotu) OUTPUT INSERTED.SiparisId VALUES (@tarih,@adres,0,@musteri,@not)", baglanti);
            yenisiparis.Parameters.AddWithValue("@tarih", DateTime.Now);
            yenisiparis.Parameters.AddWithValue("@adres", adresbox.Text);
            yenisiparis.Parameters.AddWithValue("@musteri", Convert.ToInt32(Session["KullaniciId"]));
            yenisiparis.Parameters.AddWithValue("@not", notbox.Text);

            Int32 yenisiparisId = (Int32)yenisiparis.ExecuteScalar();

            int sepetId = 0;
            SqlCommand commandkontrol = new SqlCommand("Select * From Tbl_Sepet Where MusteriId=@musteri", baglanti);
            commandkontrol.Parameters.AddWithValue("@musteri", Convert.ToInt32(Session["KullaniciId"]));
            var readerkontrol = commandkontrol.ExecuteReader();
            if (!readerkontrol.Read())
            {
                Response.Redirect("/Uye/UyeDefault.aspx");
                baglanti.Close();
                return;
            }
            else
            {
                sepetId = (int)readerkontrol["SepetId"];
            }
            readerkontrol.Close();

            SqlCommand sepet = new SqlCommand("Select YemekFiyat*Adet as Fiyat,* from Tbl_Sepet_Urunler s INNER JOIN Tbl_Yemekler y on s.YemekId = y.YemekId Where SepetId=@id", baglanti);
            sepet.Parameters.AddWithValue("@id", sepetId);
            var reader = sepet.ExecuteReader();
            List<UrunModel> urunler = new List<UrunModel>();
            while (reader.Read())
            {
                int yemekId = (int)reader["YemekId"];
                int adet = (int)reader["Adet"];
                urunler.Add(new UrunModel { Adet = adet, YemekId = yemekId });
            }
            reader.Close();
            foreach (var item in urunler)
            {
                SqlCommand siparisUrun = new SqlCommand("INSERT INTO Tbl_Siparis_Urunler (SiparisId,YemekId,Adet) VALUES (@siparis,@yemek,@adet)", baglanti);
                siparisUrun.Parameters.AddWithValue("@siparis", yenisiparisId);
                siparisUrun.Parameters.AddWithValue("@yemek", item.YemekId);
                siparisUrun.Parameters.AddWithValue("@adet", item.Adet);
                siparisUrun.ExecuteNonQuery();
            }
            decimal sepetToplam = 0;
            SqlCommand sepet2 = new SqlCommand("Select YemekFiyat*Adet as Fiyat,* from Tbl_Sepet_Urunler s INNER JOIN Tbl_Yemekler y on s.YemekId = y.YemekId Where SepetId=@id", baglanti);
            sepet2.Parameters.AddWithValue("@id", sepetId);
            var reader2 = sepet.ExecuteReader();
            while (reader2.Read())
            {
                sepetToplam += (decimal)reader2["Fiyat"];
            }
            reader2.Close();

            SqlCommand sepetGuncelle = new SqlCommand("Update Tbl_Siparis Set SiparisToplam=@toplam Where SiparisId=@siparisid", baglanti);
            sepetGuncelle.Parameters.AddWithValue("@toplam", sepetToplam);
            sepetGuncelle.Parameters.AddWithValue("@siparisid", yenisiparisId);
            sepetGuncelle.ExecuteNonQuery();
            BildirimSistemi.SiparisBildirimi(yenisiparisId, sepetId);


            SqlCommand sepetTemizle = new SqlCommand("Delete From Tbl_Sepet_Urunler Where SepetId=@sepet", baglanti);
            sepetTemizle.Parameters.AddWithValue("@sepet", sepetId);
            sepetTemizle.ExecuteNonQuery();
            baglanti.Close();
            Response.Redirect("/Uye/UyeDefault.aspx?siparis=ok");
        }
    }

    public class UrunModel
    {
        public int Adet { get; set; }
        public int YemekId { get; set; }
    }
}