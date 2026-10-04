<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="WebApplication2.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
    .dashboard-page{
        width:100%;
        padding:25px 35px 50px 35px;
        background:#111;
        min-height:100vh;
        font-family:Arial,Helvetica,sans-serif;
    }

    .card{
        width:100%;
        background:#151515;
        border:1px solid #2a2a2a;
        border-radius:8px;
        overflow:hidden;
        margin-bottom:30px;
    }

    .card-header{
        display:flex;
        justify-content:space-between;
        align-items:flex-start;
        padding:20px 25px 15px;
        flex-wrap:wrap;
        gap:12px;
    }

    .card-header-left h2{
        margin:0 0 6px;
        color:#fff;
        font-size:16px;
        font-weight:500;
    }

    .card-header-left p{
        margin:0;
        color:#777;
        font-size:11px;
    }

    .header-actions{
        display:flex;
        align-items:center;
        gap:14px;
    }

    .view-all{
        color:#ff3333;
        text-decoration:none;
        font-size:11px;
        font-weight:500;
        cursor:pointer;
    }

    .view-all:hover{
        color:#ff7777;
    }

    .add-btn{
        background:#ff5f5f;
        color:#fff;
        border:none;
        padding:8px 16px;
        border-radius:5px;
        font-size:11px;
        font-weight:600;
        cursor:pointer;
    }

    .add-btn:hover{
        background:#ff4646;
    }

    .add-panel{
        display:none;
        background:#1c1c1c;
        border-top:1px solid #2a2a2a;
        padding:20px 25px;
    }

    .add-panel.show{
        display:block;
    }

    .add-panel.editing{
        background:#201818;
        border-top:1px solid #4a2020;
    }

    .add-panel-title{
        color:#fff;
        font-size:13px;
        font-weight:600;
        margin-bottom:14px;
    }

    .add-panel.editing .add-panel-title{
        color:#ffc3b9;
    }

    .add-grid{
        display:grid;
        grid-template-columns:1fr 1fr;
        gap:14px;
        margin-bottom:14px;
    }

    .add-grid.full{
        grid-template-columns:1fr;
    }

    .add-field label{
        display:block;
        color:#aaa;
        font-size:10px;
        margin-bottom:6px;
        text-transform:uppercase;
        letter-spacing:.5px;
    }

    .add-field input,
    .add-field select,
    .add-field textarea{
        width:100%;
        background:#111;
        border:1px solid #333;
        border-radius:4px;
        padding:10px 12px;
        color:#fff;
        font-size:12px;
        outline:none;
        font-family:Arial,Helvetica,sans-serif;
        box-sizing:border-box;
    }

    .add-field input:focus,
    .add-field select:focus,
    .add-field textarea:focus{
        border-color:#ffc3b9;
    }

    .add-field textarea{
        min-height:60px;
        resize:vertical;
    }

    .add-buttons{
        display:flex;
        justify-content:flex-end;
        gap:10px;
    }

    .cancel-btn{
        height:32px;
        padding:0 18px;
        background:transparent;
        border:1px solid #414141;
        border-radius:4px;
        color:#bdbdbd;
        font-size:11px;
        cursor:pointer;
    }

    .cancel-btn:hover{
        background:#292929;
        color:#fff;
    }

    .save-btn{
        height:32px;
        padding:0 20px;
        background:#ff5f5f;
        border:none;
        border-radius:4px;
        color:#fff;
        font-size:11px;
        font-weight:600;
        cursor:pointer;
    }

    .save-btn:hover{
        background:#ff4646;
    }

    .movie-table,
    .hero-table{
        width:100%;
        border-collapse:collapse;
    }

    .movie-table thead th,
    .hero-table thead th{
        height:40px;
        background:#111;
        border-top:1px solid #252525;
        border-bottom:1px solid #252525;
        color:#888;
        font-size:11px;
        font-weight:normal;
        text-align:left;
        padding:0 25px;
    }

    .movie-table tbody td{
        height:55px;
        border-bottom:1px solid #202020;
        color:#ccc;
        font-size:12px;
        padding:0 25px;
    }

    .movie-table tbody tr:hover,
    .hero-table tbody tr:hover{
        background:#1a1a1a;
    }

    .movie-title{
        display:flex;
        align-items:center;
        gap:12px;
    }

    .movie-icon{
        width:18px;
        height:18px;
        display:flex;
        align-items:center;
        justify-content:center;
        color:#888;
        font-size:12px;
    }

    .rating{
        color:#ddd!important;
    }

    .actions{
        display:flex;
        gap:8px;
    }

    .btn-edit{
        background:transparent;
        border:1px solid #551818;
        color:#ff3333;
        font-size:10px;
        font-weight:500;
        height:26px;
        padding:0 14px;
        border-radius:4px;
        cursor:pointer;
    }

    .btn-edit:hover{
        background:#351515;
    }

    .btn-delete{
        background:transparent;
        border:1px solid #444;
        color:#ccc;
        font-size:10px;
        font-weight:500;
        height:26px;
        padding:0 14px;
        border-radius:4px;
        cursor:pointer;
    }

    .btn-delete:hover{
        background:#292929;
        color:#ff5f5f;
        border-color:#ff5f5f;
    }

    .hero-table tbody td{
        padding:18px 25px;
        border-bottom:1px solid #202020;
        color:#ccc;
        font-size:12px;
    }

    .brand{
        color:#ccc;
        font-size:11px;
        font-weight:500;
        letter-spacing:1px;
    }

    .hero-title{
        color:#ddd;
        font-size:12px;
        line-height:16px;
        font-weight:500;
    }

    .hero-description{
        display:block;
        max-width:450px;
        margin-top:5px;
        color:#777;
        font-size:10px;
        line-height:14px;
        font-weight:normal;
    }

    .status{
        display:flex;
        align-items:center;
        gap:8px;
    }

    .status-dot{
        width:7px;
        height:7px;
        background:#00dd66;
        border-radius:50%;
    }

    .status-dot.inactive{
        background:#777;
    }

    .status-text{
        color:#ccc;
        font-size:11px;
    }

    .featured{
        display:inline-block;
        color:#ff3333;
        border:1px solid #4c1515;
        padding:4px 12px;
        font-size:10px;
        border-radius:4px;
        font-weight:500;
    }

    .not-featured{
        display:inline-block;
        color:#888;
        border:1px solid #333;
        padding:4px 12px;
        font-size:10px;
        border-radius:4px;
        font-weight:500;
    }

    .success-message{
        display:none;
        position:fixed;
        right:25px;
        bottom:25px;
        z-index:99999;
        background:#171717;
        border:1px solid #00a84f;
        color:#fff;
        padding:13px 20px;
        border-radius:6px;
        font-size:12px;
        box-shadow:0 10px 30px rgba(0,0,0,.5);
    }

    .success-message.show{
        display:block;
        animation:successIn .25s ease;
    }

    @keyframes successIn{
        from{opacity:0;transform:translateY(10px);}
        to{opacity:1;transform:translateY(0);}
    }

    @media(max-width:700px){
        .dashboard-page{
            padding:20px 15px 40px;
        }

        .add-grid{
            grid-template-columns:1fr;
        }
    }
