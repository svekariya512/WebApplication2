<%@ Page Title="Manage About" Language="C#" MasterPageFile="~/Site1.Master"
    AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication2.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
    * { box-sizing: border-box; }

    .about-page { width: 100%; min-height: 100vh; padding: 25px 35px 50px; background: #111111; color: #ffffff; font-family: Arial, Helvetica, sans-serif; }

    /* CARD */
    .card { width: 100%; background: #151515; border: 1px solid #2a2a2a; border-radius: 8px; overflow: hidden; margin-bottom: 30px; }
    .card-header { display: flex; align-items: flex-start; justify-content: space-between; padding: 20px 25px 15px; }
    .card-header-left h2 { margin: 0 0 6px; color: #fff; font-size: 16px; font-weight: 500; }
    .card-header-left p { margin: 0; color: #777; font-size: 11px; }

    /* ADD BUTTON */
    .add-btn { padding: 8px 16px; background: #ff2222; border: none; border-radius: 4px; color: #fff; font-size: 11px; font-weight: 500; cursor: pointer; }
    .add-btn:hover { background: #ff4444; }

    /* TABLE */
    .data-table { width: 100%; border-collapse: collapse; }
    .data-table thead th { height: 40px; padding: 0 25px; background: #111; border-top: 1px solid #252525; border-bottom: 1px solid #252525; color: #888; text-align: left; font-size: 11px; }
    .data-table tbody td { padding: 16px 25px; border-bottom: 1px solid #202020; color: #ccc; font-size: 12px; vertical-align: top; }
    .data-table tbody tr:last-child td { border-bottom: none; }
    .data-table tbody tr:hover { background: #1a1a1a; }

    .section-label { color: #888; font-size: 11px; }
    .content-label { color: #ccc; font-size: 12px; }

    /* ACTIONS */
    .actions { display: flex; gap: 8px; }

    .btn-edit, .btn-delete { height: 26px; padding: 0 14px; border-radius: 4px; cursor: pointer; font-size: 10px; font-weight: 500; text-decoration: none; display: inline-flex; align-items: center; justify-content: center; }
    .btn-edit { background: #ff2222; border: 1px solid #ff2222; color: #fff; }
    .btn-edit:hover { background: #ff4444; }
    .btn-delete { background: transparent; border: 1px solid #444; color: #ccc; }
    .btn-delete:hover { background: #292929; color: #fff; }

    /* MODAL */
    .modal-overlay { position: fixed; inset: 0; z-index: 9999; display: none; align-items: center; justify-content: center; background: rgba(0,0,0,.75); }
    .modal-overlay.show { display: flex; }
    .about-modal { width: 470px; max-width: 92%; max-height: 90vh; overflow-y: auto; padding: 25px; background: #1c1c1c; border: 1px solid #333; border-radius: 9px; }
    .modal-header { display: flex; align-items: center; justify-content: space-between; margin-bottom: 22px; }
    .modal-title { color: #fff; font-size: 17px; font-weight: 500; }
    .modal-close { background: transparent; border: none; color: #888; cursor: pointer; font-size: 24px; }
    .modal-close:hover { color: #fff; }

    /* FORM */
    .form-group { margin-bottom: 15px; }
    .form-group label { display: block; margin-bottom: 7px; color: #999; font-size: 10px; text-transform: uppercase; }
    .form-group input, .form-group textarea { width: 100%; padding: 10px 12px; background: #111; border: 1px solid #333; border-radius: 5px; outline: none; color: #eee; font-size: 12px; box-sizing: border-box; }
    .form-group input { height: 38px; }
    .form-group textarea { min-height: 90px; resize: vertical; }
    .form-group input:focus, .form-group textarea:focus { border-color: #ff3333; }

    .error-msg { display: block; color: #ff6666; font-size: 11px; margin-top: 8px; line-height: 16px; }
    .success-msg { display: block; color: #4ade80; font-size: 11px; margin-top: 8px; line-height: 16px; }

    /* MODAL BUTTONS */
    .modal-buttons { display: flex; justify-content: flex-end; gap: 10px; margin-top: 22px; }
    .cancel-btn, .save-btn { height: 36px; padding: 0 18px; border-radius: 5px; cursor: pointer; font-size: 11px; font-weight: 600; border: none; }
    .cancel-btn { background: #222; border: 1px solid #444; color: #bbb; }
    .cancel-btn:hover { background: #2d2d2d; color: #fff; }
    .save-btn { background: #ff2222; border: 1px solid #ff2222; color: #fff; }
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

<div class="about-page">

    <!-- ================= CARD 1 : HERO & STORY ================= -->
    <div class="card">
        <div class="card-header">
            <div class="card-header-left">
                <h2>Hero &amp; Story Content</h2>
                <p>Manage main headings and brand story</p>
            </div>
            <asp:Button ID="btnAddSection" runat="server" CssClass="add-btn"
                Text="+ ADD SECTION" OnClick="btnAddSection_Click" CausesValidation="false" />
        </div>

        <table class="data-table">
            <thead>
                <tr><th>Section</th><th>Content</th><th>Action</th></tr>
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
                                        CommandName="EditAbout" CommandArgument='<%# Eval("Id") %>' CausesValidation="false" />
                                    <asp:LinkButton runat="server" CssClass="btn-delete" Text="DELETE"
                                        CommandName="DeleteAbout" CommandArgument='<%# Eval("Id") %>' CausesValidation="false"
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
            <asp:Button ID="btnAddFeature" runat="server" CssClass="add-btn"
                Text="+ ADD FEATURE" OnClick="btnAddFeature_Click" CausesValidation="false" />
        </div>

        <table class="data-table">
            <thead>
                <tr><th>Feature</th><th>Description</th><th>Action</th></tr>
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
                                        CommandName="EditAbout" CommandArgument='<%# Eval("Id") %>' CausesValidation="false" />
                                    <asp:LinkButton runat="server" CssClass="btn-delete" Text="DELETE"
                                        CommandName="DeleteAbout" CommandArgument='<%# Eval("Id") %>' CausesValidation="false"
                                        OnClientClick="return confirm('Delete this feature?');" />
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>


    <!-- ================= CARD 3 : OUR THEATERS ================= -->
    <div class="card">
        <div class="card-header">
            <div class="card-header-left">
                <h2>Our Theaters</h2>
                <p>Find a premium Cineplus experience near you.</p>
            </div>
            <asp:Button ID="btnAddTheater" runat="server" CssClass="add-btn"
                Text="+ ADD THEATER" OnClick="btnAddTheater_Click" CausesValidation="false" />
        </div>

        <table class="data-table">
            <thead>
                <tr><th>Theater Name</th><th>Location</th><th>Amenities</th><th>Action</th></tr>
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
                                        CommandName="EditAbout" CommandArgument='<%# Eval("Id") %>' CausesValidation="false" />
                                    <asp:LinkButton runat="server" CssClass="btn-delete" Text="DELETE"
                                        CommandName="DeleteAbout" CommandArgument='<%# Eval("Id") %>' CausesValidation="false"
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


<!-- ================= ADD / EDIT MODAL ================= -->
<asp:Panel ID="AboutModal" runat="server" CssClass="modal-overlay" ClientIDMode="Static">
    <div class="about-modal">

        <div class="modal-header">
            <asp:Label ID="lblModalTitle" runat="server" CssClass="modal-title" Text="Add Section" />
            <asp:Button ID="btnCloseModal" runat="server" CssClass="modal-close" Text="×"
                OnClick="btnCloseModal_Click" CausesValidation="false" />
        </div>

        <div class="form-group">
            <label>Name / Title / Theater</label>
            <asp:TextBox ID="txtItemName" runat="server" ClientIDMode="Static" />
        </div>

        <div class="form-group">
            <label>Content / Description / Location</label>
            <asp:TextBox ID="txtItemContent" runat="server" ClientIDMode="Static" TextMode="MultiLine" />
        </div>

        <div class="form-group">
            <label>Amenities (Theaters only)</label>
            <asp:TextBox ID="txtItemAmenities" runat="server" ClientIDMode="Static" />
        </div>

        <asp:Label ID="lblValidation" runat="server" CssClass="error-msg" />
        <asp:Label ID="lblSuccess" runat="server" CssClass="success-msg" />

        <div class="modal-buttons">
            <asp:Button ID="btnCancel" runat="server" CssClass="cancel-btn" Text="Cancel"
                OnClick="btnCloseModal_Click" CausesValidation="false" />
            <asp:Button ID="btnSaveAbout" runat="server" CssClass="save-btn" Text="Save Changes"
                OnClick="btnSaveAbout_Click" />
        </div>

    </div>
</asp:Panel>

</asp:Content>
