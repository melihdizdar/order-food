using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Yonet
{
    public partial class YonetYemekEkle : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["YemekSiparis"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void Unnamed_Click(object sender, EventArgs e)
        {
            if (String.IsNullOrEmpty(yemekadibox.Text) || String.IsNullOrEmpty(yemekkategoribox.Text) || String.IsNullOrEmpty(yemekfiyatbox.Text) || String.IsNullOrEmpty(yemekaciklamabox.Text))
            {
                hatalabel.Text += " Lütfen boş alan bırakmayınız.";
                return;
            }
            if (!FileUpload1.HasFile)
            {
                hatalabel.Text += " Lütfen bir resim yükleyiniz.";
                return;
            }
            string extension = Path.GetExtension(FileUpload1.FileName);
            if (extension == ".jpg" || extension == ".jpeg" || extension == ".png")
            {
                string path = Server.MapPath(@"/Resimler\");
                string imagename = Guid.NewGuid().ToString() + FileUpload1.FileName;
                string imagepath = path + imagename;
                FileUpload1.SaveAs(imagepath);
                baglanti.Open();
                SqlCommand add = new SqlCommand("INSERT INTO Tbl_Yemekler (YemekAd,YemekFiyat,YemekKategori,YemekResim,YemekAciklama) VALUES (@ad,@fiyat,@kategori,@resim,@aciklama)", baglanti);
                add.Parameters.AddWithValue("@ad", yemekadibox.Text);
                add.Parameters.AddWithValue("@fiyat", yemekfiyatbox.Text);
                add.Parameters.AddWithValue("@kategori", yemekkategoribox.Text);
                add.Parameters.AddWithValue("@resim", imagename);
                add.Parameters.AddWithValue("@aciklama", yemekaciklamabox.Text);
                add.ExecuteNonQuery();
                baglanti.Close();
                Response.Redirect("/Yonet/YonetYemekler.aspx?durum=yenieklendi");
            }
            else
            {
                hatalabel.Text += " Sadece jpg,jpeg veya png formatında yükleme yapabilirsiniz.";
            }
        }
    }
}