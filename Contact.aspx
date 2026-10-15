<%@ Page Title="Contact Management" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication2.Contact" %>

<asp:Content ID="ContactHead" ContentPlaceHolderID="head" runat="server">
<style>
.contact-page { width: 100%; min-height: calc(100vh - 82px); background: #111111; color: #ffffff; padding: 25px 35px 40px 35px; }

.contact-page-header { display: flex; align-items: center; justify-content: space-between; margin-bottom: 25px; }
.contact-subtitle { margin: 0; color: #888888; font-size: 12px; }

.contact-stat-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 12px; margin-bottom: 26px; }
.contact-stat-card { min-height: 85px; background: #151515; border: 1px solid #292929; border-radius: 5px; padding: 16px 15px; }
.contact-stat-title { color: #888888; font-size: 9px; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 10px; }
.contact-stat-bottom { display: flex; align-items: center; justify-content: space-between; }
.contact-stat-number { color: #dddddd; font-size: 20px; font-weight: 600; }
.contact-stat-number.red { color: #ff252d; }

.contact-table-card { width: 100%; background: #141414; border: 1px solid #292929; border-radius: 5px; overflow: hidden; }

.contact-table-head { display: grid; grid-template-columns: 45px minmax(130px, 1.05fr) minmax(150px, 1.15fr) minmax(120px, 0.95fr) minmax(220px, 1.7fr) 120px; align-items: center; min-height: 48px; background: #111111; border-bottom: 1px solid #292929; padding: 0 15px; color: #8b8b8b; font-size: 10px; text-transform: uppercase; letter-spacing: 1px; }

.contact-row { display: grid; grid-template-columns: 45px minmax(130px, 1.05fr) minmax(150px, 1.15fr) minmax(120px, 0.95fr) minmax(220px, 1.7fr) 120px; align-items: center; min-height: 65px; padding: 0 15px; border-bottom: 1px solid #252525; background: #141414; color: #d9d9d9; font-size: 11px; }
.contact-row:last-child { border-bottom: none; }
.contact-row:hover { background: #191919; }

.contact-number { color: #999999; font-size: 11px; }
.contact-user { display: flex; align-items: center; gap: 8px; min-width: 0; }
.contact-avatar { width: 26px; height: 26px; min-width: 26px; border-radius: 50%; display: flex; align-items: center; justify-content: center; background: #333333; color: #aaaaaa; font-size: 9px; font-weight: 600; }
.contact-avatar.red { background: #e91c2a; color: #ffffff; }
.contact-user-name { color: #dcdcdc; line-height: 14px; font-size: 11px; }
.contact-email { color: #aaaaaa; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; }
.contact-subject { display: inline-flex; width: fit-content; max-width: 110px; padding: 5px 10px; background: #1c1c1c; border: 1px solid #282828; border-radius: 3px; color: #d5d5d5; font-size: 10px; }
.contact-subject.booking { color: #ff333b; background: #241416; border-color: #4a2023; }
.contact-message { color: #aaaaaa; white-space: nowrap; overflow: hidden; text-overflow: ellipsis; padding-right: 15px; }

.contact-actions { display: flex; gap: 8px; align-items: center; justify-content: flex-end; }

.icon-btn { width: 28px; height: 28px; border-radius: 4px; display: inline-flex; align-items: center; justify-content: center; cursor: pointer; border: 1px solid; font-size: 13px; text-decoration: none; transition: 0.2s; }
.icon-view { background: rgba(42,74,107,0.4); color: #5f9ea0; border-color: #2a4a6b; }
.icon-view:hover { background: #2a4a6b; color: #fff; }
.icon-right { background: rgba(74,222,128,0.1); color: #4ade80; border-color: rgba(74,222,128,0.35); }
.icon-right:hover { background: #4ade80; color: #111; }
.icon-wrong { background: rgba(255,102,102,0.12); color: #ff6666; border-color: rgba(255,102,102,0.35); }
.icon-wrong:hover { background: #ff2633; color: #fff; }

.contact-table-footer { min-height: 48px; display: flex; align-items: center; justify-content: space-between; padding: 0 15px; border-top: 1px solid #292929; background: #111111; }
.contact-entry-count { color: #8b8b8b; font-size: 10px; }

.success-msg { display: block; color: #4ade80; font-size: 11px; margin-top: 6px; margin-bottom: 15px; }

/* ============== MODAL (Edit User style) ============== */
.modal-overlay { display: none; position: fixed; inset: 0; background: rgba(0,0,0,0.78); z-index: 9999; align-items: center; justify-content: center; padding: 15px; }
.modal-overlay.show { display: flex; }
.modal-card { width: 500px; max-width: 100%; background: #1f1f1f; border: 1px solid #333; border-radius: 8px; padding: 26px 28px 22px 28px; box-shadow: 0 12px 40px rgba(0,0,0,0.6); }

.modal-header { display: flex; align-items: center; justify-content: space-between; margin-bottom: 24px; }
.modal-title { color: #ffffff; font-size: 18px; font-weight: 600; }
.modal-close-x { background: transparent; border: none; color: #888888; font-size: 20px; line-height: 1; cursor: pointer; padding: 0; }
.modal-close-x:hover { color: #ffffff; }

.modal-field { margin-bottom: 18px; }
.modal-label { display: block; color: #888888; font-size: 11px; letter-spacing: 1px; text-transform: uppercase; margin-bottom: 8px; }
.modal-input,
.modal-textarea {
    width: 100%;
    background: #2a2a2a;
    border: 1px solid #3a3a3a;
    border-radius: 6px;
    color: #eeeeee;
    padding: 11px 13px;
    font-size: 13px;
    outline: none;
    box-sizing: border-box;
}
.modal-input[readonly],
.modal-textarea[readonly] { color: #dddddd; cursor: default; }
.modal-textarea { min-height: 95px; resize: vertical; line-height: 20px; font-family: inherit; }

.modal-footer { display: flex; justify-content: flex-end; gap: 10px; margin-top: 24px; }
.btn-cancel { padding: 10px 22px; background: #2a2a2a; color: #dddddd; border: 1px solid #3a3a3a; border-radius: 6px; font-size: 13px; cursor: pointer; }
.btn-cancel:hover { background: #333333; }
.btn-save { padding: 10px 22px; background: #ff3b3b; color: #ffffff; border: none; border-radius: 6px; font-size: 13px; font-weight: 500; cursor: pointer; }
.btn-save:hover { background: #e63232; }

@media screen and (max-width: 1100px) {
    .contact-stat-grid { grid-template-columns: repeat(2, 1fr); }
    .contact-table-card { overflow-x: auto; }
    .contact-table-head, .contact-row { min-width: 900px; }
}
@media screen and (max-width: 700px) {
    .contact-page { padding: 20px 15px 30px 15px; }
    .contact-stat-grid { grid-template-columns: 1fr; }
}
</style>
</asp:Content>


<asp:Content ID="ContactContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:HiddenField ID="hdnContactId" runat="server" ClientIDMode="Static" />

<div class="contact-page">

    <asp:Label ID="lblMessage" runat="server" CssClass="success-msg" Visible="false" />

    <div class="contact-page-header">
        <p class="contact-subtitle">Manage and respond to customer inquiries and support requests.</p>
    </div>

    <!-- STATS -->
    <div class="contact-stat-grid">
        <div class="contact-stat-card">
            <div class="contact-stat-title">Total Inquiries</div>
            <div class="contact-stat-bottom">
                <div class="contact-stat-number"><asp:Label ID="lblTotalInquiries" runat="server" Text="0" /></div>
            </div>
        </div>
        <div class="contact-stat-card">
            <div class="contact-stat-title">Unread Messages</div>
            <div class="contact-stat-bottom">
                <div class="contact-stat-number red"><asp:Label ID="lblUnreadCount" runat="server" Text="0" /></div>
            </div>
        </div>
        <div class="contact-stat-card">
            <div class="contact-stat-title">Avg. Response Time</div>
            <div class="contact-stat-bottom">
                <div class="contact-stat-number">1.2h</div>
            </div>
        </div>
        <div class="contact-stat-card">
            <div class="contact-stat-title">Resolution Rate</div>
            <div class="contact-stat-bottom">
                <div class="contact-stat-number">94%</div>
            </div>
        </div>
    </div>

    <!-- TABLE -->
    <div class="contact-table-card">

        <div class="contact-table-head">
            <div>#</div>
            <div>Full Name</div>
            <div>Email Address</div>
            <div>Subject</div>
            <div>Message Snippet</div>
            <div>Actions</div>
        </div>

        <asp:Repeater ID="rptContacts" runat="server" OnItemCommand="rptContacts_ItemCommand">
            <ItemTemplate>
                <div class="contact-row">
                    <div class="contact-number"><%# Container.ItemIndex + 1 %></div>

                    <div class="contact-user">
                        <div class='<%# "contact-avatar " + (Eval("Status").ToString() == "Unread" ? "red" : "") %>'>
                            <%# GetInitials(Eval("FullName").ToString()) %>
                        </div>
                        <div class="contact-user-name"><%# Eval("FullName") %></div>
                    </div>

                    <div class="contact-email"><%# Eval("Email") %></div>

                    <div>
                        <span class='<%# "contact-subject " + (Eval("Subject").ToString().Contains("Booking") ? "booking" : "") %>'>
                            <%# Eval("Subject") %>
                        </span>
                    </div>

                    <div class="contact-message"><%# Eval("Message") %></div>

                    <div class="contact-actions">
                        <asp:LinkButton runat="server" CssClass="icon-btn icon-view"
                            CommandName="ViewContact" CommandArgument='<%# Eval("Id") %>'
                            CausesValidation="false" ToolTip="View">👁</asp:LinkButton>

                        <asp:LinkButton runat="server" CssClass="icon-btn icon-right"
                            CommandName="MarkRead" CommandArgument='<%# Eval("Id") %>'
                            CausesValidation="false" ToolTip="Mark as Read">✓</asp:LinkButton>

                        <asp:LinkButton runat="server" CssClass="icon-btn icon-wrong"
                            CommandName="DeleteContact" CommandArgument='<%# Eval("Id") %>'
                            CausesValidation="false" ToolTip="Delete">✗</asp:LinkButton>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <div class="contact-table-footer">
            <div class="contact-entry-count">
                <asp:Label ID="lblShowingText" runat="server" />
            </div>
        </div>

    </div>

</div>


<!-- ================= VIEW MODAL ================= -->
<asp:Panel ID="ViewModal" runat="server" CssClass="modal-overlay" ClientIDMode="Static">
    <div class="modal-card">

        <div class="modal-header">
            <div class="modal-title">Contact Details</div>
            <asp:Button ID="btnCloseView" runat="server" Text="✕" CssClass="modal-close-x"
                OnClick="btnCloseView_Click" CausesValidation="false" />
        </div>

        <div class="modal-field">
            <label class="modal-label">Full Name</label>
            <asp:TextBox ID="txtViewName" runat="server" CssClass="modal-input" ReadOnly="true" />
        </div>

        <div class="modal-field">
            <label class="modal-label">Email</label>
            <asp:TextBox ID="txtViewEmail" runat="server" CssClass="modal-input" ReadOnly="true" />
        </div>

        <div class="modal-field">
            <label class="modal-label">Subject</label>
            <asp:TextBox ID="txtViewSubject" runat="server" CssClass="modal-input" ReadOnly="true" />
        </div>

        <div class="modal-field">
            <label class="modal-label">Message</label>
            <asp:TextBox ID="txtViewMessage" runat="server" CssClass="modal-textarea"
                ReadOnly="true" TextMode="MultiLine" />
        </div>

        <div class="modal-footer">
            <asp:Button ID="btnCloseViewFooter" runat="server" Text="Close"
                OnClick="btnCloseView_Click" CausesValidation="false"
                CssClass="btn-save" />
        </div>

    </div>
</asp:Panel>

</asp:Content>
