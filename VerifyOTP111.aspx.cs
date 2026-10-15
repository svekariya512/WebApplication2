using System;
using System.Web.UI;

namespace WebApplication2
{
    public partial class VerifyOTP111 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnVerifyOTP_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            pnlResendAlert.Visible = false;

            string enteredOTP = txtOtp.Text.Trim();

            if (enteredOTP.Length < 6)
            {
                lblMessage.Text = "⚠ Please enter complete 6-digit OTP.";
                lblMessage.ForeColor = System.Drawing.Color.OrangeRed;
                return;
            }

            Response.Redirect("ResetPassword111.aspx");
        }

        protected void btnResend_Click(object sender, EventArgs e)
        {
            lblMessage.Text = "";
            pnlResendAlert.Visible = true;
        }
    }
}