using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Notification : System.Web.UI.Page
    {
        // =========================================
        // IN-MEMORY DATA
        // =========================================
        private List<NotifItem> NotificationList
        {
            get
            {
                if (Session["NotificationList"] == null)
                {
                    Session["NotificationList"] = new List<NotifItem>
                    {
                        new NotifItem { Id = 1, Title = "New Ticket Booked", Message = "User Raj Patel booked 2 tickets for Inception.", Type = "ticket", IsRead = false, CreatedAt = DateTime.Now.AddHours(-1) },
                        new NotifItem { Id = 2, Title = "System Update", Message = "System will be updated tonight at 2 AM.", Type = "alert", IsRead = false, CreatedAt = DateTime.Now.AddHours(-3) },
                        new NotifItem { Id = 3, Title = "New User Registered", Message = "Priya Shah registered on CinePulse.", Type = "success", IsRead = true, CreatedAt = DateTime.Now.AddDays(-1) },
                        new NotifItem { Id = 4, Title = "Payment Received", Message = "Payment of ₹500 received.", Type = "success", IsRead = true, CreatedAt = DateTime.Now.AddDays(-2) },
                        new NotifItem { Id = 5, Title = "Ticket Cancelled", Message = "Booking CP12345 was cancelled.", Type = "alert", IsRead = false, CreatedAt = DateTime.Now.AddMinutes(-30) }
                    };
                }
                return (List<NotifItem>)Session["NotificationList"];
            }
            set { Session["NotificationList"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadNotifications();
                LoadStats();
            }
        }

        // =========================================
        // HELPERS
        // =========================================
        public string GetTypeClass(string type)
        {
            if (type == "ticket") return "ticket";
            if (type == "alert") return "alert";
            if (type == "success") return "success";
            return "info";
        }

        public string GetTypeIcon(string type)
        {
            if (type == "ticket") return "🎟";
            if (type == "alert") return "⚠";
            if (type == "success") return "✓";
            return "ℹ";
        }

        // =========================================
        // LOAD NOTIFICATIONS
        // =========================================
        private void LoadNotifications()
        {
            string search = txtNotifSearch.Text.Trim().ToLower();
            List<NotifItem> filtered = new List<NotifItem>();

            foreach (NotifItem n in NotificationList)
            {
                if (!string.IsNullOrEmpty(search))
                {
                    if (!n.Title.ToLower().Contains(search) &&
                        !n.Message.ToLower().Contains(search))
                        continue;
                }

                filtered.Add(n);
            }

            // Order by CreatedAt DESC
            filtered.Sort((a, b) => b.CreatedAt.CompareTo(a.CreatedAt));

            rptNotifications.DataSource = filtered;
            rptNotifications.DataBind();
        }

        // =========================================
        // LOAD STATS
        // =========================================
        private void LoadStats()
        {
            List<NotifItem> list = NotificationList;

            int newTickets = 0;
            int unread = 0;
            int today = 0;
            int total = list.Count;

            DateTime todayDate = DateTime.Today;

            foreach (NotifItem n in list)
            {
                if (n.Type == "ticket") newTickets++;
                if (!n.IsRead) unread++;
                if (n.CreatedAt.Date == todayDate) today++;
            }

            lblNewTickets.Text = newTickets.ToString();
            lblUnread.Text = unread.ToString();
            lblToday.Text = today.ToString();
            lblTotalNotif.Text = total.ToString();
        }

        // =========================================
        // SEARCH
        // =========================================
        protected void txtNotifSearch_TextChanged(object sender, EventArgs e)
        {
            LoadNotifications();
        }

        // =========================================
        // REPEATER — MarkRead / Delete
        // =========================================
        protected void rptNotifications_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            List<NotifItem> list = NotificationList;
            NotifItem n = list.Find(x => x.Id == id);
            if (n == null) return;

            // MARK AS READ
            if (e.CommandName == "MarkRead")
            {
                n.IsRead = true;
                NotificationList = list;

                LoadNotifications();
                LoadStats();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg",
                    "alert('Notification marked as read.');", true);
            }

            // DELETE
            else if (e.CommandName == "DeleteNotification")
            {
                list.RemoveAll(x => x.Id == id);
                NotificationList = list;

                LoadNotifications();
                LoadStats();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg",
                    "alert('Notification deleted successfully.');", true);
            }
        }
    }

    public class NotifItem
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Message { get; set; }
        public string Type { get; set; }
        public bool IsRead { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}