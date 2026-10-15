using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
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

        // =========================================
        // SESSION-BASED TICKETS
        // =========================================
        private List<TicketItem> TicketList
        {
            get
            {
                if (Session["TicketList"] == null)
                {
                    Session["TicketList"] = new List<TicketItem>
                    {
                        new TicketItem { Id = 1, TicketId = "CP94821039", MovieName = "Spider-Man: Brand New Day", Venue = "CINEPOLIS, Rajkot", ShowDate = new DateTime(2026, 8, 14, 18, 0, 0), Seats = "E7, E8", Status = "Confirmed" },
                        new TicketItem { Id = 2, TicketId = "CP94821040", MovieName = "Jhamkudi", Venue = "Cinepolis: Alpha One, Ahmedabad", ShowDate = new DateTime(2026, 8, 14, 18, 0, 0), Seats = "E7, E8", Status = "Confirmed" },
                        new TicketItem { Id = 3, TicketId = "CP202013945", MovieName = "Cocktail 2", Venue = "Cosmoplex, Rajkot", ShowDate = new DateTime(2023, 8, 12, 7, 30, 0), Seats = "A1", Status = "Past" }
                    };
                }
                return (List<TicketItem>)Session["TicketList"];
            }
            set { Session["TicketList"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            RegisterHeaderTitle();

            if (!IsPostBack)
            {
                LoadTickets();
                LoadStats();
            }
        }

        // =========================================
        // HEADER TITLE — C# thi Register
        // =========================================
        private void RegisterHeaderTitle()
        {
            string script = @"
                (function() {
                    var header = document.querySelector('.cine-header');
                    var searchArea = document.querySelector('.header-search-area');
                    
                    if (header && searchArea && !document.getElementById('ticketsHeaderTitle')) {
                        var titleEl = document.createElement('div');
                        titleEl.id = 'ticketsHeaderTitle';
                        titleEl.innerText = 'My Tickets';
                        titleEl.style.color = '#FFC3B9';
                        titleEl.style.fontSize = '22px';
                        titleEl.style.fontWeight = '500';
                        titleEl.style.marginLeft = '10px';
                        titleEl.style.marginRight = '10px';
                        titleEl.style.whiteSpace = 'nowrap';
                        titleEl.style.flexShrink = '0';
                        header.insertBefore(titleEl, searchArea);
                    }

                    var hamburger = document.getElementById('mainHamburger');
                    if (hamburger) { hamburger.style.display = 'flex'; }
                })();
            ";

            ScriptManager.RegisterStartupScript(this, this.GetType(), "headerTitle", script, true);
        }

        // =========================================
        // LOAD TICKETS
        // =========================================
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

        // =========================================
        // LOAD STATS
        // =========================================
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

        // =========================================
        // SEARCH
        // =========================================
        protected void txtTicketSearch_TextChanged(object sender, EventArgs e)
        {
            string search = txtTicketSearch.Text.Trim();

            if (!string.IsNullOrEmpty(search))
            {
                if (search.Length < 2)
                {
                    ShowAlert("Search term must be at least 2 characters.");
                    return;
                }

                if (search.Length > 50)
                {
                    ShowAlert("Search term cannot exceed 50 characters.");
                    return;
                }

                if (!Regex.IsMatch(search, @"^[a-zA-Z0-9\s\-]+$"))
                {
                    ShowAlert("Search contains invalid characters.");
                    txtTicketSearch.Text = "";
                    return;
                }
            }

            LoadTickets();
        }

        // =========================================
        // FILTER TABS
        // =========================================
        protected void FilterTab_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            CurrentFilter = btn.CommandArgument;
            LoadTickets();
        }

        // =========================================
        // ADD TICKET BUTTON
        // =========================================
        protected void btnAddTicket_Click(object sender, EventArgs e)
        {
            hdnEditTicketId.Value = "";
            ticketModalTitle.Text = "Add Ticket";
            btnSaveTicket.Text = "Save Ticket";

            txtModalMovie.Text = "";
            txtModalVenue.Text = "";
            txtModalTicketId.Text = "CP" + new Random().Next(10000000, 99999999);
            txtModalSeats.Text = "";
            ddlModalStatus.SelectedValue = "Confirmed";

            lblMovieError.Text = "";
            lblVenueError.Text = "";
            lblTicketIdError.Text = "";
            lblSeatsError.Text = "";

            TicketModal.CssClass = "ticket-modal-overlay show";
        }

        // =========================================
        // SAVE TICKET — C# VALIDATION
        // =========================================
        protected void btnSaveTicket_Click(object sender, EventArgs e)
        {
            lblMovieError.Text = "";
            lblVenueError.Text = "";
            lblTicketIdError.Text = "";
            lblSeatsError.Text = "";

            string movie = txtModalMovie.Text.Trim();
            string venue = txtModalVenue.Text.Trim();
            string ticketId = txtModalTicketId.Text.Trim();
            string seats = txtModalSeats.Text.Trim();
            string status = ddlModalStatus.SelectedValue;
            string editId = hdnEditTicketId.Value;

            bool hasError = false;

            // MOVIE
            if (string.IsNullOrEmpty(movie))
            {
                lblMovieError.Text = "Movie name is required.";
                hasError = true;
            }
            else if (movie.Length < 2)
            {
                lblMovieError.Text = "Movie name must be at least 2 characters.";
                hasError = true;
            }

            // VENUE
            if (string.IsNullOrEmpty(venue))
            {
                lblVenueError.Text = "Venue is required.";
                hasError = true;
            }
            else if (venue.Length < 3)
            {
                lblVenueError.Text = "Venue must be at least 3 characters.";
                hasError = true;
            }

            // TICKET ID
            if (string.IsNullOrEmpty(ticketId))
            {
                lblTicketIdError.Text = "Ticket ID is required.";
                hasError = true;
            }
            else if (!Regex.IsMatch(ticketId, @"^CP\d{8,12}$"))
            {
                lblTicketIdError.Text = "Ticket ID must be: CP + 8-12 digits";
                hasError = true;
            }

            // SEATS
            if (string.IsNullOrEmpty(seats))
            {
                lblSeatsError.Text = "Seats are required.";
                hasError = true;
            }
            else if (!Regex.IsMatch(seats, @"^[A-Z]\d{1,2}(,\s*[A-Z]\d{1,2})*$"))
            {
                lblSeatsError.Text = "Seats format: e.g. E7, E8";
                hasError = true;
            }

            if (hasError)
            {
                TicketModal.CssClass = "ticket-modal-overlay show";
                return;
            }

            // SAVE
            try
            {
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

                LoadTickets();
                LoadStats();

                TicketModal.CssClass = "ticket-modal-overlay";
            }
            catch (Exception ex)
            {
                lblMovieError.Text = "Error: " + ex.Message;
                TicketModal.CssClass = "ticket-modal-overlay show";
            }
        }

        // =========================================
        // REPEATER — VIEW / EDIT / DELETE
        // =========================================
        protected void rptTickets_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            List<TicketItem> list = TicketList;
            TicketItem t = list.Find(x => x.Id == id);
            if (t == null) return;

            // ⭐ VIEW — Modal ma table view
            if (e.CommandName == "ViewTicket")
            {
                viewModalTitle.Text = "Ticket Details";
                lblViewTicketId.Text = t.TicketId;
                lblViewMovieName.Text = t.MovieName;
                lblViewVenue.Text = t.Venue;
                lblViewShowDate.Text = t.ShowDate.ToString("dd MMM yyyy, hh:mm tt");
                lblViewSeats.Text = t.Seats;
                lblViewStatus.Text = t.Status;

                ViewModal.CssClass = "view-modal-overlay show";
            }
            // EDIT
            else if (e.CommandName == "EditTicket")
            {
                txtModalMovie.Text = t.MovieName;
                txtModalVenue.Text = t.Venue;
                txtModalTicketId.Text = t.TicketId;
                txtModalSeats.Text = t.Seats;
                ddlModalStatus.SelectedValue = t.Status;
                hdnEditTicketId.Value = t.Id.ToString();

                ticketModalTitle.Text = "Edit Ticket";
                btnSaveTicket.Text = "Save Changes";

                lblMovieError.Text = "";
                lblVenueError.Text = "";
                lblTicketIdError.Text = "";
                lblSeatsError.Text = "";

                TicketModal.CssClass = "ticket-modal-overlay show";
            }
            // DELETE
            else if (e.CommandName == "DeleteTicket")
            {
                list.RemoveAll(x => x.Id == id);
                TicketList = list;

                LoadTickets();
                LoadStats();
            }
        }

        // =========================================
        // CANCEL
        // =========================================
        protected void btnCancelTicket_Click(object sender, EventArgs e)
        {
            TicketModal.CssClass = "ticket-modal-overlay";
            hdnEditTicketId.Value = "";
        }

        // =========================================
        // CLOSE VIEW MODAL
        // =========================================
        protected void btnCloseView_Click(object sender, EventArgs e)
        {
            ViewModal.CssClass = "view-modal-overlay";
        }

        // =========================================
        // HELPERS — ShowAlert
        // =========================================
        private void ShowAlert(string message)
        {
            string script = "alert('" + message.Replace("'", "\\'") + "');";
            ScriptManager.RegisterStartupScript(this, this.GetType(),
                "alert" + Guid.NewGuid().ToString("N"), script, true);
        }
    }

    // =========================================
    // ⭐ MODEL CLASS — TicketItem
    // =========================================
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
