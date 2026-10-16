using System;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Reset : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                SetHeaderTitle("Reset Password");
            }
        }

        private void SetHeaderTitle(string title)
        {
            if (this.Master != null)
            {
                Label lbl = this.Master.FindControl("lblPageTitle") as Label;
                if (lbl != null)
                {
                    lbl.Text = title;
                }
            }
        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            lblMsg.Visible = false;

            string current = txtCurrentPassword.Text;
            string newPass = txtNewPassword.Text;
            string confirm = txtConfirmPassword.Text;

            if (string.IsNullOrEmpty(current) ||
                string.IsNullOrEmpty(newPass) ||
                string.IsNullOrEmpty(confirm))
            {
                ShowError("Please fill all password fields.");
                return;
            }

            if (newPass.Length < 8)
            {
                ShowError("Password must contain at least 8 characters.");
                return;
            }

            if (!Regex.IsMatch(newPass, @"[A-Z]"))
            {
                ShowError("Password must contain at least one uppercase letter.");
                return;
            }

            if (!Regex.IsMatch(newPass, @"[a-z]"))
            {
                ShowError("Password must contain at least one lowercase letter.");
                return;
            }

            if (!Regex.IsMatch(newPass, @"[0-9]"))
            {
                ShowError("Password must contain at least one number.");
                return;
            }

            if (newPass != confirm)
            {
                ShowError("New password and confirm password do not match.");
                return;
            }

            if (newPass == current)
            {
                ShowError("New password must be different from the current password.");
                return;
            }

            txtCurrentPassword.Text = "";
            txtNewPassword.Text = "";
            txtConfirmPassword.Text = "";

            ShowSuccess("✓ Password reset successfully.");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Profile.aspx");
        }

        private void ShowSuccess(string msg)
        {
            lblMsg.Text = msg;
            lblMsg.CssClass = "msg-success";
            lblMsg.Visible = true;
        }

        private void ShowError(string msg)
        {
            lblMsg.Text = msg;
            lblMsg.CssClass = "msg-error";
            lblMsg.Visible = true;
        }
    }
}
