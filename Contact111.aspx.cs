using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Contact111 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSend_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";

            // Validation 1: Full Name
            if (string.IsNullOrWhiteSpace(txtFullName.Text))
            {
                lblMessage.Text = "⚠ Please enter your full name.";
                lblMessage.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }

            // Validation 2: Email Empty
            if (string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                lblMessage.Text = "⚠ Please enter your email address.";
                lblMessage.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }

            // Validation 3: Email Format
            if (!txtEmail.Text.Contains("@") || !txtEmail.Text.Contains("."))
            {
                lblMessage.Text = "⚠ Please enter a valid email address.";
                lblMessage.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }

            // Validation 4: Message
            if (string.IsNullOrWhiteSpace(txtMessage.Text))
            {
                lblMessage.Text = "⚠ Please enter your message.";
                lblMessage.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }

            // Validation Pass: Show Success Modal Popup
            pnlSuccessModal.Visible = true;

            // Clear Input Fields
            txtFullName.Text = "";
            txtEmail.Text = "";
            ddlSubject.SelectedIndex = 0;
            txtMessage.Text = "";
        }

        // Close Button Event inside Modal
        protected void btnCloseModal_Click(object sender, EventArgs e)
        {
            pnlSuccessModal.Visible = false;
        }

        // Back to Home Button Event inside Modal
        protected void btnBackHome_Click(object sender, EventArgs e)
        {
            Response.Redirect("Home111.aspx"); // જરૂરિયાત મુજબ હોમ પેજનું નામ બદલી શકો છો
        }
    }
}