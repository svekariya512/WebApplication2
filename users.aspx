<%@ Page Title="User Management" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="WebApplication2.users" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
    * { box-sizing: border-box; }

    .users-page {
        width: 100%; min-height: 100vh;
        padding: 25px 35px 50px;
        background: #111111; color: #ffffff;
        font-family: Arial, Helvetica, sans-serif;
    }

    /* STATS */
    .stats-row {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px; margin-bottom: 30px;
    }

    .stat-card {
        position: relative; min-height: 120px;
        padding: 22px 25px;
        background: #1a1a1a; border: 1px solid #2a2a2a;
        border-radius: 10px; overflow: hidden;
    }

    .stat-label {
        color: #999; font-size: 11px;
        letter-spacing: 1.5px; text-transform: uppercase;
    }

    .stat-value {
        margin-top: 22px; color: #fff;
        font-size: 26px; font-weight: 600;
    }

    .stat-icon {
        position: absolute; top: 20px; right: 20px;
        font-size: 16px;
    }

    .icon-pink { color: #ffc3b9; }
    .icon-green { color: #4ade80; }
    .icon-orange { color: #ffa500; }

    .stat-graphic {
        position: absolute; right: 20px; bottom: 18px;
    }

    .sparkline {
        width: 60px; height: 24px;
        stroke: #ffc3b9; stroke-width: 2; fill: none;
    }

    .circle-progress { width: 34px; height: 34px; }

    /* DIRECTORY */
    .directory-card {
        width: 100%; background: #151515;
        border: 1px solid #2a2a2a; border-radius: 10px;
        overflow: hidden;
    }

    .directory-header {
        display: flex; align-items: center;
        justify-content: space-between;
        padding: 18px 25px;
        border-bottom: 1px solid #252525;
    }

    .directory-title {
        color: #fff; font-size: 15px; font-weight: 500;
    }

    .directory-actions {
        display: flex; align-items: center; gap: 12px;
    }

    .search-box { position: relative; }

    .search-box input {
        width: 240px; height: 36px;
        padding: 0 12px 0 36px;
        background: #1e1e1e; border: 1px solid #2f2f2f;
        border-radius: 6px; outline: none;
        color: #eee; font-size: 12px;
    }
    .search-box input::placeholder { color: #777; }
    .search-box input:focus { border-color: #555; }

    .search-box-icon {
        position: absolute; left: 12px; top: 50%;
        transform: translateY(-50%);
        color: #888; font-size: 13px;
    }

    .new-user-btn {
        padding: 9px 18px;
        background: #ff4d4d; border: none;
        border-radius: 6px; color: #fff;
        font-size: 11px; font-weight: 600;
        letter-spacing: .5px; cursor: pointer;
        transition: .2s;
    }
    .new-user-btn:hover { background: #ff6666; }

    /* TABLE */
    .data-table { width: 100%; border-collapse: collapse; }

    .data-table thead th {
        height: 45px; padding: 0 20px;
        background: #1a1a1a;
        border-bottom: 1px solid #252525;
        color: #888; text-align: left;
        font-size: 11px; font-weight: 500;
        letter-spacing: 1px; text-transform: uppercase;
    }

    .data-table tbody td {
        padding: 14px 20px;
        border-bottom: 1px solid #202020;
        color: #ccc; font-size: 12px;
        vertical-align: middle;
    }

    .data-table tbody tr:hover { background: #1c1c1c; }
    .data-table tbody tr:last-child td { border-bottom: none; }

    /* USER */
    .user-info { display: flex; align-items: center; gap: 12px; }

    .user-avatar {
        width: 32px; height: 32px; flex-shrink: 0;
        display: flex; align-items: center; justify-content: center;
        border-radius: 50%; background: #ff4d4d;
        color: #fff; font-size: 11px; font-weight: 600;
    }

    .user-name { color: #fff; font-size: 12px; font-weight: 500; }
    .password-dots { color: #888; font-size: 9px; letter-spacing: 2px; }
    .otp-code { color: #ccc; font-family: "Courier New", monospace; font-size: 12px; }
    .created-date { color: #ccc; font-size: 11px; line-height: 16px; }

    /* STATUS */
    .status-badge {
        display: inline-flex; align-items: center; gap: 6px;
        padding: 4px 10px; border-radius: 12px;
        font-size: 10px; font-weight: 600;
        letter-spacing: .5px;
    }
    .status-badge.active { background: rgba(74,222,128,.12); color: #4ade80; }
    .status-badge.pending { background: rgba(250,204,21,.12); color: #facc15; }

    .status-dot {
        width: 6px; height: 6px; border-radius: 50%;
        background: currentColor;
    }

    /* ACTIONS */
    .action-icons { display: flex; align-items: center; gap: 14px; }

    .action-icon-btn {
        display: flex; align-items: center; justify-content: center;
        padding: 0; background: transparent; border: none;
        color: #888; cursor: pointer; font-size: 15px;
        transition: .2s;
    }
    .action-icon-btn:hover { color: #fff; }
    .action-icon-btn.delete:hover { color: #ff4d4d; }

    /* MODAL */
    .modal-overlay {
        position: fixed; inset: 0; z-index: 9999;
        display: none; align-items: center; justify-content: center;
        background: rgba(0,0,0,.72);
        backdrop-filter: blur(4px);
    }
    .modal-overlay.show { display: flex; }

    .user-modal {
        width: 430px; max-width: 92%; padding: 25px;
        background: #1c1c1c; border: 1px solid #333;
        border-radius: 10px;
        box-shadow: 0 20px 60px rgba(0,0,0,.6);
    }

    .modal-header {
        display: flex; align-items: center;
        justify-content: space-between; margin-bottom: 22px;
    }

    .modal-title { color: #fff; font-size: 17px; font-weight: 500; }

    .modal-close {
        border: none; background: transparent;
        color: #888; cursor: pointer; font-size: 22px;
    }
    .modal-close:hover { color: #fff; }

    .form-group { margin-bottom: 15px; }

    .form-group label {
        display: block; margin-bottom: 7px;
        color: #999; font-size: 10px;
        text-transform: uppercase; letter-spacing: 1px;
    }

    .form-group input,
    .form-group select {
        width: 100%; height: 38px;
        padding: 0 12px;
        background: #111; border: 1px solid #333;
        border-radius: 5px; outline: none;
        color: #eee; font-size: 12px;
    }
    .form-group input:focus,
    .form-group select:focus { border-color: #ff4d4d; }

    .error-msg {
        display: block; color: #ff6666;
        font-size: 10px; margin-top: 5px;
    }

    .modal-buttons {
        display: flex; justify-content: flex-end;
        gap: 10px; margin-top: 22px;
    }

    .cancel-btn, .save-btn {
        height: 36px; padding: 0 18px;
        border-radius: 5px; cursor: pointer;
        font-size: 11px; font-weight: 600;
    }

    .cancel-btn {
        background: #222; border: 1px solid #444; color: #bbb;
    }
    .cancel-btn:hover { background: #2c2c2c; color: #fff; }

    .save-btn {
        background: #ff4d4d; border: 1px solid #ff4d4d; color: #fff;
    }
    .save-btn:hover { background: #ff6666; }

    /* RESPONSIVE */
    @media screen and (max-width: 1100px) {
        .stats-row { grid-template-columns: 1fr; }
    }
    @media screen and (max-width: 900px) {
        .users-page { padding: 20px 15px 40px; }
        .directory-header { flex-direction: column; align-items: flex-start; gap: 12px; }
        .directory-actions { width: 100%; }
        .search-box { flex: 1; }
        .search-box input { width: 100%; }
        .directory-card { overflow-x: auto; }
        .data-table { min-width: 900px; }
    }
</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HiddenField ID="hdnEditUserId" runat="server" />

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var hamburger = document.getElementById("mainHamburger");
            if (hamburger) { hamburger.style.display = "flex"; }

            var header = document.querySelector(".cine-header");
            var searchArea = document.querySelector(".header-search-area");

            if (header && searchArea && !document.getElementById("userPageTitle")) {
                var titleEl = document.createElement("div");
                titleEl.id = "userPageTitle";
                titleEl.innerText = "User Management";
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

        function closeUserModal() {
            document.getElementById("userModal").classList.remove("show");
            document.getElementById("hdnEditUserId").value = "";
        }

        document.addEventListener("click", function (event) {
            var modal = document.getElementById("userModal");
            if (event.target === modal) { closeUserModal(); }
        });

        document.addEventListener("keydown", function (event) {
            if (event.key === "Escape") { closeUserModal(); }
        });
    </script>


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
            <div class="directory-actions">
                <div class="search-box">
                    <span class="search-box-icon">🔍</span>
                    <asp:TextBox ID="txtSearch" runat="server" ClientIDMode="Static"
                        placeholder="Search users..." AutoPostBack="true"
                        OnTextChanged="txtSearch_TextChanged" />
                </div>
                <button type="button" class="new-user-btn" onclick="openNewUserModal();">
                    + NEW USER
                </button>
            </div>
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
                                        ToolTip="Edit" />
                                    <asp:LinkButton runat="server" CssClass="action-icon-btn delete" Text="🗑"
                                        CommandName="DeleteUser" CommandArgument='<%# Eval("Id") %>'
                                        ToolTip="Delete"
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
<div id="userModal" class="modal-overlay">
    <div class="user-modal">

        <div class="modal-header">
            <div id="modalTitle" class="modal-title">Add New User</div>
            <button type="button" class="modal-close" onclick="closeUserModal();">×</button>
        </div>

        <div class="form-group">
            <label>Full Name</label>
            <asp:TextBox ID="txtUserName" runat="server" ClientIDMode="Static" placeholder="Enter full name" />
            <asp:RequiredFieldValidator ID="rfvName" runat="server"
                ControlToValidate="txtUserName"
                ErrorMessage="Full name is required."
                CssClass="error-msg" Display="Dynamic"
                ValidationGroup="UserGroup" />
        </div>

        <div class="form-group">
            <label>Email Address</label>
            <asp:TextBox ID="txtUserEmail" runat="server" ClientIDMode="Static" TextMode="Email" placeholder="Enter email" />
            <asp:RequiredFieldValidator ID="rfvEmail" runat="server"
                ControlToValidate="txtUserEmail"
                ErrorMessage="Email is required."
                CssClass="error-msg" Display="Dynamic"
                ValidationGroup="UserGroup" />
            <asp:RegularExpressionValidator ID="revEmail" runat="server"
                ControlToValidate="txtUserEmail"
                ErrorMessage="Enter valid email."
                CssClass="error-msg" Display="Dynamic"
                ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
                ValidationGroup="UserGroup" />
        </div>

        <div class="form-group">
            <label>Password</label>
            <asp:TextBox ID="txtUserPassword" runat="server" ClientIDMode="Static" TextMode="Password" placeholder="Enter password" />
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
            <asp:RequiredFieldValidator ID="rfvOtp" runat="server"
                ControlToValidate="txtUserOtp"
                ErrorMessage="OTP is required."
                CssClass="error-msg" Display="Dynamic"
                ValidationGroup="UserGroup" />
            <asp:RegularExpressionValidator ID="revOtp" runat="server"
                ControlToValidate="txtUserOtp"
                ErrorMessage="OTP must be 6 digits."
                CssClass="error-msg" Display="Dynamic"
                ValidationExpression="^\d{6}$"
                ValidationGroup="UserGroup" />
        </div>

        <div class="modal-buttons">
            <button type="button" class="cancel-btn" onclick="closeUserModal();">Cancel</button>
            <asp:Button ID="btnSaveUser" runat="server" ClientIDMode="Static" CssClass="save-btn"
                Text="Save User" OnClick="btnSaveUser_Click" ValidationGroup="UserGroup" />
        </div>

    </div>
</div>


<script>
    function openNewUserModal() {
        document.getElementById("modalTitle").innerText = "Add New User";
        document.getElementById("hdnEditUserId").value = "";
        document.getElementById("txtUserName").value = "";
        document.getElementById("txtUserEmail").value = "";
        document.getElementById("txtUserPassword").value = "";
        document.getElementById("ddlUserStatus").value = "ACTIVE";
        document.getElementById("txtUserOtp").value = "";
        document.getElementById("btnSaveUser").value = "Save User";
        document.getElementById("userModal").classList.add("show");
        setTimeout(function () { document.getElementById("txtUserName").focus(); }, 100);
    }
</script>

</asp:Content>