using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

namespace labexw2
{
    public partial class Catecontrol : System.Web.UI.UserControl
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TeamsDatabaseConnString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM [Categories]", conn);
                SqlDataAdapter sda = new SqlDataAdapter();
                cmd.Connection = conn;
                sda.SelectCommand = cmd;
                using (DataTable dt = new DataTable())
                {
                    sda.Fill(dt);
                    dltCategories.DataSource = dt;
                    dltCategories.DataBind();
                }
            }
        }
    }
}