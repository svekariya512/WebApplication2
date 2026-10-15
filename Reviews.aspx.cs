using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Reviews : System.Web.UI.Page
    {
        private string CurrentFilter
        {
            get { return ViewState["Filter"] as string ?? "All"; }
            set { ViewState["Filter"] = value; }
        }

        private int CurrentViewReviewId
        {
            get { return Convert.ToInt32(ViewState["ViewReviewId"] ?? 0); }
            set { ViewState["ViewReviewId"] = value; }
        }

        // =========================================
        // IN-MEMORY DATA
        // =========================================
        private List<ReviewItem> ReviewList
        {
            get
            {
                if (Session["ReviewList"] == null)
                {
                    Session["ReviewList"] = new List<ReviewItem>
                    {
                        new ReviewItem { Id = 1, UserName = "Raj Patel", UserEmail = "raj@test.com", MovieName = "Inception", Rating = 5, ReviewText = "Mind-blowing movie! Highly recommended.", Status = "Approved", CreatedAt = DateTime.Now.AddDays(-2) },
                        new ReviewItem { Id = 2, UserName = "Priya Shah", UserEmail = "priya@test.com", MovieName = "Interstellar", Rating = 5, ReviewText = "Amazing visuals and story.", Status = "Pending", CreatedAt = DateTime.Now.AddDays(-1) },
                        new ReviewItem { Id = 3, UserName = "Amit Kumar", UserEmail = "amit@test.com", MovieName = "The Dark Knight", Rating = 5, ReviewText = "Best superhero movie ever!", Status = "Approved", CreatedAt = DateTime.Now.AddDays(-3) },
                        new ReviewItem { Id = 4, UserName = "Sneha Joshi", UserEmail = "sneha@test.com", MovieName = "Dune", Rating = 4, ReviewText = "Great cinematography.", Status = "Flagged", CreatedAt = DateTime.Now.AddDays(-5) }
                    };
                }
                return (List<ReviewItem>)Session["ReviewList"];
            }
            set { Session["ReviewList"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            // ⭐ C# thi header ma "Review Management" add karo
            RegisterHeaderTitle();

            if (!IsPostBack)
            {
                LoadReviews();
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
                    
                    if (header && searchArea && !document.getElementById('reviewsHeaderTitle')) {
                        var titleEl = document.createElement('div');
                        titleEl.id = 'reviewsHeaderTitle';
                        titleEl.innerText = 'Review Management';
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

            ScriptManager.RegisterStartupScript(this, this.GetType(), "reviewsHeaderTitle", script, true);
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

        public string GetStars(int rating)
        {
            string stars = "";
            for (int i = 0; i < 5; i++)
                stars += i < rating ? "★" : "☆";
            return stars;
        }

        public string GetStatusClass(string status)
        {
            if (status == "Approved") return "status-approved";
            if (status == "Flagged") return "status-flagged";
            return "status-pending";
        }

        // =========================================
        // LOAD REVIEWS
        // =========================================
        private void LoadReviews()
        {
            string search = txtReviewSearch.Text.Trim().ToLower();
            List<ReviewItem> filtered = new List<ReviewItem>();

            foreach (ReviewItem r in ReviewList)
            {
                if (CurrentFilter != "All" && r.Status != CurrentFilter) continue;

                if (!string.IsNullOrEmpty(search))
                {
                    if (!r.UserName.ToLower().Contains(search) &&
                        !r.MovieName.ToLower().Contains(search) &&
                        !r.ReviewText.ToLower().Contains(search))
                        continue;
                }

                filtered.Add(r);
            }

            rptReviews.DataSource = filtered;
            rptReviews.DataBind();
        }

        // =========================================
        // LOAD STATS
        // =========================================
        private void LoadStats()
        {
            List<ReviewItem> list = ReviewList;

            int total = list.Count;
            int pending = 0;
            int flagged = 0;
            int ratingSum = 0;

            foreach (ReviewItem r in list)
            {
                if (r.Status == "Pending") pending++;
                if (r.Status == "Flagged") flagged++;
                ratingSum += r.Rating;
            }

            decimal avgRating = total > 0 ? (decimal)ratingSum / total : 0;

            lblTotalReviews.Text = total.ToString();
            lblPending.Text = pending.ToString();
            lblFlagged.Text = flagged.ToString();
            lblAvgRating.Text = avgRating.ToString("0.0");
        }

        // =========================================
        // SEARCH
        // =========================================
        protected void txtReviewSearch_TextChanged(object sender, EventArgs e)
        {
            LoadReviews();
        }

        // =========================================
        // FILTER TAB
        // =========================================
        protected void FilterTab_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            CurrentFilter = btn.CommandArgument;
            LoadReviews();
        }

        // =========================================
        // REPEATER — View / Approve / Delete
        // =========================================
        protected void rptReviews_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            List<ReviewItem> list = ReviewList;
            ReviewItem r = list.Find(x => x.Id == id);
            if (r == null) return;

            // VIEW
            if (e.CommandName == "ViewReview")
            {
                CurrentViewReviewId = id;

                lblModalUser.Text = r.UserName;
                lblModalEmail.Text = r.UserEmail;
                lblModalMovie.Text = r.MovieName;
                lblModalStars.Text = GetStars(r.Rating);
                lblModalDate.Text = r.CreatedAt.ToString("dd MMM yyyy");
                lblModalStatus.Text = r.Status;
                lblModalReview.Text = r.ReviewText;

                btnModalApprove.Visible = r.Status != "Approved";

                ReviewModal.CssClass = "review-modal-overlay show";
            }
            // APPROVE
            else if (e.CommandName == "ApproveReview")
            {
                r.Status = "Approved";
                ReviewList = list;

                LoadReviews();
                LoadStats();

                ShowAlert("Review approved.");
            }
            // DELETE
            else if (e.CommandName == "DeleteReview")
            {
                list.RemoveAll(x => x.Id == id);
                ReviewList = list;

                LoadReviews();
                LoadStats();

                ShowAlert("Review deleted.");
            }
        }

        // =========================================
        // MODAL APPROVE BUTTON
        // =========================================
        protected void btnModalApprove_Click(object sender, EventArgs e)
        {
            int id = CurrentViewReviewId;

            if (id > 0)
            {
                List<ReviewItem> list = ReviewList;
                ReviewItem r = list.Find(x => x.Id == id);
                if (r != null)
                {
                    r.Status = "Approved";
                    ReviewList = list;
                }

                LoadReviews();
                LoadStats();
            }

            ReviewModal.CssClass = "review-modal-overlay";

            ShowAlert("Review approved.");
        }

        // =========================================
        // ⭐ CLOSE MODAL — AA METHOD JARURI CHHE
        // =========================================
        protected void btnCloseModal_Click(object sender, EventArgs e)
        {
            ReviewModal.CssClass = "review-modal-overlay";
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

    public class ReviewItem
    {
        public int Id { get; set; }
        public string UserName { get; set; }
        public string UserEmail { get; set; }
        public string MovieName { get; set; }
        public int Rating { get; set; }
        public string ReviewText { get; set; }
        public string Status { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}
