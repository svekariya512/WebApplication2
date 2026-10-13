using System;
using System.Collections.Generic;
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

        // =========================================
        // IN-MEMORY DATA (Session-Based)
        // =========================================
        private List<BookingItem> BookingList
        {
            get
            {
                if (Session["BookingList"] == null)
                {
                    Session["BookingList"] = new List<BookingItem>
                    {
                        new BookingItem
                        {
                            Id = 1,
                            BookingId = "BK10001",
                            MovieName = "Inception",
                            CustomerName = "Raj Patel",
                            Theater = "Cineplus Downtown, Mumbai",
                            ShowDate = DateTime.Now.AddDays(2),
                            Seats = "E7, E8",
                            Amount = 500,
                            Status = "SUCCESS"
                        },
                        new BookingItem
                        {
                            Id = 2,
                            BookingId = "BK10002",
                            MovieName = "Interstellar",
                            CustomerName = "Priya Shah",
                            Theater = "Cineplus Westside, Ahmedabad",
                            ShowDate = DateTime.Now.AddDays(-5),
                            Seats = "A1, A2",
                            Amount = 750,
                            Status = "SUCCESS"
                        },
                        new BookingItem
                        {
                            Id = 3,
                            BookingId = "BK10003",
                            MovieName = "The Dark Knight",
                            CustomerName = "Amit Kumar",
                            Theater = "Cineplus Rajkot",
                            ShowDate = DateTime.Now.AddDays(1),
                            Seats = "F10",
                            Amount = 350,
                            Status = "PENDING"
                        },
                        new BookingItem
                        {
                            Id = 4,
                            BookingId = "BK10004",
                            MovieName = "Dune: Part Two",
                            CustomerName = "Sneha Joshi",
                            Theater = "Cineplus Downtown, Mumbai",
                            ShowDate = DateTime.Now.AddDays(-2),
                            Seats = "B5, B6",
                            Amount = 900,
                            Status = "FAILED"
                        },
                        new BookingItem
                        {
                            Id = 5,
                            BookingId = "BK10005",
                            MovieName = "Oppenheimer",
                            CustomerName = "Kiran Mehta",
                            Theater = "Cineplus Westside, Ahmedabad",
                            ShowDate = DateTime.Now.AddDays(3),
                            Seats = "C3, C4, C5",
                            Amount = 1200,
                            Status = "SUCCESS"
                        }
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
                // Filter by status
                if (CurrentFilter != "ALL" && b.Status != CurrentFilter)
                    continue;

                // Filter by search
                if (!string.IsNullOrEmpty(search))
                {
                    if (!b.BookingId.ToLower().Contains(search) &&
                        !b.CustomerName.ToLower().Contains(search))
                        continue;
                }

                filtered.Add(b);
            }

            // Order by Id DESC
            filtered.Sort((a, b) => b.Id.CompareTo(a.Id));

            rptBookings.DataSource = filtered;
            rptBookings.DataBind();

            lblFilterStatus.Text = "Filter: " + CurrentFilter;
        }

        // =========================================
        // LOAD STATS
        // =========================================
        private void LoadStats()
        {
            List<BookingItem> list = BookingList;

            decimal totalRevenue = 0;
            int totalTransactions = list.Count;
            int successCount = 0;

            foreach (BookingItem b in list)
            {
                totalRevenue += b.Amount;
                if (b.Status == "SUCCESS") successCount++;
            }

            int successRate = totalTransactions > 0
                ? (int)Math.Round((double)successCount / totalTransactions * 100)
                : 0;

            lblTotalRevenue.Text = "Rs. " + totalRevenue.ToString("N0");
            lblTotalTransactions.Text = totalTransactions.ToString();
            lblSuccessRate.Text = successRate + "%";
        }

        // =========================================
        // SEARCH
        // =========================================
        protected void txtBookingSearch_TextChanged(object sender, EventArgs e)
        {
            LoadBookings();
        }

        // =========================================
        // FILTER TAB
        // =========================================
        protected void FilterTab_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            CurrentFilter = btn.CommandArgument;
            LoadBookings();
        }

        // =========================================
        // REPEATER — View / Edit / Delete
        // =========================================
        protected void rptBookings_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            List<BookingItem> list = BookingList;
            BookingItem b = list.Find(x => x.Id == id);
            if (b == null) return;

            // DELETE
            if (e.CommandName == "DeleteBooking")
            {
                list.RemoveAll(x => x.Id == id);
                BookingList = list;

                LoadBookings();
                LoadStats();

                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg",
                    "alert('Booking deleted successfully.');", true);
            }
            // VIEW / EDIT
            else if (e.CommandName == "ViewBooking" || e.CommandName == "EditBooking")
            {
                txtBookingId.Text = b.BookingId;
                txtMovie.Text = b.MovieName;
                txtCustomer.Text = b.CustomerName;
                txtTheater.Text = b.Theater;
                txtDateTime.Text = b.ShowDate.ToString("yyyy-MM-dd HH:mm");
                txtSeats.Text = b.Seats;
                txtAmount.Text = b.Amount.ToString("0");
                ddlStatus.SelectedValue = b.Status;
                hdnEditBookingId.Value = b.Id.ToString();

                if (e.CommandName == "ViewBooking")
                {
                    txtMovie.ReadOnly = true;
                    txtCustomer.ReadOnly = true;
                    txtTheater.ReadOnly = true;
                    txtDateTime.ReadOnly = true;
                    txtSeats.ReadOnly = true;
                    txtAmount.ReadOnly = true;
                    ddlStatus.Enabled = false;
                    btnSaveBooking.Visible = false;

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "openView",
                        "document.getElementById('modalTitleText').innerText='View Booking';" +
                        "document.getElementById('bookingModal').classList.add('show');", true);
                }
                else
                {
                    txtMovie.ReadOnly = false;
                    txtCustomer.ReadOnly = false;
                    txtTheater.ReadOnly = false;
                    txtDateTime.ReadOnly = false;
                    txtSeats.ReadOnly = false;
                    txtAmount.ReadOnly = false;
                    ddlStatus.Enabled = true;
                    btnSaveBooking.Visible = true;

                    ScriptManager.RegisterStartupScript(this, this.GetType(), "openEdit",
                        "document.getElementById('modalTitleText').innerText='Edit Booking';" +
                        "document.getElementById('bookingModal').classList.add('show');", true);
                }
            }
        }

        // =========================================
        // SAVE BOOKING (Update)
        // =========================================
        protected void btnSaveBooking_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string editId = hdnEditBookingId.Value;
            if (string.IsNullOrEmpty(editId)) return;

            string movie = txtMovie.Text.Trim();
            string customer = txtCustomer.Text.Trim();
            string theater = txtTheater.Text.Trim();
            string dateTime = txtDateTime.Text.Trim();
            string seats = txtSeats.Text.Trim();
            string status = ddlStatus.SelectedValue;

            decimal amount;
            if (!decimal.TryParse(txtAmount.Text.Trim(), out amount))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg",
                    "alert('Invalid amount.');", true);
                return;
            }

            if (string.IsNullOrEmpty(movie) || string.IsNullOrEmpty(customer))
            {
                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg",
                    "alert('Movie and Customer are required.');", true);
                return;
            }

            try
            {
                List<BookingItem> list = BookingList;
                int id = Convert.ToInt32(editId);
                BookingItem b = list.Find(x => x.Id == id);

                if (b != null)
                {
                    b.MovieName = movie;
                    b.CustomerName = customer;
                    b.Theater = theater;
                    b.ShowDate = Convert.ToDateTime(dateTime);
                    b.Seats = seats;
                    b.Amount = amount;
                    b.Status = status;
                }

                BookingList = list;
                hdnEditBookingId.Value = "";

                ScriptManager.RegisterStartupScript(this, this.GetType(), "msg",
                    "alert('Booking updated successfully.');" +
                    "document.getElementById('bookingModal').classList.remove('show');", true);

                LoadBookings();
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