using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace labexw2
{
    public partial class Library : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TeamsDatabaseConnString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }

        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["TeamsDatabaseConnString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT Library.Username,Library.GameID,Games.GameID,Games.Name,Games.CategoryID,Games.Image,Games.Description,Categories.CategoryID,Categories.CategoryName FROM Library INNER JOIN Games ON Library.GameID = Games.GameID INNER JOIN Categories ON Games.CategoryID = Categories.CategoryID WHERE Username = @Uname", conn))
                {
                    HttpCookie cookie = Request.Cookies["cookie"];
                    if (cookie != null)
                    {
                        String Username = cookie["Username"];
                        cmd.Parameters.AddWithValue("Uname", Username);

                        using (SqlDataAdapter sda = new SqlDataAdapter())
                        {
                            cmd.Connection = con;
                            sda.SelectCommand = cmd;

                            using (DataTable dt = new DataTable())
                            {
                                sda.Fill(dt);
                                dltLibrary.DataSource = dt;
                                dltLibrary.DataBind();
                            }

                        }
                    }
                    else
                    {
                        Response.Write("<script>alert('Error!Username Not Found...');</script>");
                        Response.Redirect("home.aspx");
                    }
                }
            }
        }

        protected void btnStart_Click(object sender, EventArgs e)
        {
            Response.Write("<script>alert('Your game has started download!');</script>");
        }
    }
}