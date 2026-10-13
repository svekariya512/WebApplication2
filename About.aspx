<%@ Page Title="Manage About" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication2.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
    .about-page {
        width: 100%;
        min-height: 100vh;
        padding: 25px 35px 50px;
        background: #111111;
        color: #ffffff;
        font-family: Arial, Helvetica, sans-serif;
    }

    .card {
        width: 100%;
        background: #151515;
        border: 1px solid #2a2a2a;
        border-radius: 8px;
        overflow: hidden;
        margin-bottom: 30px;
    }

    .card-header {
        display: flex;
        align-items: flex-start;
        justify-content: space-between;
        padding: 20px 25px 15px;
        flex-wrap: wrap;
        gap: 12px;
    }

    .card-header-left h2 {
        margin: 0 0 6px;
        color: #fff;
        font-size: 16px;
        font-weight: 500;
    }

    .card-header-left p {
        margin: 0;
        color: #777;
        font-size: 11px;
    }

    .add-btn {
        padding: 8px 16px;
        background: #ff2222;
        border: none;
        border-radius: 4px;
        color: #fff;
        font-size: 11px;
        font-weight: 500;
        letter-spacing: .5px;
        cursor: pointer;
        transition: .2s;
    }
    .add-btn:hover { background: #ff4444; }

    .data-table { width: 100%; border-collapse: collapse; }

    .data-table thead th {
        height: 42px;
        padding: 0 25px;
        background: #111;
        border-top: 1px solid #252525;
        border-bottom: 1px solid #252525;
        color: #888;
        text-align: left;
        font-size: 11px;
        font-weight: normal;
        letter-spacing: 0.5px;
        text-transform: uppercase;
    }

    .data-table tbody td {
        padding: 14px 25px;
        border-bottom: 1px solid #202020;
        color: #ccc;
        font-size: 12px;
        vertical-align: middle;
    }

    .data-table tbody tr:last-child td { border-bottom: none; }
    .data-table tbody tr:hover { background: #1a1a1a; }

    .section-label { color: #888; font-size: 11px; }
    .content-label { color: #ccc; font-size: 12px; }

    .actions {
        display: flex;
        gap: 8px;
        align-items: center;
        justify-content: center;
    }

    /* ===== EDIT BUTTON ===== */
    .btn-edit {
        background: #ff2222;
        border: none;
        color: #fff;
        padding: 0 16px;
        height: 30px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 10px;
        font-weight: 500;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        text-decoration: none;              /* ⭐ Underline remove */
        white-space: nowrap;
    }
    .btn-edit:hover {
        background: #ff4444;
        text-decoration: none;
    }

    /* ===== DELETE BUTTON ===== */
    .btn-delete {
        background: transparent;
        border: 1px solid #333;
        color: #ccc;
        padding: 0 16px;
        height: 30px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 10px;
        font-weight: 500;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        text-decoration: none;              /* ⭐ Underline remove */
        white-space: nowrap;
    }
    .btn-delete:hover {
        background: #292929;
        color: #fff;
        border-color: #555;
        text-decoration: none;
    }

    /* ===== MODAL ===== */
    .modal-overlay {
        position: fixed;
        inset: 0;
        z-index: 9999;
        display: none;
        align-items: center;
        justify-content: center;
        background: rgba(0,0,0,.75);
    }
    .modal-overlay.show { display: flex; }

    .about-modal {
        width: 470px;
        max-width: 92%;
        max-height: 90vh;
        overflow-y: auto;
        padding: 25px;
        background: #1c1c1c;
        border: 1px solid #333;
        border-radius: 9px;
    }

    .modal-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 22px;
    }

    .modal-title { color: #fff; font-size: 17px; font-weight: 500; }

    .modal-close {
        padding: 0;
        background: transparent;
        border: none;
        color: #888;
        cursor: pointer;
        font-size: 24px;
    }
    .modal-close:hover { color: #fff; }

    .form-group { margin-bottom: 15px; }

    .form-group label {
        display: block;
        margin-bottom: 7px;
        color: #999;
        font-size: 10px;
        letter-spacing: 1px;
        text-transform: uppercase;
    }

    .form-group input,
    .form-group textarea {
        width: 100%;
        padding: 10px 12px;
        background: #111;
        border: 1px solid #333;
        border-radius: 5px;
        outline: none;
        color: #eee;
        font-size: 12px;
        box-sizing: border-box;
    }

    .form-group input { height: 38px; }
    .form-group textarea { min-height: 90px; resize: vertical; }

    .form-group input:focus,
    .form-group textarea:focus { border-color: #ff3333; }

    .error-msg {
        display: block;
        color: #ff6666;
        font-size: 10px;
        margin-top: 5px;
    }

    .modal-buttons {
        display: flex;
        justify-content: flex-end;
        gap: 10px;
        margin-top: 22px;
    }

    .cancel-btn, .save-btn {
        height: 36px;
        padding: 0 18px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 11px;
        font-weight: 600;
    }

    .cancel-btn {
        background: #222;
        border: 1px solid #444;
        color: #bbb;
    }
    .cancel-btn:hover { background: #2d2d2d; color: #fff; }

    .save-btn {
        background: #ff2222;
        border: 1px solid #ff2222;
        color: #fff;
    }
    .save-btn:hover { background: #ff4444; }

    @media screen and (max-width: 900px) {
        .about-page { padding: 20px 15px 40px; }
        .card { overflow-x: auto; }
        .data-table { min-width: 700px; }
    }
</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HiddenField ID="hdnEditAboutId" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnEditType" runat="server" ClientIDMode="Static" />

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var hamburger = document.getElementById("mainHamburger");
            if (hamburger) { hamburger.style.display = "flex"; }

            var header = document.querySelector(".cine-header");
            var searchArea = document.querySelector(".header-search-area");

            if (header && searchArea && !document.getElementById("aboutHeaderTitle")) {
                var titleEl = document.createElement("div");
                titleEl.id = "aboutHeaderTitle";
                titleEl.innerText = "Manage About Content";
                titleEl.style.color = "#FFC3B9";
                titleEl.style.fontSize = "22px";
                titleEl.style.fontWeight = "500";
                titleEl.style.letterSpacing = "0.5px";
                titleEl.style.whiteSpace = "nowrap";
                titleEl.style.marginLeft = "10px";
                titleEl.style.marginRight = "10px";
                header.insertBefore(titleEl, searchArea);
            }
        });

        function closeAboutModal() {
            document.getElementById("aboutModal").classList.remove("show");
            document.getElementById("hdnEditAboutId").value = "";
        }

        document.addEventListener("click", function (event) {
            var modal = document.getElementById("aboutModal");
            if (event.target === modal) { closeAboutModal(); }
        });

        document.addEventListener("keydown", function (event) {
            if (event.key === "Escape") { closeAboutModal(); }
        });

        /* ADD SECTION */
        function openAddSection() {
            document.getElementById("aboutModalTitle").innerText = "Add Section";
            document.getElementById("hdnEditType").value = "HeroStory";
            document.getElementById("txtSection").value = "";
            document.getElementById("txtContent").value = "";
            document.getElementById("txtAmenities").value = "";
            document.getElementById("hdnEditAboutId").value = "";
            document.getElementById("btnSaveAbout").value = "Save Section";
            document.getElementById("aboutModal").classList.add("show");
            setTimeout(function () { document.getElementById("txtSection").focus(); }, 100);
        }

        /* ADD FEATURE */
        function openAddFeature() {
            document.getElementById("aboutModalTitle").innerText = "Add Feature";
            document.getElementById("hdnEditType").value = "Quality";
            document.getElementById("txtSection").value = "";
            document.getElementById("txtContent").value = "";
            document.getElementById("txtAmenities").value = "";
            document.getElementById("hdnEditAboutId").value = "";
            document.getElementById("btnSaveAbout").value = "Save Feature";
            document.getElementById("aboutModal").classList.add("show");
            setTimeout(function () { document.getElementById("txtSection").focus(); }, 100);
        }

        /* ADD THEATER */
        function openAddTheater() {
            document.getElementById("aboutModalTitle").innerText = "Add Theater";
            document.getElementById("hdnEditType").value = "Theater";
            document.getElementById("txtSection").value = "";
            document.getElementById("txtContent").value = "";
            document.getElementById("txtAmenities").value = "";
            document.getElementById("hdnEditAboutId").value = "";
            document.getElementById("btnSaveAbout").value = "Save Theater";
            document.getElementById("aboutModal").classList.add("show");
            setTimeout(function () { document.getElementById("txtSection").focus(); }, 100);
        }
    </script>

    <div class="about-page">

        <!-- ================= CARD 1 : HERO & STORY ================= -->
        <div class="card">
            <div class="card-header">
                <div class="card-header-left">
                    <h2>Hero &amp; Story Content</h2>
                    <p>Manage main headings and brand story</p>
                </div>
                <button type="button" class="add-btn" onclick="openAddSection();">+ ADD SECTION</button>
            </div>

            <table class="data-table">
                <thead>
                    <tr><th>Section</th><th>Content</th><th style="text-align:center;">Action</th></tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptHeroStory" runat="server" OnItemCommand="rptAbout_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td class="section-label"><%# Eval("Section") %></td>
                                <td class="content-label"><%# Eval("Content") %></td>
                                <td>
                                    <div class="actions">
                                        <asp:LinkButton runat="server" CssClass="btn-edit" Text="EDIT"
                                            CommandName="EditAbout" CommandArgument='<%# Eval("Id") %>' />
                                        <asp:LinkButton runat="server" CssClass="btn-delete" Text="DELETE"
                                            CommandName="DeleteAbout" CommandArgument='<%# Eval("Id") %>'
                                            OnClientClick="return confirm('Delete this section?');" />
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>


        <!-- ================= CARD 2 : QUALITY ================= -->
        <div class="card">
            <div class="card-header">
                <div class="card-header-left">
                    <h2>Uncompromising Quality</h2>
                    <p>The finest technology for the ultimate immersion.</p>
                </div>
                <button type="button" class="add-btn" onclick="openAddFeature();">+ ADD FEATURE</button>
            </div>

            <table class="data-table">
                <thead>
                    <tr><th>Feature</th><th>Description</th><th style="text-align:center;">Action</th></tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptQuality" runat="server" OnItemCommand="rptAbout_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td class="section-label"><%# Eval("Section") %></td>
                                <td class="content-label"><%# Eval("Content") %></td>
                                <td>
                                    <div class="actions">
                                        <asp:LinkButton runat="server" CssClass="btn-edit" Text="EDIT"
                                            CommandName="EditAbout" CommandArgument='<%# Eval("Id") %>' />
                                        <asp:LinkButton runat="server" CssClass="btn-delete" Text="DELETE"
                                            CommandName="DeleteAbout" CommandArgument='<%# Eval("Id") %>'
                                            OnClientClick="return confirm('Delete this feature?');" />
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>


        <!-- ================= CARD 3 : THEATERS ================= -->
        <div class="card">
            <div class="card-header">
                <div class="card-header-left">
                    <h2>Our Theaters</h2>
                    <p>Find a premium Cineplus experience near you.</p>
                </div>
                <button type="button" class="add-btn" onclick="openAddTheater();">+ ADD THEATER</button>
            </div>

            <table class="data-table">
                <thead>
                    <tr>
                        <th>Theater Name</th>
                        <th>Location</th>
                        <th>Amenities</th>
                        <th style="text-align:center;">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptTheaters" runat="server" OnItemCommand="rptAbout_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td class="section-label"><%# Eval("Section") %></td>
                                <td class="content-label"><%# Eval("Content") %></td>
                                <td class="content-label"><%# Eval("Amenities") %></td>
                                <td>
                                    <div class="actions">
                                        <asp:LinkButton runat="server" CssClass="btn-edit" Text="EDIT"
                                            CommandName="EditAbout" CommandArgument='<%# Eval("Id") %>' />
                                        <asp:LinkButton runat="server" CssClass="btn-delete" Text="DELETE"
                                            CommandName="DeleteAbout" CommandArgument='<%# Eval("Id") %>'
                                            OnClientClick="return confirm('Delete this theater?');" />
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>

    </div>


    <!-- ============ MODAL ============ -->
    <div id="aboutModal" class="modal-overlay">
        <div class="about-modal">

            <div class="modal-header">
                <div class="modal-title" id="aboutModalTitle">Add Section</div>
                <button type="button" class="modal-close" onclick="closeAboutModal();">×</button>
            </div>

            <div class="form-group">
                <label>Name / Feature / Theater</label>
                <asp:TextBox ID="txtSection" runat="server" ClientIDMode="Static" placeholder="Enter name..." />
            </div>

            <div class="form-group">
                <label>Content / Description / Location</label>
                <asp:TextBox ID="txtContent" runat="server" ClientIDMode="Static"
                    TextMode="MultiLine" placeholder="Enter content..." />
            </div>

            <div class="form-group">
                <label>Amenities (Theaters only)</label>
                <asp:TextBox ID="txtAmenities" runat="server" ClientIDMode="Static" placeholder="e.g. IMAX, ATMOS" />
            </div>

            <div class="modal-buttons">
                <button type="button" class="cancel-btn" onclick="closeAboutModal();">Cancel</button>
                <asp:Button ID="btnSaveAbout" runat="server" ClientIDMode="Static"
                    CssClass="save-btn" Text="Save Section"
                    OnClick="btnSaveAbout_Click" />
            </div>

        </div>
    </div>

</asp:Content>