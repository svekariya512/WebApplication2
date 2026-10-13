using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Tickets : System.Web.UI.Page
    {
        private string CurrentFilter
        {
            get { return ViewState["Filter"] as string ?? "all"; }
            set { ViewState["Filter"] = value; }
        }

        private List<TicketItem> TicketList
        {
            get
            {
                if (Session["TicketList"] == null)
                {
                    Session["TicketList"] = new List<TicketItem>
                    {
                        new TicketItem { Id = 1, TicketId = "CP12345678", MovieName = "Inception", Venue = "Cinepolis, Rajkot", ShowDate = DateTime.Now.AddDays(2), Seats = "E7, E8", Status = "Confirmed" },
                        new TicketItem { Id = 2, TicketId = "CP87654321", MovieName = "Interstellar", Venue = "INOX, Ahmedabad", ShowDate = DateTime.Now.AddDays(-5), Seats = "A1, A2", Status = "Past" }
                    };
                }
                return (List<TicketItem>)Session["TicketList"];
            }
            set { Session["TicketList"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTickets();
                LoadStats();
            }
        }

        private void LoadTickets()
        {
            string search = txtTicketSearch.Text.Trim().ToLower();
            List<TicketItem> filtered = new List<TicketItem>();

            foreach (TicketItem t in TicketList)
            {
                if (CurrentFilter == "upcoming" && t.Status == "Past") continue;
                if (CurrentFilter == "past" && t.Status != "Past") continue;

                if (!string.IsNullOrEmpty(search))
                {
                    if (!t.TicketId.ToLower().Contains(search) &&
                        !t.MovieName.ToLower().Contains(search))
                        continue;
                }

                filtered.Add(t);
            }

            rptTickets.DataSource = filtered;
            rptTickets.DataBind();

            lblShowingText.Text = "Showing " + filtered.Count + " tickets";
            lblEmpty.Visible = filtered.Count == 0;
        }

        private void LoadStats()
        {
            int total = TicketList.Count;
            int upcoming = 0;

            foreach (TicketItem t in TicketList)
            {
                if (t.Status != "Past") upcoming++;
            }

            lblTotalBookings.Text = total.ToString();
            lblUpcomingBookings.Text = upcoming.ToString();
        }

        protected void txtTicketSearch_TextChanged(object sender, EventArgs e)
        {
            LoadTickets();
        }

        protected void FilterTab_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            CurrentFilter = btn.CommandArgument;
            LoadTickets();
        }

        protected void rptTickets_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            List<TicketItem> list = TicketList;
            TicketItem t = list.Find(x => x.Id == id);
            if (t == null) return;

            if (e.CommandName == "DeleteTicket")
            {
                list.RemoveAll(x => x.Id == id);
                TicketList = list;
                LoadTickets();
                LoadStats();
                ShowAlert("Ticket deleted successfully.");
            }
            else if (e.CommandName == "ViewTicket" || e.CommandName == "EditTicket")
            {
                txtModalMovie.Text = t.MovieName;
                txtModalVenue.Text = t.Venue;
                txtModalTicketId.Text = t.TicketId;
                txtModalSeats.Text = t.Seats;
                ddlModalStatus.SelectedValue = t.Status;
                hdnEditTicketId.Value = t.Id.ToString();

                if (e.CommandName == "ViewTicket")
                {
                    string script = "document.getElementById('ticketModalTitle').innerText='Ticket Details';" +
                                    "document.getElementById('ticketModal').classList.add('show');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "openView", script, true);
                }
                else
                {
                    string script = "document.getElementById('ticketModalTitle').innerText='Edit Ticket';" +
                                    "document.getElementById('btnSaveTicket').value='Save Changes';" +
                                    "document.getElementById('ticketModal').classList.add('show');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "openEdit", script, true);
                }
            }
        }

        protected void btnSaveTicket_Click(object sender, EventArgs e)
        {
            string movie = txtModalMovie.Text.Trim();
            string venue = txtModalVenue.Text.Trim();
            string ticketId = txtModalTicketId.Text.Trim();
            string seats = txtModalSeats.Text.Trim();
            string status = ddlModalStatus.SelectedValue;
            string editId = hdnEditTicketId.Value;

            if (string.IsNullOrEmpty(movie) || string.IsNullOrEmpty(venue) || string.IsNullOrEmpty(ticketId))
            {
                ShowAlert("Please fill all required fields.");
                return;
            }

            List<TicketItem> list = TicketList;

            if (!string.IsNullOrEmpty(editId))
            {
                int id = Convert.ToInt32(editId);
                TicketItem t = list.Find(x => x.Id == id);
                if (t != null)
                {
                    t.MovieName = movie;
                    t.Venue = venue;
                    t.TicketId = ticketId;
                    t.Seats = seats;
                    t.Status = status;
                }
            }
            else
            {
                int newId = 1;
                foreach (TicketItem t in list)
                {
                    if (t.Id >= newId) newId = t.Id + 1;
                }
                list.Add(new TicketItem
                {
                    Id = newId,
                    TicketId = ticketId,
                    MovieName = movie,
                    Venue = venue,
                    ShowDate = DateTime.Now,
                    Seats = seats,
                    Status = status
                });
            }

            TicketList = list;
            hdnEditTicketId.Value = "";

            string script = "alert('Ticket saved successfully.');" +
                            "document.getElementById('ticketModal').classList.remove('show');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", script, true);

            LoadTickets();
            LoadStats();
        }

        private void ShowAlert(string message)
        {
            string script = "alert('" + message.Replace("'", "\\'") + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert" + Guid.NewGuid().ToString("N"), script, true);
        }
    }

    public class TicketItem
    {
        public int Id { get; set; }
        public string TicketId { get; set; }
        public string MovieName { get; set; }
        public string Venue { get; set; }
        public DateTime ShowDate { get; set; }
        public string Seats { get; set; }
        public string Status { get; set; }
    }
}