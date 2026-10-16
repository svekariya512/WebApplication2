using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class About : Page
    {
        // =========================================
        // SESSION-BASED DATA
        // =========================================
        private List<AboutItem> AboutItems
        {
            get
            {
                if (Session["AboutItems"] == null)
                {
                    Session["AboutItems"] = new List<AboutItem>
                    {
                        new AboutItem { Id = 1, Section = "Main Title", Content = "Redefining the Cinematic Experience", Amenities = "", Category = "HeroStory" },
                        new AboutItem { Id = 2, Section = "Description", Content = "Where cutting-edge technology meets unparalleled luxury.", Amenities = "", Category = "HeroStory" },
                        new AboutItem { Id = 3, Section = "Story Title", Content = "Our Story", Amenities = "", Category = "HeroStory" },
                        new AboutItem { Id = 4, Section = "Story Content", Content = "Founded in 2010...", Amenities = "", Category = "HeroStory" },
                        new AboutItem { Id = 5, Section = "Dolby Atmos", Content = "Sound that moves around you in three-dimensional space.", Amenities = "", Category = "Quality" },
                        new AboutItem { Id = 6, Section = "Luxury Recliners", Content = "Plush leather push-back seats with extra legroom.", Amenities = "", Category = "Quality" },
                        new AboutItem { Id = 7, Section = "IMAX with Laser", Content = "Crystal clear, larger-than-life images.", Amenities = "", Category = "Quality" },
                        new AboutItem { Id = 8, Section = "Cineplus Downtown", Content = "Mumbai, MH", Amenities = "IMAX, ATMOS", Category = "Theater" },
                        new AboutItem { Id = 9, Section = "Cineplus Westside", Content = "Ahmedabad, GJ", Amenities = "ATMOS, GOLD CLASS", Category = "Theater" }
                    };
                }
                return (List<AboutItem>)Session["AboutItems"];
            }
            set { Session["AboutItems"] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // ⭐ હેડરમાં "About Management" સેટ કરવા માટે
                SetHeaderTitle("About Management");

                LoadAll();
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

        // =========================================
        // LOAD ALL
        // =========================================
        private void LoadAll()
        {
            LoadHeroStory();
            LoadQuality();
            LoadTheaters();
        }

        private void LoadHeroStory()
        {
            List<AboutItem> items = AboutItems.FindAll(x => x.Category == "HeroStory");
            rptHeroStory.DataSource = items;
            rptHeroStory.DataBind();
        }

        private void LoadQuality()
        {
            List<AboutItem> items = AboutItems.FindAll(x => x.Category == "Quality");
            rptQuality.DataSource = items;
            rptQuality.DataBind();
        }

        private void LoadTheaters()
        {
            List<AboutItem> items = AboutItems.FindAll(x => x.Category == "Theater");
            rptTheaters.DataSource = items;
            rptTheaters.DataBind();
        }

        // =========================================
        // ADD BUTTONS
        // =========================================
        protected void btnAddSection_Click(object sender, EventArgs e)
        {
            hdnEditAboutId.Value = "";
            hdnEditType.Value = "HeroStory";
            lblModalTitle.Text = "Add Section";
            txtItemName.Text = "";
            txtItemContent.Text = "";
            txtItemAmenities.Text = "";
            lblValidation.Text = "";
            lblSuccess.Text = "";

            AboutModal.CssClass = "modal-overlay show";
        }

        protected void btnAddFeature_Click(object sender, EventArgs e)
        {
            hdnEditAboutId.Value = "";
            hdnEditType.Value = "Quality";
            lblModalTitle.Text = "Add Feature";
            txtItemName.Text = "";
            txtItemContent.Text = "";
            txtItemAmenities.Text = "";
            lblValidation.Text = "";
            lblSuccess.Text = "";

            AboutModal.CssClass = "modal-overlay show";
        }

        protected void btnAddTheater_Click(object sender, EventArgs e)
        {
            hdnEditAboutId.Value = "";
            hdnEditType.Value = "Theater";
            lblModalTitle.Text = "Add Theater";
            txtItemName.Text = "";
            txtItemContent.Text = "";
            txtItemAmenities.Text = "";
            lblValidation.Text = "";
            lblSuccess.Text = "";

            AboutModal.CssClass = "modal-overlay show";
        }

        // =========================================
        // SAVE — C# VALIDATION
        // =========================================
        protected void btnSaveAbout_Click(object sender, EventArgs e)
        {
            lblValidation.Text = "";
            lblSuccess.Text = "";

            string editId = hdnEditAboutId.Value;
            string category = hdnEditType.Value;
            string name = txtItemName.Text.Trim();
            string content = txtItemContent.Text.Trim();
            string amenities = txtItemAmenities.Text.Trim();

            // ===== VALIDATION =====
            if (string.IsNullOrEmpty(category))
            {
                ShowValidation("Invalid operation. Please reopen the form.");
                return;
            }

            string[] validCategories = { "HeroStory", "Quality", "Theater" };
            if (Array.IndexOf(validCategories, category) < 0)
            {
                ShowValidation("Invalid category.");
                return;
            }

            if (string.IsNullOrEmpty(name))
            {
                ShowValidation("Name / Title is required.");
                return;
            }

            if (name.Length < 2)
            {
                ShowValidation("Name must be at least 2 characters.");
                return;
            }

            if (name.Length > 100)
            {
                ShowValidation("Name cannot exceed 100 characters.");
                return;
            }

            if (!Regex.IsMatch(name, @"^[\p{L}\p{N}\s.\-&',()]+$"))
            {
                ShowValidation("Name contains invalid characters.");
                return;
            }

            if (category == "HeroStory" || category == "Quality")
            {
                if (string.IsNullOrEmpty(content))
                {
                    ShowValidation("Content / Description is required.");
                    return;
                }

                if (content.Length < 3)
                {
                    ShowValidation("Content must be at least 3 characters.");
                    return;
                }

                if (content.Length > 1000)
                {
                    ShowValidation("Content cannot exceed 1000 characters.");
                    return;
                }
            }
            else if (category == "Theater")
            {
                if (string.IsNullOrEmpty(content))
                {
                    ShowValidation("Location is required.");
                    return;
                }

                if (content.Length < 2)
                {
                    ShowValidation("Location must be at least 2 characters.");
                    return;
                }

                if (content.Length > 200)
                {
                    ShowValidation("Location cannot exceed 200 characters.");
                    return;
                }

                if (string.IsNullOrEmpty(amenities))
                {
                    ShowValidation("Amenities are required.");
                    return;
                }

                if (amenities.Length > 300)
                {
                    ShowValidation("Amenities cannot exceed 300 characters.");
                    return;
                }
            }

            // ===== SAVE =====
            try
            {
                List<AboutItem> items = AboutItems;

                if (!string.IsNullOrEmpty(editId))
                {
                    int id = Convert.ToInt32(editId);
                    AboutItem item = items.Find(x => x.Id == id);
                    if (item != null)
                    {
                        item.Section = name;
                        item.Content = content;
                        item.Amenities = amenities;
                    }
                }
                else
                {
                    int newId = 1;
                    foreach (AboutItem i in items)
                    {
                        if (i.Id >= newId) newId = i.Id + 1;
                    }

                    items.Add(new AboutItem
                    {
                        Id = newId,
                        Section = name,
                        Content = content,
                        Amenities = amenities,
                        Category = category
                    });
                }

                AboutItems = items;
                hdnEditAboutId.Value = "";

                ShowSuccess("✓ Saved successfully!");

                LoadAll();

                // ⭐ JavaScript વગર મોડલ બંધ કરવા માટે C# થી ક્લાસ બદલો
                AboutModal.CssClass = "modal-overlay";
            }
            catch (Exception ex)
            {
                ShowValidation("Error: " + ex.Message);
            }
        }

        // =========================================
        // REPEATER — EDIT / DELETE
        // =========================================
        protected void rptAbout_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            List<AboutItem> items = AboutItems;
            AboutItem item = items.Find(x => x.Id == id);
            if (item == null) return;

            if (e.CommandName == "DeleteAbout")
            {
                items.RemoveAll(x => x.Id == id);
                AboutItems = items;
                LoadAll();
            }
            else if (e.CommandName == "EditAbout")
            {
                hdnEditAboutId.Value = item.Id.ToString();
                hdnEditType.Value = item.Category;

                txtItemName.Text = item.Section;
                txtItemContent.Text = item.Content;
                txtItemAmenities.Text = item.Amenities;

                string titleText = "Edit";
                if (item.Category == "HeroStory") titleText = "Edit Section";
                else if (item.Category == "Quality") titleText = "Edit Feature";
                else if (item.Category == "Theater") titleText = "Edit Theater";

                lblModalTitle.Text = titleText;
                lblValidation.Text = "";
                lblSuccess.Text = "";

                AboutModal.CssClass = "modal-overlay show";
            }
        }

        // =========================================
        // CLOSE MODAL
        // =========================================
        protected void btnCloseModal_Click(object sender, EventArgs e)
        {
            AboutModal.CssClass = "modal-overlay";
            hdnEditAboutId.Value = "";
            lblValidation.Text = "";
            lblSuccess.Text = "";
        }

        // =========================================
        // HELPERS
        // =========================================
        private void ShowValidation(string message)
        {
            lblValidation.Text = "✗ " + HttpUtility.HtmlEncode(message);
        }

        private void ShowSuccess(string message)
        {
            lblSuccess.Text = message;
        }
    }

    public class AboutItem
    {
        public int Id { get; set; }
        public string Section { get; set; }
        public string Content { get; set; }
        public string Amenities { get; set; }
        public string Category { get; set; }
    }
}
