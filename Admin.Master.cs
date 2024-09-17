using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace labexw2
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            HttpCookie cookie = Request.Cookies["cookie"];
            if (cookie != null)
            {
                //assign cookie values to the labels
                lblInfo.Text = cookie["Username"];
                btnLogin.Visible = false;
                btnLogout.Visible = true;
            }
            else
            {
                btnLogout.Visible = false;
            }
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("login.aspx");
        }


        protected void btnLogout_Click(object sender, EventArgs e)
        {

            HttpCookie cookie = Request.Cookies["cookie"];
            cookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(cookie);
            Response.Redirect("login.aspx");
        }
    }
}