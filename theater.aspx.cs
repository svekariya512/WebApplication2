using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class theater : System.Web.UI.Page
    {
        // =========================================
        // SESSION-BASED DATA — THEATERS
        // =========================================
        private List<TheaterItem> TheaterList
        {
            get
            {
                if (Session["TheaterList"] == null)
                {
                    Session["TheaterList"] = new List<TheaterItem>
                    {
                        new TheaterItem { Id = 1, Name = "Cineplus Downtown", Location = "Mumbai, MH",    Amenities = "IMAX, ATMOS" },
                        new TheaterItem { Id = 2, Name = "Cineplus Westside", Location = "Ahmedabad, GJ", Amenities = "ATMOS, GOLD CLASS" },
                        new TheaterItem { Id = 3, Name = "Cineplus Metro",    Location = "Bengaluru, KA", Amenities = "IMAX" },
                        new TheaterItem { Id = 4, Name = "Cineplus Grand",    Location = "New Delhi, DL", Amenities = "IMAX, ATMOS, LUXE" }
                    };
                }
                return (List<TheaterItem>)Session["TheaterList"];
            }
            set { Session["TheaterList"] = value; }
        }

        private List<ShowingItem> ShowingList
        {
            get
            {
                if (Session["ShowingList"] == null)
                {
                    Session["ShowingList"] = new List<ShowingItem>
                    {
                        new ShowingItem { Id = 1, Movie = "Dune: Part Two", Format = "IMAX 70mm", ShowTimings = "10:00 AM, 02:30 PM, 07:00 PM" },
                        new ShowingItem { Id = 2, Movie = "Oppenheimer",    Format = "IMAX",      ShowTimings = "11:15 AM, 04:00 PM, 08:45 PM" }
                    };
                }
                return (List<ShowingItem>)Session["ShowingList"];
            }
            set { Session["ShowingList"] = value; }
        }

        private List<SignatureItem> SignatureList
        {
            get
            {
                if (Session["SignatureList"] == null)
                {
                    Session["SignatureList"] = new List<SignatureItem>
                    {
                        new SignatureItem {
                            Id = 1,
                            Movie = "FIGHTER",
                            Format = "IMAX",
                            Features = "Expanded Ratio, 12-Channel Sound",
                            ShowTimings = "2:30 PM, 6:00 PM (Book Now), 9:45 PM"
                        },
                        new SignatureItem {
                            Id = 2,
                            Movie = "JAWAN",
                            Format = "4DX",
                            Features = "Dolby Vision, Dolby Atmos",
                            ShowTimings = "12:00 PM, 08:00 PM, 10:00 AM (Book Now)"
                        }
                    };
                }
                return (List<SignatureItem>)Session["SignatureList"];
            }
            set { Session["SignatureList"] = value; }
        }

        // =========================================
        // COMFORT FEATURES
        // =========================================
        private List<ComfortItem> ComfortList
        {
            get
            {
                if (Session["ComfortList"] == null)
                {
                    Session["ComfortList"] = new List<ComfortItem>
                    {
                        new ComfortItem {
                            Id = 1,
                            Title = "Motorized Recliners",
                            Description = "Fully adjustable plush-leather seating with personalized temperature control and ample legroom.",
                            ImageUrl = "https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?w=800&q=80"
                        },
                        new ComfortItem {
                            Id = 2,
                            Title = "Gourmet Dining",
                            Description = "In-seat service featuring artisanal snacks, popcorn, and refreshing beverages.",
                            ImageUrl = "https://images.unsplash.com/photo-1414235077428-338989a2e8c0?w=800&q=80"
                        },
                        new ComfortItem {
                            Id = 3,
                            Title = "Private Lounges",
                            Description = "Exclusive pre-show waiting areas with complimentary beverages.",
                            ImageUrl = "https://images.unsplash.com/photo-1540555700478-4be289fbecef?w=800&q=80"
                        },
                        new ComfortItem {
                            Id = 4,
                            Title = "Dual-Laser Projection",
                            Description = "Unmatched brightness, contrast, and color accuracy for a flawless picture.",
                            ImageUrl = "https://images.unsplash.com/photo-1478720568477-152d9b164e26?w=800&q=80"
                        }
                    };
                }
                return (List<ComfortItem>)Session["ComfortList"];
            }
            set { Session["ComfortList"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadAll();
            }
        }

        // =========================================
        // SPLIT HELPER — for repeater binding
        // =========================================
        public string[] SplitList(object value)
        {
            if (value == null) return new string[0];
            string str = value.ToString();
            if (string.IsNullOrWhiteSpace(str)) return new string[0];

            string[] parts = str.Split(',');
            List<string> cleaned = new List<string>();
            foreach (string p in parts)
            {
                string t = p.Trim();
                if (t.Length > 0) cleaned.Add(t);
            }
            return cleaned.ToArray();
        }

        private void LoadAll()
        {
            rptTheaters.DataSource = TheaterList;
            rptTheaters.DataBind();

            rptShowings.DataSource = ShowingList;
            rptShowings.DataBind();

            rptSignatureScreens.DataSource = SignatureList;
            rptSignatureScreens.DataBind();

            rptComfort.DataSource = ComfortList;
            rptComfort.DataBind();
        }

        // =========================================
        // THEATER — ADD / EDIT / DELETE
        // =========================================
        protected void btnAddTheater_Click(object sender, EventArgs e)
        {
            hdnEditTheaterId.Value = "";
            txtTheaterName.Text = "";
            txtLocation.Text = "";
            txtAmenities.Text = "";

            theaterModalTitle.Text = "Add Theater";
            btnSaveTheater.Text = "Save Theater";
            theaterModal.CssClass = "theater-modal-overlay show";
        }

        protected void rptTheaters_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            List<TheaterItem> list = TheaterList;
            TheaterItem t = list.Find(x => x.Id == id);
            if (t == null) return;

            if (e.CommandName == "EditTheater")
            {
                hdnEditTheaterId.Value = t.Id.ToString();
                txtTheaterName.Text = t.Name;
                txtLocation.Text = t.Location;
                txtAmenities.Text = t.Amenities;

                theaterModalTitle.Text = "Edit Theater";
                btnSaveTheater.Text = "Update Theater";
                theaterModal.CssClass = "theater-modal-overlay show";
            }
            else if (e.CommandName == "DeleteTheater")
            {
                list.RemoveAll(x => x.Id == id);
                TheaterList = list;
                LoadAll();
            }
        }

        protected void btnSaveTheater_Click(object sender, EventArgs e)
        {
            string name = txtTheaterName.Text.Trim();
            string location = txtLocation.Text.Trim();
            string amenities = txtAmenities.Text.Trim();

            if (string.IsNullOrEmpty(name) || name.Length < 2 || name.Length > 80) return;
            if (string.IsNullOrEmpty(location) || location.Length < 2 || location.Length > 60) return;

            List<TheaterItem> list = TheaterList;

            if (!string.IsNullOrEmpty(hdnEditTheaterId.Value))
            {
                int id = Convert.ToInt32(hdnEditTheaterId.Value);
                TheaterItem t = list.Find(x => x.Id == id);
                if (t != null)
                {
                    t.Name = name;
                    t.Location = location;
                    t.Amenities = amenities;
                }
            }
            else
            {
                int newId = 1;
                foreach (var x in list) if (x.Id >= newId) newId = x.Id + 1;
                list.Add(new TheaterItem { Id = newId, Name = name, Location = location, Amenities = amenities });
            }

            TheaterList = list;
            LoadAll();
            theaterModal.CssClass = "theater-modal-overlay";
        }

        protected void btnCloseTheater_Click(object sender, EventArgs e)
        {
            theaterModal.CssClass = "theater-modal-overlay";
        }

        // =========================================
        // SHOWING — ADD / EDIT / DELETE
        // =========================================
        protected void btnAddShowing_Click(object sender, EventArgs e)
        {
            hdnEditShowingId.Value = "";
            txtShowingMovie.Text = "";
            txtShowingFormat.Text = "";
            txtShowingTimings.Text = "";

            showingModalTitle.Text = "Add Showing";
            btnSaveShowing.Text = "Save Showing";
            showingModal.CssClass = "theater-modal-overlay show";
        }

        protected void rptShowings_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            List<ShowingItem> list = ShowingList;
            ShowingItem s = list.Find(x => x.Id == id);
            if (s == null) return;

            if (e.CommandName == "EditShowing")
            {
                hdnEditShowingId.Value = s.Id.ToString();
                txtShowingMovie.Text = s.Movie;
                txtShowingFormat.Text = s.Format;
                txtShowingTimings.Text = s.ShowTimings;

                showingModalTitle.Text = "Edit Showing";
                btnSaveShowing.Text = "Update Showing";
                showingModal.CssClass = "theater-modal-overlay show";
            }
            else if (e.CommandName == "DeleteShowing")
            {
                list.RemoveAll(x => x.Id == id);
                ShowingList = list;
                LoadAll();
            }
        }

        protected void btnSaveShowing_Click(object sender, EventArgs e)
        {
            string movie = txtShowingMovie.Text.Trim();
            string format = txtShowingFormat.Text.Trim();
            string timings = txtShowingTimings.Text.Trim();

            if (string.IsNullOrEmpty(movie)) return;

            List<ShowingItem> list = ShowingList;

            if (!string.IsNullOrEmpty(hdnEditShowingId.Value))
            {
                int id = Convert.ToInt32(hdnEditShowingId.Value);
                ShowingItem s = list.Find(x => x.Id == id);
                if (s != null)
                {
                    s.Movie = movie;
                    s.Format = format;
                    s.ShowTimings = timings;
                }
            }
            else
            {
                int newId = 1;
                foreach (var x in list) if (x.Id >= newId) newId = x.Id + 1;
                list.Add(new ShowingItem { Id = newId, Movie = movie, Format = format, ShowTimings = timings });
            }

            ShowingList = list;
            LoadAll();
            showingModal.CssClass = "theater-modal-overlay";
        }

        protected void btnCloseShowing_Click(object sender, EventArgs e)
        {
            showingModal.CssClass = "theater-modal-overlay";
        }

        // =========================================
        // SIGNATURE — ADD / EDIT / DELETE
        // =========================================
        protected void btnAddSignature_Click(object sender, EventArgs e)
        {
            hdnEditSignatureId.Value = "";
            txtSignatureMovie.Text = "";
            txtSignatureFormat.Text = "";
            txtSignatureFeatures.Text = "";
            txtSignatureTimings.Text = "";

            signatureModalTitle.Text = "Add Signature Screen";
            btnSaveSignature.Text = "Save Signature Screen";
            signatureModal.CssClass = "theater-modal-overlay show";
        }

        protected void rptSignatureScreens_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            List<SignatureItem> list = SignatureList;
            SignatureItem s = list.Find(x => x.Id == id);
            if (s == null) return;

            if (e.CommandName == "EditSignatureScreen")
            {
                hdnEditSignatureId.Value = s.Id.ToString();
                txtSignatureMovie.Text = s.Movie;
                txtSignatureFormat.Text = s.Format;
                txtSignatureFeatures.Text = s.Features;
                txtSignatureTimings.Text = s.ShowTimings;

                signatureModalTitle.Text = "Edit Signature Screen";
                btnSaveSignature.Text = "Update Signature Screen";
                signatureModal.CssClass = "theater-modal-overlay show";
            }
            else if (e.CommandName == "DeleteSignatureScreen")
            {
                list.RemoveAll(x => x.Id == id);
                SignatureList = list;
                LoadAll();
            }
        }

        protected void btnSaveSignature_Click(object sender, EventArgs e)
        {
            string movie = txtSignatureMovie.Text.Trim();
            string format = txtSignatureFormat.Text.Trim();
            string features = txtSignatureFeatures.Text.Trim();
            string timings = txtSignatureTimings.Text.Trim();

            if (string.IsNullOrEmpty(movie)) return;

            List<SignatureItem> list = SignatureList;

            if (!string.IsNullOrEmpty(hdnEditSignatureId.Value))
            {
                int id = Convert.ToInt32(hdnEditSignatureId.Value);
                SignatureItem s = list.Find(x => x.Id == id);
                if (s != null)
                {
                    s.Movie = movie;
                    s.Format = format;
                    s.Features = features;
                    s.ShowTimings = timings;
                }
            }
            else
            {
                int newId = 1;
                foreach (var x in list) if (x.Id >= newId) newId = x.Id + 1;
                list.Add(new SignatureItem
                {
                    Id = newId,
                    Movie = movie,
                    Format = format,
                    Features = features,
                    ShowTimings = timings
                });
            }

            SignatureList = list;
            LoadAll();
            signatureModal.CssClass = "theater-modal-overlay";
        }

        protected void btnCloseSignature_Click(object sender, EventArgs e)
        {
            signatureModal.CssClass = "theater-modal-overlay";
        }

        // =========================================
        // COMFORT — ADD / EDIT / DELETE
        // =========================================
        protected void btnAddComfort_Click(object sender, EventArgs e)
        {
            hdnEditComfortId.Value = "";
            txtComfortTitle.Text = "";
            txtComfortDesc.Text = "";
            txtComfortImage.Text = "";

            comfortModalTitle.Text = "Add Comfort Feature";
            btnSaveComfort.Text = "Save Comfort Feature";
            comfortModal.CssClass = "theater-modal-overlay show";
        }

        protected void rptComfort_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            List<ComfortItem> list = ComfortList;
            ComfortItem c = list.Find(x => x.Id == id);
            if (c == null) return;

            if (e.CommandName == "EditComfort")
            {
                hdnEditComfortId.Value = c.Id.ToString();
                txtComfortTitle.Text = c.Title;
                txtComfortDesc.Text = c.Description;
                txtComfortImage.Text = c.ImageUrl;

                comfortModalTitle.Text = "Edit Comfort Feature";
                btnSaveComfort.Text = "Update Comfort Feature";
                comfortModal.CssClass = "theater-modal-overlay show";
            }
            else if (e.CommandName == "DeleteComfort")
            {
                list.RemoveAll(x => x.Id == id);
                ComfortList = list;
                LoadAll();
            }
        }

        protected void btnSaveComfort_Click(object sender, EventArgs e)
        {
            string title = txtComfortTitle.Text.Trim();
            string desc = txtComfortDesc.Text.Trim();
            string img = txtComfortImage.Text.Trim();

            if (string.IsNullOrEmpty(title)) return;

            List<ComfortItem> list = ComfortList;

            if (!string.IsNullOrEmpty(hdnEditComfortId.Value))
            {
                int id = Convert.ToInt32(hdnEditComfortId.Value);
                ComfortItem c = list.Find(x => x.Id == id);
                if (c != null)
                {
                    c.Title = title;
                    c.Description = desc;
                    if (!string.IsNullOrEmpty(img)) c.ImageUrl = img;
                }
            }
            else
            {
                int newId = 1;
                foreach (var x in list) if (x.Id >= newId) newId = x.Id + 1;
                list.Add(new ComfortItem
                {
                    Id = newId,
                    Title = title,
                    Description = desc,
                    ImageUrl = string.IsNullOrEmpty(img)
                        ? "https://images.unsplash.com/photo-1517604931442-7e0c8ed2963c?w=800&q=80"
                        : img
                });
            }

            ComfortList = list;
            LoadAll();
            comfortModal.CssClass = "theater-modal-overlay";
        }

        protected void btnCloseComfort_Click(object sender, EventArgs e)
        {
            comfortModal.CssClass = "theater-modal-overlay";
        }
    }

    // =========================================
    // DATA MODELS
    // =========================================
    public class TheaterItem
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Location { get; set; }
        public string Amenities { get; set; }
    }

    public class ShowingItem
    {
        public int Id { get; set; }
        public string Movie { get; set; }
        public string Format { get; set; }
        public string ShowTimings { get; set; }
    }

    public class SignatureItem
    {
        public int Id { get; set; }
        public string Movie { get; set; }
        public string Format { get; set; }
        public string Features { get; set; }
        public string ShowTimings { get; set; }
    }

    public class ComfortItem
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string ImageUrl { get; set; }
    }
}
