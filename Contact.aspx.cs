using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Contact : System.Web.UI.Page
    {
        // =========================================
        // SESSION-BASED DATA
        // =========================================
        private List<ContactItem> ContactList
        {
            get
            {
                if (Session["ContactList"] == null)
                {
                    Session["ContactList"] = new List<ContactItem>
                    {
                        new ContactItem { Id = 1, FullName = "Jaldhara Jadav", Email = "j@example.com", Subject = "General Inquiry", Message = "How can we help you today?", Status = "Unread", CreatedAt = new DateTime(2026, 8, 9) },
                        new ContactItem { Id = 2, FullName = "shreeya vekariya", Email = "s@gmail.com", Subject = "Booking Issue", Message = "My tickets didn't get confirmed.", Status = "Unread", CreatedAt = new DateTime(2026, 8, 8) },
                        new ContactItem { Id = 3, FullName = "mitu uteriya", Email = "m@gmail.com", Subject = "Group Booking", Message = "Interested in booking for 20 people.", Status = "Read", CreatedAt = new DateTime(2026, 8, 7) },
                        new ContactItem { Id = 4, FullName = "sneha Patel", Email = "sneha@gmail.com", Subject = "Private Screening", Message = "Can we book a private screening?", Status = "Read", CreatedAt = new DateTime(2026, 8, 6) }
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
                // ⭐ હેડરમાં "Contact Management" સેટ કરવા માટે
                SetHeaderTitle("Contact Management");

                LoadContacts();
                LoadStats();
            }
        }

        // ⭐ હેડર ટાઈટલ સેટ કરવાની મેથડ (C# થી)
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
            List<ContactItem> list = ContactList;

            rptContacts.DataSource = list;
            rptContacts.DataBind();

            lblShowingText.Text = "Showing 1 to " + list.Count + " of " + list.Count + " entries";
        }

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
        // REPEATER — VIEW / MARKREAD / DELETE
        // =========================================
        protected void rptContacts_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            List<ContactItem> list = ContactList;
            ContactItem c = list.Find(x => x.Id == id);
            if (c == null) return;

            // ===== VIEW =====
            if (e.CommandName == "ViewContact")
            {
                if (string.IsNullOrEmpty(c.FullName))
                {
                    ShowMessage("Invalid contact.");
                    return;
                }

                txtViewName.Text = c.FullName;
                txtViewEmail.Text = c.Email;
                txtViewSubject.Text = c.Subject;
                txtViewMessage.Text = c.Message;

                ViewModal.CssClass = "modal-overlay show";
            }

            // ===== MARK AS READ =====
            else if (e.CommandName == "MarkRead")
            {
                if (c.Status == "Read")
                {
                    ShowMessage("Already marked as read.");
                    return;
                }

                c.Status = "Read";
                ContactList = list;

                LoadContacts();
                LoadStats();

                ShowMessage("Marked as read.");
            }

            // ===== DELETE =====
            else if (e.CommandName == "DeleteContact")
            {
                if (c.Id <= 0)
                {
                    ShowMessage("Invalid contact.");
                    return;
                }

                list.RemoveAll(x => x.Id == id);
                ContactList = list;

                LoadContacts();
                LoadStats();

                ShowMessage("Contact deleted successfully.");
            }
        }

        // =========================================
        // CLOSE VIEW
        // =========================================
        protected void btnCloseView_Click(object sender, EventArgs e)
        {
            ViewModal.CssClass = "modal-overlay";
        }

        // =========================================
        // HELPERS
        // =========================================
        private void ShowMessage(string message)
        {
            lblMessage.Text = message;
            lblMessage.Visible = true;
        }
    }

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
