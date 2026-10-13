<%@ Page Title="Theater" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="theater.aspx.cs" Inherits="WebApplication2.theater" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
    .theater-page {
        min-height: 100vh;
        background: #111111;
        color: #ffffff;
        padding: 25px 35px 45px 35px;
    }

    .theater-section { margin-bottom: 30px; }

    .section-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 12px;
    }

    .section-heading {
        margin: 0;
        color: #eeeeee;
        font-size: 16px;
        font-weight: 600;
    }

    .section-description {
        margin: 5px 0 0 0;
        color: #8c8c8c;
        font-size: 10px;
    }

    .add-button {
        background: #ff111c;
        color: #ffffff;
        border: none;
        border-radius: 4px;
        padding: 8px 14px;
        font-size: 11px;
        cursor: pointer;
        white-space: nowrap;
        font-weight: 500;
        transition: 0.2s;
    }
    .add-button:hover { background: #d90009; }

    .table-box {
        width: 100%;
        background: #181818;
        border: 1px solid #303030;
        border-radius: 5px;
        overflow: hidden;
    }

    .theater-table { width: 100%; border-collapse: collapse; }

    .theater-table th {
        height: 42px;
        background: #1b1b1b;
        color: #d2a7a7;
        font-size: 10px;
        font-weight: 500;
        letter-spacing: 0.7px;
        text-align: left;
        padding: 0 15px;
        border-bottom: 1px solid #303030;
        text-transform: uppercase;
    }

    .theater-table td {
        min-height: 52px;
        padding: 12px 15px;
        color: #c6c6c6;
        font-size: 11px;
        border-bottom: 1px solid #292929;
        vertical-align: middle;
    }

    .theater-table tr:last-child td { border-bottom: none; }
    .theater-table tbody tr:hover td { background: #202020; }

    .number { width: 32px; color: #777777 !important; }

    .theater-name,
    .movie-name {
        color: #eeeeee !important;
        font-weight: 500;
        white-space: nowrap;
    }

    .location,
    .format,
    .show-time {
        color: #b8b8b8 !important;
        white-space: nowrap;
    }

    .amenities,
    .features {
        display: flex;
        flex-wrap: wrap;
        gap: 5px;
    }

    .amenity,
    .feature {
        display: inline-block;
        background: #333333;
        color: #c9b2b2;
        border-radius: 3px;
        padding: 4px 8px;
        font-size: 9px;
        white-space: nowrap;
    }

    .actions {
        text-align: right;
        white-space: nowrap;
        display: inline-flex;
        align-items: center;
        gap: 6px;
        justify-content: flex-end;
        width: 100%;
    }

    .edit-button {
        background: transparent;
        color: #dddddd;
        border: 1px solid #604444;
        border-radius: 3px;
        padding: 0 12px;
        font-size: 10px;
        cursor: pointer;
        transition: 0.2s;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        height: 26px;
        line-height: 1;
        text-decoration: none;
        white-space: nowrap;
    }
    .edit-button:hover { background: #333333; color: #ffffff; text-decoration: none; }

    .delete-button {
        background: #ff111c;
        color: #ffffff;
        border: 1px solid #ff111c;
        border-radius: 3px;
        padding: 0 12px;
        font-size: 10px;
        cursor: pointer;
        transition: 0.2s;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        height: 26px;
        line-height: 1;
        text-decoration: none;
        white-space: nowrap;
    }
    .delete-button:hover { background: #d90009; border-color: #d90009; text-decoration: none; }

    /* ============ MODAL ============ */
    .theater-modal-overlay {
        display: none;
        position: fixed;
        inset: 0;
        z-index: 9999;
        background: rgba(0, 0, 0, 0.75);
        align-items: center;
        justify-content: center;
    }
    .theater-modal-overlay.show { display: flex; }

    .theater-modal {
        width: 430px;
        max-width: calc(100% - 30px);
        max-height: 90vh;
        overflow-y: auto;
        background: #242424;
        border: 1px solid #3a3a3a;
        border-radius: 9px;
    }

    .modal-header {
        height: 54px;
        padding: 0 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        background: #2c2c2c;
        border-bottom: 1px solid #3a3a3a;
    }

    .modal-title { color: #ffffff; font-size: 14px; font-weight: 500; }

    .modal-close {
        border: none;
        background: transparent;
        color: #999999;
        font-size: 20px;
        cursor: pointer;
    }
    .modal-close:hover { color: #ffffff; }

    .modal-body { padding: 20px; }

    .modal-field { margin-bottom: 14px; }

    .modal-field label {
        display: block;
        color: #858585;
        font-size: 9px;
        text-transform: uppercase;
        letter-spacing: .5px;
        margin-bottom: 6px;
    }

    .modal-field input,
    .modal-field textarea {
        width: 100%;
        background: #181818;
        border: 1px solid #3b3b3b;
        border-radius: 4px;
        color: #eeeeee;
        padding: 0 10px;
        outline: none;
        font-size: 11px;
        box-sizing: border-box;
        font-family: Arial, Helvetica, sans-serif;
    }
    .modal-field input { height: 35px; }
    .modal-field textarea { min-height: 70px; padding: 10px; resize: vertical; }
    .modal-field input:focus,
    .modal-field textarea:focus { border-color: #777777; }

    .error-msg {
        display: block;
        color: #ff6666;
        font-size: 10px;
        margin-top: 5px;
    }

    .modal-footer {
        display: flex;
        justify-content: flex-end;
        gap: 8px;
        padding: 15px 20px;
        background: #202020;
        border-top: 1px solid #333333;
    }

    .modal-cancel, .modal-save {
        height: 32px;
        padding: 0 15px;
        border-radius: 4px;
        font-size: 10px;
        cursor: pointer;
    }

    .modal-cancel {
        background: transparent;
        border: 1px solid #444444;
        color: #aaaaaa;
    }
    .modal-cancel:hover { color: #ffffff; background: #303030; }

    .modal-save {
        background: #ff111c;
        border: 1px solid #ff111c;
        color: #ffffff;
        font-weight: 600;
    }
    .modal-save:hover { background: #d90009; }

    @media screen and (max-width: 1000px) {
        .theater-page { padding: 20px 18px 40px 18px; }
        .theater-table { min-width: 750px; }
        .table-box { overflow-x: auto; }
    }

    @media screen and (max-width: 700px) {
        .section-header {
            flex-direction: column;
            align-items: flex-start;
            gap: 10px;
        }
        .section-heading { font-size: 15px; }
    }
</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HiddenField ID="hdnEditTheaterId" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnEditShowingId" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnEditSignatureId" runat="server" ClientIDMode="Static" />

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var hamburger = document.getElementById("mainHamburger");
            if (hamburger) { hamburger.style.display = "flex"; }

            var header = document.querySelector(".cine-header");
            var searchArea = document.querySelector(".header-search-area");

            if (header && searchArea && !document.getElementById("theaterHeaderTitle")) {
                var titleEl = document.createElement("div");
                titleEl.id = "theaterHeaderTitle";
                titleEl.innerText = "Theater Management";
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
        });

        function closeTheaterModal() {
            document.getElementById("theaterModal").classList.remove("show");
            document.getElementById("hdnEditTheaterId").value = "";
        }

        function closeShowingModal() {
            document.getElementById("showingModal").classList.remove("show");
            document.getElementById("hdnEditShowingId").value = "";
        }

        function closeSignatureModal() {
            document.getElementById("signatureModal").classList.remove("show");
            document.getElementById("hdnEditSignatureId").value = "";
        }

        document.addEventListener("click", function (event) {
            if (event.target === document.getElementById("theaterModal")) { closeTheaterModal(); }
            if (event.target === document.getElementById("showingModal")) { closeShowingModal(); }
            if (event.target === document.getElementById("signatureModal")) { closeSignatureModal(); }
        });

        document.addEventListener("keydown", function (event) {
            if (event.key === "Escape") {
                closeTheaterModal();
                closeShowingModal();
                closeSignatureModal();
            }
        });

        function openAddTheater() {
            document.getElementById("theaterModalTitle").innerText = "Add Theater";
            document.getElementById("txtTheaterName").value = "";
            document.getElementById("txtLocation").value = "";
            document.getElementById("txtAmenities").value = "";
            document.getElementById("hdnEditTheaterId").value = "";
            document.getElementById("btnSaveTheater").value = "Save Theater";
            document.getElementById("theaterModal").classList.add("show");
            setTimeout(function () { document.getElementById("txtTheaterName").focus(); }, 100);
        }

        function openAddShowing() {
            document.getElementById("showingModalTitle").innerText = "Add Showing";
            document.getElementById("txtShowingMovie").value = "";
            document.getElementById("txtShowingFormat").value = "";
            document.getElementById("txtShowingTimings").value = "";
            document.getElementById("hdnEditShowingId").value = "";
            document.getElementById("btnSaveShowing").value = "Save Showing";
            document.getElementById("showingModal").classList.add("show");
            setTimeout(function () { document.getElementById("txtShowingMovie").focus(); }, 100);
        }

        function openAddSignature() {
            document.getElementById("signatureModalTitle").innerText = "Add Signature Screen";
            document.getElementById("txtSignatureMovie").value = "";
            document.getElementById("txtSignatureFormat").value = "";
            document.getElementById("txtSignatureFeatures").value = "";
            document.getElementById("txtSignatureTimings").value = "";
            document.getElementById("hdnEditSignatureId").value = "";
            document.getElementById("btnSaveSignature").value = "Save Signature Screen";
            document.getElementById("signatureModal").classList.add("show");
            setTimeout(function () { document.getElementById("txtSignatureMovie").focus(); }, 100);
        }
    </script>

<div class="theater-page">

    <!-- ==================================================
         SECTION 1: THEATER LISTINGS
    ================================================== -->
    <div class="theater-section">
        <div class="section-header">
            <div>
                <h2 class="section-heading">Theater Listings</h2>
                <p class="section-description">Manage theater locations and amenities.</p>
            </div>
            <button type="button" class="add-button" onclick="openAddTheater();">+ Add Theater</button>
        </div>

        <div class="table-box">
            <table class="theater-table">
                <thead>
                    <tr>
                        <th style="width:35px;">#</th>
                        <th>Theater Name</th>
                        <th>Location</th>
                        <th>Amenities</th>
                        <th style="text-align:right;">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptTheaters" runat="server" OnItemCommand="rptTheaters_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td class="number"><%# Container.ItemIndex + 1 %></td>
                                <td class="theater-name"><%# Eval("Name") %></td>
                                <td class="location"><%# Eval("Location") %></td>
                                <td>
                                    <div class="amenities">
                                        <span class="amenity"><%# Eval("Amenities") %></span>
                                    </div>
                                </td>
                                <td>
                                    <div class="actions">
                                        <asp:LinkButton runat="server" CssClass="edit-button" Text="✎ EDIT"
                                            CommandName="EditTheater" CommandArgument='<%# Eval("Id") %>' />
                                        <asp:LinkButton runat="server" CssClass="delete-button" Text="🗑 DELETE"
                                            CommandName="DeleteTheater" CommandArgument='<%# Eval("Id") %>'
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


    <!-- ==================================================
         SECTION 2: MOVIE SHOWINGS
    ================================================== -->
    <div class="theater-section">
        <div class="section-header">
            <div>
                <h2 class="section-heading">Movie Showings</h2>
                <p class="section-description">Manage signature screens and show timings.</p>
            </div>
            <button type="button" class="add-button" onclick="openAddShowing();">+ Add Showing</button>
        </div>

        <div class="table-box">
            <table class="theater-table">
                <thead>
                    <tr>
                        <th style="width:35px;">#</th>
                        <th>Movie</th>
                        <th>Format</th>
                        <th>Show Timings</th>
                        <th style="text-align:right;">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptShowings" runat="server" OnItemCommand="rptShowings_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td class="number"><%# Container.ItemIndex + 1 %></td>
                                <td class="movie-name"><%# Eval("Movie") %></td>
                                <td class="format"><%# Eval("Format") %></td>
                                <td class="show-time"><%# Eval("ShowTimings") %></td>
                                <td>
                                    <div class="actions">
                                        <asp:LinkButton runat="server" CssClass="edit-button" Text="✎ EDIT"
                                            CommandName="EditShowing" CommandArgument='<%# Eval("Id") %>' />
                                        <asp:LinkButton runat="server" CssClass="delete-button" Text="🗑 DELETE"
                                            CommandName="DeleteShowing" CommandArgument='<%# Eval("Id") %>'
                                            OnClientClick="return confirm('Delete this showing?');" />
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>


    <!-- ==================================================
         SECTION 3: SIGNATURE SCREENS
    ================================================== -->
    <div class="theater-section">
        <div class="section-header">
            <div>
                <h2 class="section-heading">Signature Screens Management</h2>
                <p class="section-description">Manage premium viewing formats and signature experiences.</p>
            </div>
            <button type="button" class="add-button" onclick="openAddSignature();">+ Add Signature Screen</button>
        </div>

        <div class="table-box">
            <table class="theater-table">
                <thead>
                    <tr>
                        <th style="width:35px;">#</th>
                        <th>Movie</th>
                        <th>Format</th>
                        <th>Features</th>
                        <th>Show Timings</th>
                        <th style="text-align:right;">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptSignatureScreens" runat="server" OnItemCommand="rptSignatureScreens_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td class="number"><%# Container.ItemIndex + 1 %></td>
                                <td class="movie-name"><%# Eval("Movie") %></td>
                                <td class="format"><%# Eval("Format") %></td>
                                <td>
                                    <div class="features">
                                        <span class="feature"><%# Eval("Features") %></span>
                                    </div>
                                </td>
                                <td class="show-time"><%# Eval("ShowTimings") %></td>
                                <td>
                                    <div class="actions">
                                        <asp:LinkButton runat="server" CssClass="edit-button" Text="✎ EDIT"
                                            CommandName="EditSignatureScreen" CommandArgument='<%# Eval("Id") %>' />
                                        <asp:LinkButton runat="server" CssClass="delete-button" Text="🗑 DELETE"
                                            CommandName="DeleteSignatureScreen" CommandArgument='<%# Eval("Id") %>'
                                            OnClientClick="return confirm('Delete this signature screen?');" />
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
    </div>

</div>


<!-- ============ THEATER MODAL ============ -->
<div id="theaterModal" class="theater-modal-overlay">
    <div class="theater-modal">
        <div class="modal-header">
            <div class="modal-title" id="theaterModalTitle">Add Theater</div>
            <button type="button" class="modal-close" onclick="closeTheaterModal();">×</button>
        </div>
        <div class="modal-body">
            <div class="modal-field">
                <label>Theater Name</label>
                <asp:TextBox ID="txtTheaterName" runat="server" ClientIDMode="Static" placeholder="e.g. Cineplus Downtown" />
            </div>
            <div class="modal-field">
                <label>Location</label>
                <asp:TextBox ID="txtLocation" runat="server" ClientIDMode="Static" placeholder="e.g. Mumbai, MH" />
            </div>
            <div class="modal-field">
                <label>Amenities</label>
                <asp:TextBox ID="txtAmenities" runat="server" ClientIDMode="Static" placeholder="e.g. IMAX, ATMOS" />
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="modal-cancel" onclick="closeTheaterModal();">Cancel</button>
            <asp:Button ID="btnSaveTheater" runat="server" ClientIDMode="Static" CssClass="modal-save"
                Text="Save Theater" OnClick="btnSaveTheater_Click" />
        </div>
    </div>
</div>


<!-- ============ SHOWING MODAL ============ -->
<div id="showingModal" class="theater-modal-overlay">
    <div class="theater-modal">
        <div class="modal-header">
            <div class="modal-title" id="showingModalTitle">Add Showing</div>
            <button type="button" class="modal-close" onclick="closeShowingModal();">×</button>
        </div>
        <div class="modal-body">
            <div class="modal-field">
                <label>Movie</label>
                <asp:TextBox ID="txtShowingMovie" runat="server" ClientIDMode="Static" placeholder="e.g. Dune: Part Two" />
            </div>
            <div class="modal-field">
                <label>Format</label>
                <asp:TextBox ID="txtShowingFormat" runat="server" ClientIDMode="Static" placeholder="e.g. IMAX 70mm" />
            </div>
            <div class="modal-field">
                <label>Show Timings</label>
                <asp:TextBox ID="txtShowingTimings" runat="server" ClientIDMode="Static"
                    TextMode="MultiLine" placeholder="e.g. 10:00 AM, 02:30 PM, 07:00 PM" />
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="modal-cancel" onclick="closeShowingModal();">Cancel</button>
            <asp:Button ID="btnSaveShowing" runat="server" ClientIDMode="Static" CssClass="modal-save"
                Text="Save Showing" OnClick="btnSaveShowing_Click" />
        </div>
    </div>
</div>


<!-- ============ SIGNATURE MODAL ============ -->
<div id="signatureModal" class="theater-modal-overlay">
    <div class="theater-modal">
        <div class="modal-header">
            <div class="modal-title" id="signatureModalTitle">Add Signature Screen</div>
            <button type="button" class="modal-close" onclick="closeSignatureModal();">×</button>
        </div>
        <div class="modal-body">
            <div class="modal-field">
                <label>Movie</label>
                <asp:TextBox ID="txtSignatureMovie" runat="server" ClientIDMode="Static" placeholder="e.g. FIGHTER" />
            </div>
            <div class="modal-field">
                <label>Format</label>
                <asp:TextBox ID="txtSignatureFormat" runat="server" ClientIDMode="Static" placeholder="e.g. IMAX, 4DX" />
            </div>
            <div class="modal-field">
                <label>Features</label>
                <asp:TextBox ID="txtSignatureFeatures" runat="server" ClientIDMode="Static" placeholder="e.g. Dolby Vision, Dolby Atmos" />
            </div>
            <div class="modal-field">
                <label>Show Timings</label>
                <asp:TextBox ID="txtSignatureTimings" runat="server" ClientIDMode="Static"
                    TextMode="MultiLine" placeholder="e.g. 2:30 PM, 6:00 PM, 9:45 PM" />
            </div>
        </div>
        <div class="modal-footer">
            <button type="button" class="modal-cancel" onclick="closeSignatureModal();">Cancel</button>
            <asp:Button ID="btnSaveSignature" runat="server" ClientIDMode="Static" CssClass="modal-save"
                Text="Save Signature Screen" OnClick="btnSaveSignature_Click" />
        </div>
    </div>
</div>

</asp:Content>