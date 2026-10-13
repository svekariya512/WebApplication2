<%@ Page Title="Movies" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="movies.aspx.cs" Inherits="WebApplication2.movies" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style>
    * { box-sizing: border-box; }
    html, body { background: #111111; color: #ffffff; font-family: Arial, Helvetica, sans-serif; }

    .movies-main { min-height: 100vh; background: #111111; padding: 25px 45px 70px 45px; }
    .movie-area { display: flex; gap: 22px; align-items: flex-start; }
    .movie-left { width: 70%; min-width: 0; }
    .movie-right { width: 30%; }

    .movie-box { background: #101010; border: 1px solid #303030; border-radius: 5px; overflow: hidden; margin-bottom: 20px; }
    .box-header { min-height: 52px; padding: 0 14px; display: flex; align-items: center; justify-content: space-between; border-bottom: 1px solid #292929; }
    .box-title { font-size: 14px; font-weight: bold; border-left: 3px solid #ff3333; padding-left: 8px; color: #ffffff; }
    .box-header-right { display: flex; align-items: center; gap: 10px; }
    .film-count { font-size: 9px; color: #aaaaaa; background: #333333; padding: 5px 8px; border-radius: 10px; }

    .add-movie-btn { background: #ffb6b1; color: #171717; border: none; padding: 7px 11px; border-radius: 4px; font-size: 9px; font-weight: 600; cursor: pointer; }
    .add-movie-btn:hover { background: #ffc8c4; }

    .movie-table { width: 100%; border-collapse: collapse; }
    .movie-table th { height: 38px; text-align: left; padding: 0 15px; color: #888888; font-size: 8px; letter-spacing: 1px; background: #181818; }
    .movie-table td { height: 45px; padding: 0 15px; color: #bbbbbb; font-size: 10px; border-top: 1px solid #242424; }
    .movie-table tr:hover td { background: #191919; }

    .action-buttons { display: flex; align-items: center; gap: 6px; }

    .btn-view, .btn-edit, .btn-delete {
        height: 27px; padding: 0 10px; border: none; border-radius: 3px;
        cursor: pointer; font-size: 9px; font-weight: 600;
        display: inline-flex; align-items: center; justify-content: center;
        text-decoration: none;
    }
    .btn-view { background: #2a4a6b; color: #fff; }
    .btn-view:hover { background: #356089; }
    .btn-edit { background: #3a3a3a; color: #ffffff; }
    .btn-edit:hover { background: #555555; }
    .btn-delete { background: #ff2633; color: #ffffff; }
    .btn-delete:hover { background: #d91d29; }

    .genre-box { background: #101010; border: 1px solid #303030; border-radius: 5px; padding: 18px; }
    .genre-title { font-size: 14px; margin: 0 0 15px 0; color: #ffffff; }
    .genre-buttons { display: flex; flex-wrap: wrap; gap: 6px; }
    .genre { background: #292929; color: #bbbbbb; border: 1px solid #444444; padding: 6px 8px; font-size: 8px; cursor: pointer; }
    .genre:hover { color: #ffffff; border-color: #ff3333; }
    .genre.active { background: #651b1b; color: #ffffff; border-color: #ff3333; }
    .genre-message { margin-top: 15px; color: #777777; font-size: 9px; }

    /* MODAL */
    .movie-modal-overlay { display: none; position: fixed; z-index: 99999; left: 0; top: 0; width: 100%; height: 100%; background: rgba(0,0,0,0.78); align-items: center; justify-content: center; }
    .movie-modal-overlay.show { display: flex; }
    .movie-modal { width: 430px; max-width: 92%; background: #222222; border: 1px solid #3a3a3a; border-radius: 8px; overflow: hidden; }
    .movie-modal-header { height: 55px; display: flex; align-items: center; justify-content: space-between; padding: 0 18px; border-bottom: 1px solid #363636; }
    .movie-modal-title { color: #ffffff; font-size: 15px; font-weight: 600; }
    .modal-close { border: none; background: transparent; color: #999999; font-size: 20px; cursor: pointer; }
    .modal-close:hover { color: #ffffff; }
    .movie-modal-body { padding: 20px; }
    .modal-field { margin-bottom: 15px; }
    .modal-field label { display: block; color: #888888; font-size: 9px; text-transform: uppercase; margin-bottom: 7px; }
    .modal-field input, .modal-field select { width: 100%; height: 36px; background: #151515; border: 1px solid #3b3b3b; border-radius: 4px; color: #ffffff; outline: none; padding: 0 10px; font-size: 11px; }
    .modal-field input:focus, .modal-field select:focus { border-color: #777777; }
    .error-msg { display: block; color: #ff6666; font-size: 10px; margin-top: 5px; }
    .movie-modal-footer { display: flex; justify-content: flex-end; gap: 8px; padding: 14px 20px; border-top: 1px solid #363636; }
    .modal-cancel, .modal-save { height: 33px; padding: 0 16px; border-radius: 4px; cursor: pointer; font-size: 10px; border: none; }
    .modal-cancel { background: #333333; color: #cccccc; }
    .modal-save { background: #ff5f5f; color: #ffffff; font-weight: 600; }
    .modal-save:hover { background: #ff4141; }

    .view-detail-value { width: 100%; min-height: 36px; background: #151515; border: 1px solid #3b3b3b; border-radius: 4px; color: #ffffff; padding: 9px 10px; font-size: 11px; display: flex; align-items: center; }

    @media(max-width: 1100px) {
        .movie-area { flex-direction: column; }
        .movie-left, .movie-right { width: 100%; }
    }
</style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var hamburger = document.getElementById("mainHamburger");
            if (hamburger) { hamburger.style.display = "flex"; }

            var header = document.querySelector(".cine-header");
            var searchArea = document.querySelector(".header-search-area");

            if (header && searchArea && !document.getElementById("moviesHeaderTitle")) {
                var titleEl = document.createElement("div");
                titleEl.id = "moviesHeaderTitle";
                titleEl.innerText = "Now Showing";
                titleEl.style.color = "#FFC3B9";
                titleEl.style.fontSize = "22px";
                titleEl.style.fontWeight = "500";
                titleEl.style.marginLeft = "10px";
                titleEl.style.marginRight = "10px";
                header.insertBefore(titleEl, searchArea);
            }
        });
    </script>

    <div class="movies-main">

        <div class="movie-area">

            <div class="movie-left">

                <!-- GUJARATI MOVIES -->
                <div class="movie-box">
                    <div class="box-header">
                        <div class="box-title">GUJARATI MOVIES</div>
                        <div class="box-header-right">
                            <asp:Label ID="GujaratiCount" runat="server" CssClass="film-count"></asp:Label>
                            <asp:Button ID="AddGujarati" runat="server" Text="✚ Add Movie"
                                CssClass="add-movie-btn" CommandArgument="GUJARATI"
                                OnClick="AddMovie_Click" CausesValidation="false" />
                        </div>
                    </div>

                    <table class="movie-table">
                        <thead>
                            <tr><th>LANGUAGE</th><th>MOVIE TITLE</th><th>RATING/STATUS</th><th>ACTION</th></tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="GujaratiRepeater" runat="server" OnItemCommand="MoviesRepeater_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#: Eval("Language") %></td>
                                        <td class="movie-title"><%#: Eval("Title") %></td>
                                        <td><%#: Eval("RatingStatus") %></td>
                                        <td>
                                            <div class="action-buttons">
                                                <asp:LinkButton runat="server" Text="VIEW" CssClass="btn-view"
                                                    CommandName="ViewMovie" CommandArgument='<%# Eval("MovieId") %>'
                                                    CausesValidation="false" />
                                                <asp:LinkButton runat="server" Text="EDIT" CssClass="btn-edit"
                                                    CommandName="EditMovie" CommandArgument='<%# Eval("MovieId") %>'
                                                    CausesValidation="false" />
                                                <asp:LinkButton runat="server" Text="DELETE" CssClass="btn-delete"
                                                    CommandName="DeleteMovie" CommandArgument='<%# Eval("MovieId") %>'
                                                    CausesValidation="false"
                                                    OnClientClick="return confirm('Delete this movie?');" />
                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>

                <!-- ENGLISH MOVIES -->
                <div class="movie-box">
                    <div class="box-header">
                        <div class="box-title">ENGLISH MOVIES</div>
                        <div class="box-header-right">
                            <asp:Label ID="EnglishCount" runat="server" CssClass="film-count"></asp:Label>
                            <asp:Button ID="AddEnglish" runat="server" Text="✚ Add Movie"
                                CssClass="add-movie-btn" CommandArgument="ENGLISH"
                                OnClick="AddMovie_Click" CausesValidation="false" />
                        </div>
                    </div>

                    <table class="movie-table">
                        <thead>
                            <tr><th>LANGUAGE</th><th>MOVIE TITLE</th><th>RATING/STATUS</th><th>ACTION</th></tr>
                        </thead>
                        <tbody>
                            <asp:Repeater ID="EnglishRepeater" runat="server" OnItemCommand="MoviesRepeater_ItemCommand">
                                <ItemTemplate>
                                    <tr>
                                        <td><%#: Eval("Language") %></td>
                                        <td class="movie-title"><%#: Eval("Title") %></td>
                                        <td><%#: Eval("RatingStatus") %></td>
                                        <td>
                                            <div class="action-buttons">
                                                <asp:LinkButton runat="server" Text="VIEW" CssClass="btn-view"
                                                    CommandName="ViewMovie" CommandArgument='<%# Eval("MovieId") %>'
                                                    CausesValidation="false" />
                                                <asp:LinkButton runat="server" Text="EDIT" CssClass="btn-edit"
                                                    CommandName="EditMovie" CommandArgument='<%# Eval("MovieId") %>'
                                                    CausesValidation="false" />
                                                <asp:LinkButton runat="server" Text="DELETE" CssClass="btn-delete"
                                                    CommandName="DeleteMovie" CommandArgument='<%# Eval("MovieId") %>'
                                                    CausesValidation="false"
                                                    OnClientClick="return confirm('Delete this movie?');" />
                                            </div>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>
                </div>

            </div>

            <div class="movie-right">
                <div class="genre-box">
                    <h3 class="genre-title">⚙ Genre Overview</h3>
                    <div class="genre-buttons">
                        <asp:Button runat="server" Text="ALL" CssClass="genre" CommandArgument="ALL" OnCommand="FilterGenre_Command" CausesValidation="false" />
                        <asp:Button runat="server" Text="ACTION" CssClass="genre" CommandArgument="ACTION" OnCommand="FilterGenre_Command" CausesValidation="false" />
                        <asp:Button runat="server" Text="THRILLER" CssClass="genre" CommandArgument="THRILLER" OnCommand="FilterGenre_Command" CausesValidation="false" />
                        <asp:Button runat="server" Text="DOCUMENTARY" CssClass="genre" CommandArgument="DOCUMENTARY" OnCommand="FilterGenre_Command" CausesValidation="false" />
                        <asp:Button runat="server" Text="HISTORICAL" CssClass="genre" CommandArgument="HISTORICAL" OnCommand="FilterGenre_Command" CausesValidation="false" />
                        <asp:Button runat="server" Text="ARRIVE" CssClass="genre" CommandArgument="ARRIVE" OnCommand="FilterGenre_Command" CausesValidation="false" />
                        <asp:Button runat="server" Text="NEW" CssClass="genre" CommandArgument="NEW" OnCommand="FilterGenre_Command" CausesValidation="false" />
                        <asp:Button runat="server" Text="LONG" CssClass="genre" CommandArgument="LONG" OnCommand="FilterGenre_Command" CausesValidation="false" />
                    </div>
                    <div class="genre-message">
                        <asp:Label ID="GenreMessage" runat="server" Text="Showing all movies."></asp:Label>
                    </div>
                </div>
            </div>

        </div>
    </div>


    <!-- ============ ADD / EDIT MOVIE MODAL ============ -->
    <asp:Panel ID="MovieModal" runat="server" CssClass="movie-modal-overlay">
        <div class="movie-modal">
            <div class="movie-modal-header">
                <asp:Label ID="MovieModalTitle" runat="server" Text="Add Movie" CssClass="movie-modal-title"></asp:Label>
                <asp:Button ID="CloseModalButton" runat="server" Text="×"
                    CssClass="modal-close" OnClick="CancelMovie_Click" CausesValidation="false" />
            </div>

            <div class="movie-modal-body">
                <asp:HiddenField ID="MovieIdField" runat="server" Value="-1" />

                <div class="modal-field">
                    <label>Language</label>
                    <asp:DropDownList ID="MovieLanguage" runat="server" CssClass="modal-field">
                        <asp:ListItem Value="GUJARATI">GUJARATI</asp:ListItem>
                        <asp:ListItem Value="ENGLISH">ENGLISH</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="LanguageError" runat="server" CssClass="error-msg"></asp:Label>
                </div>

                <div class="modal-field">
                    <label>Movie Title</label>
                    <asp:TextBox ID="MovieTitleInput" runat="server" MaxLength="100" placeholder="Enter movie title"></asp:TextBox>
                    <asp:Label ID="TitleError" runat="server" CssClass="error-msg"></asp:Label>
                </div>

                <div class="modal-field">
                    <label>Rating / Status</label>
                    <asp:TextBox ID="MovieRatingInput" runat="server" MaxLength="30" placeholder="Example: 8.5/10 or Now Showing"></asp:TextBox>
                    <asp:Label ID="RatingError" runat="server" CssClass="error-msg"></asp:Label>
                </div>

                <div class="modal-field">
                    <label>Genre</label>
                    <asp:DropDownList ID="MovieGenreInput" runat="server" CssClass="modal-field">
                        <asp:ListItem Value="ACTION">ACTION</asp:ListItem>
                        <asp:ListItem Value="THRILLER">THRILLER</asp:ListItem>
                        <asp:ListItem Value="DOCUMENTARY">DOCUMENTARY</asp:ListItem>
                        <asp:ListItem Value="HISTORICAL">HISTORICAL</asp:ListItem>
                        <asp:ListItem Value="ARRIVE">ARRIVE</asp:ListItem>
                        <asp:ListItem Value="NEW">NEW</asp:ListItem>
                        <asp:ListItem Value="LONG">LONG</asp:ListItem>
                        <asp:ListItem Value="ALL">ALL</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="movie-modal-footer">
                <asp:Button ID="CancelMovieButton" runat="server" Text="Cancel"
                    CssClass="modal-cancel" OnClick="CancelMovie_Click" CausesValidation="false" />
                <asp:Button ID="SaveMovieButton" runat="server" Text="Save Movie"
                    CssClass="modal-save" OnClick="SaveMovie_Click" />
            </div>
        </div>
    </asp:Panel>


    <!-- ============ VIEW MOVIE MODAL ============ -->
    <asp:Panel ID="ViewMovieModal" runat="server" CssClass="movie-modal-overlay">
        <div class="movie-modal">
            <div class="movie-modal-header">
                <asp:Label ID="ViewMovieTitle" runat="server" Text="Movie Details" CssClass="movie-modal-title"></asp:Label>
                <asp:Button ID="CloseViewButton" runat="server" Text="×"
                    CssClass="modal-close" OnClick="CancelView_Click" CausesValidation="false" />
            </div>

            <div class="movie-modal-body">
                <div class="modal-field">
                    <label>Language</label>
                    <asp:Label ID="ViewLanguage" runat="server" CssClass="view-detail-value"></asp:Label>
                </div>
                <div class="modal-field">
                    <label>Movie Title</label>
                    <asp:Label ID="ViewTitle" runat="server" CssClass="view-detail-value"></asp:Label>
                </div>
                <div class="modal-field">
                    <label>Rating / Status</label>
                    <asp:Label ID="ViewRating" runat="server" CssClass="view-detail-value"></asp:Label>
                </div>
                <div class="modal-field">
                    <label>Genre</label>
                    <asp:Label ID="ViewGenre" runat="server" CssClass="view-detail-value"></asp:Label>
                </div>
            </div>

            <div class="movie-modal-footer">
                <asp:Button ID="CloseViewFooterButton" runat="server" Text="Close"
                    CssClass="modal-cancel" OnClick="CancelView_Click" CausesValidation="false" />
            </div>
        </div>
    </asp:Panel>

</asp:Content>