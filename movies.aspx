<%@ Page Title="Movies" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="movies.aspx.cs" Inherits="WebApplication2.movies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        * {
            box-sizing: border-box;
        }

        html {
            background: #111111;
        }

        body {
            background: #111111;
            color: #ffffff;
            font-family: Arial, Helvetica, sans-serif;
        }

        /* =========================================
           MAIN
        ========================================= */

        .movies-main {
            min-height: 100vh;
            background: #111111;
            padding: 25px 45px 70px 45px;
        }

        .top-line {
            height: 1px;
            background: #292929;
            margin-bottom: 25px;
        }

        /* =========================================
           MOVIE AREA
        ========================================= */

        .movie-area {
            display: flex;
            gap: 22px;
            align-items: flex-start;
        }

        .movie-left {
            width: 70%;
        }

        .movie-right {
            width: 30%;
        }

        /* =========================================
           MOVIE BOX
        ========================================= */

        .movie-box {
            background: #101010;
            border: 1px solid #303030;
            border-radius: 5px;
            overflow: hidden;
            margin-bottom: 20px;
        }

        .box-header {
            min-height: 52px;
            padding: 0 14px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            border-bottom: 1px solid #292929;
        }

        .box-title {
            font-size: 14px;
            font-weight: bold;
            border-left: 3px solid #ff3333;
            padding-left: 8px;
            color: #ffffff;
        }

        .box-header-right {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .film-count {
            font-size: 9px;
            color: #aaaaaa;
            background: #333333;
            padding: 5px 8px;
            border-radius: 10px;
        }

        /* =========================================
           ADD MOVIE BUTTON
        ========================================= */

        .add-movie-btn {
            background: #ffb6b1;
            color: #171717;
            border: none;
            padding: 7px 11px;
            border-radius: 4px;
            font-size: 9px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.2s;
        }

        .add-movie-btn:hover {
            background: #ffc8c4;
            transform: translateY(-1px);
        }

        /* =========================================
           TABLE
        ========================================= */

        .movie-table {
            width: 100%;
            border-collapse: collapse;
        }

        .movie-table th {
            height: 38px;
            text-align: left;
            padding: 0 15px;
            color: #888888;
            font-size: 8px;
            letter-spacing: 1px;
            background: #181818;
        }

        .movie-table td {
            height: 45px;
            padding: 0 15px;
            color: #bbbbbb;
            font-size: 10px;
            border-top: 1px solid #242424;
        }

        .movie-table tr:hover td {
            background: #191919;
        }

        /* =========================================
           STATUS
        ========================================= */

        .status {
            color: #ffffff;
            background: #252525;
            padding: 5px 7px;
            border-radius: 3px;
            font-size: 9px;
        }

        .now {
            color: #ffffff;
            background: #651b1b;
        }

        /* =========================================
           ACTION BUTTONS
        ========================================= */

        .action-buttons {
            display: flex;
            align-items: center;
            gap: 6px;
        }

        .btn-edit,
        .btn-delete {
            width: 29px;
            height: 27px;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            font-size: 13px;
            transition: 0.2s;
        }

        .btn-edit {
            background: #3a3a3a;
            color: #ffffff;
        }

        .btn-edit:hover {
            background: #555555;
            transform: translateY(-1px);
        }

        .btn-delete {
            background: #ff2633;
            color: #ffffff;
        }

        .btn-delete:hover {
            background: #d91d29;
            transform: translateY(-1px);
        }

        /* =========================================
           GENRE BOX
        ========================================= */

        .genre-box {
            background: #101010;
            border: 1px solid #303030;
            border-radius: 5px;
            padding: 18px;
        }

        .genre-title {
            font-size: 14px;
            margin: 0 0 15px 0;
            color: #ffffff;
        }

        .genre-buttons {
            display: flex;
            flex-wrap: wrap;
            gap: 6px;
        }

        .genre {
            background: #292929;
            color: #bbbbbb;
            border: 1px solid #444444;
            padding: 6px 8px;
            font-size: 8px;
            cursor: pointer;
            transition: 0.2s;
        }

        .genre:hover {
            color: #ffffff;
            border-color: #ff3333;
        }

        .genre.active {
            background: #651b1b;
            color: #ffffff;
            border-color: #ff3333;
        }

        .genre-message {
            margin-top: 15px;
            color: #777777;
            font-size: 9px;
            line-height: 15px;
        }

        /* =========================================
           HAMBURGER
        ========================================= */

        .home-hamburger {
            display: flex;
            flex-direction: column;
            justify-content: center;
            gap: 4px;
            width: 24px;
            height: 24px;
            cursor: pointer;
            flex-shrink: 0;
        }

        .home-hamburger span {
            display: block;
            width: 20px;
            height: 2px;
            background: #FFC3B9;
            border-radius: 2px;
            transition: 0.2s;
        }

        .home-hamburger:hover span {
            background: #ffb0a3;
        }

        /* =========================================
           MODAL BACKGROUND
        ========================================= */

        .movie-modal-overlay {
            display: none;
            position: fixed;
            z-index: 99999;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background: rgba(0,0,0,0.78);
            align-items: center;
            justify-content: center;
        }

        .movie-modal-overlay.show {
            display: flex;
        }

        /* =========================================
           MODAL
        ========================================= */

        .movie-modal {
            width: 430px;
            max-width: 92%;
            background: #222222;
            border: 1px solid #3a3a3a;
            border-radius: 8px;
            box-shadow: 0 25px 70px rgba(0,0,0,0.7);
            overflow: hidden;
        }

        .movie-modal-header {
            height: 55px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 18px;
            border-bottom: 1px solid #363636;
        }

        .movie-modal-title {
            color: #ffffff;
            font-size: 15px;
            font-weight: 600;
        }

        .modal-close {
            border: none;
            background: transparent;
            color: #999999;
            font-size: 20px;
            cursor: pointer;
        }

        .modal-close:hover {
            color: #ffffff;
        }

        .movie-modal-body {
            padding: 20px;
        }

        .modal-field {
            margin-bottom: 15px;
        }

        .modal-field label {
            display: block;
            color: #888888;
            font-size: 9px;
            text-transform: uppercase;
            letter-spacing: .7px;
            margin-bottom: 7px;
        }

        .modal-field input,
        .modal-field select {
            width: 100%;
            height: 36px;
            background: #151515;
            border: 1px solid #3b3b3b;
            border-radius: 4px;
            color: #ffffff;
            outline: none;
            padding: 0 10px;
            font-size: 11px;
        }

        .modal-field input:focus,
        .modal-field select:focus {
            border-color: #777777;
        }

        .modal-field select option {
            background: #151515;
            color: #ffffff;
        }

        .movie-modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 8px;
            padding: 14px 20px;
            border-top: 1px solid #363636;
        }

        .modal-cancel,
        .modal-save {
            height: 33px;
            padding: 0 16px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 10px;
            border: none;
        }

        .modal-cancel {
            background: #333333;
            color: #cccccc;
        }

        .modal-cancel:hover {
            background: #444444;
        }

        .modal-save {
            background: #ff5f5f;
            color: #ffffff;
            font-weight: 600;
        }

        .modal-save:hover {
            background: #ff4141;
        }

        /* =========================================
           DELETE CONFIRM
        ========================================= */

        .delete-modal {
            width: 340px;
        }

        .delete-icon {
            width: 45px;
            height: 45px;
            margin: 0 auto 13px;
            border-radius: 50%;
            background: #3b1d1d;
            color: #ff5c5c;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 20px;
        }

        .delete-text {
            text-align: center;
            color: #999999;
            font-size: 11px;
            line-height: 17px;
            margin-bottom: 20px;
        }

        .delete-movie-name {
            color: #ffffff;
            font-weight: 600;
        }

        /* =========================================
           RESPONSIVE
        ========================================= */

        @media screen and (max-width: 1100px) {

            .movie-area {
                flex-direction: column;
            }

            .movie-left,
            .movie-right {
                width: 100%;
            }
        }

        @media screen and (max-width: 700px) {

            .movies-main {
                padding: 25px 20px 50px 20px;
            }

            .movie-table {
                min-width: 650px;
            }

            .movie-box {
                overflow-x: auto;
            }

            .box-header {
                min-width: 650px;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- =========================================
         HEADER TITLE
    ========================================= -->

    <script type="text/javascript">

        document.addEventListener("DOMContentLoaded", function () {

            var hamburger = document.getElementById("mainHamburger");

            if (hamburger) {
                hamburger.style.display = "flex";
            }

            var header = document.querySelector(".cine-header");
            var searchArea = document.querySelector(".header-search-area");

            if (header && searchArea) {

                var oldTitle = document.getElementById("moviesHeaderTitle");

                if (!oldTitle) {

                    var titleEl = document.createElement("div");

                    titleEl.id = "moviesHeaderTitle";
                    titleEl.innerText = "Now Showing";

                    titleEl.style.color = "#FFC3B9";
                    titleEl.style.fontSize = "22px";
                    titleEl.style.fontWeight = "500";
                    titleEl.style.letterSpacing = "0.5px";
                    titleEl.style.whiteSpace = "nowrap";
                    titleEl.style.flexShrink = "0";
                    titleEl.style.marginLeft = "10px";
                    titleEl.style.marginRight = "10px";

                    header.insertBefore(titleEl, searchArea);
                }
            }

        });

    </script>


    <!-- =========================================
         MAIN PAGE
    ========================================= -->

    <div class="movies-main">

        <div class="movie-area">

            <!-- =====================================
                 LEFT SIDE
            ====================================== -->

            <div class="movie-left">


                <!-- =================================
                     GUJARATI MOVIES
                ================================== -->

                <div class="movie-box">

                    <div class="box-header">

                        <div class="box-title">
                            GUJARATI MOVIES
                        </div>

                        <div class="box-header-right">

                            <div class="film-count" id="gujaratiCount">
                                5 Films Active
                            </div>

                            <button type="button"
                                    class="add-movie-btn"
                                    onclick="openAddMovie('GUJARATI')">
                                ✚ Add Movie
                            </button>

                        </div>

                    </div>


                    <table class="movie-table">

                        <thead>

                            <tr>
                                <th>LANGUAGE</th>
                                <th>MOVIE TITLE</th>
                                <th>RATING/STATUS</th>
                                <th>ACTION</th>
                            </tr>

                        </thead>

                        <tbody id="gujaratiMovies">


                            <tr data-genre="ALL" data-language="GUJARATI">

                                <td>GUJARATI</td>

                                <td class="movie-title">
                                    CHICHI
                                </td>

                                <td class="movie-rating">
                                    <span class="status">-</span>
                                </td>

                                <td>

                                    <div class="action-buttons">

                                        <button type="button"
                                                class="btn-edit"
                                                onclick="editMovie(this)"
                                                title="Edit">
                                            ✎
                                        </button>

                                        <button type="button"
                                                class="btn-delete"
                                                onclick="deleteMovie(this)"
                                                title="Delete">
                                            🗑
                                        </button>

                                    </div>

                                </td>

                            </tr>


                            <tr data-genre="ACTION" data-language="GUJARATI">

                                <td>GUJARATI</td>

                                <td class="movie-title">
                                    JHAMKUDI
                                </td>

                                <td class="movie-rating">
                                    <span class="status now">● Now Showing</span>
                                </td>

                                <td>

                                    <div class="action-buttons">

                                        <button type="button"
                                                class="btn-edit"
                                                onclick="editMovie(this)"
                                                title="Edit">
                                            ✎
                                        </button>

                                        <button type="button"
                                                class="btn-delete"
                                                onclick="deleteMovie(this)"
                                                title="Delete">
                                            🗑
                                        </button>

                                    </div>

                                </td>

                            </tr>


                            <tr data-genre="THRILLER" data-language="GUJARATI">

                                <td>GUJARATI</td>

                                <td class="movie-title">
                                    Stree 2
                                </td>

                                <td class="movie-rating">
                                    8.2/10
                                </td>

                                <td>

                                    <div class="action-buttons">

                                        <button type="button"
                                                class="btn-edit"
                                                onclick="editMovie(this)"
                                                title="Edit">
                                            ✎
                                        </button>

                                        <button type="button"
                                                class="btn-delete"
                                                onclick="deleteMovie(this)"
                                                title="Delete">
                                            🗑
                                        </button>

                                    </div>

                                </td>

                            </tr>


                            <tr data-genre="HISTORICAL" data-language="GUJARATI">

                                <td>GUJARATI</td>

                                <td class="movie-title">
                                    Laalo
                                </td>

                                <td class="movie-rating">
                                    9.9/10
                                </td>

                                <td>

                                    <div class="action-buttons">

                                        <button type="button"
                                                class="btn-edit"
                                                onclick="editMovie(this)"
                                                title="Edit">
                                            ✎
                                        </button>

                                        <button type="button"
                                                class="btn-delete"
                                                onclick="deleteMovie(this)"
                                                title="Delete">
                                            🗑
                                        </button>

                                    </div>

                                </td>

                            </tr>


                            <tr data-genre="DOCUMENTARY" data-language="GUJARATI">

                                <td>GUJARATI</td>

                                <td class="movie-title">
                                    Satyameva Jayate 2
                                </td>

                                <td class="movie-rating">
                                    9/10
                                </td>

                                <td>

                                    <div class="action-buttons">

                                        <button type="button"
                                                class="btn-edit"
                                                onclick="editMovie(this)"
                                                title="Edit">
                                            ✎
                                        </button>

                                        <button type="button"
                                                class="btn-delete"
                                                onclick="deleteMovie(this)"
                                                title="Delete">
                                            🗑
                                        </button>

                                    </div>

                                </td>

                            </tr>


                        </tbody>

                    </table>

                </div>


                <!-- =================================
                     ENGLISH MOVIES
                ================================== -->

                <div class="movie-box">

                    <div class="box-header">

                        <div class="box-title">
                            ENGLISH MOVIES
                        </div>

                        <div class="box-header-right">

                            <div class="film-count" id="englishCount">
                                4 Films Active
                            </div>

                            <button type="button"
                                    class="add-movie-btn"
                                    onclick="openAddMovie('ENGLISH')">
                                ✚ Add Movie
                            </button>

                        </div>

                    </div>


                    <table class="movie-table">

                        <thead>

                            <tr>
                                <th>LANGUAGE</th>
                                <th>MOVIE TITLE</th>
                                <th>RATING/STATUS</th>
                                <th>ACTION</th>
                            </tr>

                        </thead>

                        <tbody id="englishMovies">


                            <tr data-genre="ACTION" data-language="ENGLISH">

                                <td>ENGLISH</td>

                                <td class="movie-title">
                                    VOID
                                </td>

                                <td class="movie-rating">
                                    8.5/10
                                </td>

                                <td>

                                    <div class="action-buttons">

                                        <button type="button"
                                                class="btn-edit"
                                                onclick="editMovie(this)"
                                                title="Edit">
                                            ✎
                                        </button>

                                        <button type="button"
                                                class="btn-delete"
                                                onclick="deleteMovie(this)"
                                                title="Delete">
                                            🗑
                                        </button>

                                    </div>

                                </td>

                            </tr>


                            <tr data-genre="THRILLER" data-language="ENGLISH">

                                <td>ENGLISH</td>

                                <td class="movie-title">
                                    SPIDER-MAN
                                </td>

                                <td class="movie-rating">
                                    8.6/10
                                </td>

                                <td>

                                    <div class="action-buttons">

                                        <button type="button"
                                                class="btn-edit"
                                                onclick="editMovie(this)"
                                                title="Edit">
                                            ✎
                                        </button>

                                        <button type="button"
                                                class="btn-delete"
                                                onclick="deleteMovie(this)"
                                                title="Delete">
                                            🗑
                                        </button>

                                    </div>

                                </td>

                            </tr>


                            <tr data-genre="HISTORICAL" data-language="ENGLISH">

                                <td>ENGLISH</td>

                                <td class="movie-title">
                                    Kohi-noor
                                </td>

                                <td class="movie-rating">
                                    8.9/10
                                </td>

                                <td>

                                    <div class="action-buttons">

                                        <button type="button"
                                                class="btn-edit"
                                                onclick="editMovie(this)"
                                                title="Edit">
                                            ✎
                                        </button>

                                        <button type="button"
                                                class="btn-delete"
                                                onclick="deleteMovie(this)"
                                                title="Delete">
                                            🗑
                                        </button>

                                    </div>

                                </td>

                            </tr>


                            <tr data-genre="HISTORICAL" data-language="ENGLISH">

                                <td>ENGLISH</td>

                                <td class="movie-title">
                                    CHHAVA
                                </td>

                                <td class="movie-rating">
                                    8.2/10
                                </td>

                                <td>

                                    <div class="action-buttons">

                                        <button type="button"
                                                class="btn-edit"
                                                onclick="editMovie(this)"
                                                title="Edit">
                                            ✎
                                        </button>

                                        <button type="button"
                                                class="btn-delete"
                                                onclick="deleteMovie(this)"
                                                title="Delete">
                                            🗑
                                        </button>

                                    </div>

                                </td>

                            </tr>


                        </tbody>

                    </table>

                </div>

            </div>


            <!-- =====================================
                 RIGHT SIDE - GENRE
            ====================================== -->

            <div class="movie-right">

                <div class="genre-box">

                    <h3 class="genre-title">
                        ⚙ Genre Overview
                    </h3>

                    <div class="genre-buttons">

                        <button type="button"
                                class="genre active"
                                onclick="filterGenre('ALL', this)">
                            ALL
                        </button>

                        <button type="button"
                                class="genre"
                                onclick="filterGenre('ACTION', this)">
                            ACTION
                        </button>

                        <button type="button"
                                class="genre"
                                onclick="filterGenre('THRILLER', this)">
                            THRILLER
                        </button>

                        <button type="button"
                                class="genre"
                                onclick="filterGenre('DOCUMENTARY', this)">
                            DOCUMENTARY
                        </button>

                        <button type="button"
                                class="genre"
                                onclick="filterGenre('HISTORICAL', this)">
                            HISTORICAL
                        </button>

                        <button type="button"
                                class="genre"
                                onclick="filterGenre('ARRIVE', this)">
                            ARRIVE
                        </button>

                        <button type="button"
                                class="genre"
                                onclick="filterGenre('NEW', this)">
                            NEW
                        </button>

                        <button type="button"
                                class="genre"
                                onclick="filterGenre('LONG', this)">
                            LONG
                        </button>

                    </div>

                    <div class="genre-message" id="genreMessage">
                        Showing all movies.
                    </div>

                </div>

            </div>

        </div>

    </div>


    <!-- =========================================
         ADD / EDIT MOVIE MODAL
    ========================================= -->

    <div id="movieModal"
         class="movie-modal-overlay">

        <div class="movie-modal">

            <div class="movie-modal-header">

                <div class="movie-modal-title"
                     id="movieModalTitle">
                    Add Movie
                </div>

                <button type="button"
                        class="modal-close"
                        onclick="closeMovieModal()">
                    ×
                </button>

            </div>


            <div class="movie-modal-body">

                <div class="modal-field">

                    <label>
                        Language
                    </label>

                    <select id="movieLanguage">

                        <option value="GUJARATI">
                            GUJARATI
                        </option>

                        <option value="ENGLISH">
                            ENGLISH
                        </option>

                    </select>

                </div>


                <div class="modal-field">

                    <label>
                        Movie Title
                    </label>

                    <input type="text"
                           id="movieTitleInput"
                           placeholder="Enter movie title" />

                </div>


                <div class="modal-field">

                    <label>
                        Rating / Status
                    </label>

                    <input type="text"
                           id="movieRatingInput"
                           placeholder="Example: 8.5/10 or Now Showing" />

                </div>


                <div class="modal-field">

                    <label>
                        Genre
                    </label>

                    <select id="movieGenreInput">

                        <option value="ACTION">
                            ACTION
                        </option>

                        <option value="THRILLER">
                            THRILLER
                        </option>

                        <option value="DOCUMENTARY">
                            DOCUMENTARY
                        </option>

                        <option value="HISTORICAL">
                            HISTORICAL
                        </option>

                        <option value="ARRIVE">
                            ARRIVE
                        </option>

                        <option value="NEW">
                            NEW
                        </option>

                        <option value="LONG">
                            LONG
                        </option>

                        <option value="ALL">
                            ALL
                        </option>

                    </select>

                </div>

            </div>


            <div class="movie-modal-footer">

                <button type="button"
                        class="modal-cancel"
                        onclick="closeMovieModal()">
                    Cancel
                </button>

                <button type="button"
                        class="modal-save"
                        onclick="saveMovie()">
                    Save Movie
                </button>

            </div>

        </div>

    </div>


    <!-- =========================================
         DELETE MODAL
    ========================================= -->

    <div id="deleteModal"
         class="movie-modal-overlay">

        <div class="movie-modal delete-modal">

            <div class="movie-modal-header">

                <div class="movie-modal-title">
                    Delete Movie
                </div>

                <button type="button"
                        class="modal-close"
                        onclick="closeDeleteModal()">
                    ×
                </button>

            </div>


            <div class="movie-modal-body">

                <div class="delete-icon">
                    🗑
                </div>

                <div class="delete-text">

                    Are you sure you want to delete

                    <span class="delete-movie-name"
                          id="deleteMovieName">
                    </span>

                    ?

                    <br />

                    This movie will be removed from the list.

                </div>

            </div>


            <div class="movie-modal-footer">

                <button type="button"
                        class="modal-cancel"
                        onclick="closeDeleteModal()">
                    Cancel
                </button>

                <button type="button"
                        class="modal-save"
                        onclick="confirmDelete()"
                        style="background:#ff2633;">
                    Delete
                </button>

            </div>

        </div>

    </div>


    <!-- =========================================
         JAVASCRIPT
    ========================================= -->

    <script type="text/javascript">

        var editingRow = null;
        var deletingRow = null;
        var currentLanguage = "GUJARATI";


        /* =========================================
           ADD MOVIE
        ========================================= */

        function openAddMovie(language) {

            editingRow = null;
            currentLanguage = language;

            document.getElementById("movieModalTitle").innerText =
                "Add " + language + " Movie";

            document.getElementById("movieLanguage").value = language;

            document.getElementById("movieTitleInput").value = "";

            document.getElementById("movieRatingInput").value = "";

            document.getElementById("movieGenreInput").value = "ACTION";

            document.getElementById("movieModal").classList.add("show");

            setTimeout(function () {

                document.getElementById("movieTitleInput").focus();

            }, 100);

        }


        /* =========================================
           EDIT MOVIE
        ========================================= */

        function editMovie(button) {

            editingRow = button.closest("tr");

            var language =
                editingRow.getAttribute("data-language");

            var title =
                editingRow.querySelector(".movie-title").innerText.trim();

            var rating =
                editingRow.querySelector(".movie-rating").innerText.trim();

            var genre =
                editingRow.getAttribute("data-genre") || "ACTION";


            document.getElementById("movieModalTitle").innerText =
                "Edit Movie";

            document.getElementById("movieLanguage").value =
                language;

            document.getElementById("movieTitleInput").value =
                title;

            document.getElementById("movieRatingInput").value =
                rating;

            document.getElementById("movieGenreInput").value =
                genre;

            document.getElementById("movieModal").classList.add("show");

        }


        /* =========================================
           SAVE MOVIE
        ========================================= */

        function saveMovie() {

            var language =
                document.getElementById("movieLanguage").value;

            var title =
                document.getElementById("movieTitleInput").value.trim();

            var rating =
                document.getElementById("movieRatingInput").value.trim();

            var genre =
                document.getElementById("movieGenreInput").value;


            if (title === "") {

                alert("Please enter movie title.");

                document.getElementById("movieTitleInput").focus();

                return;
            }


            if (rating === "") {

                alert("Please enter rating or status.");

                document.getElementById("movieRatingInput").focus();

                return;
            }


            /* =====================================
               EDIT EXISTING
            ====================================== */

            if (editingRow !== null) {

                var oldLanguage =
                    editingRow.getAttribute("data-language");


                /*
                   If language changed,
                   move movie to another table.
                */

                if (oldLanguage !== language) {

                    var newTable;

                    if (language === "GUJARATI") {
                        newTable =
                            document.getElementById("gujaratiMovies");
                    }
                    else {
                        newTable =
                            document.getElementById("englishMovies");
                    }


                    var newRow =
                        createMovieRow(
                            language,
                            title,
                            rating,
                            genre
                        );


                    newTable.appendChild(newRow);

                    editingRow.remove();

                }
                else {

                    editingRow.setAttribute(
                        "data-language",
                        language
                    );

                    editingRow.setAttribute(
                        "data-genre",
                        genre
                    );

                    editingRow.querySelector(
                        ".movie-title"
                    ).innerText = title;

                    editingRow.querySelector(
                        ".movie-rating"
                    ).innerHTML = formatRating(rating);

                }

                updateCounts();

                closeMovieModal();

                alert("Movie updated successfully.");

                return;
            }


            /* =====================================
               ADD NEW
            ====================================== */

            var targetTable;

            if (language === "GUJARATI") {

                targetTable =
                    document.getElementById("gujaratiMovies");

            }
            else {

                targetTable =
                    document.getElementById("englishMovies");

            }


            var newRow =
                createMovieRow(
                    language,
                    title,
                    rating,
                    genre
                );


            targetTable.appendChild(newRow);

            updateCounts();

            closeMovieModal();

            alert("Movie added successfully.");

        }


        /* =========================================
           CREATE ROW
        ========================================= */

        function createMovieRow(
            language,
            title,
            rating,
            genre
        ) {

            var row =
                document.createElement("tr");

            row.setAttribute(
                "data-genre",
                genre
            );

            row.setAttribute(
                "data-language",
                language
            );


            row.innerHTML =

                "<td>" +
                language +
                "</td>" +

                "<td class='movie-title'>" +
                escapeHtml(title) +
                "</td>" +

                "<td class='movie-rating'>" +
                formatRating(rating) +
                "</td>" +

                "<td>" +

                "<div class='action-buttons'>" +

                "<button type='button' " +
                "class='btn-edit' " +
                "onclick='editMovie(this)' " +
                "title='Edit'>" +
                "✎" +
                "</button>" +

                "<button type='button' " +
                "class='btn-delete' " +
                "onclick='deleteMovie(this)' " +
                "title='Delete'>" +
                "🗑" +
                "</button>" +

                "</div>" +

                "</td>";


            return row;

        }


        /* =========================================
           FORMAT RATING
        ========================================= */

        function formatRating(value) {

            var lower =
                value.toLowerCase();

            if (
                lower.indexOf("now showing") !== -1
            ) {

                return "<span class='status now'>" +
                    "● Now Showing" +
                    "</span>";

            }


            if (
                value === "-"
            ) {

                return "<span class='status'>" +
                    "-" +
                    "</span>";

            }


            return escapeHtml(value);

        }


        /* =========================================
           DELETE MOVIE
        ========================================= */

        function deleteMovie(button) {

            deletingRow =
                button.closest("tr");

            var title =
                deletingRow.querySelector(
                    ".movie-title"
                ).innerText.trim();


            document.getElementById(
                "deleteMovieName"
            ).innerText =
                title;


            document.getElementById(
                "deleteModal"
            ).classList.add("show");

        }


        /* =========================================
           CONFIRM DELETE
        ========================================= */

        function confirmDelete() {

            if (deletingRow !== null) {

                deletingRow.remove();

                updateCounts();

                deletingRow = null;

                closeDeleteModal();

                alert("Movie deleted successfully.");

            }

        }


        /* =========================================
           CLOSE MOVIE MODAL
        ========================================= */

        function closeMovieModal() {

            document.getElementById(
                "movieModal"
            ).classList.remove("show");

            editingRow = null;

        }


        /* =========================================
           CLOSE DELETE MODAL
        ========================================= */

        function closeDeleteModal() {

            document.getElementById(
                "deleteModal"
            ).classList.remove("show");

            deletingRow = null;

        }


        /* =========================================
           UPDATE FILM COUNTS
        ========================================= */

        function updateCounts() {

            var gujarati =
                document.querySelectorAll(
                    "#gujaratiMovies tr"
                ).length;


            var english =
                document.querySelectorAll(
                    "#englishMovies tr"
                ).length;


            document.getElementById(
                "gujaratiCount"
            ).innerText =
                gujarati + " Films Active";


            document.getElementById(
                "englishCount"
            ).innerText =
                english + " Films Active";

        }


        /* =========================================
           GENRE FILTER
        ========================================= */

        function filterGenre(genre, button) {

            document
                .querySelectorAll(".genre")
                .forEach(function (item) {

                    item.classList.remove("active");

                });


            button.classList.add("active");


            var rows =
                document.querySelectorAll(
                    ".movie-table tbody tr"
                );


            rows.forEach(function (row) {

                var rowGenre =
                    row.getAttribute("data-genre");


                if (
                    genre === "ALL" ||
                    rowGenre === genre
                ) {

                    row.style.display = "table-row";

                }
                else {

                    row.style.display = "none";

                }

            });


            var message =
                document.getElementById(
                    "genreMessage"
                );


            if (genre === "ALL") {

                message.innerText =
                    "Showing all movies.";

            }
            else {

                message.innerText =
                    "Showing " +
                    genre.toLowerCase() +
                    " movies.";

            }

        }


        /* =========================================
           ESCAPE HTML
        ========================================= */

        function escapeHtml(text) {

            var div =
                document.createElement("div");

            div.textContent = text;

            return div.innerHTML;

        }


        /* =========================================
           CLOSE MODAL WHEN CLICK OUTSIDE
        ========================================= */

        document.addEventListener(
            "click",
            function (event) {

                var movieModal =
                    document.getElementById(
                        "movieModal"
                    );

                var deleteModal =
                    document.getElementById(
                        "deleteModal"
                    );


                if (
                    event.target === movieModal
                ) {

                    closeMovieModal();

                }


                if (
                    event.target === deleteModal
                ) {

                    closeDeleteModal();

                }

            }
        );


        /* =========================================
           ESC KEY
        ========================================= */

        document.addEventListener(
            "keydown",
            function (event) {

                if (event.key === "Escape") {

                    closeMovieModal();

                    closeDeleteModal();

                }

            }
        );

    </script>

</asp:Content>