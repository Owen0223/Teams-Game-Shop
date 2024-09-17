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
    public partial class WebForm6 : System.Web.UI.Page
    {
        private decimal totalPrice = 0;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TeamsDatabaseConnString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
                if (!this.IsPostBack)
                {
                    HttpCookie cookie = Request.Cookies["cookie"];
                    if(cookie != null)
                {
                    String Username = cookie["Username"];

                    SqlDSDel.SelectCommand = "SELECT CartList.[GameID], Games.[Name] FROM [CartList] CartList INNER JOIN [Games] Games ON CartList.[GameID] = Games.[GameID] WHERE CartList.[Username] = @Uname";
                    SqlDSDel.SelectParameters.Clear();
                    SqlDSDel.SelectParameters.Add("Uname", Username);
                }
                    this.BindGrid();
                    lblRemind.Visible = false;
                    btnYes.Visible = false;
                    btnNo.Visible = false;
                }
        }

        private void BindGrid()
        {
            using (SqlCommand cmd = new SqlCommand("SELECT CartListID, [CartList].GameID, Image, Name, Price FROM [CartList] INNER JOIN [Games] ON [CartList].GameID = [Games].GameID WHERE Username = @Uname", conn))
            {
                HttpCookie cookie = Request.Cookies["cookie"];
                if (cookie != null)
                {
                    String Username = cookie["Username"];
                    cmd.Parameters.AddWithValue("Uname", Username);
                    using (SqlDataAdapter sda = new SqlDataAdapter())
                    {
                        cmd.Connection = conn;
                        sda.SelectCommand = cmd;
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            grvItem.DataSource = dt;
                            grvItem.DataBind();
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

        protected void grvItem_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                decimal price = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Price"));
                totalPrice += price;
            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[1].Text = "Total:";
                e.Row.Cells[2].Text = totalPrice.ToString("c");

                lblTotalPrice.Text = "Total Amount: " + totalPrice.ToString("c");
            }
        }

        protected void btnDel_Click(object sender, EventArgs e)
        {
            if (conn.State == System.Data.ConnectionState.Closed)
            {
                try
                {
                    conn.Open();
                        using (SqlCommand cmd = new SqlCommand("DELETE FROM CartList WHERE GameID=@ID AND Username=@Uname", conn))
                        {
                            string gameID = ddlDel.SelectedItem.Value;
                            string Name = ddlDel.SelectedItem.Text;
                            HttpCookie cookie = Request.Cookies["cookie"];
                        if (cookie != null)
                        {
                            String Username = cookie["Username"];

                            cmd.Parameters.AddWithValue("ID", gameID);
                            cmd.Parameters.AddWithValue("Uname", Username);

                            int rows = cmd.ExecuteNonQuery();
                            SqlDataReader dr = cmd.ExecuteReader();
                            bool recordfound = dr.Read();


                            if (rows > 0)
                            {
                                Response.Write("<script>alert('Record Deleted Successfully...');</script>");
                                conn.Close();
                                ddlDel.DataBind();
                                BindGrid();
                            }

                            else
                            {
                                Response.Write("<script>alert('Record Not Found...');</script>");
                            }
                        }
                        else
                        {
                            Response.Write("<script>alert('Error!Username Not Found...');</script>");
                        }
                        }
                }

                catch (SqlException ex)
                {
                    lblStatus.Text = "Error found: " + ex.Message;
                    lblStatus.ForeColor = System.Drawing.Color.Red;
                }
            }
        }

        protected void btnPay_Click(object sender, EventArgs e)
        {
            lblRemind.Text = "No changes can be made once proceed to payment, do you wish to continue?";
            lblRemind.Visible = true;
            btnYes.Visible = true;
            btnNo.Visible = true;
        }
    }
}