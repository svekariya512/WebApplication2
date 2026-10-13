using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class users : System.Web.UI.Page
    {
        // =========================================
        // IN-MEMORY USERS DATA
        // =========================================
        private List<User> UserList
        {
            get
            {
                if (Session["UserList"] == null)
                {
                    Session["UserList"] = new List<User>
                    {
                        new User { Id = 1, FullName = "Raj Patel", Email = "raj@test.com", Status = "ACTIVE", ResetOTP = "123456", CreatedAt = DateTime.Now.AddDays(-30) },
                        new User { Id = 2, FullName = "Priya Shah", Email = "priya@test.com", Status = "ACTIVE", ResetOTP = "654321", CreatedAt = DateTime.Now.AddDays(-15) },
                        new User { Id = 3, FullName = "Amit Kumar", Email = "amit@test.com", Status = "PENDING", ResetOTP = "111111", CreatedAt = DateTime.Now.AddDays(-5) },
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

        // =========================================
        // HELPERS
        // =========================================
        public string GetInitials(string name)
        {
            if (string.IsNullOrEmpty(name)) return "??";
            string[] parts = name.Trim().Split(' ');
            if (parts.Length == 1) return parts[0].Substring(0, Math.Min(2, parts[0].Length)).ToUpper();
            return (parts[0][0].ToString() + parts[parts.Length - 1][0].ToString()).ToUpper();
        }

        // =========================================
        // LOAD USERS
        // =========================================
        private void LoadUsers()
        {
            string search = txtSearch.Text.Trim().ToLower();
            List<User> filtered = new List<User>();

            foreach (User u in UserList)
            {
                if (!string.IsNullOrEmpty(search))
                {
                    if (!u.FullName.ToLower().Contains(search) &&
                        !u.Email.ToLower().Contains(search))
                        continue;
                }

                filtered.Add(u);
            }

            rptUsers.DataSource = filtered;
            rptUsers.DataBind();
        }

        // =========================================
        // LOAD STATS
        // =========================================
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
        // SEARCH
        // =========================================
        protected void txtSearch_TextChanged(object sender, EventArgs e)
        {
            LoadUsers();
        }

        // =========================================
        // SAVE USER
        // =========================================
        protected void btnSaveUser_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string name = txtUserName.Text.Trim();
            string email = txtUserEmail.Text.Trim();
            string password = txtUserPassword.Text.Trim();
            string status = ddlUserStatus.SelectedValue;
            string otp = txtUserOtp.Text.Trim();
            string editId = hdnEditUserId.Value;

            if (string.IsNullOrEmpty(name) || name.Length < 2)
            {
                ShowAlert("Valid name required.");
                return;
            }

            if (string.IsNullOrEmpty(email) || !email.Contains("@"))
            {
                ShowAlert("Valid email required.");
                return;
            }

            if (string.IsNullOrEmpty(otp) || otp.Length != 6)
            {
                ShowAlert("OTP must be 6 digits.");
                return;
            }

            try
            {
                List<User> list = UserList;

                if (!string.IsNullOrEmpty(editId))
                {
                    // UPDATE
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
                    // INSERT
                    if (string.IsNullOrEmpty(password))
                    {
                        ShowAlert("Password required.");
                        return;
                    }

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

                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg",
                    "alert('User saved successfully.');" +
                    "document.getElementById('userModal').classList.remove('show');", true);
            }
            catch (Exception ex)
            {
                ShowAlert("Error: " + ex.Message.Replace("'", ""));
            }
        }

        // =========================================
        // EDIT / DELETE
        // =========================================
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

                ShowAlert("User deleted successfully.");
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

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "openEdit",
                        "document.getElementById('modalTitle').innerText='Edit User';" +
                        "document.getElementById('btnSaveUser').value='Save Changes';" +
                        "document.getElementById('userModal').classList.add('show');", true);
                }
            }
        }

        // =========================================
        // HELPERS
        // =========================================
        private void ShowAlert(string message)
        {
            string script = "alert('" + message.Replace("'", "\\'") + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert" + Guid.NewGuid().ToString("N"), script, true);
        }
    }

    // =========================================
    // MODEL CLASS
    // =========================================
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