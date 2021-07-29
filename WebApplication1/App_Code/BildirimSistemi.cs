using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Configuration;

/// <summary>
/// Summary description for BildirimSistemi
/// </summary>


namespace WebApplication1.Uye
{
    public static class BildirimSistemi
    {
        private static SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["YemekSiparis"].ConnectionString);

        public static void SiparisBildirimi(int siparisId,int sepetId)
        {
            baglanti.Open();
            StringBuilder bildirim = new StringBuilder();
            bildirim.AppendLine("Bir adet sipariş bildiriminiz var. <br/>");

            SqlCommand getuser = new SqlCommand("Select * from Tbl_Siparis s Inner Join Tbl_Musteriler m on s.MusteriId=m.MusteriId Where SiparisId=@siparisid", baglanti);
            getuser.Parameters.AddWithValue("@siparisid", siparisId);
            var getuserreader = getuser.ExecuteReader();
            while (getuserreader.Read())
            {
                var tarih = (DateTime)getuserreader["SiparisTarihi"];
                string line = $"Ad : <b> {getuserreader["Adi"].ToString()} </b>  <br/> ";
                string line2 = $"Soyad : <b> {getuserreader["Soyadi"].ToString()} </b>  <br/>";
                string line3 = $"Siparis Adresi : <b> {getuserreader["SiparisAdres"].ToString()} </b> <br/>";
                string line4 = $"Siparis Notu :<b> {getuserreader["SiparisNotu"].ToString()} </b> <br/>";
                string line5 = $"Siparis Tarihi : <b>{tarih.ToString("dd/MM/yyyy hh:mm")} </b> <br/>";


                bildirim.AppendLine(line);
                bildirim.AppendLine(line2);
                bildirim.AppendLine(line3);
                bildirim.AppendLine(line4);
                bildirim.AppendLine(line5);


            }
            getuserreader.Close();

            SqlCommand command = new SqlCommand("Select (YemekFiyat * Adet) as Fiyat,* From Tbl_Siparis_Urunler siur Inner Join Tbl_Yemekler y on siur.YemekId = y.YemekId Where SiparisId=@siparisid", baglanti);
            command.Parameters.AddWithValue("@siparisid", siparisId);
            var reader = command.ExecuteReader();
            bildirim.AppendLine("Sipariş İçeriği &#x2193;  <br/>");
            while (reader.Read())
            {
                var fiyat = (decimal)reader["Fiyat"];
                string line = $"<b> {reader["Adet"].ToString()} Adet {reader["YemekAd"].ToString()} - {fiyat.ToString("C", CultureInfo.CreateSpecificCulture("tr-TR"))}</b> <br/>";
                bildirim.AppendLine(line);
            }
            reader.Close();

            decimal sepetToplam = 0;
            SqlCommand sepet2 = new SqlCommand("Select YemekFiyat*Adet as Fiyat,* from Tbl_Sepet_Urunler s INNER JOIN Tbl_Yemekler y on s.YemekId = y.YemekId Where SepetId=@id", baglanti);
            sepet2.Parameters.AddWithValue("@id", sepetId);
            var reader2 = sepet2.ExecuteReader();
            while (reader2.Read())
            {
                sepetToplam += (decimal)reader2["Fiyat"];
            }
            reader2.Close();

            bildirim.AppendLine($"Sepet Toplamı : <b> {sepetToplam.ToString("C", CultureInfo.CreateSpecificCulture("tr-TR"))} </b>");
            SqlCommand bildirimyolla = new SqlCommand("INSERT INTO Tbl_Bildirimler (BildirimText,BildirimTarih,BildirimOkundu,BildirimGonderildi) VALUES (@text,@tarih,0,@gonderildi)",baglanti);
            bildirimyolla.Parameters.AddWithValue("@text", bildirim.ToString());
            bildirimyolla.Parameters.AddWithValue("@tarih", DateTime.Now);
            bildirimyolla.Parameters.AddWithValue("@gonderildi", false);
            bildirimyolla.ExecuteNonQuery();

            baglanti.Close();

            //return bildirim.ToString();
        }

    }

}