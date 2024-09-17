using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace labexw2
{
    public partial class Payment1 : System.Web.UI.MasterPage
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TeamsDatabaseConnString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                conn.Open();
                SqlCommand user = new SqlCommand("SELECT Image, Username FROM [User] WHERE Username=@Uname", conn);
                HttpCookie cookie = Request.Cookies["cookie"];
                if (cookie != null)
                {
                    lblInfo.Text = cookie["Username"];
                    user.Parameters.AddWithValue("@Uname", lblInfo.Text);
                    SqlDataReader dr = user.ExecuteReader();
                    bool recordfound = dr.Read();
                    if (recordfound)
                    {
                        if (dr["Image"] != DBNull.Value)
                        {
                            imgUser.ImageUrl = "~/images/TeamsImage/" + dr["Image"].ToString();
                        }
                        else
                        {
                            imgUser.ImageUrl = "~/images/TeamsImage/Userdefault.png";
                        }
                    }
                }
            }
        }
    }
}