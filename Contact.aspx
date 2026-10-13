<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication2.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
    .contact-page { width: 100%; min-height: 100vh; background: #111111; color: #ffffff; padding: 25px 35px 50px 35px; font-family: Arial, Helvetica, sans-serif; }

    .contact-header { display: flex; justify-content: space-between; align-items: flex-start; margin-bottom: 25px; flex-wrap: wrap; gap: 12px; }
    .contact-header-left h1 { margin: 0 0 6px; color: #ffffff; font-size: 20px; font-weight: 500; }
    .contact-header-left p { margin: 0; color: #777777; font-size: 11px; }

    /* STATS */
    .stats-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 15px; margin-bottom: 25px; }
    .stat-card { background: #1c1c1c; border: 1px solid #292929; border-radius: 8px; padding: 18px; }
    .stat-card.active { border-color: #4c1515; }
    .stat-label { color: #888888; font-size: 10px; text-transform: uppercase; letter-spacing: 0.5px; margin-bottom: 10px; }
    .stat-value { color: #ffffff; font-size: 24px; font-weight: 500; margin-bottom: 8px; }
    .stat-value.red { color: #ff3333; }
    .stat-change { display: inline-block; font-size: 10px; padding: 3px 8px; border-radius: 3px; }
    .stat-change.up { color: #4ade80; background: rgba(74, 222, 128, 0.12); }
    .stat-change.down { color: #ff6666; background: rgba(255, 102, 102, 0.12); }

    /* TABLE */
    .contact-table-box { background: #1c1c1c; border: 1px solid #292929; border-radius: 8px; overflow: hidden; }
    .contact-table { width: 100%; border-collapse: collapse; }
    .contact-table thead th { height: 45px; padding: 0 20px; background: #181818; color: #909090; text-align: left; font-size: 10px; font-weight: normal; text-transform: uppercase; letter-spacing: 0.5px; border-bottom: 1px solid #292929; }
    .contact-table tbody td { padding: 15px 20px; border-bottom: 1px solid #242424; color: #bbbbbb; font-size: 12px; vertical-align: middle; }
    .contact-table tbody tr:last-child td { border-bottom: none; }
    .contact-table tbody tr:hover { background: #222222; }

    .user-info { display: flex; align-items: center; gap: 12px; }
    .user-avatar { width: 36px; height: 36px; border-radius: 50%; background: linear-gradient(135deg, #4c1515, #651b1b); color: #ffc3b9; display: flex; align-items: center; justify-content: center; font-size: 12px; font-weight: 600; flex-shrink: 0; }
    .user-name { color: #eeeeee; font-size: 12px; font-weight: 500; }
    .subject-tag { display: inline-block; padding: 5px 10px; background: #292929; color: #cccccc; border-radius: 4px; font-size: 10px; }

    /* ICONS */
    .actions { display: flex; gap: 8px; align-items: center; justify-content: center; }

    .icon-btn { width: 30px; height: 30px; border-radius: 4px; display: inline-flex; align-items: center; justify-content: center; cursor: pointer; text-decoration: none; border: 1px solid; transition: 0.2s; font-size: 13px; }

    .icon-view { background: rgba(42, 74, 107, 0.4); color: #5f9ea0; border-color: #2a4a6b; }
    .icon-view:hover { background: #2a4a6b; color: #ffffff; }

    .icon-right { background: rgba(74, 222, 128, 0.1); color: #4ade80; border-color: rgba(74, 222, 128, 0.35); }
    .icon-right:hover { background: #4ade80; color: #111111; }

    .icon-wrong { background: rgba(255, 102, 102, 0.12); color: #ff6666; border-color: rgba(255, 102, 102, 0.35); }
    .icon-wrong:hover { background: #ff2633; color: #ffffff; }

    /* MODAL */
    .contact-modal-overlay { display: none; position: fixed; inset: 0; z-index: 99999; background: rgba(0, 0, 0, 0.75); align-items: center; justify-content: center; padding: 15px; }
    .contact-modal-overlay.show { display: flex; }

    .contact-modal { width: 500px; max-width: 100%; max-height: 90vh; overflow-y: auto; background: #222222; border: 1px solid #3a3a3a; border-radius: 9px; }

    .modal-header { height: 55px; display: flex; align-items: center; justify-content: space-between; padding: 0 20px; background: #2c2c2c; border-bottom: 1px solid #363636; }
    .modal-title { color: #ffffff; font-size: 15px; font-weight: 600; }
    .modal-close { background: transparent; border: none; color: #999999; font-size: 22px; cursor: pointer; }
    .modal-close:hover { color: #ffffff; }

    .modal-body { padding: 20px; }

    .modal-field { margin-bottom: 15px; }
    .modal-field label { display: block; color: #888888; font-size: 10px; text-transform: uppercase; letter-spacing: 0.7px; margin-bottom: 7px; }
    .modal-field input, .modal-field textarea, .modal-field select { width: 100%; background: #151515; border: 1px solid #3b3b3b; border-radius: 4px; color: #ffffff; outline: none; padding: 10px 12px; font-size: 12px; box-sizing: border-box; font-family: Arial, Helvetica, sans-serif; }
    .modal-field input { height: 40px; padding: 0 12px; }
    .modal-field textarea { min-height: 100px; resize: vertical; }
    .modal-field input:focus, .modal-field textarea:focus, .modal-field select:focus { border-color: #777777; }

    .view-value { display: block; color: #dddddd; font-size: 12px; padding: 10px 12px; background: #151515; border: 1px solid #333; border-radius: 4px; min-height: 40px; line-height: 20px; word-wrap: break-word; }

    .modal-footer { display: flex; justify-content: flex-end; gap: 10px; padding: 15px 20px; background: #1c1c1c; border-top: 1px solid #363636; }
    .modal-cancel, .modal-save { height: 36px; padding: 0 18px; border-radius: 4px; cursor: pointer; font-size: 11px; font-weight: 600; border: none; }
    .modal-cancel { background: #333333; color: #cccccc; }
    .modal-cancel:hover { background: #444444; color: #ffffff; }
    .modal-save { background: #ff5f5f; color: #ffffff; }
    .modal-save:hover { background: #ff4141; }

    @media screen and (max-width: 900px) { .stats-grid { grid-template-columns: repeat(2, 1fr); } }
    @media screen and (max-width: 600px) { .contact-page { padding: 20px 15px; } .stats-grid { grid-template-columns: 1fr; } }
</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HiddenField ID="hdnEditContactId" runat="server" ClientIDMode="Static" />

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var hamburger = document.getElementById("mainHamburger");
            if (hamburger) { hamburger.style.display = "flex"; }

            var header = document.querySelector(".cine-header");
            var searchArea = document.querySelector(".header-search-area");

            if (header && searchArea && !document.getElementById("contactHeaderTitle")) {
                var titleEl = document.createElement("div");
                titleEl.id = "contactHeaderTitle";
                titleEl.innerText = "Contact Management";
                titleEl.style.color = "#FFC3B9";
                titleEl.style.fontSize = "22px";
                titleEl.style.fontWeight = "500";
                titleEl.style.marginLeft = "10px";
                titleEl.style.marginRight = "10px";
                header.insertBefore(titleEl, searchArea);
            }
        });

        function closeViewModal() {
            var m = document.getElementById("viewModal");
            if (m) m.classList.remove("show");
        }

        function closeEditModal() {
            var m = document.getElementById("editModal");
            if (m) m.classList.remove("show");
        }

        document.addEventListener("click", function (event) {
            var vm = document.getElementById("viewModal");
            var em = document.getElementById("editModal");
            if (event.target === vm) closeViewModal();
            if (event.target === em) closeEditModal();
        });

        document.addEventListener("keydown", function (event) {
            if (event.key === "Escape") { closeViewModal(); closeEditModal(); }
        });
    </script>

    <div class="contact-page">

        <div class="contact-header">
            <div class="contact-header-left">
                <h1>Contact Management</h1>
                <p>Manage and respond to customer inquiries and support requests.</p>
            </div>
        </div>


        <!-- STATS -->
        <div class="stats-grid">
            <div class="stat-card">
                <div class="stat-label">Total Inquiries</div>
                <div class="stat-value"><asp:Label ID="lblTotalInquiries" runat="server" Text="0" /></div>
                <span class="stat-change up">↗ 12%</span>
            </div>
            <div class="stat-card active">
                <div class="stat-label">Unread Messages</div>
                <div class="stat-value red"><asp:Label ID="lblUnreadCount" runat="server" Text="0" /></div>
                <span class="stat-change down">↘ 5%</span>
            </div>
            <div class="stat-card">
                <div class="stat-label">Avg. Response Time</div>
                <div class="stat-value">1.2h</div>
                <span class="stat-change up">↗ 8%</span>
            </div>
            <div class="stat-card">
                <div class="stat-label">Resolution Rate</div>
                <div class="stat-value">94%</div>
                <span class="stat-change up">✓</span>
            </div>
        </div>


        <!-- TABLE -->
        <div class="contact-table-box">
            <table class="contact-table">
                <thead>
                    <tr>
                        <th style="width: 60px;">#</th>
                        <th>Full Name</th>
                        <th>Email Address</th>
                        <th>Subject</th>
                        <th>Message Snippet</th>
                        <th>Date</th>
                        <th style="text-align: center;">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rptContacts" runat="server" OnItemCommand="rptContacts_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <div class="user-info">
                                        <div class="user-avatar"><%# GetInitials(Eval("FullName").ToString()) %></div>
                                    </div>
                                </td>
                                <td><div class="user-name"><%# Eval("FullName") %></div></td>
                                <td><%# Eval("Email") %></td>
                                <td><span class="subject-tag"><%# Eval("Subject") %></span></td>
                                <td><%# Eval("Message") %></td>
                                <td><%# Convert.ToDateTime(Eval("CreatedAt")).ToString("yyyy-MM-dd") %></td>
                                <td>
                                    <div class="actions">
                                        <asp:LinkButton runat="server" CssClass="icon-btn icon-view"
                                            CommandName="ViewContact" CommandArgument='<%# Eval("Id") %>'
                                            CausesValidation="false" ToolTip="View">👁</asp:LinkButton>

                                        <asp:LinkButton runat="server" CssClass="icon-btn icon-right"
                                            CommandName="MarkRead" CommandArgument='<%# Eval("Id") %>'
                                            CausesValidation="false" ToolTip="Mark as Read">✓</asp:LinkButton>

                                        <asp:LinkButton runat="server" CssClass="icon-btn icon-wrong"
                                            CommandName="DeleteContact" CommandArgument='<%# Eval("Id") %>'
                                            CausesValidation="false" ToolTip="Delete"
                                            OnClientClick="return confirm('Delete this message?');">✗</asp:LinkButton>
                                    </div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>

    </div>


    <!-- ============ VIEW MODAL ============ -->
    <div id="viewModal" class="contact-modal-overlay">
        <div class="contact-modal">
            <div class="modal-header">
                <div class="modal-title">Contact Details</div>
                <button type="button" class="modal-close" onclick="closeViewModal();">×</button>
            </div>

            <div class="modal-body">
                <div class="modal-field">
                    <label>Full Name</label>
                    <asp:Label ID="lblViewName" runat="server" CssClass="view-value" />
                </div>
                <div class="modal-field">
                    <label>Email</label>
                    <asp:Label ID="lblViewEmail" runat="server" CssClass="view-value" />
                </div>
                <div class="modal-field">
                    <label>Subject</label>
                    <asp:Label ID="lblViewSubject" runat="server" CssClass="view-value" />
                </div>
                <div class="modal-field">
                    <label>Message</label>
                    <asp:Label ID="lblViewMessage" runat="server" CssClass="view-value" />
                </div>
                <div class="modal-field">
                    <label>Status</label>
                    <asp:Label ID="lblViewStatus" runat="server" CssClass="view-value" />
                </div>
                <div class="modal-field">
                    <label>Date</label>
                    <asp:Label ID="lblViewDate" runat="server" CssClass="view-value" />
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="modal-cancel" onclick="closeViewModal();">Close</button>
            </div>
        </div>
    </div>


    <!-- ============ EDIT MODAL ============ -->
    <div id="editModal" class="contact-modal-overlay">
        <div class="contact-modal">
            <div class="modal-header">
                <div class="modal-title">Edit Contact</div>
                <button type="button" class="modal-close" onclick="closeEditModal();">×</button>
            </div>

            <div class="modal-body">
                <div class="modal-field">
                    <label>Full Name</label>
                    <asp:TextBox ID="txtEditName" runat="server" ClientIDMode="Static" />
                </div>
                <div class="modal-field">
                    <label>Email</label>
                    <asp:TextBox ID="txtEditEmail" runat="server" ClientIDMode="Static" TextMode="Email" />
                </div>
                <div class="modal-field">
                    <label>Subject</label>
                    <asp:TextBox ID="txtEditSubject" runat="server" ClientIDMode="Static" />
                </div>
                <div class="modal-field">
                    <label>Message</label>
                    <asp:TextBox ID="txtEditMessage" runat="server" ClientIDMode="Static" TextMode="MultiLine" />
                </div>
                <div class="modal-field">
                    <label>Status</label>
                    <asp:DropDownList ID="ddlEditStatus" runat="server" ClientIDMode="Static">
                        <asp:ListItem Value="Unread">Unread</asp:ListItem>
                        <asp:ListItem Value="Read">Read</asp:ListItem>
                    </asp:DropDownList>
                </div>
            </div>

            <div class="modal-footer">
                <button type="button" class="modal-cancel" onclick="closeEditModal();">Cancel</button>
                <asp:Button ID="btnSaveContact" runat="server" ClientIDMode="Static"
                    CssClass="modal-save" Text="Save Changes"
                    OnClick="btnSaveContact_Click" />
            </div>
        </div>
    </div>

</asp:Content>