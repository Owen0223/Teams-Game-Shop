using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Channels;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace labexw2
{
    public partial class FAQ : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string[] FeaturesArray = new string[] { "User Accounts: Allow users to create accounts for a personalized experience.", "Product Listings: Display games with details, images, and prices.", "Shopping Cart: Enable users to add items, review, and proceed to checkout.", "Payment Gateway: Integrate a secure system for online transactions.", "Download Options: Provide digital downloads and shipping for physical products.", "Reviews and Ratings: Allow users to leave feedback on games.", "Responsive Design: Ensure compatibility with various devices." };
            btlFeatures.DataSource = FeaturesArray;
            btlFeatures.DataBind();
            btlFeatures.Visible = false;
            

            string[] SupportsArray = new string[] { "Contact Channels: Provide email, chat, or a ticketing system for customer inquiries.", "FAQ Section: Create a comprehensive FAQ section to address common questions.", "Returns and Refunds: Clearly communicate your policies regarding returns and refunds." };
            btlSupport.DataSource = SupportsArray;
            btlSupport.DataBind();
            btlSupport.Visible = false;

            if (rdoFeatures.Checked )
            {
                btlFeatures.Visible = true;
            }
            if (rdoSupport.Checked )
            {
                btlSupport.Visible = true;

            }
            if (rdoRefund.Checked )
            {
                lblRefund.Text = "<br/>If a purchase amount is returned to your bank, the amount will be subtracted from your account's total purchase value. If the refund or dispute amount brings your account's total purchase value below $5 USD, then your account will lose access to these features.<br/><br/>For example, if you purchase a game for $5 USD, your account will gain access to these Community features. If you open a dispute with your bank, these funds will be returned to the bank and you will lose access to these features because Steam never received the funds.<br/><br/>";
            }
            if (rdoPurchase.Checked )
            {
                lblPurchase.Text = "<br/>A purchase amount only counts towards this limit if it was processed successfully. If a purchase is pending/processing or our system is waiting to confirm payment with your bank it will not count towards this limit.";
            }
        }

        protected void btnContactUs_Click(object sender, EventArgs e)
        {
            string[] ContactUsArray = new string[] { "Teams Email Support: support@teamspowered.com", "Teams Knowledge Base: https://support.steampowered.com/kb.php", "Teams Forum: https://steamcommunity.com/discussions/", "PIC Email: i22022244@student.newinti.edu.my" };
            btlContactUs.DataSource = ContactUsArray;
            btlContactUs.DataBind();
            lblContactUs.Text = "<h2>Teams Customer Service Contacts</h2>";
            btlContactUs.Visible = true;
        }


    }
}