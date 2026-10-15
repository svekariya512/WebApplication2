using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class users : System.Web.UI.Page
    {
        private List<User> UserList
        {
            get
            {
                if (Session["UserList"] == null)
                {
                    Session["UserList"] = new List<User>
                    {
                        new User { Id = 1, FullName = "shreeya vekariya", Email = "s@test.com", Status = "ACTIVE", ResetOTP = "123456", CreatedAt = DateTime.Now.AddDays(-30) },
                        new User { Id = 2, FullName = "mitu uteriya", Email = "m@test.com", Status = "ACTIVE", ResetOTP = "654321", CreatedAt = DateTime.Now.AddDays(-15) },
                        new User { Id = 3, FullName = "jaldhara jadav", Email = "j@test.com", Status = "PENDING", ResetOTP = "111111", CreatedAt = DateTime.Now.AddDays(-5) },
                        new User { Id = 4, FullName = "Sneha Joshi", Email = "sneha@test.com", Status = "ACTIVE", ResetOTP = "222222", CreatedAt = DateTime.Now.AddDays(-10) }
                    };
                }
                return (List<User>)Session["UserList"];
            }
            set { Session["UserList"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsers();
                LoadStats();
            }
        }

        public string GetInitials(string name)
        {
            if (string.IsNullOrEmpty(name)) return "??";
            string[] parts = name.Trim().Split(' ');
            if (parts.Length == 1) return parts[0].Substring(0, Math.Min(2, parts[0].Length)).ToUpper();
            return (parts[0][0].ToString() + parts[parts.Length - 1][0].ToString()).ToUpper();
        }

        private void LoadUsers()
        {
            rptUsers.DataSource = UserList;
            rptUsers.DataBind();
        }

        private void LoadStats()
        {
            List<User> list = UserList;
            int total = list.Count;
            int active = 0;
            int pending = 0;

            foreach (User u in list)
            {
                if (u.Status == "ACTIVE") active++;
                if (u.Status == "PENDING") pending++;
            }

            lblTotalUsers.Text = total.ToString();
            lblActiveUsers.Text = active.ToString();
            lblPendingUsers.Text = pending.ToString();
        }

        // =========================================
        // SAVE USER — C# VALIDATION
        // =========================================
        protected void btnSaveUser_Click(object sender, EventArgs e)
        {
            lblNameError.Text = "";
            lblEmailError.Text = "";
            lblPasswordError.Text = "";
            lblOtpError.Text = "";

            string name = txtUserName.Text.Trim();
            string email = txtUserEmail.Text.Trim();
            string password = txtUserPassword.Text.Trim();
            string status = ddlUserStatus.SelectedValue;
            string otp = txtUserOtp.Text.Trim();
            string editId = hdnEditUserId.Value;

            bool hasError = false;

            if (string.IsNullOrEmpty(name))
            {
                lblNameError.Text = "Full name is required.";
                hasError = true;
            }
            else if (name.Length < 2)
            {
                lblNameError.Text = "Name must be at least 2 characters.";
                hasError = true;
            }
            else if (!Regex.IsMatch(name, @"^[a-zA-Z\s.\-']+$"))
            {
                lblNameError.Text = "Name can only contain letters, spaces, dots, hyphens.";
                hasError = true;
            }

            if (string.IsNullOrEmpty(email))
            {
                lblEmailError.Text = "Email is required.";
                hasError = true;
            }
            else if (!Regex.IsMatch(email, @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"))
            {
                lblEmailError.Text = "Please enter a valid email address.";
                hasError = true;
            }

            if (string.IsNullOrEmpty(editId))
            {
                if (string.IsNullOrEmpty(password))
                {
                    lblPasswordError.Text = "Password is required.";
                    hasError = true;
                }
                else if (password.Length < 6)
                {
                    lblPasswordError.Text = "Password must be at least 6 characters.";
                    hasError = true;
                }
            }

            if (string.IsNullOrEmpty(otp))
            {
                lblOtpError.Text = "OTP is required.";
                hasError = true;
            }
            else if (!Regex.IsMatch(otp, @"^\d{6}$"))
            {
                lblOtpError.Text = "OTP must be exactly 6 digits.";
                hasError = true;
            }

            if (hasError)
            {
                UserModal.CssClass = "modal-overlay show";
                return;
            }

            try
            {
                List<User> list = UserList;

                if (!string.IsNullOrEmpty(editId))
                {
                    int id = Convert.ToInt32(editId);
                    User u = list.Find(x => x.Id == id);
                    if (u != null)
                    {
                        u.FullName = name;
                        u.Email = email;
                        u.Status = status;
                        u.ResetOTP = otp;
                    }
                }
                else
                {
                    int newId = 1;
                    foreach (User u in list)
                    {
                        if (u.Id >= newId) newId = u.Id + 1;
                    }

                    list.Add(new User
                    {
                        Id = newId,
                        FullName = name,
                        Email = email,
                        Status = status,
                        ResetOTP = otp,
                        CreatedAt = DateTime.Now
                    });
                }

                UserList = list;

                txtUserName.Text = "";
                txtUserEmail.Text = "";
                txtUserPassword.Text = "";
                ddlUserStatus.SelectedValue = "ACTIVE";
                txtUserOtp.Text = "";
                hdnEditUserId.Value = "";

                LoadUsers();
                LoadStats();

                UserModal.CssClass = "modal-overlay";
            }
            catch (Exception ex)
            {
                lblNameError.Text = "Error: " + ex.Message;
                UserModal.CssClass = "modal-overlay show";
            }
        }

        protected void rptUsers_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            List<User> list = UserList;

            if (e.CommandName == "DeleteUser")
            {
                list.RemoveAll(x => x.Id == id);
                UserList = list;

                LoadUsers();
                LoadStats();
            }
            else if (e.CommandName == "EditUser")
            {
                User u = list.Find(x => x.Id == id);
                if (u != null)
                {
                    txtUserName.Text = u.FullName;
                    txtUserEmail.Text = u.Email;
                    txtUserPassword.Text = "";
                    ddlUserStatus.SelectedValue = u.Status;
                    txtUserOtp.Text = u.ResetOTP;
                    hdnEditUserId.Value = u.Id.ToString();

                    modalTitle.Text = "Edit User";
                    btnSaveUser.Text = "Save Changes";

                    lblNameError.Text = "";
                    lblEmailError.Text = "";
                    lblPasswordError.Text = "";
                    lblOtpError.Text = "";

                    UserModal.CssClass = "modal-overlay show";
                }
            }
        }

        protected void btnCloseModal_Click(object sender, EventArgs e)
        {
            UserModal.CssClass = "modal-overlay";
            hdnEditUserId.Value = "";
        }
    }

    public class User
    {
        public int Id { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Status { get; set; }
        public string ResetOTP { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}
