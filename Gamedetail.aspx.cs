using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace labexw2
{
    public partial class Gamedetail : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TeamsDatabaseConnString"].ConnectionString);

        protected void Page_Load(object sender, EventArgs e)
        {
            string IDGa = Request.QueryString["IDGa"];
            if (!IsPostBack)
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM [Games] WHERE GameID = '" + IDGa + "'", conn);
                SqlDataAdapter sda = new SqlDataAdapter();
                {
                    cmd.Connection = conn;
                    sda.SelectCommand = cmd;
                    using (DataTable dt = new DataTable())
                    {
                        if (IDGa != null)
                        {
                            sda.Fill(dt);
                            dltGame.DataSource = dt;
                            dltGame.DataBind();
                        }
                    }
                }
            }
        }

        protected void btnBuy_Click(object sender, EventArgs e)
        {
            try
            {
                if (conn.State == System.Data.ConnectionState.Closed)
                {
                    conn.Open();
                    string GaID = Request.QueryString["IDGa"];

                    SqlCommand checkCart = new SqlCommand("SELECT COUNT(*) FROM [CartList] WHERE Username = @Uname AND GameID = @GaID", conn);
                    HttpCookie cookie = Request.Cookies["cookie"];

                    if (cookie != null)
                    {
                        string Username = cookie["Username"];
                        checkCart.Parameters.AddWithValue("@Uname", Username);
                        checkCart.Parameters.AddWithValue("@GaID", GaID);

                        int gameCount = (int)checkCart.ExecuteScalar();

                        if (gameCount > 0)
                        {
                            lblStatus.Text = "The game is already in the cart.";
                            return;
                        }
                    }
                    else
                    {
                        lblStatus.Text = "Username not found! Please login as a user to proceed!";
                        return;
                    }

                    SqlCommand checkLibrary = new SqlCommand("SELECT COUNT(*) FROM [Library] WHERE Username = @Uname AND GameID = @GaID", conn);

                    if (cookie != null)
                    {
                        string Username = cookie["Username"];
                        checkLibrary.Parameters.AddWithValue("@Uname", Username);
                        checkLibrary.Parameters.AddWithValue("@GaID", GaID);

                        int gameCount = (int)checkLibrary.ExecuteScalar();

                        if (gameCount > 0)
                        {
                            lblStatus.Text = "The game is already in the library.";
                            return;
                        }
                    }
                    else
                    {
                        lblStatus.Text = "Username not found! Please login as a user to proceed!";
                        return;
                    }

                    SqlCommand selectCommand = new SqlCommand("SELECT GameID FROM [Games] WHERE GameID = @GaID", conn);
                    selectCommand.Parameters.AddWithValue("@GaID", GaID);
                    object gameID = selectCommand.ExecuteScalar();
                    bool recordfound = (gameID != null);

                    if (recordfound)
                    {
                        if (cookie != null)
                        {
                            string Username = cookie["Username"];   
                            string insertQuery = "INSERT INTO CartList(Username, GameID) Values(@Uname, @GID)";
                            SqlCommand com = new SqlCommand(insertQuery, conn);

                            com.Parameters.AddWithValue("@Uname", Username);
                            com.Parameters.AddWithValue("@GID", gameID);

                            com.ExecuteNonQuery();
                            Response.Redirect("TeamsCart.aspx");
                            conn.Close();
                        }
                        else
                        {
                            lblStatus.Text = "Username not found! Please Login as User to proceed!";
                        }
                    }
                    else
                    {
                        lblStatus.Text = "Error! Result not found!";
                    }
                }
            }
            catch (Exception ex)
            {
                lblStatus.Text = "Error:" + ex.ToString();
                lblStatus.ForeColor = System.Drawing.Color.Red;
            }
        }
    }
}