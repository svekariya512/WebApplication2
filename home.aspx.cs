using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class home : System.Web.UI.Page
    {
        // =========================================
        // MOVIES DATA
        // =========================================
        private List<Movie> Movies
        {
            get
            {
                if (Session["Movies"] == null)
                {
                    Session["Movies"] = new List<Movie>
                    {
                        new Movie { Id = 1, Title = "Inception", Rating = "8.8" },
                        new Movie { Id = 2, Title = "Interstellar", Rating = "8.7" },
                        new Movie { Id = 3, Title = "The Dark Knight", Rating = "9.0" }
                    };
                }
                return (List<Movie>)Session["Movies"];
            }
            set { Session["Movies"] = value; }
        }

        // =========================================
        // HERO DATA
        // =========================================
        private List<HeroItem> HeroItems
        {
            get
            {
                if (Session["HeroItems"] == null)
                {
                    Session["HeroItems"] = new List<HeroItem>
                    {
                        new HeroItem { Id = 1, Brand = "ARCADE", MovieTitle = "Shadows of Gotham", Description = "A dark thriller", Status = "Active", Position = "Featured" },
                        new HeroItem { Id = 2, Brand = "CINEPLUS", MovieTitle = "Cosmic Journey", Description = "Space adventure", Status = "Active", Position = "Featured" }
                    };
                }
                return (List<HeroItem>)Session["HeroItems"];
            }
            set { Session["HeroItems"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // ⭐ હેડરમાં "Global Oversight" સેટ કરવા માટે
                SetHeaderTitle("Global Oversight");

                LoadMovies();
                LoadHeroContent();
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

        private void LoadMovies()
        {
            rptMovies.DataSource = Movies;
            rptMovies.DataBind();
        }

        private void LoadHeroContent()
        {
            rptHero.DataSource = HeroItems;
            rptHero.DataBind();
        }

        // =========================================
        // ⭐ ADD MOVIE (JavaScript વગર)
        // =========================================
        protected void btnAddMovie_Click(object sender, EventArgs e)
        {
            // ફોર્મ ખાલી કરો
            txtMovieTitle.Text = "";
            txtMovieRating.Text = "";
            hdnEditMovieId.Value = "";

            // મોડલ ટાઈટલ અને બટન સેટ કરો
            MovieModalTitle.Text = "Add New Movie";
            btnSaveMovie.Text = "Save Movie";

            // મોડલ ખોલો (CSS ક્લાસ થી)
            MovieModal.CssClass = "movie-modal-overlay show";
        }

        // =========================================
        // ⭐ ADD HERO (JavaScript વગર)
        // =========================================
        protected void btnAddHero_Click(object sender, EventArgs e)
        {
            // ફોર્મ ખાલી કરો
            txtHeroBrand.Text = "";
            txtHeroTitle.Text = "";
            txtHeroDesc.Text = "";
            ddlHeroStatus.SelectedValue = "Active";
            ddlHeroPosition.SelectedValue = "Featured";
            hdnEditHeroId.Value = "";

            // મોડલ ટાઈટલ અને બટન સેટ કરો
            HeroModalTitle.Text = "Add New Hero Content";
            btnSaveHero.Text = "Save Hero";

            // મોડલ ખોલો (CSS ક્લાસ થી)
            HeroModal.CssClass = "movie-modal-overlay show";
        }

        // =========================================
        // SAVE MOVIE
        // =========================================
        protected void btnSaveMovie_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string title = txtMovieTitle.Text.Trim();
            string rating = txtMovieRating.Text.Trim();
            string editId = hdnEditMovieId.Value;

            if (string.IsNullOrEmpty(title)) return;
            if (string.IsNullOrEmpty(rating)) rating = "N/A";

            List<Movie> movies = Movies;

            if (!string.IsNullOrEmpty(editId))
            {
                int id = Convert.ToInt32(editId);
                Movie m = movies.Find(x => x.Id == id);
                if (m != null)
                {
                    m.Title = title;
                    m.Rating = rating;
                }
            }
            else
            {
                int newId = 1;
                foreach (Movie m in movies)
                {
                    if (m.Id >= newId) newId = m.Id + 1;
                }
                movies.Add(new Movie { Id = newId, Title = title, Rating = rating });
            }

            Movies = movies;

            // JavaScript વગર મોડલ બંધ કરવા માટે C# થી ક્લાસ બદલો
            MovieModal.CssClass = "movie-modal-overlay";

            txtMovieTitle.Text = "";
            txtMovieRating.Text = "";
            hdnEditMovieId.Value = "";

            LoadMovies();
        }

        // =========================================
        // SAVE HERO
        // =========================================
        protected void btnSaveHero_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return;

            string brand = txtHeroBrand.Text.Trim();
            string title = txtHeroTitle.Text.Trim();
            string desc = txtHeroDesc.Text.Trim();
            string status = ddlHeroStatus.SelectedValue;
            string position = ddlHeroPosition.SelectedValue;
            string editId = hdnEditHeroId.Value;

            if (string.IsNullOrEmpty(brand) || string.IsNullOrEmpty(title)) return;

            List<HeroItem> heroes = HeroItems;

            if (!string.IsNullOrEmpty(editId))
            {
                int id = Convert.ToInt32(editId);
                HeroItem h = heroes.Find(x => x.Id == id);
                if (h != null)
                {
                    h.Brand = brand;
                    h.MovieTitle = title;
                    h.Description = desc;
                    h.Status = status;
                    h.Position = position;
                }
            }
            else
            {
                int newId = 1;
                foreach (HeroItem h in heroes)
                {
                    if (h.Id >= newId) newId = h.Id + 1;
                }
                heroes.Add(new HeroItem
                {
                    Id = newId,
                    Brand = brand,
                    MovieTitle = title,
                    Description = desc,
                    Status = status,
                    Position = position
                });
            }

            HeroItems = heroes;

            // JavaScript વગર મોડલ બંધ કરવા માટે C# થી ક્લાસ બદલો
            HeroModal.CssClass = "movie-modal-overlay";

            txtHeroBrand.Text = "";
            txtHeroTitle.Text = "";
            txtHeroDesc.Text = "";
            hdnEditHeroId.Value = "";

            LoadHeroContent();
        }

        // =========================================
        // EDIT / DELETE — MOVIES
        // =========================================
        protected void rptMovies_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            List<Movie> movies = Movies;

            if (e.CommandName == "DeleteMovie")
            {
                movies.RemoveAll(x => x.Id == id);
                Movies = movies;
                LoadMovies();
            }
            else if (e.CommandName == "EditMovie")
            {
                Movie m = movies.Find(x => x.Id == id);
                if (m != null)
                {
                    txtMovieTitle.Text = m.Title;
                    txtMovieRating.Text = m.Rating;
                    hdnEditMovieId.Value = m.Id.ToString();

                    // JavaScript વગર મોડલ ખોલવા માટે C# થી ક્લાસ બદલો
                    MovieModal.CssClass = "movie-modal-overlay show";
                    MovieModalTitle.Text = "Edit Movie";
                    btnSaveMovie.Text = "Save Changes";
                }
            }
        }

        // =========================================
        // EDIT / DELETE — HERO
        // =========================================
        protected void rptHero_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            List<HeroItem> heroes = HeroItems;

            if (e.CommandName == "DeleteHero")
            {
                heroes.RemoveAll(x => x.Id == id);
                HeroItems = heroes;
                LoadHeroContent();
            }
            else if (e.CommandName == "EditHero")
            {
                HeroItem h = heroes.Find(x => x.Id == id);
                if (h != null)
                {
                    txtHeroBrand.Text = h.Brand;
                    txtHeroTitle.Text = h.MovieTitle;
                    txtHeroDesc.Text = h.Description;
                    ddlHeroStatus.SelectedValue = h.Status;
                    ddlHeroPosition.SelectedValue = h.Position;
                    hdnEditHeroId.Value = h.Id.ToString();

                    // JavaScript વગર મોડલ ખોલવા માટે C# થી ક્લાસ બદલો
                    HeroModal.CssClass = "movie-modal-overlay show";
                    HeroModalTitle.Text = "Edit Hero Content";
                    btnSaveHero.Text = "Save Changes";
                }
            }
        }

        // =========================================
        // CANCEL
        // =========================================
        protected void CancelMovie_Click(object sender, EventArgs e)
        {
            MovieModal.CssClass = "movie-modal-overlay";
            hdnEditMovieId.Value = "";
            txtMovieTitle.Text = "";
            txtMovieRating.Text = "";
        }

        protected void CancelHero_Click(object sender, EventArgs e)
        {
            HeroModal.CssClass = "movie-modal-overlay";
            hdnEditHeroId.Value = "";
            txtHeroBrand.Text = "";
            txtHeroTitle.Text = "";
            txtHeroDesc.Text = "";
        }
    }

    public class Movie
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Rating { get; set; }
    }

    public class HeroItem
    {
        public int Id { get; set; }
        public string Brand { get; set; }
        public string MovieTitle { get; set; }
        public string Description { get; set; }
        public string Status { get; set; }
        public string Position { get; set; }
    }
}
