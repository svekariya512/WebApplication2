using System;
using System.Text.RegularExpressions;
using System.Web.UI;

namespace WebApplication2
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Koi initialization jaruri nathi
        }

        // =========================================
        // RESET PASSWORD — SIMPLE VALIDATION
        // =========================================
        protected void btnSendReset_Click(object sender, EventArgs e)
        {
            lblError.Visible = false;
            lblSuccess.Visible = false;

            string email = txtResetEmail.Text.Trim();
            string newPassword = txtNewPassword.Text;
            string confirmPassword = txtConfirmPassword.Text;

            // ==================== VALIDATION ====================

            // 1. Email empty check
            if (string.IsNullOrEmpty(email))
            {
                ShowError("Please enter your email address.");
                return;
            }

            // 2. Email format check
            if (!Regex.IsMatch(email, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                ShowError("Please enter a valid email address.");
                return;
            }

            // 3. Password empty check
            if (string.IsNullOrEmpty(newPassword))
            {
                ShowError("Please enter a new password.");
                return;
            }

            // 4. Password min length
            if (newPassword.Length < 6)
            {
                ShowError("Password must be at least 6 characters long.");
                return;
            }

            // 5. Confirm password empty
            if (string.IsNullOrEmpty(confirmPassword))
            {
                ShowError("Please confirm your password.");
                return;
            }

            // 6. Password match check
            if (newPassword != confirmPassword)
            {
                ShowError("Passwords do not match. Please try again.");
                return;
            }

            // ==================== SUCCESS ====================
            try
            {
                ShowSuccess("✓ Password reset successfully! You can now login with your new password.");

                // Clear form
                txtResetEmail.Text = "";
                txtNewPassword.Text = "";
                txtConfirmPassword.Text = "";
            }
            catch (Exception ex)
            {
                ShowError("Error: " + ex.Message);
            }
        }

        // =========================================
        // HELPERS
        // =========================================
        private void ShowError(string message)
        {
            lblError.Text = "✗ " + message;
            lblError.CssClass = "forgot-error show";
            lblError.Visible = true;
        }

        private void ShowSuccess(string message)
        {
            lblSuccess.Text = message;
            lblSuccess.CssClass = "forgot-message show";
            lblSuccess.Visible = true;
        }
    }
}