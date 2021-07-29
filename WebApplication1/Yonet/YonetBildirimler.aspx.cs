using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1.Yonet
{
    public partial class YonetBildirimler : System.Web.UI.Page
    {
        SqlConnection baglanti = new SqlConnection(WebConfigurationManager.ConnectionStrings["YemekSiparis"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            baglanti.Open();
            SqlCommand bildirimlerigetir = new SqlCommand("Select * from Tbl_Bildirimler ORDER BY Id DESC", baglanti);
            bildirimrepetear2.DataSource = bildirimlerigetir.ExecuteReader();
            bildirimrepetear2.DataBind();
            baglanti.Close();
        }

        protected void Unnamed_Command(object sender, CommandEventArgs e)
        {
            baglanti.Open();
            int id = Convert.ToInt32(e.CommandArgument);
            SqlCommand okundu = new SqlCommand("Update Tbl_Bildirimler Set BildirimOkundu=1 Where Id=@id", baglanti);
            okundu.Parameters.AddWithValue("@id", id);
            okundu.ExecuteNonQuery();
            baglanti.Close();
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Yonet/YonetBildirimEkle.aspx");
        }
    }
}