</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="dashboard-page">

    <!-- MOVIES -->

    <div class="card">

        <div class="card-header">

            <div class="card-header-left">
                <h2>Movie Listings</h2>
                <p>High-density catalog view</p>
            </div>

            <div class="header-actions">

                <a href="Movies.aspx" class="view-all">
                    View All →
                </a>

                <button type="button"
                        class="add-btn"
                        onclick="openMovieAdd();">
                    + Add Movie
                </button>

            </div>

        </div>


        <div id="moviePanel" class="add-panel">

            <div class="add-panel-title" id="moviePanelTitle">
                Add New Movie
            </div>

            <div class="add-grid">

                <div class="add-field">
                    <label>Movie Title</label>
                    <input type="text"
                           id="newMovieTitle"
                           placeholder="e.g. Inception" />
                </div>

                <div class="add-field">
                    <label>Rating</label>
                    <input type="text"
                           id="newMovieRating"
                           placeholder="e.g. 8.5" />
                </div>

            </div>

            <div class="add-buttons">

                <button type="button"
                        class="cancel-btn"
                        onclick="closeMoviePanel();">
                    Cancel
                </button>

                <button type="button"
                        class="save-btn"
                        id="movieSaveBtn"
                        onclick="saveMovie();">
                    Save Movie
                </button>

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

            <tbody id="movieTableBody">

                <tr>
                    <td>
                        <div class="movie-title">
                            <span class="movie-icon">▣</span>
                            <span>Jungle Heart</span>
                        </div>
                    </td>

                    <td class="rating">8.5/10</td>

                    <td>
                        <div class="actions">
                            <button type="button"
                                    class="btn-edit"
                                    onclick="editMovie(this);">
                                EDIT
                            </button>

                            <button type="button"
                                    class="btn-delete"
                                    onclick="deleteMovie(this);">
                                DELETE
                            </button>
                        </div>
                    </td>
                </tr>


                <tr>
                    <td>
                        <div class="movie-title">
                            <span class="movie-icon">▣</span>
                            <span>Void</span>
                        </div>
                    </td>

                    <td class="rating">8.5/10</td>

                    <td>
                        <div class="actions">
                            <button type="button"
                                    class="btn-edit"
                                    onclick="editMovie(this);">
                                EDIT
                            </button>

                            <button type="button"
                                    class="btn-delete"
                                    onclick="deleteMovie(this);">
                                DELETE
                            </button>
                        </div>
                    </td>
                </tr>


                <tr>
                    <td>
                        <div class="movie-title">
                            <span class="movie-icon">▣</span>
                            <span>Koh-i-noor</span>
                        </div>
                    </td>

                    <td class="rating">8.9/10</td>

                    <td>
                        <div class="actions">
                            <button type="button"
                                    class="btn-edit"
                                    onclick="editMovie(this);">
                                EDIT
                            </button>

                            <button type="button"
                                    class="btn-delete"
                                    onclick="deleteMovie(this);">
                                DELETE
                            </button>
                        </div>
                    </td>
                </tr>


                <tr>
                    <td>
                        <div class="movie-title">
                            <span class="movie-icon">◉</span>
                            <span>CHHAAVA</span>
                        </div>
                    </td>

                    <td class="rating">9.2/10</td>

                    <td>
                        <div class="actions">
                            <button type="button"
                                    class="btn-edit"
                                    onclick="editMovie(this);">
                                EDIT
                            </button>

                            <button type="button"
                                    class="btn-delete"
                                    onclick="deleteMovie(this);">
                                DELETE
                            </button>
                        </div>
                    </td>
                </tr>

            </tbody>

        </table>

    </div>


    <!-- HERO -->

    <div class="card">

        <div class="card-header">

            <div class="card-header-left">
                <h2>Hero Content Management</h2>
                <p>Manage featured cinematic assets and promotional banners</p>
            </div>

            <div class="header-actions">

                <button type="button"
                        class="add-btn"
                        onclick="openHeroAdd();">
                    + Add Hero
                </button>

            </div>

        </div>


        <div id="heroPanel" class="add-panel">

            <div class="add-panel-title"
                 id="heroPanelTitle">
                Add New Hero Content
            </div>

            <div class="add-grid">

                <div class="add-field">
                    <label>Brand / Channel</label>
                    <input type="text"
                           id="newHeroBrand"
                           placeholder="e.g. ARCADE" />
                </div>

                <div class="add-field">
                    <label>Movie Title</label>
                    <input type="text"
                           id="newHeroTitle"
                           placeholder="e.g. Shadows of Gotham" />
                </div>

                <div class="add-field">
                    <label>Status</label>

                    <select id="newHeroStatus">
                        <option value="active">Active</option>
                        <option value="inactive">Inactive</option>
                    </select>

                </div>

                <div class="add-field">
                    <label>Position</label>

                    <select id="newHeroPosition">
                        <option value="featured">Featured</option>
                        <option value="not-featured">Not Featured</option>
                    </select>

                </div>

            </div>


            <div class="add-grid full">

                <div class="add-field">
                    <label>Description</label>

                    <textarea id="newHeroDesc"
                              placeholder="Enter short description..."></textarea>

                </div>

            </div>


            <div class="add-buttons">

                <button type="button"
                        class="cancel-btn"
                        onclick="closeHeroPanel();">
                    Cancel
                </button>

                <button type="button"
                        class="save-btn"
                        id="heroSaveBtn"
                        onclick="saveHero();">
                    Save Hero
                </button>

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


            <tbody id="heroTableBody">

                <tr>

                    <td>
                        <span class="brand">ARCADE</span>
                    </td>

                    <td>

                        <div class="hero-title">

                            Shadows of Gotham: The Final Chapter

                            <span class="hero-description">
                                Experience the epic conclusion in breathtaking IMAX.
                                The city's greatest hero faces his ultimate test...
                            </span>

                        </div>

                    </td>

                    <td>

                        <div class="status">
                            <span class="status-dot"></span>
                            <span class="status-text">Active</span>
                        </div>

                    </td>

                    <td>
                        <span class="featured">FEATURED</span>
                    </td>

                    <td>

                        <div class="actions">

                            <button type="button"
                                    class="btn-edit"
                                    onclick="editHero(this);">
                                EDIT
                            </button>

                            <button type="button"
                                    class="btn-delete"
                                    onclick="deleteHero(this);">
                                DELETE
                            </button>

                        </div>

                    </td>

                </tr>

            </tbody>

        </table>

    </div>

