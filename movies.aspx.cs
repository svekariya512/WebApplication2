using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class movies : System.Web.UI.Page
    {
        private List<MovieItem> MovieList
        {
            get
            {
                if (Session["MovieList"] == null)
                {
                    Session["MovieList"] = new List<MovieItem>
                    {
                        new MovieItem { Id = 1, Language = "GUJARATI", Title = "CHICHI", Rating = "-", Genre = "ALL" },
                        new MovieItem { Id = 2, Language = "GUJARATI", Title = "JHAMKUDI", Rating = "Now Showing", Genre = "ACTION" },
                        new MovieItem { Id = 3, Language = "GUJARATI", Title = "Stree 2", Rating = "8.2/10", Genre = "THRILLER" },
                        new MovieItem { Id = 4, Language = "GUJARATI", Title = "Laalo", Rating = "9.9/10", Genre = "HISTORICAL" },
                        new MovieItem { Id = 5, Language = "GUJARATI", Title = "Satyameva Jayate 2", Rating = "9/10", Genre = "DOCUMENTARY" },
                        new MovieItem { Id = 6, Language = "ENGLISH", Title = "VOID", Rating = "8.5/10", Genre = "ACTION" },
                        new MovieItem { Id = 7, Language = "ENGLISH", Title = "SPIDER-MAN", Rating = "8.6/10", Genre = "THRILLER" },
                        new MovieItem { Id = 8, Language = "ENGLISH", Title = "Kohi-noor", Rating = "8.9/10", Genre = "HISTORICAL" },
                        new MovieItem { Id = 9, Language = "ENGLISH", Title = "CHHAVA", Rating = "8.2/10", Genre = "HISTORICAL" }
                    };
                }
                return (List<MovieItem>)Session["MovieList"];
            }
            set { Session["MovieList"] = value; }
        }

        private string SelectedGenre
        {
            get { return ViewState["SelectedGenre"] as string ?? "ALL"; }
            set { ViewState["SelectedGenre"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindMovies();
            }
        }

        private void BindMovies()
        {
            List<MovieItem> allMovies = MovieList;
            List<MovieItem> gujarati = new List<MovieItem>();
            List<MovieItem> english = new List<MovieItem>();

            foreach (MovieItem m in allMovies)
            {
                bool matchesGenre = SelectedGenre == "ALL" || m.Genre == SelectedGenre;
                if (!matchesGenre) continue;

                if (m.Language == "GUJARATI") gujarati.Add(m);
                else if (m.Language == "ENGLISH") english.Add(m);
            }

            GujaratiRepeater.DataSource = gujarati;
            GujaratiRepeater.DataBind();

            EnglishRepeater.DataSource = english;
            EnglishRepeater.DataBind();

            GujaratiCount.Text = gujarati.Count + " Films Active";
            EnglishCount.Text = english.Count + " Films Active";

            GenreMessage.Text = SelectedGenre == "ALL"
                ? "Showing all movies."
                : "Showing " + SelectedGenre.ToLower() + " movies.";
        }

        protected void AddMovie_Click(object sender, EventArgs e)
        {
            Button button = (Button)sender;

            ClearValidation();
            MovieIdField.Value = "-1";
            MovieModalTitle.Text = "Add " + button.CommandArgument + " Movie";
            MovieLanguage.SelectedValue = button.CommandArgument;
            MovieTitleInput.Text = "";
            MovieRatingInput.Text = "";
            MovieGenreInput.SelectedValue = "ACTION";

            ShowModal();
        }

        protected void SaveMovie_Click(object sender, EventArgs e)
        {
            ClearValidation();

            string language = MovieLanguage.SelectedValue;
            string title = MovieTitleInput.Text.Trim();
            string rating = MovieRatingInput.Text.Trim();
            string genre = MovieGenreInput.SelectedValue;

            bool hasError = false;

            if (title.Length == 0)
            {
                TitleError.Text = "Please enter a movie title.";
                hasError = true;
            }
            else if (title.Length < 2)
            {
                TitleError.Text = "Movie title must contain at least 2 characters.";
                hasError = true;
            }
            else if (!Regex.IsMatch(title, @"^[\p{L}\p{N}\s.,:!&'()\-]+$"))
            {
                TitleError.Text = "Movie title contains invalid characters.";
                hasError = true;
            }

            if (rating.Length == 0)
            {
                RatingError.Text = "Please enter a rating or status.";
                hasError = true;
            }
            else if (!IsValidRatingOrStatus(rating))
            {
                RatingError.Text = "Enter a rating 0-10 or a status.";
                hasError = true;
            }

            if (hasError)
            {
                ShowModal();
                return;
            }

            List<MovieItem> list = MovieList;
            int movieId;
            bool isEdit = int.TryParse(MovieIdField.Value, out movieId) && movieId >= 0;

            if (isEdit)
            {
                MovieItem m = list.Find(x => x.Id == movieId);
                if (m != null)
                {
                    m.Language = language;
                    m.Title = title;
                    m.Rating = rating;
                    m.Genre = genre;
                }
            }
            else
            {
                int nextId = 1;
                foreach (MovieItem m in list)
                {
                    if (m.Id >= nextId) nextId = m.Id + 1;
                }
                list.Add(new MovieItem { Id = nextId, Language = language, Title = title, Rating = rating, Genre = genre });
            }

            MovieList = list;
            SelectedGenre = "ALL";

            MovieModal.CssClass = "movie-modal-overlay";
            BindMovies();
        }

        private bool IsValidRatingOrStatus(string value)
        {
            if (string.Equals(value, "Now Showing", StringComparison.OrdinalIgnoreCase)) return true;
            if (string.Equals(value, "Coming Soon", StringComparison.OrdinalIgnoreCase)) return true;
            if (value == "-") return true;

            Match match = Regex.Match(value, @"^(10(\.0{1,2})?|[0-9](\.[0-9]{1,2})?)(/10)?$");
            return match.Success;
        }

        protected void MoviesRepeater_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id;
            if (!int.TryParse(Convert.ToString(e.CommandArgument), out id)) return;

            List<MovieItem> list = MovieList;
            MovieItem m = list.Find(x => x.Id == id);
            if (m == null) return;

            if (e.CommandName == "ViewMovie")
            {
                ViewMovieTitle.Text = "Movie Details - " + m.Title;
                ViewLanguage.Text = m.Language;
                ViewTitle.Text = m.Title;
                ViewRating.Text = m.Rating;
                ViewGenre.Text = m.Genre;
                ViewMovieModal.CssClass = "movie-modal-overlay show";
            }
            else if (e.CommandName == "EditMovie")
            {
                ClearValidation();
                MovieIdField.Value = id.ToString();
                MovieModalTitle.Text = "Edit Movie";
                MovieLanguage.SelectedValue = m.Language;
                MovieTitleInput.Text = m.Title;
                MovieRatingInput.Text = m.Rating;
                MovieGenreInput.SelectedValue = m.Genre;
                ShowModal();
            }
            else if (e.CommandName == "DeleteMovie")
            {
                list.RemoveAll(x => x.Id == id);
                MovieList = list;
                BindMovies();
            }
        }

        protected void FilterGenre_Command(object sender, CommandEventArgs e)
        {
            SelectedGenre = Convert.ToString(e.CommandArgument);
            BindMovies();
        }

        protected void CancelMovie_Click(object sender, EventArgs e)
        {
            MovieModal.CssClass = "movie-modal-overlay";
            ClearValidation();
            MovieTitleInput.Text = "";
            MovieRatingInput.Text = "";
            MovieIdField.Value = "-1";
        }

        protected void CancelView_Click(object sender, EventArgs e)
        {
            ViewMovieModal.CssClass = "movie-modal-overlay";
        }

        private void ShowModal()
        {
            MovieModal.CssClass = "movie-modal-overlay show";
        }

        private void ClearValidation()
        {
            LanguageError.Text = "";
            TitleError.Text = "";
            RatingError.Text = "";
        }
    }

    public class MovieItem
    {
        public int Id { get; set; }
        public string Language { get; set; }
        public string Title { get; set; }
        public string Rating { get; set; }
        public string Genre { get; set; }

        public int MovieId
        {
            get { return Id; }
            set { Id = value; }
        }

        public string RatingStatus
        {
            get { return Rating; }
            set { Rating = value; }
        }
    }
}