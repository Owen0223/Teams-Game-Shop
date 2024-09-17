using labexw2;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Assignment
{
    public partial class login : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TeamsDatabaseConnString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("register.aspx");
        }

        public int cookies()
        {
            int i = 0;
            conn.Open();
            SqlCommand com = new SqlCommand("SELECT * FROM [User] WHERE Username=@Uname", conn);

            com.Parameters.AddWithValue("@Uname", txtUname.Text);
            SqlDataReader dr = com.ExecuteReader();

            if (dr.Read())
            {
                lblName.Text = dr["Name"].ToString();
            }
            conn.Close();

            HttpCookie cookie = new HttpCookie("cookie");

            cookie["name"] = lblName.Text;
            cookie["Username"] = txtUname.Text;

            
            Response.Cookies.Add(cookie);
            
            cookie.Expires = DateTime.Now.AddDays(30);

            return i;
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                cookies();
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM [User] WHERE  Username=@Uname AND Password = @pwd", conn);
                
                cmd.Parameters.AddWithValue("@Uname", txtUname.Text);
                cmd.Parameters.AddWithValue("@pwd", txtPwd.Text);
                SqlDataReader rdr = cmd.ExecuteReader();

                if (rdr.HasRows)
                {

                    while (rdr.Read())
                    {
                        
                        int userRole = Convert.ToInt16(rdr["isAdmin"].ToString());



                        switch (userRole)
                        {
                            case 0:

                                Response.Redirect("~/home.aspx?Username=" + txtUname.Text);
                                break;
                            case 1:
                                Response.Redirect("~/Adminpage.aspx?Username="+txtUname.Text);
                                break;

                        }

                    }
                }

                else
                {
                    lblMessage.Text = "Username and / or password not found.";
                }
                conn.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }


        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }
    }
}