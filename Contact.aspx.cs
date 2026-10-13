using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Contact : System.Web.UI.Page
    {
        private int CurrentViewContactId
        {
            get { return Convert.ToInt32(ViewState["ViewContactId"] ?? 0); }
            set { ViewState["ViewContactId"] = value; }
        }

        // =========================================
        // IN-MEMORY DATA (Fakt 1 Contact)
        // =========================================
        private List<ContactItem> ContactList
        {
            get
            {
                if (Session["ContactList"] == null)
                {
                    Session["ContactList"] = new List<ContactItem>
                    {
                        new ContactItem
                        {
                            Id = 1,
                            FullName = "Jaldhara Jadhav",
                            Email = "jaldhara@example.com",
                            Subject = "General Inquiry",
                            Message = "How can we help you today?",
                            Status = "Unread",
                            CreatedAt = new DateTime(2026, 8, 9)
                        }
                    };
                }
                return (List<ContactItem>)Session["ContactList"];
            }
            set { Session["ContactList"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadContacts();
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
        // LOAD CONTACTS
        // =========================================
        private void LoadContacts()
        {
            rptContacts.DataSource = ContactList;
            rptContacts.DataBind();
        }

        // =========================================
        // LOAD STATS
        // =========================================
        private void LoadStats()
        {
            List<ContactItem> list = ContactList;
            int unread = 0;
            foreach (ContactItem c in list)
            {
                if (c.Status == "Unread") unread++;
            }
            lblTotalInquiries.Text = list.Count.ToString();
            lblUnreadCount.Text = unread.ToString();
        }

        // =========================================
        // REPEATER — 👁 View / ✓ MarkRead / ✗ Delete
        // =========================================
        protected void rptContacts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            List<ContactItem> list = ContactList;
            ContactItem c = list.Find(x => x.Id == id);
            if (c == null) return;

            // ===== 👁 VIEW =====
            if (e.CommandName == "ViewContact")
            {
                CurrentViewContactId = id;

                lblViewName.Text = c.FullName;
                lblViewEmail.Text = c.Email;
                lblViewSubject.Text = c.Subject;
                lblViewMessage.Text = c.Message;
                lblViewStatus.Text = c.Status;
                lblViewDate.Text = c.CreatedAt.ToString("dd MMM yyyy");

                ScriptManager.RegisterStartupScript(this, this.GetType(), "openView",
                    "document.getElementById('viewModal').classList.add('show');", true);
            }

            // ===== ✓ RIGHT (Mark as Read) =====
            else if (e.CommandName == "MarkRead")
            {
                c.Status = "Read";
                ContactList = list;

                LoadContacts();
                LoadStats();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg",
                    "alert('Marked as read.');", true);
            }

            // ===== ✗ WRONG (Delete) =====
            else if (e.CommandName == "DeleteContact")
            {
                list.RemoveAll(x => x.Id == id);
                ContactList = list;

                LoadContacts();
                LoadStats();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg",
                    "alert('Message deleted successfully.');", true);
            }
        }

        // =========================================
        // ⭐ SAVE CONTACT (Edit) — AA METHOD JARURI CHHE
        // =========================================
        protected void btnSaveContact_Click(object sender, EventArgs e)
        {
            int id = CurrentViewContactId;
            if (id <= 0)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg",
                    "alert('No contact selected.');", true);
                return;
            }

            string name = txtEditName.Text.Trim();
            string email = txtEditEmail.Text.Trim();
            string subject = txtEditSubject.Text.Trim();
            string message = txtEditMessage.Text.Trim();
            string status = ddlEditStatus.SelectedValue;

            // ===== VALIDATION =====
            if (string.IsNullOrEmpty(name) || name.Length < 2)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg",
                    "alert('Valid name required.');", true);
                return;
            }

            if (string.IsNullOrEmpty(email) || !Regex.IsMatch(email, @"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg",
                    "alert('Valid email required.');", true);
                return;
            }

            if (string.IsNullOrEmpty(subject))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg",
                    "alert('Subject required.');", true);
                return;
            }

            if (string.IsNullOrEmpty(message))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg",
                    "alert('Message required.');", true);
                return;
            }

            // ===== UPDATE =====
            try
            {
                List<ContactItem> list = ContactList;
                ContactItem c = list.Find(x => x.Id == id);
                if (c != null)
                {
                    c.FullName = name;
                    c.Email = email;
                    c.Subject = subject;
                    c.Message = message;
                    c.Status = status;
                }

                ContactList = list;
                hdnEditContactId.Value = "";

                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg",
                    "alert('Contact updated successfully.');" +
                    "document.getElementById('editModal').classList.remove('show');", true);

                LoadContacts();
                LoadStats();
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg",
                    "alert('Error: " + ex.Message.Replace("'", "") + "');", true);
            }
        }
    }

    // =========================================
    // MODEL CLASS
    // =========================================
    public class ContactItem
    {
        public int Id { get; set; }
        public string FullName { get; set; }
        public string Email { get; set; }
        public string Subject { get; set; }
        public string Message { get; set; }
        public string Status { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}