</div>


<div id="successMessage"
     class="success-message">
    Success
</div>


<script>

    var editingMovieRow = null;
    var editingHeroRow = null;


    function showSuccess(message) {

        var box =
            document.getElementById("successMessage");

        box.innerText = message;

        box.classList.add("show");

        setTimeout(function () {

            box.classList.remove("show");

        }, 2500);
    }


    /* MOVIE */

    function openMovieAdd() {

        editingMovieRow = null;

        var panel =
            document.getElementById("moviePanel");

        panel.classList.add("show");
        panel.classList.remove("editing");

        document.getElementById("moviePanelTitle").innerText =
            "Add New Movie";

        document.getElementById("movieSaveBtn").innerText =
            "Save Movie";

        document.getElementById("newMovieTitle").value = "";
        document.getElementById("newMovieRating").value = "";

        document.getElementById("newMovieTitle").focus();

        panel.scrollIntoView({
            behavior: "smooth",
            block: "center"
        });
    }


    function closeMoviePanel() {

        document.getElementById("moviePanel")
            .classList.remove("show");

        document.getElementById("moviePanel")
            .classList.remove("editing");

        editingMovieRow = null;

    }


    function saveMovie() {

        var title =
            document.getElementById("newMovieTitle")
                .value.trim();

        var rating =
            document.getElementById("newMovieRating")
                .value.trim();


        if (title === "") {

            alert("Please enter a movie title.");
            return;

        }


        if (rating === "") {
            rating = "N/A";
        }


        if (editingMovieRow) {

            editingMovieRow.querySelector(
                ".movie-title span:last-child"
            ).innerText = title;

            editingMovieRow.querySelector(
                ".rating"
            ).innerText = rating + "/10";

            closeMoviePanel();

            showSuccess(
                "Movie updated successfully!"
            );

        }
        else {

            var row =
                document.createElement("tr");

            row.innerHTML =

                '<td>' +
                '<div class="movie-title">' +
                '<span class="movie-icon">▣</span>' +
                '<span>' +
                escapeHtml(title) +
                '</span>' +
                '</div>' +
                '</td>' +

                '<td class="rating">' +
                escapeHtml(rating) +
                '/10' +
                '</td>' +

                '<td>' +
                '<div class="actions">' +

                '<button type="button" class="btn-edit" onclick="editMovie(this);">' +
                'EDIT' +
                '</button>' +

                '<button type="button" class="btn-delete" onclick="deleteMovie(this);">' +
                'DELETE' +
                '</button>' +

                '</div>' +
                '</td>';


            document.getElementById("movieTableBody")
                .insertBefore(
                    row,
                    document.getElementById("movieTableBody")
                        .firstChild
                );


            closeMoviePanel();

            showSuccess(
                "Movie added successfully!"
            );

        }

    }


    function editMovie(button) {

        editingMovieRow =
            button.closest("tr");

        var title =
            editingMovieRow.querySelector(
                ".movie-title span:last-child"
            ).innerText;

        var rating =
            editingMovieRow.querySelector(
                ".rating"
            ).innerText.replace("/10", "");


        document.getElementById("moviePanel")
            .classList.add("show");

        document.getElementById("moviePanel")
            .classList.add("editing");


        document.getElementById("moviePanelTitle")
            .innerText = "Edit Movie";

        document.getElementById("movieSaveBtn")
            .innerText = "Save Changes";


        document.getElementById("newMovieTitle")
            .value = title;

        document.getElementById("newMovieRating")
            .value = rating;


        document.getElementById("moviePanel")
            .scrollIntoView({
                behavior: "smooth",
                block: "center"
            });

    }


    function deleteMovie(button) {

        var row =
            button.closest("tr");

        var title =
            row.querySelector(
                ".movie-title span:last-child"
            ).innerText;


        if (!confirm(
            'Are you sure you want to delete "' +
            title +
            '"?'
        )) {
            return;
        }


        row.remove();

        showSuccess(
            "Movie deleted successfully!"
        );

    }


    /* HERO */

    function openHeroAdd() {

        editingHeroRow = null;

        var panel =
            document.getElementById("heroPanel");

        panel.classList.add("show");
        panel.classList.remove("editing");


        document.getElementById("heroPanelTitle")
            .innerText = "Add New Hero Content";

        document.getElementById("heroSaveBtn")
            .innerText = "Save Hero";


        document.getElementById("newHeroBrand").value = "";
        document.getElementById("newHeroTitle").value = "";
        document.getElementById("newHeroDesc").value = "";

        document.getElementById("newHeroStatus")
            .value = "active";

        document.getElementById("newHeroPosition")
            .value = "featured";


        panel.scrollIntoView({
            behavior: "smooth",
            block: "center"
        });

    }


    function closeHeroPanel() {

        document.getElementById("heroPanel")
            .classList.remove("show");

        document.getElementById("heroPanel")
            .classList.remove("editing");

        editingHeroRow = null;

    }


    function saveHero() {

        var brand =
            document.getElementById("newHeroBrand")
                .value.trim();

        var title =
            document.getElementById("newHeroTitle")
                .value.trim();

        var desc =
            document.getElementById("newHeroDesc")
                .value.trim();

        var status =
            document.getElementById("newHeroStatus")
                .value;

        var position =
            document.getElementById("newHeroPosition")
                .value;


        if (brand === "") {
            alert("Please enter a brand/channel name.");
            return;
        }

        if (title === "") {
            alert("Please enter a movie title.");
            return;
        }


        if (editingHeroRow) {

            editingHeroRow.querySelector(".brand")
                .innerText = brand.toUpperCase();


            var titleHTML =
                escapeHtml(title);

            if (desc !== "") {

                titleHTML +=
                    '<span class="hero-description">' +
                    escapeHtml(desc) +
                    '</span>';

            }


            editingHeroRow.querySelector(".hero-title")
                .innerHTML = titleHTML;


            if (status === "active") {

                editingHeroRow.querySelector(".status")
                    .innerHTML =
                    '<span class="status-dot"></span>' +
                    '<span class="status-text">Active</span>';

            }
            else {

                editingHeroRow.querySelector(".status")
                    .innerHTML =
                    '<span class="status-dot inactive"></span>' +
                    '<span class="status-text">Inactive</span>';

            }


            editingHeroRow.children[3].innerHTML =
                position === "featured"
                    ? '<span class="featured">FEATURED</span>'
                    : '<span class="not-featured">NOT FEATURED</span>';


            closeHeroPanel();

            showSuccess(
                "Hero content updated successfully!"
            );

        }
        else {

            var statusHTML =
                status === "active"
                    ?
                    '<div class="status">' +
                    '<span class="status-dot"></span>' +
                    '<span class="status-text">Active</span>' +
                    '</div>'
                    :
                    '<div class="status">' +
                    '<span class="status-dot inactive"></span>' +
                    '<span class="status-text">Inactive</span>' +
                    '</div>';


            var positionHTML =
                position === "featured"
                    ?
                    '<span class="featured">FEATURED</span>'
                    :
                    '<span class="not-featured">NOT FEATURED</span>';


            var descHTML =
                desc !== ""
                    ?
                    '<span class="hero-description">' +
                    escapeHtml(desc) +
                    '</span>'
                    :
                    "";


            var row =
                document.createElement("tr");


            row.innerHTML =

                '<td>' +
                '<span class="brand">' +
                escapeHtml(
                    brand.toUpperCase()
                ) +
                '</span>' +
                '</td>' +

                '<td>' +
                '<div class="hero-title">' +
                escapeHtml(title) +
                descHTML +
                '</div>' +
                '</td>' +

                '<td>' +
                statusHTML +
                '</td>' +

                '<td>' +
                positionHTML +
                '</td>' +

                '<td>' +
                '<div class="actions">' +

                '<button type="button" class="btn-edit" onclick="editHero(this);">' +
                'EDIT' +
                '</button>' +

                '<button type="button" class="btn-delete" onclick="deleteHero(this);">' +
                'DELETE' +
                '</button>' +

                '</div>' +
                '</td>';


            document.getElementById("heroTableBody")
                .insertBefore(
                    row,
                    document.getElementById("heroTableBody")
                        .firstChild
                );


            closeHeroPanel();

            showSuccess(
                "Hero content added successfully!"
            );

        }

    }


    function editHero(button) {

        editingHeroRow =
            button.closest("tr");


        var brand =
            editingHeroRow.querySelector(".brand")
                .innerText;

        var heroTitle =
            editingHeroRow.querySelector(".hero-title");

        var title =
            heroTitle.childNodes[0]
                .textContent.trim();

        var descElement =
            heroTitle.querySelector(
                ".hero-description"
            );

        var desc =
            descElement
                ? descElement.innerText
                : "";


        var statusText =
            editingHeroRow.querySelector(
                ".status-text"
            ).innerText;

        var position =
            editingHeroRow.querySelector(
                ".featured"
            )
                ? "featured"
                : "not-featured";


        document.getElementById("heroPanel")
            .classList.add("show");

        document.getElementById("heroPanel")
            .classList.add("editing");


        document.getElementById("heroPanelTitle")
            .innerText = "Edit Hero Content";

        document.getElementById("heroSaveBtn")
            .innerText = "Save Changes";


        document.getElementById("newHeroBrand")
            .value = brand;

        document.getElementById("newHeroTitle")
            .value = title;

        document.getElementById("newHeroDesc")
            .value = desc;

        document.getElementById("newHeroStatus")
            .value =
            statusText === "Active"
                ? "active"
                : "inactive";

        document.getElementById("newHeroPosition")
            .value = position;


        document.getElementById("heroPanel")
            .scrollIntoView({
                behavior: "smooth",
                block: "center"
            });

    }


    function deleteHero(button) {

        var row =
            button.closest("tr");

        var title =
            row.querySelector(".hero-title")
                .childNodes[0]
                .textContent.trim();


        if (!confirm(
            'Are you sure you want to delete "' +
            title +
            '"?'
        )) {
            return;
        }


        row.remove();

        showSuccess(
            "Hero content deleted successfully!"
        );

    }


    function escapeHtml(text) {

        var div =
            document.createElement("div");

        div.appendChild(
            document.createTextNode(text)
        );

        return div.innerHTML;
    }

</script>

</asp:Content>