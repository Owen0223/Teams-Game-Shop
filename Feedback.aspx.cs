using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace labexw2
{
    public partial class Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            string script = "alert('Validation passed! You will receive a reply within 3 working days.');";
            script += "window.location.href = 'FAQ.aspx';";
            ClientScript.RegisterStartupScript(this.GetType(), "alert", script, true);
        }
    }
}