using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class theater : System.Web.UI.Page
    {
        // =========================================
        // THEATERS DATA
        // =========================================
        private List<TheaterItem> Theaters
        {
            get
            {
                if (Session["Theaters"] == null)
                {
                    Session["Theaters"] = new List<TheaterItem>
                    {
                        new TheaterItem { Id = 1, Name = "Cineplus Downtown", Location = "Mumbai, MH", Amenities = "IMAX, ATMOS" },
                        new TheaterItem { Id = 2, Name = "Cineplus Westside", Location = "Ahmedabad, GJ", Amenities = "ATMOS, GOLD CLASS" }
                    };
                }
                return (List<TheaterItem>)Session["Theaters"];
            }
            set { Session["Theaters"] = value; }
        }

        // =========================================
        // SHOWINGS DATA
        // =========================================
        private List<Showing> Showings
        {
            get
            {
                if (Session["Showings"] == null)
                {
                    Session["Showings"] = new List<Showing>
                    {
                        new Showing { Id = 1, Movie = "Dune: Part Two", Format = "IMAX 70mm", ShowTimings = "10:00 AM, 02:30 PM, 07:00 PM" },
                        new Showing { Id = 2, Movie = "Oppenheimer", Format = "IMAX", ShowTimings = "11:15 AM, 04:00 PM, 08:45 PM" }
                    };
                }
                return (List<Showing>)Session["Showings"];
            }
            set { Session["Showings"] = value; }
        }

        // =========================================
        // SIGNATURE SCREENS DATA
        // =========================================
        private List<SignatureScreen> SignatureScreens
        {
            get
            {
                if (Session["SignatureScreens"] == null)
                {
                    Session["SignatureScreens"] = new List<SignatureScreen>
                    {
                        new SignatureScreen { Id = 1, Movie = "FIGHTER", Format = "IMAX", Features = "Expanded Ratio, 12-Channel Sound", ShowTimings = "2:30 PM, 6:00 PM, 9:45 PM" },
                        new SignatureScreen { Id = 2, Movie = "JAWAN", Format = "4DX", Features = "Dolby Vision, Dolby Atmos", ShowTimings = "12:00 PM, 08:00 PM, 10:00 AM" }
                    };
                }
                return (List<SignatureScreen>)Session["SignatureScreens"];
            }
            set { Session["SignatureScreens"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadTheaters();
                LoadShowings();
                LoadSignatureScreens();
            }
        }

        private void LoadTheaters()
        {
            rptTheaters.DataSource = Theaters;
            rptTheaters.DataBind();
        }

        private void LoadShowings()
        {
            rptShowings.DataSource = Showings;
            rptShowings.DataBind();
        }

        private void LoadSignatureScreens()
        {
            rptSignatureScreens.DataSource = SignatureScreens;
            rptSignatureScreens.DataBind();
        }

        // =========================================
        // SAVE THEATER
        // =========================================
        protected void btnSaveTheater_Click(object sender, EventArgs e)
        {
            string name = txtTheaterName.Text.Trim();
            string location = txtLocation.Text.Trim();
            string amenities = txtAmenities.Text.Trim();
            string editId = hdnEditTheaterId.Value;

            if (string.IsNullOrEmpty(name)) { ShowAlert("Theater name is required."); return; }

            List<TheaterItem> theaters = Theaters;

            if (!string.IsNullOrEmpty(editId))
            {
                int id = Convert.ToInt32(editId);
                TheaterItem t = theaters.Find(x => x.Id == id);
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
                foreach (TheaterItem t in theaters)
                {
                    if (t.Id >= newId) newId = t.Id + 1;
                }
                theaters.Add(new TheaterItem
                {
                    Id = newId,
                    Name = name,
                    Location = location,
                    Amenities = amenities
                });
            }

            Theaters = theaters;
            hdnEditTheaterId.Value = "";

            string script = "alert('Theater saved successfully!');" +
                            "document.getElementById('theaterModal').classList.remove('show');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "theaterSaved", script, true);

            LoadTheaters();
        }

        // =========================================
        // SAVE SHOWING
        // =========================================
        protected void btnSaveShowing_Click(object sender, EventArgs e)
        {
            string movie = txtShowingMovie.Text.Trim();
            string format = txtShowingFormat.Text.Trim();
            string timings = txtShowingTimings.Text.Trim();
            string editId = hdnEditShowingId.Value;

            if (string.IsNullOrEmpty(movie)) { ShowAlert("Movie is required."); return; }

            List<Showing> showings = Showings;

            if (!string.IsNullOrEmpty(editId))
            {
                int id = Convert.ToInt32(editId);
                Showing s = showings.Find(x => x.Id == id);
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
                foreach (Showing s in showings)
                {
                    if (s.Id >= newId) newId = s.Id + 1;
                }
                showings.Add(new Showing
                {
                    Id = newId,
                    Movie = movie,
                    Format = format,
                    ShowTimings = timings
                });
            }

            Showings = showings;
            hdnEditShowingId.Value = "";

            string script = "alert('Showing saved successfully!');" +
                            "document.getElementById('showingModal').classList.remove('show');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "showingSaved", script, true);

            LoadShowings();
        }

        // =========================================
        // SAVE SIGNATURE SCREEN
        // =========================================
        protected void btnSaveSignature_Click(object sender, EventArgs e)
        {
            string movie = txtSignatureMovie.Text.Trim();
            string format = txtSignatureFormat.Text.Trim();
            string features = txtSignatureFeatures.Text.Trim();
            string timings = txtSignatureTimings.Text.Trim();
            string editId = hdnEditSignatureId.Value;

            if (string.IsNullOrEmpty(movie)) { ShowAlert("Movie is required."); return; }

            List<SignatureScreen> screens = SignatureScreens;

            if (!string.IsNullOrEmpty(editId))
            {
                int id = Convert.ToInt32(editId);
                SignatureScreen s = screens.Find(x => x.Id == id);
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
                foreach (SignatureScreen s in screens)
                {
                    if (s.Id >= newId) newId = s.Id + 1;
                }
                screens.Add(new SignatureScreen
                {
                    Id = newId,
                    Movie = movie,
                    Format = format,
                    Features = features,
                    ShowTimings = timings
                });
            }

            SignatureScreens = screens;
            hdnEditSignatureId.Value = "";

            string script = "alert('Signature screen saved successfully!');" +
                            "document.getElementById('signatureModal').classList.remove('show');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "signatureSaved", script, true);

            LoadSignatureScreens();
        }

        // =========================================
        // THEATERS EDIT / DELETE
        // =========================================
        protected void rptTheaters_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            List<TheaterItem> theaters = Theaters;

            if (e.CommandName == "DeleteTheater")
            {
                theaters.RemoveAll(x => x.Id == id);
                Theaters = theaters;
                LoadTheaters();
                ShowAlert("Theater deleted successfully.");
            }
            else if (e.CommandName == "EditTheater")
            {
                TheaterItem t = theaters.Find(x => x.Id == id);
                if (t != null)
                {
                    txtTheaterName.Text = t.Name;
                    txtLocation.Text = t.Location;
                    txtAmenities.Text = t.Amenities;
                    hdnEditTheaterId.Value = t.Id.ToString();

                    string script =
                        "document.getElementById('theaterModalTitle').innerText='Edit Theater';" +
                        "document.getElementById('btnSaveTheater').value='Save Changes';" +
                        "document.getElementById('theaterModal').classList.add('show');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "openEditTheater", script, true);
                }
            }
        }

        // =========================================
        // SHOWINGS EDIT / DELETE
        // =========================================
        protected void rptShowings_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            List<Showing> showings = Showings;

            if (e.CommandName == "DeleteShowing")
            {
                showings.RemoveAll(x => x.Id == id);
                Showings = showings;
                LoadShowings();
                ShowAlert("Showing deleted successfully.");
            }
            else if (e.CommandName == "EditShowing")
            {
                Showing s = showings.Find(x => x.Id == id);
                if (s != null)
                {
                    txtShowingMovie.Text = s.Movie;
                    txtShowingFormat.Text = s.Format;
                    txtShowingTimings.Text = s.ShowTimings;
                    hdnEditShowingId.Value = s.Id.ToString();

                    string script =
                        "document.getElementById('showingModalTitle').innerText='Edit Showing';" +
                        "document.getElementById('btnSaveShowing').value='Save Changes';" +
                        "document.getElementById('showingModal').classList.add('show');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "openEditShowing", script, true);
                }
            }
        }

        // =========================================
        // SIGNATURE EDIT / DELETE
        // =========================================
        protected void rptSignatureScreens_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            List<SignatureScreen> screens = SignatureScreens;

            if (e.CommandName == "DeleteSignatureScreen")
            {
                screens.RemoveAll(x => x.Id == id);
                SignatureScreens = screens;
                LoadSignatureScreens();
                ShowAlert("Signature screen deleted successfully.");
            }
            else if (e.CommandName == "EditSignatureScreen")
            {
                SignatureScreen s = screens.Find(x => x.Id == id);
                if (s != null)
                {
                    txtSignatureMovie.Text = s.Movie;
                    txtSignatureFormat.Text = s.Format;
                    txtSignatureFeatures.Text = s.Features;
                    txtSignatureTimings.Text = s.ShowTimings;
                    hdnEditSignatureId.Value = s.Id.ToString();

                    string script =
                        "document.getElementById('signatureModalTitle').innerText='Edit Signature Screen';" +
                        "document.getElementById('btnSaveSignature').value='Save Changes';" +
                        "document.getElementById('signatureModal').classList.add('show');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "openEditSignature", script, true);
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

    public class TheaterItem
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Location { get; set; }
        public string Amenities { get; set; }
    }

    public class Showing
    {
        public int Id { get; set; }
        public string Movie { get; set; }
        public string Format { get; set; }
        public string ShowTimings { get; set; }
    }

    public class SignatureScreen
    {
        public int Id { get; set; }
        public string Movie { get; set; }
        public string Format { get; set; }
        public string Features { get; set; }
        public string ShowTimings { get; set; }
    }
}