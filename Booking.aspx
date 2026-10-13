<%@ Page Title="Booking" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="WebApplication2.Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
    .page-container {
        padding: 25px 35px 50px 35px;
        background: #111111;
        min-height: calc(100vh - 82px);
    }

    .page-subtitle {
        font-size: 12px;
        color: #888888;
        margin-bottom: 25px;
    }

    /* ACTION BAR */
    .action-bar {
        display: flex;
        justify-content: space-between;
        align-items: center;
        margin-bottom: 20px;
    }

    .filter-tabs { display: flex; gap: 10px; }

    .filter-tab {
        padding: 7px 18px;
        background: #1E1E1E;
        border: 1px solid #2a2a2a;
        border-radius: 5px;
        color: #cccccc;
        font-size: 12px;
        cursor: pointer;
        transition: 0.2s;
    }
    .filter-tab:hover { background: #2a2a2a; }
    .filter-tab.active {
        background: #2a2a2a;
        border-color: #FFC3B9;
        color: #FFC3B9;
    }

    /* STATS */
    .stats-row {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 15px;
        margin-bottom: 25px;
    }

    .stat-card {
        background: #1a1a1a;
        border: 1px solid #2a2a2a;
        border-radius: 8px;
        padding: 18px 20px;
        position: relative;
    }

    .stat-label {
        font-size: 10px;
        color: #888888;
        letter-spacing: 1px;
        text-transform: uppercase;
        margin-bottom: 10px;
    }

    .stat-value {
        font-size: 26px;
        font-weight: bold;
        color: #ffffff;
        margin-bottom: 6px;
    }

    .stat-change { font-size: 11px; color: #4ade80; }
    .stat-change.negative { color: #ff6b6b; }

    .stat-icon {
        position: absolute;
        top: 18px; right: 18px;
        width: 28px; height: 28px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-size: 14px;
    }
    .stat-icon.pink { background: rgba(255, 195, 185, 0.15); color: #FFC3B9; }
    .stat-icon.green { background: rgba(74, 222, 128, 0.15); color: #4ade80; }

    /* TABLE */
    .table-wrapper {
        background: #1a1a1a;
        border: 1px solid #2a2a2a;
        border-radius: 8px;
        overflow: hidden;
    }

    .table-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 15px 20px;
        border-bottom: 1px solid #2a2a2a;
    }

    .table-search {
        display: flex;
        align-items: center;
        background: #222222;
        border: 1px solid #333333;
        border-radius: 5px;
        padding: 6px 12px;
        width: 250px;
    }

    .table-search svg {
        width: 13px; height: 13px;
        stroke: #888888;
        margin-right: 8px;
    }

    .table-search input {
        background: transparent;
        border: none;
        outline: none;
        color: #eeeeee;
        font-size: 12px;
        width: 100%;
    }
    .table-search input::placeholder { color: #666666; }

    /* DATA TABLE */
    .data-table { width: 100%; border-collapse: collapse; }

    .data-table thead th {
        text-align: left;
        padding: 12px 15px;
        font-size: 10px;
        color: #888888;
        letter-spacing: 1px;
        text-transform: uppercase;
        border-bottom: 1px solid #2a2a2a;
        font-weight: normal;
    }

    .data-table tbody td {
        padding: 14px 15px;
        font-size: 12px;
        color: #dddddd;
        border-bottom: 1px solid #222222;
    }

    .data-table tbody tr:hover { background: #1f1f1f; }

    .booking-id {
        color: #FFC3B9;
        font-weight: bold;
        font-size: 11px;
    }

    /* STATUS */
    .status-badge {
        display: inline-block;
        padding: 3px 10px;
        border-radius: 4px;
        font-size: 10px;
        font-weight: bold;
        letter-spacing: 0.5px;
    }
    .status-success { background: rgba(74, 222, 128, 0.15); color: #4ade80; }
    .status-pending { background: rgba(250, 204, 21, 0.15); color: #facc15; }

    /* ACTION ICONS */
    .action-icons { display: flex; gap: 10px; }
    .action-icons svg {
        width: 15px; height: 15px;
        stroke: #888888;
        cursor: pointer;
        transition: 0.2s;
    }
    .action-icons svg:hover { stroke: #FFC3B9; transform: scale(1.12); }
    .delete-icon:hover { stroke: #ff6b6b !important; }

    /* MODAL */
    .booking-modal-overlay {
        display: none;
        position: fixed; inset: 0;
        background: rgba(0,0,0,0.72);
        z-index: 9999;
        align-items: center; justify-content: center;
    }
    .booking-modal-overlay.show { display: flex; }

    .booking-modal {
        width: 500px; max-width: 92%;
        background: #1c1c1c;
        border: 1px solid #383838;
        border-radius: 9px;
        box-shadow: 0 25px 70px rgba(0,0,0,0.7);
        overflow: hidden;
    }

    .modal-header {
        display: flex; align-items: center; justify-content: space-between;
        padding: 17px 20px;
        border-bottom: 1px solid #303030;
    }

    .modal-title { color: #FFC3B9; font-size: 15px; font-weight: 600; }

    .modal-close {
        background: transparent; border: none;
        color: #777; font-size: 22px;
        cursor: pointer;
    }
    .modal-close:hover { color: #fff; }

    .modal-body { padding: 20px; }

    .form-grid {
        display: grid;
        grid-template-columns: 1fr 1fr;
        gap: 14px;
    }

    .form-group { display: flex; flex-direction: column; gap: 6px; }

    .form-label {
        font-size: 10px; color: #888;
        text-transform: uppercase;
        letter-spacing: 0.8px;
    }

    .form-input, .form-select {
        height: 35px;
        background: #252525;
        border: 1px solid #383838;
        border-radius: 5px;
        color: #eee;
        padding: 0 10px;
        outline: none;
        font-size: 11px;
    }
    .form-input:focus, .form-select:focus { border-color: #FFC3B9; }
    .form-input[readonly] { color: #cccccc; cursor: default; }

    .modal-footer {
        display: flex; justify-content: flex-end; gap: 9px;
        padding: 15px 20px;
        border-top: 1px solid #303030;
    }

    .modal-cancel {
        padding: 8px 17px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 11px;
        background: #222; color: #ccc;
        border: 1px solid #444;
    }
    .modal-cancel:hover { background: #2c2c2c; }

    .error-msg {
        display: block;
        color: #ff6666;
        font-size: 10px;
        margin-top: 3px;
    }

    @media screen and (max-width: 900px) {
        .page-container { padding: 20px 15px 40px 15px; }
        .stats-row { grid-template-columns: 1fr; }
        .action-bar { flex-direction: column; align-items: flex-start; gap: 12px; }
        .table-header { flex-direction: column; align-items: stretch; gap: 12px; }
        .table-search { width: 100%; }
        .form-grid { grid-template-columns: 1fr; }
    }
</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HiddenField ID="hdnEditBookingId" runat="server" />

    <!-- Header Title + Hamburger -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var hamburger = document.getElementById("mainHamburger");
            if (hamburger) { hamburger.style.display = "flex"; }

            var header = document.querySelector(".cine-header");
            var searchArea = document.querySelector(".header-search-area");

            if (header && searchArea && !document.getElementById("bookingHeaderTitle")) {
                var titleEl = document.createElement("div");
                titleEl.id = "bookingHeaderTitle";
                titleEl.innerText = "Payment Transactions";
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

        function openEditModal() {
            document.getElementById("bookingModal").classList.add("show");
        }
        function closeBookingModal() {
            document.getElementById("bookingModal").classList.remove("show");
            document.getElementById("hdnEditBookingId").value = "";
        }
        document.addEventListener("click", function (event) {
            var modal = document.getElementById("bookingModal");
            if (event.target === modal) { closeBookingModal(); }
        });
        document.addEventListener("keydown", function (event) {
            if (event.key === "Escape") { closeBookingModal(); }
        });
    </script>

<div class="page-container">

    <div class="page-subtitle">
        Overview and management of all booking payments.
    </div>

    <!-- ACTION BAR -->
    <div class="action-bar">
        <div class="filter-tabs">
            <asp:LinkButton runat="server" CssClass="filter-tab" Text="All"
                CommandArgument="ALL" OnClick="FilterTab_Click" />
            <asp:LinkButton runat="server" CssClass="filter-tab" Text="Pending"
                CommandArgument="PENDING" OnClick="FilterTab_Click" />
            <asp:LinkButton runat="server" CssClass="filter-tab" Text="Successful"
                CommandArgument="SUCCESS" OnClick="FilterTab_Click" />
        </div>
        <asp:Label ID="lblFilterStatus" runat="server" ForeColor="#FFC3B9"
            Font-Size="11px" />
    </div>


    <!-- STATS -->
    <div class="stats-row">

        <div class="stat-card">
            <div class="stat-label">Total Revenue</div>
            <div class="stat-value">
                <asp:Label ID="lblTotalRevenue" runat="server" Text="Rs. 0" />
            </div>
            <div class="stat-change">↗ +8.2% from last week</div>
            <div class="stat-icon pink">📊</div>
        </div>

        <div class="stat-card">
            <div class="stat-label">Total Transactions</div>
            <div class="stat-value">
                <asp:Label ID="lblTotalTransactions" runat="server" Text="0" />
            </div>
            <div class="stat-change">↗ +12.4% from last week</div>
            <div class="stat-icon pink">📈</div>
        </div>

        <div class="stat-card">
            <div class="stat-label">Successful Payments</div>
            <div class="stat-value">
                <asp:Label ID="lblSuccessRate" runat="server" Text="0%" />
            </div>
            <div class="stat-change negative">↘ -0.5% failure rate</div>
            <div class="stat-icon green">✔</div>
        </div>

    </div>


    <!-- TABLE -->
    <div class="table-wrapper">

        <div class="table-header">
            <div class="table-search">
                <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="11" cy="11" r="8"></circle>
                    <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                </svg>
                <asp:TextBox ID="txtBookingSearch" runat="server" ClientIDMode="Static"
                    placeholder="Search Booking ID or Customer..." AutoPostBack="true"
                    OnTextChanged="txtBookingSearch_TextChanged" />
            </div>
        </div>


        <table class="data-table">
            <thead>
                <tr>
                    <th>Booking ID</th>
                    <th>Movie</th>
                    <th>Customer Name</th>
                    <th>Theater</th>
                    <th>Date & Time</th>
                    <th>Seats</th>
                    <th>Amount</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="rptBookings" runat="server" OnItemCommand="rptBookings_ItemCommand">
                    <ItemTemplate>
                        <tr>
                            <td class="booking-id"><%# Eval("BookingId") %></td>
                            <td><%# Eval("MovieName") %></td>
                            <td><%# Eval("CustomerName") %></td>
                            <td><%# Eval("Theater") %></td>
                            <td><%# Convert.ToDateTime(Eval("ShowDate")).ToString("dd MMM, hh:mm tt") %></td>
                            <td><%# Eval("Seats") %></td>
                            <td>Rs. <%# Eval("Amount", "{0:N0}") %></td>
                            <td>
                                <span class='<%# "status-badge " + (Eval("Status").ToString() == "SUCCESS" ? "status-success" : "status-pending") %>'>
                                    <%# Eval("Status") %>
                                </span>
                            </td>
                            <td>
                                <div class="action-icons">
                                    <!-- VIEW -->
                                    <asp:LinkButton runat="server" CommandName="ViewBooking"
                                        CommandArgument='<%# Eval("Id") %>' ToolTip="View">
                                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8S1 12 1 12z"></path>
                                            <circle cx="12" cy="12" r="3"></circle>
                                        </svg>
                                    </asp:LinkButton>

                                    <!-- EDIT -->
                                    <asp:LinkButton runat="server" CommandName="EditBooking"
                                        CommandArgument='<%# Eval("Id") %>' ToolTip="Edit">
                                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <path d="M11 4H4a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2v-7"></path>
                                            <path d="M18.5 2.5a2.121 2.121 0 0 1 3 3L12 15l-4 1 1-4 9.5-9.5z"></path>
                                        </svg>
                                    </asp:LinkButton>

                                    <!-- DELETE -->
                                    <asp:LinkButton runat="server" CssClass="delete-icon"
                                        CommandName="DeleteBooking"
                                        CommandArgument='<%# Eval("Id") %>' ToolTip="Delete"
                                        OnClientClick="return confirm('Delete this booking?');">
                                        <svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                            <polyline points="3 6 5 6 21 6"></polyline>
                                            <path d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2"></path>
                                        </svg>
                                    </asp:LinkButton>
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
<div id="bookingModal" class="booking-modal-overlay">
    <div class="booking-modal">

        <div class="modal-header">
            <div class="modal-title" id="modalTitleText">View Booking</div>
            <button type="button" class="modal-close" onclick="closeBookingModal();">×</button>
        </div>

        <div class="modal-body">
            <div class="form-grid">

                <div class="form-group">
                    <label class="form-label">Booking ID</label>
                    <asp:TextBox ID="txtBookingId" runat="server" ClientIDMode="Static" CssClass="form-input" ReadOnly="true" />
                </div>

                <div class="form-group">
                    <label class="form-label">Movie</label>
                    <asp:TextBox ID="txtMovie" runat="server" ClientIDMode="Static" CssClass="form-input" />
                    <asp:RequiredFieldValidator ID="rfvMovie" runat="server"
                        ControlToValidate="txtMovie"
                        ErrorMessage="Movie is required."
                        CssClass="error-msg" Display="Dynamic"
                        ValidationGroup="BookingGroup" />
                </div>

                <div class="form-group">
                    <label class="form-label">Customer Name</label>
                    <asp:TextBox ID="txtCustomer" runat="server" ClientIDMode="Static" CssClass="form-input" />
                    <asp:RequiredFieldValidator ID="rfvCustomer" runat="server"
                        ControlToValidate="txtCustomer"
                        ErrorMessage="Customer is required."
                        CssClass="error-msg" Display="Dynamic"
                        ValidationGroup="BookingGroup" />
                </div>

                <div class="form-group">
                    <label class="form-label">Theater</label>
                    <asp:TextBox ID="txtTheater" runat="server" ClientIDMode="Static" CssClass="form-input" />
                    <asp:RequiredFieldValidator ID="rfvTheater" runat="server"
                        ControlToValidate="txtTheater"
                        ErrorMessage="Theater is required."
                        CssClass="error-msg" Display="Dynamic"
                        ValidationGroup="BookingGroup" />
                </div>

                <div class="form-group">
                    <label class="form-label">Date & Time</label>
                    <asp:TextBox ID="txtDateTime" runat="server" ClientIDMode="Static" CssClass="form-input" />
                </div>

                <div class="form-group">
                    <label class="form-label">Seats</label>
                    <asp:TextBox ID="txtSeats" runat="server" ClientIDMode="Static" CssClass="form-input" />
                    <asp:RequiredFieldValidator ID="rfvSeats" runat="server"
                        ControlToValidate="txtSeats"
                        ErrorMessage="Seats are required."
                        CssClass="error-msg" Display="Dynamic"
                        ValidationGroup="BookingGroup" />
                </div>

                <div class="form-group">
                    <label class="form-label">Amount</label>
                    <asp:TextBox ID="txtAmount" runat="server" ClientIDMode="Static" CssClass="form-input" />
                    <asp:RequiredFieldValidator ID="rfvAmount" runat="server"
                        ControlToValidate="txtAmount"
                        ErrorMessage="Amount is required."
                        CssClass="error-msg" Display="Dynamic"
                        ValidationGroup="BookingGroup" />
                </div>

                <div class="form-group">
                    <label class="form-label">Status</label>
                    <asp:DropDownList ID="ddlStatus" runat="server" ClientIDMode="Static" CssClass="form-select">
                        <asp:ListItem Value="SUCCESS">SUCCESS</asp:ListItem>
                        <asp:ListItem Value="PENDING">PENDING</asp:ListItem>
                    </asp:DropDownList>
                </div>

            </div>
        </div>

        <div class="modal-footer">
            <button type="button" class="modal-cancel" onclick="closeBookingModal();">Close</button>
            <asp:Button ID="btnSaveBooking" runat="server" ClientIDMode="Static"
                CssClass="modal-cancel" Text="Save Changes"
                BackColor="#FFC3B9" ForeColor="#111111" BorderStyle="None"
                OnClick="btnSaveBooking_Click" ValidationGroup="BookingGroup"
                Style="font-weight:600;" />
        </div>

    </div>
</div>

</asp:Content>