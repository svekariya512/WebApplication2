<%@ Page Title="Theater Management" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="theater.aspx.cs" Inherits="WebApplication2.theater" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
    .theater-page {
        min-height: 100vh;
        background: #0d0d0d;
        color: #ffffff;
        padding: 24px 32px 45px 32px;
    }

    .theater-section { margin-bottom: 36px; }

    .section-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 14px;
    }

    .section-heading {
        margin: 0;
        color: #eeeeee;
        font-size: 17px;
        font-weight: 600;
    }

    .section-description {
        margin: 5px 0 0 0;
        color: #8c8c8c;
        font-size: 11px;
    }

    .add-button {
        background: #ff111c;
        color: #ffffff;
        border: none;
        border-radius: 4px;
        padding: 9px 15px;
        font-size: 11px;
        cursor: pointer;
        white-space: nowrap;
        font-weight: 600;
        transition: 0.2s;
    }
    .add-button:hover { background: #d90009; }

    .table-box {
        width: 100%;
        background: #141414;
        border: 1px solid #262626;
        border-radius: 6px;
        overflow: hidden;
    }

    .theater-table { width: 100%; border-collapse: collapse; }

    .theater-table th {
        height: 44px;
        background: #101010;
        color: #9a9a9a;
        font-size: 10px;
        font-weight: 500;
        letter-spacing: 0.6px;
        text-align: left;
        padding: 0 16px;
        border-bottom: 1px solid #262626;
        text-transform: uppercase;
    }

    .theater-table td {
        padding: 14px 16px;
        color: #c9c9c9;
        font-size: 11px;
        border-bottom: 1px solid #202020;
        vertical-align: middle;
    }

    .theater-table tr:last-child td { border-bottom: none; }
    .theater-table tbody tr:hover td { background: #191919; }

    .number { width: 40px; color: #7a7a7a !important; }

    .theater-name, .movie-name {
        color: #ececec !important;
        font-weight: 500;
        white-space: nowrap;
    }

    .location, .format, .show-time {
        color: #b5b5b5 !important;
        white-space: nowrap;
    }

    .show-time.multiline {
        white-space: normal;
        line-height: 18px;
        max-width: 260px;
    }

    .amenities, .features {
        display: flex;
        flex-wrap: wrap;
        gap: 5px;
    }

    .amenity, .feature {
        display: inline-block;
        background: #2b2b2b;
        color: #c9b2b2;
        border-radius: 3px;
        padding: 4px 9px;
        font-size: 9px;
        letter-spacing: 0.3px;
        white-space: nowrap;
        text-transform: uppercase;
        font-weight: 500;
    }

    .comfort-thumb {
        width: 78px;
        height: 42px;
        object-fit: cover;
        border-radius: 4px;
        border: 1px solid #2a2a2a;
        display: block;
    }

    .actions {
        text-align: right;
        white-space: nowrap;
        display: inline-flex;
        align-items: center;
        gap: 8px;
        justify-content: flex-end;
        width: 100%;
    }

    .edit-button {
        background: transparent;
        color: #dddddd;
        border: 1px solid #4a3838;
        border-radius: 3px;
        padding: 0 13px;
        font-size: 10px;
        cursor: pointer;
        transition: 0.2s;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        height: 27px;
        line-height: 1;
        text-decoration: none;
        white-space: nowrap;
    }
    .edit-button:hover { background: #2a2a2a; color: #ffffff; text-decoration: none; }

    .delete-button {
        background: #ff111c;
        color: #ffffff;
        border: 1px solid #ff111c;
        border-radius: 3px;
        padding: 0 13px;
        font-size: 10px;
        cursor: pointer;
        transition: 0.2s;
        display: inline-flex;
        align-items: center;
        justify-content: center;
        height: 27px;
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
    .modal-field input, .modal-field textarea {
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
    .modal-field input:focus, .modal-field textarea:focus { border-color: #777777; }

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
        .theater-table { min-width: 780px; }
        .table-box { overflow-x: auto; }
    }
    @media screen and (max-width: 700px) {
        .section-header { flex-direction: column; align-items: flex-start; gap: 10px; }
        .section-heading { font-size: 15px; }
    }
</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HiddenField ID="hdnEditTheaterId" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnEditShowingId" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnEditSignatureId" runat="server" ClientIDMode="Static" />
    <asp:HiddenField ID="hdnEditComfortId" runat="server" ClientIDMode="Static" />

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
            <asp:Button ID="btnAddTheater" runat="server" CssClass="add-button" Text="+ Add Theater"
                OnClick="btnAddTheater_Click" CausesValidation="false" />
        </div>

        <div class="table-box">
            <table class="theater-table">
                <thead>
                    <tr>
                        <th style="width:40px;">#</th>
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
                                        <asp:Repeater ID="rptAmenities" runat="server"
                                            DataSource='<%# SplitList(Eval("Amenities")) %>'>
                                            <ItemTemplate>
                                                <span class="amenity"><%# Container.DataItem %></span>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </td>
                                <td>
                                    <div class="actions">
                                        <asp:LinkButton runat="server" CssClass="edit-button" Text="✎ Edit"
                                            CommandName="EditTheater" CommandArgument='<%# Eval("Id") %>' CausesValidation="false" />
                                        <asp:LinkButton runat="server" CssClass="delete-button" Text="🗑 Delete"
                                            CommandName="DeleteTheater" CommandArgument='<%# Eval("Id") %>' CausesValidation="false" />
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
            <asp:Button ID="btnAddShowing" runat="server" CssClass="add-button" Text="+ Add Showing"
                OnClick="btnAddShowing_Click" CausesValidation="false" />
        </div>

        <div class="table-box">
            <table class="theater-table">
                <thead>
                    <tr>
                        <th style="width:40px;">#</th>
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
                                        <asp:LinkButton runat="server" CssClass="edit-button" Text="✎ Edit"
                                            CommandName="EditShowing" CommandArgument='<%# Eval("Id") %>' CausesValidation="false" />
                                        <asp:LinkButton runat="server" CssClass="delete-button" Text="🗑 Delete"
                                            CommandName="DeleteShowing" CommandArgument='<%# Eval("Id") %>' CausesValidation="false" />
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
            <asp:Button ID="btnAddSignature" runat="server" CssClass="add-button" Text="+ Add Signature Screen"
                OnClick="btnAddSignature_Click" CausesValidation="false" />
        </div>

        <div class="table-box">
            <table class="theater-table">
                <thead>
                    <tr>
                        <th style="width:40px;">#</th>
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
                                        <asp:Repeater ID="rptFeatures" runat="server"
                                            DataSource='<%# SplitList(Eval("Features")) %>'>
                                            <ItemTemplate>
                                                <span class="feature"><%# Container.DataItem %></span>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </td>
                                <td class="show-time multiline"><%# Eval("ShowTimings") %></td>
                                <td>
                                    <div class="actions">
                                        <asp:LinkButton runat="server" CssClass="edit-button" Text="✎ Edit"
                                            CommandName="EditSignatureScreen" CommandArgument='<%# Eval("Id") %>' CausesValidation="false" />
                                        <asp:LinkButton runat="server" CssClass="delete-button" Text="🗑 Delete"
                                            CommandName="DeleteSignatureScreen" CommandArgument='<%# Eval("Id") %>' CausesValidation="false" />
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
         SECTION 4: UNCOMPROMISED COMFORT
    ================================================== -->
    <div class="theater-section">
        <div class="section-header">
            <div>
                <h2 class="section-heading">Uncompromised Comfort</h2>
                <p class="section-description">Every detail curated for the most luxurious cinematic experience.</p>
            </div>
            <asp:Button ID="btnAddComfort" runat="server" CssClass="add-button" Text="+ Add Comfort Feature"
                OnClick="btnAddComfort_Click" CausesValidation="false" />
        </div>

        <div class="table-box">
            <table class="theater-table">
                <thead>
                    <tr>
                        <th style="width:40px;">#</th>
                        <th style="width:100px;">Image</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th style="text-align:right;">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptComfort" runat="server" OnItemCommand="rptComfort_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td class="number"><%# Container.ItemIndex + 1 %></td>
                                <td>
                                    <img class="comfort-thumb" src='<%# Eval("ImageUrl") %>' alt="" />
                                </td>
                                <td class="theater-name"><%# Eval("Title") %></td>
                                <td><%# Eval("Description") %></td>
                                <td>
                                    <div class="actions">
                                        <asp:LinkButton runat="server" CssClass="edit-button" Text="✎ Edit"
                                            CommandName="EditComfort" CommandArgument='<%# Eval("Id") %>' CausesValidation="false" />
                                        <asp:LinkButton runat="server" CssClass="delete-button" Text="🗑 Delete"
                                            CommandName="DeleteComfort" CommandArgument='<%# Eval("Id") %>' CausesValidation="false" />
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
<asp:Panel ID="theaterModal" runat="server" CssClass="theater-modal-overlay" ClientIDMode="Static">
    <div class="theater-modal">
        <div class="modal-header">
            <div class="modal-title"><asp:Label ID="theaterModalTitle" runat="server" Text="Add Theater" /></div>
            <asp:Button ID="btnCloseTheater" runat="server" CssClass="modal-close" Text="×"
                OnClick="btnCloseTheater_Click" CausesValidation="false" />
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
                <label>Amenities (comma-separated)</label>
                <asp:TextBox ID="txtAmenities" runat="server" ClientIDMode="Static" placeholder="e.g. IMAX, ATMOS, LUXE" />
            </div>
        </div>
        <div class="modal-footer">
            <asp:Button runat="server" CssClass="modal-cancel" Text="Cancel"
                OnClick="btnCloseTheater_Click" CausesValidation="false" />
            <asp:Button ID="btnSaveTheater" runat="server" ClientIDMode="Static" CssClass="modal-save"
                Text="Save Theater" OnClick="btnSaveTheater_Click" />
        </div>
    </div>
</asp:Panel>


<!-- ============ SHOWING MODAL ============ -->
<asp:Panel ID="showingModal" runat="server" CssClass="theater-modal-overlay" ClientIDMode="Static">
    <div class="theater-modal">
        <div class="modal-header">
            <div class="modal-title"><asp:Label ID="showingModalTitle" runat="server" Text="Add Showing" /></div>
            <asp:Button ID="btnCloseShowing" runat="server" CssClass="modal-close" Text="×"
                OnClick="btnCloseShowing_Click" CausesValidation="false" />
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
                <label>Show Timings (comma-separated)</label>
                <asp:TextBox ID="txtShowingTimings" runat="server" ClientIDMode="Static"
                    TextMode="MultiLine" placeholder="e.g. 10:00 AM, 02:30 PM, 07:00 PM" />
            </div>
        </div>
        <div class="modal-footer">
            <asp:Button runat="server" CssClass="modal-cancel" Text="Cancel"
                OnClick="btnCloseShowing_Click" CausesValidation="false" />
            <asp:Button ID="btnSaveShowing" runat="server" ClientIDMode="Static" CssClass="modal-save"
                Text="Save Showing" OnClick="btnSaveShowing_Click" />
        </div>
    </div>
</asp:Panel>


<!-- ============ SIGNATURE MODAL ============ -->
<asp:Panel ID="signatureModal" runat="server" CssClass="theater-modal-overlay" ClientIDMode="Static">
    <div class="theater-modal">
        <div class="modal-header">
            <div class="modal-title"><asp:Label ID="signatureModalTitle" runat="server" Text="Add Signature Screen" /></div>
            <asp:Button ID="btnCloseSignature" runat="server" CssClass="modal-close" Text="×"
                OnClick="btnCloseSignature_Click" CausesValidation="false" />
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
                <label>Features (comma-separated)</label>
                <asp:TextBox ID="txtSignatureFeatures" runat="server" ClientIDMode="Static" placeholder="e.g. Dolby Vision, Dolby Atmos" />
            </div>
            <div class="modal-field">
                <label>Show Timings (comma-separated)</label>
                <asp:TextBox ID="txtSignatureTimings" runat="server" ClientIDMode="Static"
                    TextMode="MultiLine" placeholder="e.g. 2:30 PM, 6:00 PM, 9:45 PM" />
            </div>
        </div>
        <div class="modal-footer">
            <asp:Button runat="server" CssClass="modal-cancel" Text="Cancel"
                OnClick="btnCloseSignature_Click" CausesValidation="false" />
            <asp:Button ID="btnSaveSignature" runat="server" ClientIDMode="Static" CssClass="modal-save"
                Text="Save Signature Screen" OnClick="btnSaveSignature_Click" />
        </div>
    </div>
</asp:Panel>


<!-- ============ COMFORT MODAL ============ -->
<asp:Panel ID="comfortModal" runat="server" CssClass="theater-modal-overlay" ClientIDMode="Static">
    <div class="theater-modal">
        <div class="modal-header">
            <div class="modal-title"><asp:Label ID="comfortModalTitle" runat="server" Text="Add Comfort Feature" /></div>
            <asp:Button ID="btnCloseComfort" runat="server" CssClass="modal-close" Text="×"
                OnClick="btnCloseComfort_Click" CausesValidation="false" />
        </div>
        <div class="modal-body">
            <div class="modal-field">
                <label>Title</label>
                <asp:TextBox ID="txtComfortTitle" runat="server" ClientIDMode="Static" placeholder="e.g. Motorized Recliners" />
            </div>
            <div class="modal-field">
                <label>Description</label>
                <asp:TextBox ID="txtComfortDesc" runat="server" ClientIDMode="Static"
                    TextMode="MultiLine" placeholder="e.g. Fully adjustable plush-leather seating..." />
            </div>
            <div class="modal-field">
                <label>Image URL</label>
                <asp:TextBox ID="txtComfortImage" runat="server" ClientIDMode="Static" placeholder="https://..." />
            </div>
        </div>
        <div class="modal-footer">
            <asp:Button runat="server" CssClass="modal-cancel" Text="Cancel"
                OnClick="btnCloseComfort_Click" CausesValidation="false" />
            <asp:Button ID="btnSaveComfort" runat="server" ClientIDMode="Static" CssClass="modal-save"
                Text="Save Comfort Feature" OnClick="btnSaveComfort_Click" />
        </div>
    </div>
</asp:Panel>

</asp:Content>
