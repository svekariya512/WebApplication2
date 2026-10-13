<%@ Page Title="Tickets" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Tickets.aspx.cs" Inherits="WebApplication2.Tickets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
    .tickets-page {
        width: 100%; min-height: 100vh;
        background: #111111; color: #eeeeee;
        font-family: Arial, Helvetica, sans-serif;
        padding: 25px 35px 40px 35px;
    }

    .tickets-topbar {
        display: flex; justify-content: flex-end;
        margin-bottom: 28px;
    }

    .add-ticket-btn {
        border: none; background: #ffb6b1;
        color: #181818; padding: 11px 17px;
        border-radius: 6px; font-size: 11px;
        cursor: pointer; font-weight: 600;
        transition: 0.2s;
    }
    .add-ticket-btn:hover { background: #ffc7c3; }

    .ticket-stats { display: flex; gap: 15px; margin-bottom: 20px; }

    .stat-card {
        width: 180px; height: 130px;
        background: #202020; border: 1px solid #292929;
        border-radius: 11px; padding: 16px;
        position: relative; overflow: hidden;
    }

    .stat-label {
        color: #8d8d8d; font-size: 9px;
        letter-spacing: 1px; text-transform: uppercase;
    }

    .stat-number {
        margin-top: 10px; font-size: 28px;
        color: #eeeeee; font-weight: 300;
    }

    .stat-growth { margin-top: 12px; font-size: 11px; color: #46b85a; }
    .stat-next { margin-top: 12px; font-size: 11px; color: #9b9b9b; line-height: 16px; }

    .ticket-container {
        width: 100%; background: #1c1c1c;
        border: 1px solid #292929; border-radius: 10px;
        overflow: hidden;
    }

    .ticket-toolbar {
        height: 55px; background: #292929;
        display: flex; justify-content: space-between;
        align-items: center; padding: 0 18px;
    }

    .ticket-tabs { display: flex; gap: 3px; }

    .ticket-tab {
        border: none; background: transparent;
        color: #999999; padding: 8px 15px;
        border-radius: 4px; cursor: pointer;
        font-size: 11px; transition: 0.2s;
        text-decoration: none;
    }
    .ticket-tab:hover { color: #ffffff; }
    .ticket-tab.active { background: #3a3a3a; color: #ffffff; }

    .search-wrapper { position: relative; }

    .ticket-search {
        width: 220px; height: 30px;
        background: #1c1c1c; border: 1px solid #404040;
        border-radius: 5px; color: white;
        outline: none; padding: 0 12px 0 30px;
        font-size: 10px;
    }
    .ticket-search::placeholder { color: #777777; }

    .search-icon {
        position: absolute; left: 10px; top: 8px;
        color: #858585; font-size: 12px;
    }

    .ticket-table-header {
        display: grid;
        grid-template-columns: 2.2fr .75fr .65fr .55fr .9fr .55fr;
        align-items: center; min-height: 45px;
        padding: 0 20px; border-bottom: 1px solid #292929;
        color: #909090; font-size: 10px;
        text-transform: uppercase; letter-spacing: 0.5px;
    }

    .ticket-row {
        display: grid;
        grid-template-columns: 2.2fr .75fr .65fr .55fr .9fr .55fr;
        align-items: center; min-height: 85px;
        padding: 0 20px; border-bottom: 1px solid #292929;
        transition: 0.2s;
    }
    .ticket-row:last-child { border-bottom: none; }
    .ticket-row:hover { background: #222222; }

    .movie-info { display: flex; align-items: center; gap: 12px; }

    .movie-image {
        width: 36px; height: 48px;
        border-radius: 3px; background: #252525;
    }

    .movie-name { color: #eeeeee; font-size: 12px; margin-bottom: 5px; font-weight: 500; }
    .venue-name { color: #929292; font-size: 10px; }

    .status { display: inline-block; padding: 5px 10px; border-radius: 12px; font-size: 10px; }
    .status.confirmed { color: #4ac15a; background: rgba(53, 164, 66, .13); }
    .status.past { color: #858585; background: #292929; }

    .ticket-date { color: #dddddd; font-size: 11px; line-height: 17px; }
    .ticket-date span { color: #8d8d8d; }

    .seat-list { display: flex; flex-direction: column; gap: 4px; }

    .seat {
        width: 26px; padding: 3px 0;
        text-align: center; background: #303030;
        color: #c8c8c8; font-size: 9px;
        border-radius: 3px;
    }

    .ticket-id { color: #cccccc; font-size: 10px; }

    .actions { display: flex; gap: 12px; align-items: center; }

    .action-btn {
        width: 18px; height: 18px; padding: 0;
        border: none; background: transparent;
        color: #8d8d8d; cursor: pointer;
        display: flex; align-items: center; justify-content: center;
        text-decoration: none;
    }

    .action-btn svg {
        width: 14px; height: 14px;
        fill: none; stroke: currentColor;
        stroke-width: 1.8;
        stroke-linecap: round; stroke-linejoin: round;
    }
    .action-btn:hover { color: #ffffff; text-decoration: none; }
    .delete-btn:hover { color: #ff7777; }

    .ticket-modal-overlay {
        display: none; position: fixed; inset: 0;
        z-index: 9999; background: rgba(0, 0, 0, 0.72);
        align-items: center; justify-content: center;
    }
    .ticket-modal-overlay.show { display: flex; }

    .ticket-modal {
        width: 430px; max-width: calc(100% - 30px);
        background: #242424; border: 1px solid #3a3a3a;
        border-radius: 9px; overflow: hidden;
    }

    .modal-header {
        height: 54px; padding: 0 20px;
        display: flex; align-items: center;
        justify-content: space-between;
        background: #2c2c2c; border-bottom: 1px solid #3a3a3a;
    }

    .modal-title { color: #ffffff; font-size: 14px; font-weight: 500; }

    .modal-close {
        border: none; background: transparent;
        color: #999999; font-size: 20px; cursor: pointer;
    }
    .modal-close:hover { color: #ffffff; }

    .modal-body { padding: 20px; }

    .modal-field { margin-bottom: 14px; }

    .modal-field label {
        display: block; color: #858585;
        font-size: 9px; text-transform: uppercase;
        letter-spacing: .5px; margin-bottom: 6px;
    }

    .modal-field input,
    .modal-field select {
        width: 100%; height: 35px;
        background: #181818; border: 1px solid #3b3b3b;
        border-radius: 4px; color: #eeeeee;
        padding: 0 10px; outline: none;
        font-size: 11px;
        box-sizing: border-box;
    }
    .modal-field input:focus,
    .modal-field select:focus { border-color: #777777; }

    .error-msg {
        display: block; color: #ff6666;
        font-size: 10px; margin-top: 5px;
    }

    .modal-footer {
        display: flex; justify-content: flex-end;
        gap: 8px; padding: 15px 20px;
        background: #202020; border-top: 1px solid #333333;
    }

    .modal-cancel, .modal-save {
        height: 32px; padding: 0 15px;
        border-radius: 4px; font-size: 10px;
        cursor: pointer;
    }

    .modal-cancel {
        background: transparent; border: 1px solid #444444;
        color: #aaaaaa;
    }
    .modal-cancel:hover { color: #ffffff; background: #303030; }

    .modal-save {
        background: #ffb6b1; border: 1px solid #ffb6b1;
        color: #181818; font-weight: 600;
    }
    .modal-save:hover { background: #ffc7c3; }

    .ticket-footer {
        min-height: 45px; display: flex;
        align-items: center; justify-content: space-between;
        padding: 0 20px; color: #858585;
        font-size: 10px;
    }

    .footer-info { display: flex; gap: 10px; align-items: center; }
    .footer-right { display: flex; align-items: center; gap: 10px; }

    .page-arrow {
        border: none; background: transparent;
        color: #aaaaaa; cursor: pointer; font-size: 18px;
    }
    .page-arrow:hover { color: white; }

    .empty-msg {
        text-align: center;
        padding: 40px 20px;
        color: #666;
        font-size: 12px;
    }

    @media screen and (max-width: 900px) {
        .tickets-page { padding: 20px 15px 40px 15px; }
        .ticket-container { overflow-x: auto; }
        .ticket-toolbar, .ticket-table-header,
        .ticket-row, .ticket-footer { min-width: 800px; }
    }
</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <asp:HiddenField ID="hdnEditTicketId" runat="server" ClientIDMode="Static" />

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var hamburger = document.getElementById("mainHamburger");
            if (hamburger) { hamburger.style.display = "flex"; }

            var header = document.querySelector(".cine-header");
            var searchArea = document.querySelector(".header-search-area");

            if (header && searchArea && !document.getElementById("ticketsHeaderTitle")) {
                var titleEl = document.createElement("div");
                titleEl.id = "ticketsHeaderTitle";
                titleEl.innerText = "My Tickets";
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

        function closeTicketModal() {
            var modal = document.getElementById("ticketModal");
            if (modal) modal.classList.remove("show");
            var hdn = document.getElementById("hdnEditTicketId");
            if (hdn) hdn.value = "";
        }

        document.addEventListener("click", function (event) {
            var m1 = document.getElementById("ticketModal");
            if (event.target === m1) { closeTicketModal(); }
        });

        document.addEventListener("keydown", function (event) {
            if (event.key === "Escape") { closeTicketModal(); }
        });

        function openAddTicket() {
            var titleEl = document.getElementById("ticketModalTitle");
            var movieEl = document.getElementById("txtModalMovie");
            var venueEl = document.getElementById("txtModalVenue");
            var ticketIdEl = document.getElementById("txtModalTicketId");
            var seatsEl = document.getElementById("txtModalSeats");
            var statusEl = document.getElementById("ddlModalStatus");
            var hdnEl = document.getElementById("hdnEditTicketId");
            var modal = document.getElementById("ticketModal");

            if (titleEl) titleEl.innerText = "Add Ticket";
            if (movieEl) movieEl.value = "";
            if (venueEl) venueEl.value = "";
            if (ticketIdEl) ticketIdEl.value = "CP" + Math.floor(10000000 + Math.random() * 89999999);
            if (seatsEl) seatsEl.value = "";
            if (statusEl) statusEl.value = "Confirmed";
            if (hdnEl) hdnEl.value = "";
            if (modal) modal.classList.add("show");

            setTimeout(function () {
                if (movieEl) movieEl.focus();
            }, 100);
        }
    </script>

<div class="tickets-page">

    <div class="tickets-topbar">
        <button type="button" class="add-ticket-btn" onclick="openAddTicket();">
            ✚ &nbsp; Add Ticket
        </button>
    </div>

    <div class="ticket-stats">
        <div class="stat-card">
            <div class="stat-label">Total Bookings</div>
            <div class="stat-number">
                <asp:Label ID="lblTotalBookings" runat="server" Text="0" />
            </div>
            <div class="stat-growth">↗ +12% this month</div>
        </div>

        <div class="stat-card">
            <div class="stat-label">Upcoming</div>
            <div class="stat-number">
                <asp:Label ID="lblUpcomingBookings" runat="server" Text="0" />
            </div>
            <div class="stat-next">
                ♧ Next: Today 6:00<br />&nbsp;&nbsp;&nbsp;&nbsp;PM
            </div>
        </div>
    </div>


    <div class="ticket-container">

        <div class="ticket-toolbar">
            <div class="ticket-tabs">
                <asp:LinkButton runat="server" CssClass="ticket-tab" Text="All Tickets"
                    CommandArgument="all" OnClick="FilterTab_Click" />
                <asp:LinkButton runat="server" CssClass="ticket-tab" Text="Upcoming"
                    CommandArgument="upcoming" OnClick="FilterTab_Click" />
                <asp:LinkButton runat="server" CssClass="ticket-tab" Text="Past"
                    CommandArgument="past" OnClick="FilterTab_Click" />
            </div>

            <div class="search-wrapper">
                <span class="search-icon">⌕</span>
                <asp:TextBox ID="txtTicketSearch" runat="server" ClientIDMode="Static"
                    CssClass="ticket-search" placeholder="Search by Movie or ID..."
                    AutoPostBack="true" OnTextChanged="txtTicketSearch_TextChanged" />
            </div>
        </div>

        <div class="ticket-table-header">
            <div>Movie / Venue</div>
            <div>Status</div>
            <div>Date &amp; Time</div>
            <div>Seats</div>
            <div>Ticket ID</div>
            <div>Actions</div>
        </div>

        <asp:Repeater ID="rptTickets" runat="server" OnItemCommand="rptTickets_ItemCommand">
            <ItemTemplate>
                <div class="ticket-row">
                    <div class="movie-info">
                        <div class="movie-image"></div>
                        <div>
                            <div class="movie-name"><%# Eval("MovieName") %></div>
                            <div class="venue-name">♧ <%# Eval("Venue") %></div>
                        </div>
                    </div>

                    <div>
                        <span class='<%# "status " + (Eval("Status").ToString() == "Past" ? "past" : "confirmed") %>'>
                            <%# Eval("Status").ToString() == "Past" ? "Past" : "● Confirmed" %>
                        </span>
                    </div>

                    <div class="ticket-date">
                        <%# Convert.ToDateTime(Eval("ShowDate")).ToString("dd MMM") %><br />
                        <span><%# Convert.ToDateTime(Eval("ShowDate")).ToString("hh:mm tt") %></span>
                    </div>

                    <div class="seat-list">
                        <span class="seat"><%# Eval("Seats") %></span>
                    </div>

                    <div class="ticket-id"><%# Eval("TicketId") %></div>

                    <div class="actions">
                        <asp:LinkButton runat="server" CssClass="action-btn"
                            CommandName="ViewTicket" CommandArgument='<%# Eval("Id") %>'
                            ToolTip="View">
                            <svg viewBox="0 0 24 24">
                                <path d="M2.5 12s3.5-5 9.5-5 9.5 5 9.5 5-3.5 5-9.5 5-9.5-5-9.5-5z"></path>
                                <circle cx="12" cy="12" r="2.5"></circle>
                            </svg>
                        </asp:LinkButton>

                        <asp:LinkButton runat="server" CssClass="action-btn"
                            CommandName="EditTicket" CommandArgument='<%# Eval("Id") %>'
                            ToolTip="Edit">
                            <svg viewBox="0 0 24 24">
                                <path d="M4 20h4L19 9l-4-4L4 16v4z"></path>
                                <path d="M13.5 6.5l4 4"></path>
                            </svg>
                        </asp:LinkButton>

                        <asp:LinkButton runat="server" CssClass="action-btn delete-btn"
                            CommandName="DeleteTicket" CommandArgument='<%# Eval("Id") %>'
                            ToolTip="Delete"
                            OnClientClick="return confirm('Delete this ticket?');">
                            <svg viewBox="0 0 24 24">
                                <path d="M4 7h16"></path>
                                <path d="M9 7V4h6v3"></path>
                                <path d="M6 7l1 13h10l1-13"></path>
                                <path d="M10 11v5"></path>
                                <path d="M14 11v5"></path>
                            </svg>
                        </asp:LinkButton>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <asp:Label ID="lblEmpty" runat="server" CssClass="empty-msg" Visible="false" Text="No tickets found." />

        <div class="ticket-footer">
            <div class="footer-info">
                <span>♧ Scan QR code for entry</span>
                <span>↓ Download PDF tickets from actions menu</span>
            </div>
            <div class="footer-right">
                <asp:Label ID="lblShowingText" runat="server" />
                <button type="button" class="page-arrow" onclick="alert('First page');">‹</button>
                <button type="button" class="page-arrow" onclick="alert('Next page');">›</button>
            </div>
        </div>

    </div>

</div>


<div id="ticketModal" class="ticket-modal-overlay">
    <div class="ticket-modal">

        <div class="modal-header">
            <div class="modal-title" id="ticketModalTitle">Add Ticket</div>
            <button type="button" class="modal-close" onclick="closeTicketModal();">×</button>
        </div>

        <div class="modal-body">

            <div class="modal-field">
                <label>Movie Name</label>
                <asp:TextBox ID="txtModalMovie" runat="server" ClientIDMode="Static" placeholder="e.g. Inception" />
                <asp:RequiredFieldValidator ID="rfvMovie" runat="server"
                    ControlToValidate="txtModalMovie"
                    ErrorMessage="Movie name is required."
                    CssClass="error-msg" Display="Dynamic"
                    ValidationGroup="TicketGroup" />
            </div>

            <div class="modal-field">
                <label>Venue</label>
                <asp:TextBox ID="txtModalVenue" runat="server" ClientIDMode="Static" placeholder="e.g. Cinepolis, Rajkot" />
                <asp:RequiredFieldValidator ID="rfvVenue" runat="server"
                    ControlToValidate="txtModalVenue"
                    ErrorMessage="Venue is required."
                    CssClass="error-msg" Display="Dynamic"
                    ValidationGroup="TicketGroup" />
            </div>

            <div class="modal-field">
                <label>Ticket ID</label>
                <asp:TextBox ID="txtModalTicketId" runat="server" ClientIDMode="Static" placeholder="e.g. CP94821039" />
                <asp:RequiredFieldValidator ID="rfvTicketId" runat="server"
                    ControlToValidate="txtModalTicketId"
                    ErrorMessage="Ticket ID is required."
                    CssClass="error-msg" Display="Dynamic"
                    ValidationGroup="TicketGroup" />
            </div>

            <div class="modal-field">
                <label>Seats</label>
                <asp:TextBox ID="txtModalSeats" runat="server" ClientIDMode="Static" placeholder="e.g. E7, E8" />
                <asp:RequiredFieldValidator ID="rfvSeats" runat="server"
                    ControlToValidate="txtModalSeats"
                    ErrorMessage="Seats are required."
                    CssClass="error-msg" Display="Dynamic"
                    ValidationGroup="TicketGroup" />
            </div>

            <div class="modal-field">
                <label>Status</label>
                <asp:DropDownList ID="ddlModalStatus" runat="server" ClientIDMode="Static">
                    <asp:ListItem Value="Confirmed">Confirmed</asp:ListItem>
                    <asp:ListItem Value="Past">Past</asp:ListItem>
                </asp:DropDownList>
            </div>

        </div>

        <div class="modal-footer">
            <button type="button" class="modal-cancel" onclick="closeTicketModal();">Cancel</button>
            <asp:Button ID="btnSaveTicket" runat="server" ClientIDMode="Static"
                CssClass="modal-save" Text="Save Ticket"
                OnClick="btnSaveTicket_Click" ValidationGroup="TicketGroup" />
        </div>

    </div>
</div>

</asp:Content>