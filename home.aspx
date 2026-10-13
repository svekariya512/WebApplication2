<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="WebApplication2.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
    .dashboard-page { width:100%; padding:25px 35px 50px 35px; background:#111; min-height:100vh; font-family:Arial,Helvetica,sans-serif; }

    /* ===== CARD ===== */
    .card { width:100%; background:#151515; border:1px solid #2a2a2a; border-radius:8px; overflow:hidden; margin-bottom:30px; }
    .card-header { display:flex; justify-content:space-between; align-items:flex-start; padding:20px 25px 15px; flex-wrap:wrap; gap:12px; }
    .card-header-left h2 { margin:0 0 6px; color:#fff; font-size:16px; font-weight:500; }
    .card-header-left p { margin:0; color:#777; font-size:11px; }
    .header-actions { display:flex; align-items:center; gap:14px; }
    .view-all { color:#ff3333; text-decoration:none; font-size:11px; font-weight:500; }
    .view-all:hover { color:#ff7777; }
    .add-btn { background:#ff5f5f; color:#fff; border:none; padding:8px 16px; border-radius:5px; font-size:11px; font-weight:600; cursor:pointer; }
    .add-btn:hover { background:#ff4646; }

    /* ===== TABLES ===== */
    .movie-table { width:100%; border-collapse:collapse; }
    .movie-table thead th { height:40px; background:#111; border-top:1px solid #252525; border-bottom:1px solid #252525; color:#888; font-size:11px; font-weight:normal; text-align:left; padding:0 25px; }
    .movie-table tbody td { height:55px; border-bottom:1px solid #202020; color:#ccc; font-size:12px; padding:0 25px; vertical-align:middle; }
    .movie-table tbody tr:last-child td { border-bottom:none; }
    .movie-table tbody tr:hover { background:#1a1a1a; }

    .movie-title-cell { display:flex; align-items:center; gap:12px; }
    .movie-icon { width:18px; height:18px; display:flex; align-items:center; justify-content:center; color:#888; font-size:12px; }
    .rating { color:#ddd !important; }

    /* ===== ACTIONS ===== */
    .actions { display: flex; flex-direction: row; gap: 8px; align-items: center; }

    .btn-edit {
        background: transparent;
        border: 1px solid #551818;
        color: #ff3333;
        font-size: 10px;
        font-weight: 500;
        height: 26px;
        padding: 0 14px;
        border-radius: 4px;
        cursor: pointer;
        transition: 0.2s;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        justify-content: center;
    }
    .btn-edit:hover { background: #351515; color: #ff3333; text-decoration: none; }

    .btn-delete {
        background: transparent;
        border: 1px solid #444;
        color: #ccc;
        font-size: 10px;
        font-weight: 500;
        height: 26px;
        padding: 0 14px;
        border-radius: 4px;
        cursor: pointer;
        transition: 0.2s;
        text-decoration: none;
        display: inline-flex;
        align-items: center;
        justify-content: center;
    }
    .btn-delete:hover { background: #292929; color: #ff5f5f; border-color: #ff5f5f; text-decoration: none; }

    /* ===== HERO TABLE ===== */
    .hero-table { width:100%; border-collapse:collapse; }
    .hero-table thead th { height:40px; background:#111; border-top:1px solid #252525; border-bottom:1px solid #252525; color:#888; font-size:11px; font-weight:normal; text-align:left; padding:0 25px; }
    .hero-table tbody td { padding:18px 25px; border-bottom:1px solid #202020; color:#ccc; font-size:12px; }
    .hero-table tbody tr:last-child td { border-bottom:none; }
    .hero-table tbody tr:hover { background:#1a1a1a; }

    .brand { color:#ccc; font-size:11px; font-weight:500; letter-spacing:1px; }
    .hero-title { color:#ddd; font-size:12px; line-height:16px; font-weight:500; }
    .hero-description { display:block; max-width:450px; margin-top:5px; color:#777; font-size:10px; line-height:14px; font-weight:normal; }
    .status { display:flex; align-items:center; gap:8px; }
    .status-dot { width:7px; height:7px; background:#00dd66; border-radius:50%; }
    .status-dot.inactive { background:#777; }
    .status-text { color:#ccc; font-size:11px; }
    .featured { display:inline-block; color:#ff3333; border:1px solid #4c1515; padding:4px 12px; font-size:10px; border-radius:4px; font-weight:500; text-decoration: none; }
    .not-featured { display:inline-block; color:#888; border:1px solid #333; padding:4px 12px; font-size:10px; border-radius:4px; font-weight:500; text-decoration: none; }

    /* =========================================
       MODAL
    ========================================= */
    .movie-modal-overlay {
        display: none;
        position: fixed;
        z-index: 99999;
        inset: 0;
        width: 100%;
        height: 100%;
        background: rgba(0,0,0,.78);
        align-items: center;
        justify-content: center;
        padding: 15px;
    }
    .movie-modal-overlay.show { display: flex; }

    .movie-modal {
        width: 540px;
        max-width: 100%;
        max-height: 90vh;
        overflow-y: auto;
        background: #1c1c1c;
        border: 1px solid #3a3a3a;
        border-radius: 8px;
        box-shadow: 0 25px 70px rgba(0,0,0,.7);
    }

    .movie-modal-header {
        min-height: 65px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 0 22px;
        border-bottom: 1px solid #2e2e2e;
    }

    .movie-modal-title { color: #fff; font-size: 16px; font-weight: 600; letter-spacing: 0.3px; }

    .movie-modal-close {
        width: 30px;
        height: 30px;
        background: #2a2a2a;
        border: none;
        border-radius: 4px;
        color: #aaa;
        font-size: 16px;
        cursor: pointer;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        transition: 0.2s;
    }
    .movie-modal-close:hover { background: #3a3a3a; color: #fff; }

    .movie-modal-body { padding: 22px; }

    .modal-field { margin-bottom: 18px; }
    .modal-field:last-child { margin-bottom: 0; }

    .modal-field label {
        display: block;
        color: #999;
        font-size: 10px;
        text-transform: uppercase;
        letter-spacing: 0.8px;
        margin-bottom: 8px;
        font-weight: 500;
    }

    .modal-input, .modal-select {
        width: 100%;
        height: 42px;
        background: #111;
        border: 1px solid #333;
        border-radius: 4px;
        color: #fff;
        outline: none;
        padding: 0 14px;
        font-size: 12px;
        font-family: Arial, Helvetica, sans-serif;
        box-sizing: border-box;
    }
    .modal-input::placeholder { color: #555; }
    .modal-input:focus, .modal-select:focus { border-color: #ff5f5f; }

    .modal-select {
        cursor: pointer;
        appearance: none;
        -webkit-appearance: none;
        background-image: url("data:image/svg+xml;charset=UTF-8,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 24 24' fill='none' stroke='%23888' stroke-width='2' stroke-linecap='round' stroke-linejoin='round'%3e%3cpolyline points='6 9 12 15 18 9'%3e%3c/polyline%3e%3c/svg%3e");
        background-repeat: no-repeat;
        background-position: right 14px center;
        background-size: 14px;
        padding-right: 40px;
    }
    .modal-select option { background: #181818; color: #fff; }

    .modal-textarea {
        width: 100%;
        min-height: 80px;
        background: #111;
        border: 1px solid #333;
        border-radius: 4px;
        color: #fff;
        outline: none;
        padding: 12px 14px;
        font-size: 12px;
        font-family: Arial, Helvetica, sans-serif;
        resize: vertical;
        box-sizing: border-box;
    }
    .modal-textarea::placeholder { color: #555; }
    .modal-textarea:focus { border-color: #ff5f5f; }

    .movie-modal-footer {
        display: flex;
        justify-content: flex-end;
        gap: 10px;
        padding: 18px 22px;
        background: #191919;
        border-top: 1px solid #2e2e2e;
    }

    .modal-cancel, .modal-save {
        height: 38px;
        padding: 0 22px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 12px;
        font-weight: 600;
        border: none;
        font-family: Arial, Helvetica, sans-serif;
    }

    .modal-cancel { background: #2e2e2e; color: #ccc; }
    .modal-cancel:hover { background: #3a3a3a; color: #fff; }

    .modal-save { background: #ff5f5f; color: #fff; }
    .modal-save:hover { background: #ff4646; }

    .error-msg { display:block; color:#ff5f5f; font-size:10px; margin-top:6px; line-height:15px; }

    @media(max-width:700px) {
        .dashboard-page { padding:20px 15px 40px; }
    }
</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HiddenField ID="hdnEditMovieId" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnEditHeroId" runat="server" ClientIDMode="Static" />

<div class="dashboard-page">

    <!-- ================= MOVIES ================= -->
    <div class="card">

        <div class="card-header">
            <div class="card-header-left">
                <h2>Movie Listings</h2>
                <p>High-density catalog view</p>
            </div>
            <div class="header-actions">
                <a href="Movies.aspx" class="view-all">View All →</a>
                <button type="button" class="add-btn" onclick="openMovieAdd();">+ Add Movie</button>
            </div>
        </div>

        <table class="movie-table">
            <thead>
                <tr>
                    <th>Movie Title</th>
                    <th>Rating</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptMovies" runat="server" OnItemCommand="rptMovies_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <div class="movie-title-cell">
                                    <span class="movie-icon">▣</span>
                                    <span><%# Eval("Title") %></span>
                                </div>
                            </td>
                            <td class="rating"><%# Eval("Rating") %>/10</td>
                            <td>
                                <div class="actions">
                                    <asp:LinkButton runat="server" CssClass="btn-edit" Text="EDIT"
                                        CommandName="EditMovie" CommandArgument='<%# Eval("Id") %>' />
                                    <asp:LinkButton runat="server" CssClass="btn-delete" Text="DELETE"
                                        CommandName="DeleteMovie" CommandArgument='<%# Eval("Id") %>'
                                        OnClientClick="return confirm('Delete this movie?');" />
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>

    </div>


    <!-- ================= HERO ================= -->
    <div class="card">

        <div class="card-header">
            <div class="card-header-left">
                <h2>Hero Content Management</h2>
                <p>Manage featured cinematic assets and promotional banners</p>
            </div>
            <div class="header-actions">
                <button type="button" class="add-btn" onclick="openHeroAdd();">+ Add Hero</button>
            </div>
        </div>

        <table class="hero-table">
            <thead>
                <tr>
                    <th>BRAND / CHANNEL</th>
                    <th>MOVIE TITLE</th>
                    <th>STATUS</th>
                    <th>POSITION</th>
                    <th>ACTION</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptHero" runat="server" OnItemCommand="rptHero_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td><span class="brand"><%# Eval("Brand") %></span></td>
                            <td>
                                <div class="hero-title">
                                    <%# Eval("MovieTitle") %>
                                    <span class="hero-description"><%# Eval("Description") %></span>
                                </div>
                            </td>
                            <td>
                                <div class="status">
                                    <span class='<%# "status-dot " + (Eval("Status").ToString() == "Inactive" ? "inactive" : "") %>'></span>
                                    <span class="status-text"><%# Eval("Status") %></span>
                                </div>
                            </td>
                            <td>
                                <span class='<%# Eval("Position").ToString() == "Featured" ? "featured" : "not-featured" %>'>
                                    <%# Eval("Position").ToString().ToUpper() %>
                                </span>
                            </td>
                            <td>
                                <div class="actions">
                                    <asp:LinkButton runat="server" CssClass="btn-edit" Text="EDIT"
                                        CommandName="EditHero" CommandArgument='<%# Eval("Id") %>' />
                                    <asp:LinkButton runat="server" CssClass="btn-delete" Text="DELETE"
                                        CommandName="DeleteHero" CommandArgument='<%# Eval("Id") %>'
                                        OnClientClick="return confirm('Delete this hero?');" />
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>

    </div>

</div>


<!-- ============================================
     MOVIE MODAL — ClientIDMode="Static" ⭐
============================================ -->
<asp:Panel ID="MovieModal" runat="server" CssClass="movie-modal-overlay" ClientIDMode="Static">
    <div class="movie-modal">

        <div class="movie-modal-header">
            <asp:Label ID="MovieModalTitle" runat="server" Text="Add New Movie" CssClass="movie-modal-title" ClientIDMode="Static"></asp:Label>
            <asp:Button ID="CloseMovieModalBtn" runat="server" Text="×"
                CssClass="movie-modal-close" OnClick="CancelMovie_Click" CausesValidation="false" />
        </div>

        <div class="movie-modal-body">

            <div class="modal-field">
                <label>Movie Title</label>
                <asp:TextBox ID="txtMovieTitle" runat="server" ClientIDMode="Static"
                    CssClass="modal-input" placeholder="Enter movie title" MaxLength="100" />
                <asp:RequiredFieldValidator ID="rfvMovieTitle" runat="server"
                    ControlToValidate="txtMovieTitle"
                    ErrorMessage="Movie title is required."
                    CssClass="error-msg" Display="Dynamic"
                    ValidationGroup="MovieGroup" />
            </div>

            <div class="modal-field">
                <label>Rating</label>
                <asp:TextBox ID="txtMovieRating" runat="server" ClientIDMode="Static"
                    CssClass="modal-input" placeholder="Example: 8.5" MaxLength="10" />
                <asp:RequiredFieldValidator ID="rfvMovieRating" runat="server"
                    ControlToValidate="txtMovieRating"
                    ErrorMessage="Rating is required."
                    CssClass="error-msg" Display="Dynamic"
                    ValidationGroup="MovieGroup" />
                <asp:RegularExpressionValidator ID="revMovieRating" runat="server"
                    ControlToValidate="txtMovieRating"
                    ErrorMessage="Enter rating 0-10 (e.g. 8.5)"
                    CssClass="error-msg" Display="Dynamic"
                    ValidationExpression="^([0-9]|10)(\.[0-9]{1,2})?$"
                    ValidationGroup="MovieGroup" />
            </div>

        </div>

        <div class="movie-modal-footer">
            <asp:Button ID="CancelMovieBtn" runat="server" Text="Cancel"
                CssClass="modal-cancel" OnClick="CancelMovie_Click" CausesValidation="false" />
            <asp:Button ID="btnSaveMovie" runat="server" ClientIDMode="Static"
                CssClass="modal-save" Text="Save Movie"
                OnClick="btnSaveMovie_Click" ValidationGroup="MovieGroup" />
        </div>

    </div>
</asp:Panel>


<!-- ============================================
     HERO MODAL — ClientIDMode="Static" ⭐
============================================ -->
<asp:Panel ID="HeroModal" runat="server" CssClass="movie-modal-overlay" ClientIDMode="Static">
    <div class="movie-modal">

        <div class="movie-modal-header">
            <asp:Label ID="HeroModalTitle" runat="server" Text="Add New Hero Content" CssClass="movie-modal-title" ClientIDMode="Static"></asp:Label>
            <asp:Button ID="CloseHeroModalBtn" runat="server" Text="×"
                CssClass="movie-modal-close" OnClick="CancelHero_Click" CausesValidation="false" />
        </div>

        <div class="movie-modal-body">

            <div class="modal-field">
                <label>Brand / Channel</label>
                <asp:TextBox ID="txtHeroBrand" runat="server" ClientIDMode="Static"
                    CssClass="modal-input" placeholder="e.g. ARCADE" MaxLength="50" />
                <asp:RequiredFieldValidator ID="rfvHeroBrand" runat="server"
                    ControlToValidate="txtHeroBrand"
                    ErrorMessage="Brand is required."
                    CssClass="error-msg" Display="Dynamic"
                    ValidationGroup="HeroGroup" />
            </div>

            <div class="modal-field">
                <label>Movie Title</label>
                <asp:TextBox ID="txtHeroTitle" runat="server" ClientIDMode="Static"
                    CssClass="modal-input" placeholder="e.g. Shadows of Gotham" MaxLength="100" />
                <asp:RequiredFieldValidator ID="rfvHeroTitle" runat="server"
                    ControlToValidate="txtHeroTitle"
                    ErrorMessage="Movie title is required."
                    CssClass="error-msg" Display="Dynamic"
                    ValidationGroup="HeroGroup" />
            </div>

            <div class="modal-field">
                <label>Status</label>
                <asp:DropDownList ID="ddlHeroStatus" runat="server" ClientIDMode="Static" CssClass="modal-select">
                    <asp:ListItem Value="Active">Active</asp:ListItem>
                    <asp:ListItem Value="Inactive">Inactive</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="modal-field">
                <label>Position</label>
                <asp:DropDownList ID="ddlHeroPosition" runat="server" ClientIDMode="Static" CssClass="modal-select">
                    <asp:ListItem Value="Featured">Featured</asp:ListItem>
                    <asp:ListItem Value="Not Featured">Not Featured</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="modal-field">
                <label>Description</label>
                <asp:TextBox ID="txtHeroDesc" runat="server" ClientIDMode="Static"
                    CssClass="modal-textarea" TextMode="MultiLine"
                    placeholder="Enter short description..." MaxLength="300" />
            </div>

        </div>

        <div class="movie-modal-footer">
            <asp:Button ID="CancelHeroBtn" runat="server" Text="Cancel"
                CssClass="modal-cancel" OnClick="CancelHero_Click" CausesValidation="false" />
            <asp:Button ID="btnSaveHero" runat="server" ClientIDMode="Static"
                CssClass="modal-save" Text="Save Hero"
                OnClick="btnSaveHero_Click" ValidationGroup="HeroGroup" />
        </div>

    </div>
</asp:Panel>


<script type="text/javascript">
    function openMovieAdd() {
        var p = document.getElementById("MovieModal");
        if (p) {
            p.classList.add("show");
            document.getElementById("MovieModalTitle").innerText = "Add New Movie";
            document.getElementById("btnSaveMovie").value = "Save Movie";
            document.getElementById("hdnEditMovieId").value = "";
            document.getElementById("txtMovieTitle").value = "";
            document.getElementById("txtMovieRating").value = "";
            setTimeout(function () {
                var t = document.getElementById("txtMovieTitle");
                if (t) t.focus();
            }, 100);
        }
    }

    function openHeroAdd() {
        var p = document.getElementById("HeroModal");
        if (p) {
            p.classList.add("show");
            document.getElementById("HeroModalTitle").innerText = "Add New Hero Content";
            document.getElementById("btnSaveHero").value = "Save Hero";
            document.getElementById("hdnEditHeroId").value = "";
            document.getElementById("txtHeroBrand").value = "";
            document.getElementById("txtHeroTitle").value = "";
            document.getElementById("txtHeroDesc").value = "";
            document.getElementById("ddlHeroStatus").value = "Active";
            document.getElementById("ddlHeroPosition").value = "Featured";
            setTimeout(function () {
                var t = document.getElementById("txtHeroBrand");
                if (t) t.focus();
            }, 100);
        }
    }

    document.addEventListener("click", function (event) {
        var movieModal = document.getElementById("MovieModal");
        var heroModal = document.getElementById("HeroModal");

        if (event.target === movieModal) {
            movieModal.classList.remove("show");
        }
        if (event.target === heroModal) {
            heroModal.classList.remove("show");
        }
    });

    document.addEventListener("keydown", function (event) {
        if (event.key === "Escape") {
            var movieModal = document.getElementById("MovieModal");
            var heroModal = document.getElementById("HeroModal");
            if (movieModal) movieModal.classList.remove("show");
            if (heroModal) heroModal.classList.remove("show");
        }
    });
</script>

</asp:Content>