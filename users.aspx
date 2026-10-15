<%@ Page Title="User Management" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="WebApplication2.users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
* { box-sizing: border-box; }

.users-page { width: 100%; min-height: 100vh; padding: 25px 35px 50px; background: #111111; color: #ffffff; font-family: Arial, Helvetica, sans-serif; }

/* STATS */
.stats-row { display: grid; grid-template-columns: repeat(3, 1fr); gap: 20px; margin-bottom: 30px; }
.stat-card { position: relative; min-height: 120px; padding: 22px 25px; background: #1a1a1a; border: 1px solid #2a2a2a; border-radius: 10px; overflow: hidden; }
.stat-label { color: #999; font-size: 11px; letter-spacing: 1.5px; text-transform: uppercase; }
.stat-value { margin-top: 22px; color: #fff; font-size: 26px; font-weight: 600; }
.stat-icon { position: absolute; top: 20px; right: 20px; font-size: 16px; }
.icon-pink { color: #ffc3b9; }
.icon-green { color: #4ade80; }
.icon-orange { color: #ffa500; }
.stat-graphic { position: absolute; right: 20px; bottom: 18px; }
.sparkline { width: 60px; height: 24px; stroke: #ffc3b9; stroke-width: 2; fill: none; }
.circle-progress { width: 34px; height: 34px; }

/* DIRECTORY */
.directory-card { width: 100%; background: #151515; border: 1px solid #2a2a2a; border-radius: 10px; overflow: hidden; }
.directory-header { display: flex; align-items: center; justify-content: space-between; padding: 18px 25px; border-bottom: 1px solid #252525; }
.directory-title { color: #fff; font-size: 15px; font-weight: 500; }

/* TABLE */
.data-table { width: 100%; border-collapse: collapse; }
.data-table thead th { height: 45px; padding: 0 20px; background: #1a1a1a; border-bottom: 1px solid #252525; color: #888; text-align: left; font-size: 11px; font-weight: 500; letter-spacing: 1px; text-transform: uppercase; }
.data-table tbody td { padding: 14px 20px; border-bottom: 1px solid #202020; color: #ccc; font-size: 12px; vertical-align: middle; }
.data-table tbody tr:hover { background: #1c1c1c; }
.data-table tbody tr:last-child td { border-bottom: none; }

/* USER */
.user-info { display: flex; align-items: center; gap: 12px; }
.user-avatar { width: 32px; height: 32px; flex-shrink: 0; display: flex; align-items: center; justify-content: center; border-radius: 50%; background: #ff4d4d; color: #fff; font-size: 11px; font-weight: 600; }
.user-name { color: #fff; font-size: 12px; font-weight: 500; }
.password-dots { color: #888; font-size: 9px; letter-spacing: 2px; }
.otp-code { color: #ccc; font-family: "Courier New", monospace; font-size: 12px; }
.created-date { color: #ccc; font-size: 11px; line-height: 16px; }

/* STATUS */
.status-badge { display: inline-flex; align-items: center; gap: 6px; padding: 4px 10px; border-radius: 12px; font-size: 10px; font-weight: 600; letter-spacing: .5px; }
.status-badge.active { background: rgba(74,222,128,.12); color: #4ade80; }
.status-badge.pending { background: rgba(250,204,21,.12); color: #facc15; }
.status-dot { width: 6px; height: 6px; border-radius: 50%; background: currentColor; }

/* ACTIONS */
.action-icons { display: flex; align-items: center; gap: 14px; }
.action-icon-btn { display: flex; align-items: center; justify-content: center; padding: 0; background: transparent; border: none; color: #888; cursor: pointer; font-size: 15px; transition: .2s; text-decoration: none; }
.action-icon-btn:hover { color: #fff; }
.action-icon-btn.delete:hover { color: #ff4d4d; }

/* MODAL */
.modal-overlay { position: fixed; inset: 0; z-index: 9999; display: none; align-items: center; justify-content: center; background: rgba(0,0,0,.72); backdrop-filter: blur(4px); }
.modal-overlay.show { display: flex; }

.user-modal { width: 430px; max-width: 92%; padding: 25px; background: #1c1c1c; border: 1px solid #333; border-radius: 10px; box-shadow: 0 20px 60px rgba(0,0,0,.6); }

.modal-header { display: flex; align-items: center; justify-content: space-between; margin-bottom: 22px; }
.modal-title { color: #fff; font-size: 17px; font-weight: 500; }
.modal-close { border: none; background: transparent; color: #888; cursor: pointer; font-size: 22px; }
.modal-close:hover { color: #fff; }

.form-group { margin-bottom: 15px; }
.form-group label { display: block; margin-bottom: 7px; color: #999; font-size: 10px; text-transform: uppercase; letter-spacing: 1px; }
.form-group input, .form-group select { width: 100%; height: 38px; padding: 0 12px; background: #111; border: 1px solid #333; border-radius: 5px; outline: none; color: #eee; font-size: 12px; box-sizing: border-box; }
.form-group input:focus, .form-group select:focus { border-color: #ff4d4d; }

.error-msg { display: block; color: #ff6666; font-size: 10px; margin-top: 5px; }

.modal-buttons { display: flex; justify-content: flex-end; gap: 10px; margin-top: 22px; }
.cancel-btn, .save-btn { height: 36px; padding: 0 18px; border-radius: 5px; cursor: pointer; font-size: 11px; font-weight: 600; border: none; }
.cancel-btn { background: #222; border: 1px solid #444; color: #bbb; }
.cancel-btn:hover { background: #2c2c2c; color: #fff; }
.save-btn { background: #ff4d4d; border: 1px solid #ff4d4d; color: #fff; }
.save-btn:hover { background: #ff6666; }

/* RESPONSIVE */
@media screen and (max-width: 1100px) { .stats-row { grid-template-columns: 1fr; } }
@media screen and (max-width: 900px) {
    .users-page { padding: 20px 15px 40px; }
    .directory-card { overflow-x: auto; }
    .data-table { min-width: 900px; }
}
</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<asp:HiddenField ID="hdnEditUserId" runat="server" ClientIDMode="Static" />

<div class="users-page">

    <!-- STATS -->
    <div class="stats-row">
        <div class="stat-card">
            <div class="stat-label">Total Users</div>
            <div class="stat-value"><asp:Label ID="lblTotalUsers" runat="server" Text="0" /></div>
            <div class="stat-icon icon-pink">👥</div>
            <svg class="stat-graphic sparkline" viewBox="0 0 60 24" preserveAspectRatio="none">
                <path d="M 0 18 L 12 14 L 20 16 L 30 8 L 40 12 L 50 4 L 60 10" />
            </svg>
        </div>

        <div class="stat-card">
            <div class="stat-label">Active Accounts</div>
            <div class="stat-value"><asp:Label ID="lblActiveUsers" runat="server" Text="0" /></div>
            <div class="stat-icon icon-green">✓</div>
            <svg class="stat-graphic circle-progress" viewBox="0 0 36 36">
                <circle cx="18" cy="18" r="14" fill="none" stroke="#2a2a2a" stroke-width="3"/>
                <circle cx="18" cy="18" r="14" fill="none" stroke="#4ade80" stroke-width="3"
                        stroke-dasharray="88" stroke-dashoffset="20"
                        stroke-linecap="round" transform="rotate(-90 18 18)"/>
            </svg>
        </div>

        <div class="stat-card">
            <div class="stat-label">Pending Activation</div>
            <div class="stat-value"><asp:Label ID="lblPendingUsers" runat="server" Text="0" /></div>
            <div class="stat-icon icon-orange">⏳</div>
            <svg class="stat-graphic sparkline" viewBox="0 0 60 24" preserveAspectRatio="none">
                <path d="M 0 8 L 10 12 L 20 10 L 30 16 L 40 14 L 50 20 L 60 18" stroke="#ffa500"/>
            </svg>
        </div>
    </div>


    <!-- DIRECTORY -->
    <div class="directory-card">

        <div class="directory-header">
            <div class="directory-title">User Directory</div>
        </div>

        <table class="data-table">
            <thead>
                <tr>
                    <th>Full Name</th>
                    <th>Email Address</th>
                    <th>Password</th>
                    <th>Status</th>
                    <th>Reset OTP</th>
                    <th>Created At</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptUsers" runat="server" OnItemCommand="rptUsers_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td>
                                <div class="user-info">
                                    <div class="user-avatar"><%# GetInitials(Eval("FullName").ToString()) %></div>
                                    <div class="user-name"><%# Eval("FullName") %></div>
                                </div>
                            </td>
                            <td><%# Eval("Email") %></td>
                            <td><span class="password-dots">••••••••</span></td>
                            <td>
                                <span class='<%# "status-badge " + (Eval("Status").ToString() == "ACTIVE" ? "active" : "pending") %>'>
                                    <span class="status-dot"></span>
                                    <%# Eval("Status") %>
                                </span>
                            </td>
                            <td><span class="otp-code"><%# Eval("ResetOTP") %></span></td>
                            <td>
                                <div class="created-date">
                                    <%# Convert.ToDateTime(Eval("CreatedAt")).ToString("dd MMM") %><br />
                                    <%# Convert.ToDateTime(Eval("CreatedAt")).ToString("yyyy") %>
                                </div>
                            </td>
                            <td>
                                <div class="action-icons">
                                    <asp:LinkButton runat="server" CssClass="action-icon-btn" Text="✎"
                                        CommandName="EditUser" CommandArgument='<%# Eval("Id") %>'
                                        ToolTip="Edit" CausesValidation="false" />
                                    <asp:LinkButton runat="server" CssClass="action-icon-btn delete" Text="🗑"
                                        CommandName="DeleteUser" CommandArgument='<%# Eval("Id") %>'
                                        ToolTip="Delete" CausesValidation="false"
                                        OnClientClick="return confirm('Delete this user?');" />
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>

</div>


<!-- MODAL -->
<asp:Panel ID="UserModal" runat="server" CssClass="modal-overlay" ClientIDMode="Static">
    <div class="user-modal">

        <div class="modal-header">
            <asp:Label ID="modalTitle" runat="server" CssClass="modal-title" Text="Add New User" ClientIDMode="Static" />
            <asp:Button ID="btnCloseModal" runat="server" CssClass="modal-close" Text="×"
                OnClick="btnCloseModal_Click" CausesValidation="false" />
        </div>

        <div class="form-group">
            <label>Full Name</label>
            <asp:TextBox ID="txtUserName" runat="server" ClientIDMode="Static" placeholder="Enter full name" />
            <asp:Label ID="lblNameError" runat="server" CssClass="error-msg" />
        </div>

        <div class="form-group">
            <label>Email Address</label>
            <asp:TextBox ID="txtUserEmail" runat="server" ClientIDMode="Static" placeholder="Enter email" />
            <asp:Label ID="lblEmailError" runat="server" CssClass="error-msg" />
        </div>

        <div class="form-group">
            <label>Password</label>
            <asp:TextBox ID="txtUserPassword" runat="server" ClientIDMode="Static" TextMode="Password" placeholder="Enter password" />
            <asp:Label ID="lblPasswordError" runat="server" CssClass="error-msg" />
        </div>

        <div class="form-group">
            <label>Status</label>
            <asp:DropDownList ID="ddlUserStatus" runat="server" ClientIDMode="Static">
                <asp:ListItem Value="ACTIVE">ACTIVE</asp:ListItem>
                <asp:ListItem Value="PENDING">PENDING</asp:ListItem>
            </asp:DropDownList>
        </div>

        <div class="form-group">
            <label>Reset OTP</label>
            <asp:TextBox ID="txtUserOtp" runat="server" ClientIDMode="Static" MaxLength="6" placeholder="Enter 6 digit OTP" />
            <asp:Label ID="lblOtpError" runat="server" CssClass="error-msg" />
        </div>

        <div class="modal-buttons">
            <asp:Button ID="btnCancelModal" runat="server" CssClass="cancel-btn" Text="Cancel"
                OnClick="btnCloseModal_Click" CausesValidation="false" />
            <asp:Button ID="btnSaveUser" runat="server" ClientIDMode="Static" CssClass="save-btn"
                Text="Save User" OnClick="btnSaveUser_Click" />
        </div>

    </div>
</asp:Panel>

</asp:Content>
