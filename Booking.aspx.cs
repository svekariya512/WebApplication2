using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Booking : System.Web.UI.Page
    {
        private string CurrentFilter
        {
            get { return ViewState["Filter"] as string ?? "ALL"; }
            set { ViewState["Filter"] = value; }
        }

        private int CurrentPage
        {
            get { return Convert.ToInt32(ViewState["Page"] ?? 1); }
            set { ViewState["Page"] = value; }
        }

        private const int PageSize = 5;

        // =========================================
        // SESSION-BASED DATA
        // =========================================
        private List<BookingItem> BookingList
        {
            get
            {
                if (Session["BookingList"] == null)
                {
                    Session["BookingList"] = new List<BookingItem>
                    {
                        new BookingItem { Id = 1, BookingId = "CP90481239", MovieName = "Jhamkudi", CustomerName = "Rahul Sharma", Theater = "Cinépolis Alpha One", ShowDate = new DateTime(2024, 8, 14, 18, 0, 0), Seats = "E7, E8", Amount = 700, Status = "SUCCESS" },
                        new BookingItem { Id = 2, BookingId = "CP90481240", MovieName = "Deadpool & Wolverine", CustomerName = "Priya Patel", Theater = "PVR Acropolis", ShowDate = new DateTime(2024, 8, 14, 21, 30, 0), Seats = "P1, P2", Amount = 800, Status = "PENDING" },
                        new BookingItem { Id = 3, BookingId = "CP90481241", MovieName = "Stree 2", CustomerName = "Amit Singh", Theater = "INOX: City Gold", ShowDate = new DateTime(2024, 8, 15, 12, 15, 0), Seats = "G4, G5, G6", Amount = 1050, Status = "PENDING" },
                        new BookingItem { Id = 4, BookingId = "CP90481243", MovieName = "Kalki 2898 AD", CustomerName = "Vikas Reddy", Theater = "PVR Acropolis", ShowDate = new DateTime(2024, 8, 15, 20, 0, 0), Seats = "A1, A2", Amount = 800, Status = "PENDING" },
                        new BookingItem { Id = 5, BookingId = "CP90481244", MovieName = "Munjya", CustomerName = "Karan Johar", Theater = "INOX: City Gold", ShowDate = new DateTime(2024, 8, 16, 11, 0, 0), Seats = "F10", Amount = 350, Status = "SUCCESS" }
                    };
                }
                return (List<BookingItem>)Session["BookingList"];
            }
            set { Session["BookingList"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadBookings();
                LoadStats();
            }
        }

        // =========================================
        // LOAD BOOKINGS
        // =========================================
        private void LoadBookings()
        {
            string search = txtBookingSearch.Text.Trim().ToLower();
            List<BookingItem> filtered = new List<BookingItem>();

            foreach (BookingItem b in BookingList)
            {
                // Status filter
                if (CurrentFilter != "ALL" && b.Status != CurrentFilter)
                    continue;

                // Search filter
                if (!string.IsNullOrEmpty(search))
                {
                    if (!b.BookingId.ToLower().Contains(search) &&
                        !b.CustomerName.ToLower().Contains(search))
                        continue;
                }

                filtered.Add(b);
            }

            // Pagination
            int totalItems = filtered.Count;
            int totalPages = Math.Max(1, (int)Math.Ceiling((double)totalItems / PageSize));

            if (CurrentPage > totalPages) CurrentPage = totalPages;
            if (CurrentPage < 1) CurrentPage = 1;

            int startIndex = (CurrentPage - 1) * PageSize;
            List<BookingItem> paged = filtered.GetRange(
                startIndex,
                Math.Min(PageSize, totalItems - startIndex)
            );

            rptBookings.DataSource = paged;
            rptBookings.DataBind();

            lblShowingText.Text = "Showing " + (startIndex + 1) + " to " +
                (startIndex + paged.Count) + " of " + totalItems + " entries";

            btnPrev.Enabled = CurrentPage > 1;
            btnNext.Enabled = CurrentPage < totalPages;
        }

        // =========================================
        // LOAD STATS
        // =========================================
        private void LoadStats()
        {
            decimal totalRevenue = 0;
            int totalTransactions = BookingList.Count;
            int successful = 0;

            foreach (BookingItem b in BookingList)
            {
                totalRevenue += b.Amount;
                if (b.Status == "SUCCESS") successful++;
            }

            int successRate = totalTransactions > 0
                ? (int)Math.Round((double)successful / totalTransactions * 100)
                : 0;

            lblTotalRevenue.Text = "Rs. " + totalRevenue.ToString("N0");
            lblTotalTransactions.Text = totalTransactions.ToString();
            lblSuccessRate.Text = successRate + "%";
        }

        // =========================================
        // SEARCH — C# VALIDATION
        // =========================================
        protected void txtBookingSearch_TextChanged(object sender, EventArgs e)
        {
            string search = txtBookingSearch.Text.Trim();

            // ===== VALIDATION =====
            if (!string.IsNullOrEmpty(search))
            {
                // Min length
                if (search.Length < 2)
                {
                    ShowMessage("Search term must be at least 2 characters.");
                    return;
                }

                // Max length
                if (search.Length > 50)
                {
                    ShowMessage("Search term cannot exceed 50 characters.");
                    return;
                }

                // Only valid characters
                if (!Regex.IsMatch(search, @"^[a-zA-Z0-9\s\-]+$"))
                {
                    ShowMessage("Search contains invalid characters.");
                    txtBookingSearch.Text = "";
                    return;
                }
            }

            CurrentPage = 1;
            LoadBookings();
        }

        // =========================================
        // FILTERS
        // =========================================
        protected void btnAll_Click(object sender, EventArgs e)
        {
            CurrentFilter = "ALL";
            CurrentPage = 1;
            LoadBookings();
        }

        protected void btnPending_Click(object sender, EventArgs e)
        {
            CurrentFilter = "PENDING";
            CurrentPage = 1;
            LoadBookings();
        }

        protected void btnSuccess_Click(object sender, EventArgs e)
        {
            CurrentFilter = "SUCCESS";
            CurrentPage = 1;
            LoadBookings();
        }

        // =========================================
        // PAGINATION
        // =========================================
        protected void btnPrev_Click(object sender, EventArgs e)
        {
            if (CurrentPage > 1)
            {
                CurrentPage--;
                LoadBookings();
            }
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            CurrentPage++;
            LoadBookings();
        }

        // =========================================
        // REPEATER — VIEW / DELETE
        // =========================================
        protected void rptBookings_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            List<BookingItem> list = BookingList;
            BookingItem b = list.Find(x => x.Id == id);
            if (b == null) return;

            // ===== VIEW =====
            if (e.CommandName == "ViewBooking")
            {
                txtViewBookingId.Text = b.BookingId;
                txtViewMovie.Text = b.MovieName;
                txtViewCustomer.Text = b.CustomerName;
                txtViewTheater.Text = b.Theater;
                txtViewDateTime.Text = b.ShowDate.ToString("dd MMM yyyy, hh:mm tt");
                txtViewSeats.Text = b.Seats;
                txtViewAmount.Text = "Rs. " + b.Amount.ToString("N0");
                txtViewStatus.Text = b.Status;

                BookingModal.CssClass = "booking-modal-overlay show";
            }
            // ===== DELETE =====
            else if (e.CommandName == "DeleteBooking")
            {
                // ===== VALIDATION =====
                if (b.BookingId.Length < 5)
                {
                    ShowMessage("Invalid booking ID.");
                    return;
                }

                list.RemoveAll(x => x.Id == id);
                BookingList = list;

                LoadBookings();
                LoadStats();

                ShowMessage("Booking deleted successfully.");
            }
        }

        // =========================================
        // CLOSE MODAL
        // =========================================
        protected void btnCloseModal_Click(object sender, EventArgs e)
        {
            BookingModal.CssClass = "booking-modal-overlay";
        }

        // =========================================
        // HELPERS
        // =========================================
        private void ShowMessage(string message)
        {
            lblMessage.Text = message;
            lblMessage.Visible = true;

            string script = "setTimeout(function(){ var m=document.getElementById('" + lblMessage.ClientID + "'); if(m) m.style.display='none'; }, 3000);";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "hideMsg", script, true);
        }
    }

    public class BookingItem
    {
        public int Id { get; set; }
        public string BookingId { get; set; }
        public string MovieName { get; set; }
        public string CustomerName { get; set; }
        public string Theater { get; set; }
        public DateTime ShowDate { get; set; }
        public string Seats { get; set; }
        public decimal Amount { get; set; }
        public string Status { get; set; }
    }
}
