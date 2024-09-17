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
    
    public partial class EditPersonal : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["TeamsDatabaseConnString"].ConnectionString);
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                tabEdit.Visible = false;
                tabVerify.Visible = false;
            }
            pageUpdate();
            
        }

        public void pageUpdate()
        {
            HttpCookie cookie = Request.Cookies["cookie"];
            if (cookie != null)
            {
                lblName.Text = cookie["name"];
            }

            conn.Open();
            SqlCommand cmd = new SqlCommand("SELECT * FROM [User] WHERE Name=@name", conn);
            cmd.Parameters.AddWithValue("name", lblName.Text);
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                lblUname.Text = dr["Username"].ToString();
                lblPwd.Text = dr["Password"].ToString();
                lblName.Text = dr["Name"].ToString();
                lblIc.Text = dr["IC"].ToString();
                lblPhone.Text = dr["Phone"].ToString();
                imgP.ImageUrl = "~/images/TeamsImage/" + dr["Image"].ToString();
                conn.Close();

                Response.Cookies.Add(cookie);
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            tabEdit.Visible=false;
            tabResult.Visible=true;
        }

        protected void btnEdit_Click(object sender, EventArgs e)
        {
            
            tabResult.Visible = false;
            tabVerify.Visible = true;

            txtUname.Text = lblUname.Text;
            txtPwd.Text = lblPwd.Text;  
            txtName.Text = lblName.Text;    
            txtIc.Text = lblIc.Text;
            txtPhone.Text = lblPhone.Text;
            

            
            txtName.Enabled = false;
            txtIc.Enabled = false;
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if(fiuProfile.HasFile)
            {            
            conn.Open();
            SqlCommand cmd = new SqlCommand("UPDATE [User] SET Username=@Uname, Password=@pwd, Phone=@phone, Image=@image WHERE Name = @name", conn);
            cmd.Parameters.AddWithValue("name", txtName.Text);
            cmd.Parameters.AddWithValue("Uname", txtUname.Text);
            cmd.Parameters.AddWithValue("pwd", txtPwd.Text);
            cmd.Parameters.AddWithValue("phone", txtPhone.Text);


                fiuProfile.PostedFile.SaveAs(Server.MapPath("~/images/TeamsImage/") + fiuProfile.FileName.ToString());
                cmd.Parameters.AddWithValue("image", fiuProfile.FileName.ToString());

                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Record updated successfully!');</script>");
                cmd.Dispose();
                conn.Close();
            }
            else
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("UPDATE [User] SET Username=@Uname, Password=@pwd, Phone=@phone WHERE Name = @name", conn);
                cmd.Parameters.AddWithValue("name", txtName.Text);
                cmd.Parameters.AddWithValue("Uname", txtUname.Text);
                cmd.Parameters.AddWithValue("pwd", txtPwd.Text);
                cmd.Parameters.AddWithValue("phone", txtPhone.Text);
                cmd.ExecuteNonQuery();
                Response.Write("<script>alert('Record updated successfully!');</script>");
                cmd.Dispose();
                conn.Close();
            }

            HttpCookie cookie = Request.Cookies["cookie"];
            cookie["name"] = lblName.Text;
            cookie["Username"] = lblUname.Text;
            tabEdit.Visible = false;
            tabResult.Visible = true;

            pageUpdate();
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void btnVerify_Click(object sender, EventArgs e)
        {
            if(txtVerify.Text == lblPwd.Text)
            {
                tabVerify.Visible = false;
                tabEdit.Visible = true;
            }
            else
            {
                lblVerify.Text = "Wrong Password, pls enter again";
            }
        }

        protected void btnVcancel_Click(object sender, EventArgs e)
        {
            tabResult.Visible = true;
            tabVerify.Visible = false;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("home.aspx");
        }
    }
}