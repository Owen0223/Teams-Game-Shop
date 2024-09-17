using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;
using static System.Runtime.CompilerServices.RuntimeHelpers;

namespace labexw2
{
    public partial class Payment : System.Web.UI.Page
    {
        private decimal totalPrice = 0;
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TeamsDatabaseConnString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                this.BindGrid();
            }
        }

        protected void ddlMethod_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlMethod.SelectedIndex == 3)
            {
                lblTNG.Visible = true;
                lblTNG.Text = "You will be redirected to the merchant payment page...";
                lblTNG.ForeColor = System.Drawing.Color.Red;
                lblTNG.BackColor = System.Drawing.Color.Yellow;

                btnCheckout.CausesValidation = false;
                btnCheckout.Enabled = true;
                cbxAgree.Enabled = false;
                txtCard.Enabled = false;
                ddlExpMonth.Enabled = false;
                ddlExpYear.Enabled = false;
                txtCode.Enabled = false;
                txtFirstName.Enabled = false;
                txtLastName.Enabled = false;
                txtCity.Enabled = false;
                txtAddress.Enabled = false;
                txtPoscode.Enabled = false;
                ddlCountry.Enabled = false;
                txtPhone.Enabled = false;
                cbxAgree.Enabled = false;
            }
            else if(ddlMethod.SelectedIndex == 2)
            {
                lblTNG.Visible = false;
                ddlMethod.SelectedIndex = 2;
                txtCard.Enabled = true;
                ddlExpMonth.Enabled = true;
                ddlExpYear.Enabled = true;
                txtCode.Enabled = true;
                txtFirstName.Enabled = true;
                txtLastName.Enabled = true;
                txtCity.Enabled = true;
                txtAddress.Enabled = true;
                txtPoscode.Enabled = true;
                ddlCountry.Enabled = true;
                txtPhone.Enabled = true;
                cbxAgree.Enabled = true;
            }
            else if(ddlMethod.SelectedIndex == 1)
            {
                lblTNG.Visible = false;
                ddlMethod.SelectedIndex = 1;

                txtCard.Enabled = true;
                ddlExpMonth.Enabled = true;
                ddlExpYear.Enabled = true;
                txtCode.Enabled = true;
                txtFirstName.Enabled = true;
                txtLastName.Enabled = true;
                txtCity.Enabled = true;
                txtAddress.Enabled = true;
                txtPoscode.Enabled = true;
                ddlCountry.Enabled = true;
                txtPhone.Enabled = true;
                cbxAgree.Enabled = true;
            }
        }


        protected void ibtnCard_Click(object sender, ImageClickEventArgs e)
        {
            lblTNG.Visible = false;
            ddlMethod.SelectedIndex = 1;

            txtCard.Enabled = true;
            ddlExpMonth.Enabled = true;
            ddlExpYear.Enabled = true;
            txtCode.Enabled = true;
            txtFirstName.Enabled = true;
            txtLastName.Enabled = true;
            txtCity.Enabled = true;
            txtAddress.Enabled = true;
            txtPoscode.Enabled = true;
            ddlCountry.Enabled = true;
            txtPhone.Enabled = true;
            cbxAgree.Enabled = true;
        }

        protected void ibtnMasterCard_Click(object sender, ImageClickEventArgs e)
        {
            lblTNG.Visible = false;
            ddlMethod.SelectedIndex = 2;
            txtCard.Enabled = true;
            ddlExpMonth.Enabled = true;
            ddlExpYear.Enabled = true;
            txtCode.Enabled = true;
            txtFirstName.Enabled = true;
            txtLastName.Enabled = true;
            txtCity.Enabled = true;
            txtAddress.Enabled = true;
            txtPoscode.Enabled = true;
            ddlCountry.Enabled = true;
            txtPhone.Enabled = true;
            cbxAgree.Enabled = true;
        }

        protected void ibtnTouchnGo_Click(object sender, ImageClickEventArgs e)
        {
            ddlMethod.SelectedIndex = 3;
            lblTNG.Visible = true;
            lblTNG.Text = "You will be redirected to the merchant payment page...";
            lblTNG.ForeColor = System.Drawing.Color.Red;
            lblTNG.BackColor = System.Drawing.Color.Yellow;
            btnCheckout.CausesValidation = false;
            btnCheckout.Enabled = true;
            cbxAgree.Enabled = false;

            txtCard.Enabled = false;
            ddlExpMonth.Enabled = false;
            ddlExpYear.Enabled = false;
            txtCode.Enabled = false;
            txtFirstName.Enabled = false;
            txtLastName.Enabled = false;
            txtCity.Enabled = false;
            txtAddress.Enabled = false;
            txtPoscode.Enabled = false;
            ddlCountry.Enabled = false;
            txtPhone.Enabled = false;
            cbxAgree.Enabled = false;
        }

        protected void cbxAgree_CheckedChanged(object sender, EventArgs e)
        {
                if (cbxAgree.Checked)
                {
                    btnCheckout.Enabled = true;
                }
            else
            {
                btnCheckout.Enabled=false;
            }
        }

        private void BindGrid()
        {
            string constr = ConfigurationManager.ConnectionStrings["TeamsDatabaseConnString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(constr))
            {
                using (SqlCommand cmd = new SqlCommand("SELECT [CartList].CartListID, [CartList].Username, [Games].Name, [Games].Price FROM [CartList] INNER JOIN [Games] ON [Games].GameID = [CartList].GameID WHERE [CartList].Username = @Uname", con))
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
                                grvReceipt.DataSource = dt;
                                grvReceipt.DataBind();
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

        protected void grvReceipt_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                decimal price = Convert.ToDecimal(DataBinder.Eval(e.Row.DataItem, "Price"));

                totalPrice += price;
            }

            if (e.Row.RowType == DataControlRowType.Footer)
            {
                e.Row.Cells[0].Text = "Total:";
                e.Row.Cells[1].Text = totalPrice.ToString("c");

                lblTotalPrice.Text = "Total Amount: " + totalPrice.ToString("c");
            }
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            HttpCookie cookie = Request.Cookies["cookie"];
            if (cookie != null)
            {
                string Username = cookie["Username"];

                lblUser.Text = "Username: " + Username;
                lblMethod.Text = "Payment Method: " + ddlMethod.SelectedItem.ToString();
            }
        }

        protected void txtDone_Click(object sender, EventArgs e)
        {
            

            if (conn.State == System.Data.ConnectionState.Closed)
            {
                try
                {
                    conn.Open();
                    SqlCommand selectCommand = new SqlCommand("SELECT GameID, Username FROM [CartList] WHERE Username=@Uname", conn);

                    HttpCookie cookie = Request.Cookies["cookie"];
                    if (cookie != null)
                    {
                        string Username = cookie["Username"];
                        selectCommand.Parameters.AddWithValue("@Uname", Username);

                        List<string> gameIDs = new List<string>();

                        using (SqlDataReader dr = selectCommand.ExecuteReader())
                        {
                            if (dr.HasRows)
                            {
                                while (dr.Read())
                                {
                                    gameIDs.Add(dr["GameID"].ToString());
                                }
                            }
                        }

                        foreach (string gameID in gameIDs)
                        {
                            string insertQuery = "INSERT INTO Library(Username, GameID) VALUES(@Uname, @GID)";
                            using (SqlCommand com = new SqlCommand(insertQuery, conn))
                            {
                                com.Parameters.AddWithValue("@Uname", Username);
                                com.Parameters.AddWithValue("@GID", gameID);

                                com.ExecuteNonQuery();
                            }
                        }
                    }

                        using (SqlCommand cmd = new SqlCommand("DELETE FROM CartList WHERE Username=@Uname", conn))
                        {
                        if (cookie != null)
                        {
                            String Username = cookie["Username"];

                            cmd.Parameters.AddWithValue("Uname", Username);

                            int rows = cmd.ExecuteNonQuery();
                            SqlDataReader dr = cmd.ExecuteReader();
                            bool recordfound = dr.Read();


                            if (rows > 0)
                            {
                                conn.Close();
                                Response.Redirect("Library.aspx");
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
    }
}