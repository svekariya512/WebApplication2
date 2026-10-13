using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class About : System.Web.UI.Page
    {
        // =========================================
        // IN-MEMORY DATA (Session-Based)
        // =========================================
        private List<AboutItem> AboutItems
        {
            get
            {
                if (Session["AboutItems"] == null)
                {
                    Session["AboutItems"] = new List<AboutItem>
                    {
                        // ===== HeroStory (4 rows) =====
                        new AboutItem { Id = 1, Section = "Main Title", Content = "Redefining the Cinematic Experience", Amenities = "", Category = "HeroStory" },
                        new AboutItem { Id = 2, Section = "Description", Content = "Where cutting-edge technology meets unparalleled luxury. Step into a world where every screening is an event.", Amenities = "", Category = "HeroStory" },
                        new AboutItem { Id = 3, Section = "Story Title", Content = "Our Story", Amenities = "", Category = "HeroStory" },
                        new AboutItem { Id = 4, Section = "Story Content", Content = "Founded in 2010, CinePulse has grown to become the premier destination for cinema lovers.", Amenities = "", Category = "HeroStory" },

                        // ===== Quality (3 rows) =====
                        new AboutItem { Id = 5, Section = "Dolby Atmos", Content = "Sound that moves around you in three-dimensional space, bringing every scene to vivid life.", Amenities = "", Category = "Quality" },
                        new AboutItem { Id = 6, Section = "Luxury Recliners", Content = "Plush leather push-back seats with extra legroom, designed for maximum comfort during long movies.", Amenities = "", Category = "Quality" },
                        new AboutItem { Id = 7, Section = "IMAX with Laser", Content = "Crystal clear, larger-than-life images with unprecedented contrast and color accuracy.", Amenities = "", Category = "Quality" },

                        // ===== Theater (2 rows) =====
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
                LoadAll();
            }
        }

        // =========================================
        // LOAD ALL SECTIONS
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
        // SAVE (Add / Edit)
        // =========================================
        protected void btnSaveAbout_Click(object sender, EventArgs e)
        {
            string section = txtSection.Text.Trim();
            string content = txtContent.Text.Trim();
            string amenities = txtAmenities.Text.Trim();
            string editId = hdnEditAboutId.Value;
            string category = hdnEditType.Value;

            // Validation
            if (string.IsNullOrEmpty(section))
            {
                ShowAlert("Name / Feature / Theater is required.");
                KeepModalOpen();
                return;
            }

            if (string.IsNullOrEmpty(content))
            {
                ShowAlert("Content / Description / Location is required.");
                KeepModalOpen();
                return;
            }

            if (string.IsNullOrEmpty(category))
            {
                ShowAlert("Invalid category.");
                KeepModalOpen();
                return;
            }

            List<AboutItem> items = AboutItems;

            if (!string.IsNullOrEmpty(editId))
            {
                // UPDATE
                int id = Convert.ToInt32(editId);
                AboutItem item = items.Find(x => x.Id == id);
                if (item != null)
                {
                    item.Section = section;
                    item.Content = content;
                    item.Amenities = amenities;
                }
            }
            else
            {
                // INSERT
                int newId = 1;
                foreach (AboutItem i in items)
                {
                    if (i.Id >= newId) newId = i.Id + 1;
                }

                items.Add(new AboutItem
                {
                    Id = newId,
                    Section = section,
                    Content = content,
                    Amenities = amenities,
                    Category = category
                });
            }

            AboutItems = items;
            hdnEditAboutId.Value = "";

            string script = "alert('Saved successfully.');" +
                            "document.getElementById('aboutModal').classList.remove('show');";
            ScriptManager.RegisterStartupScript(this, this.GetType(), "msg", script, true);

            LoadAll();
        }

        // =========================================
        // EDIT / DELETE
        // =========================================
        protected void rptAbout_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);
            List<AboutItem> items = AboutItems;

            if (e.CommandName == "DeleteAbout")
            {
                items.RemoveAll(x => x.Id == id);
                AboutItems = items;
                LoadAll();
                ShowAlert("Deleted successfully.");
            }
            else if (e.CommandName == "EditAbout")
            {
                AboutItem item = items.Find(x => x.Id == id);
                if (item != null)
                {
                    txtSection.Text = item.Section;
                    txtContent.Text = item.Content;
                    txtAmenities.Text = item.Amenities;
                    hdnEditAboutId.Value = item.Id.ToString();
                    hdnEditType.Value = item.Category;

                    string titleText = "Edit";
                    string saveBtnText = "Save Changes";

                    if (item.Category == "HeroStory") { titleText = "Edit Section"; saveBtnText = "Save Section"; }
                    else if (item.Category == "Quality") { titleText = "Edit Feature"; saveBtnText = "Save Feature"; }
                    else if (item.Category == "Theater") { titleText = "Edit Theater"; saveBtnText = "Save Theater"; }

                    string script =
                        "document.getElementById('aboutModalTitle').innerText='" + titleText + "';" +
                        "document.getElementById('btnSaveAbout').value='" + saveBtnText + "';" +
                        "document.getElementById('aboutModal').classList.add('show');";
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "openEdit", script, true);
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

        private void KeepModalOpen()
        {
            string script = "document.getElementById('aboutModal').classList.add('show');";
            ScriptManager.RegisterStartupScript(this, this.GetType(),
                "keepOpen" + Guid.NewGuid().ToString("N"), script, true);
        }
    }

    // =========================================
    // MODEL CLASS
    // =========================================
    public class AboutItem
    {
        public int Id { get; set; }
        public string Section { get; set; }
        public string Content { get; set; }
        public string Amenities { get; set; }
        public string Category { get; set; }
    }
}