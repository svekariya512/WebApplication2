<%@ Page Title="Tickets" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Tickets.aspx.cs" Inherits="WebApplication2.Tickets" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style>

        /* =========================================
           MAIN PAGE
        ========================================= */

        .tickets-page {
            width: 100%;
            min-height: 100vh;
            background: #111111;
            color: #eeeeee;
            font-family: Arial, Helvetica, sans-serif;
            padding: 25px 35px 40px 35px;
        }


        /* =========================================
           TOP BAR
        ========================================= */

        .tickets-topbar {
            width: 100%;
            display: flex;
            justify-content: flex-end;
            align-items: center;
            margin-bottom: 28px;
        }


        /* =========================================
           ADD TICKET BUTTON
        ========================================= */

        .add-ticket-btn {
            border: none;
            background: #ffb6b1;
            color: #181818;
            padding: 11px 17px;
            border-radius: 6px;
            font-size: 11px;
            cursor: pointer;
            font-weight: 600;
            box-shadow: 0 4px 12px rgba(255, 150, 145, 0.12);
            transition: 0.2s;
        }

        .add-ticket-btn:hover {
            background: #ffc7c3;
            transform: translateY(-1px);
        }


        /* =========================================
           STAT CARDS
        ========================================= */

        .ticket-stats {
            display: flex;
            gap: 15px;
            margin-bottom: 20px;
        }

        .stat-card {
            width: 180px;
            height: 130px;
            background: #202020;
            border: 1px solid #292929;
            border-radius: 11px;
            padding: 16px;
            position: relative;
            overflow: hidden;
        }

        .stat-card:first-child::after {
            content: "";
            position: absolute;
            width: 90px;
            height: 90px;
            right: -30px;
            top: -20px;
            background: rgba(151, 81, 73, 0.10);
            border-radius: 50%;
            filter: blur(16px);
        }

        .stat-card.upcoming-card::after {
            content: "";
            position: absolute;
            width: 90px;
            height: 90px;
            right: -25px;
            top: -15px;
            background: rgba(58, 128, 145, 0.10);
            border-radius: 50%;
            filter: blur(16px);
        }

        .stat-label {
            color: #8d8d8d;
            font-size: 9px;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        .stat-number {
            margin-top: 10px;
            font-size: 28px;
            color: #eeeeee;
            font-weight: 300;
        }

        .stat-growth {
            margin-top: 12px;
            font-size: 11px;
            color: #46b85a;
        }

        .stat-next {
            margin-top: 12px;
            font-size: 11px;
            color: #9b9b9b;
            line-height: 16px;
        }


        /* =========================================
           TICKET CONTAINER
        ========================================= */

        .ticket-container {
            width: 100%;
            background: #1c1c1c;
            border: 1px solid #292929;
            border-radius: 10px;
            overflow: hidden;
        }


        /* =========================================
           TOOLBAR
        ========================================= */

        .ticket-toolbar {
            height: 55px;
            background: #292929;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0 18px;
        }

        .ticket-tabs {
            display: flex;
            gap: 3px;
        }

        .ticket-tab {
            border: none;
            background: transparent;
            color: #999999;
            padding: 8px 15px;
            border-radius: 4px;
            cursor: pointer;
            font-size: 11px;
            transition: 0.2s;
        }

        .ticket-tab:hover {
            color: #ffffff;
        }

        .ticket-tab.active {
            background: #3a3a3a;
            color: #ffffff;
        }


        /* =========================================
           SEARCH
        ========================================= */

        .search-wrapper {
            position: relative;
        }

        .ticket-search {
            width: 200px;
            height: 30px;
            background: #1c1c1c;
            border: 1px solid #404040;
            border-radius: 5px;
            color: white;
            outline: none;
            padding: 0 12px 0 30px;
            font-size: 10px;
        }

        .ticket-search::placeholder {
            color: #777777;
        }

        .search-icon {
            position: absolute;
            left: 10px;
            top: 8px;
            color: #858585;
            font-size: 12px;
            pointer-events: none;
        }


        /* =========================================
           TABLE HEADER
        ========================================= */

        .ticket-table-header {
            display: grid;
            grid-template-columns: 2.2fr .75fr .65fr .55fr .9fr .55fr;
            align-items: center;
            min-height: 45px;
            padding: 0 20px;
            border-bottom: 1px solid #292929;
            color: #909090;
            font-size: 10px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }


        /* =========================================
           TICKET ROW
        ========================================= */

        .ticket-row {
            display: grid;
            grid-template-columns: 2.2fr .75fr .65fr .55fr .9fr .55fr;
            align-items: center;
            min-height: 85px;
            padding: 0 20px;
            border-bottom: 1px solid #292929;
            transition: 0.2s;
        }

        .ticket-row:hover {
            background: #222222;
        }


        /* =========================================
           MOVIE
        ========================================= */

        .movie-info {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .movie-image {
            width: 36px;
            height: 48px;
            object-fit: cover;
            border-radius: 3px;
            background: #252525;
        }

        .movie-name {
            color: #eeeeee;
            font-size: 12px;
            margin-bottom: 5px;
            font-weight: 500;
        }

        .venue-name {
            color: #929292;
            font-size: 10px;
        }


        /* =========================================
           STATUS
        ========================================= */

        .status {
            display: inline-block;
            padding: 5px 10px;
            border-radius: 12px;
            font-size: 10px;
        }

        .status.confirmed {
            color: #4ac15a;
            background: rgba(53, 164, 66, .13);
        }

        .status.past {
            color: #858585;
            background: #292929;
        }


        /* =========================================
           DATE
        ========================================= */

        .ticket-date {
            color: #dddddd;
            font-size: 11px;
            line-height: 17px;
        }

        .ticket-date span {
            color: #8d8d8d;
        }


        /* =========================================
           SEATS
        ========================================= */

        .seat-list {
            display: flex;
            flex-direction: column;
            gap: 4px;
        }

        .seat {
            width: 26px;
            padding: 3px 0;
            text-align: center;
            background: #303030;
            color: #c8c8c8;
            font-size: 9px;
            border-radius: 3px;
        }


        /* =========================================
           TICKET ID
        ========================================= */

        .ticket-id {
            color: #cccccc;
            font-size: 10px;
        }


        /* =========================================
           ACTIONS
        ========================================= */

        .actions {
            display: flex;
            gap: 12px;
            align-items: center;
        }

        .action-btn {
            width: 18px;
            height: 18px;
            padding: 0;
            border: none;
            background: transparent;
            color: #8d8d8d;
            cursor: pointer;
            display: flex;
            align-items: center;
            justify-content: center;
            transition: 0.2s;
        }

        .action-btn svg {
            width: 14px;
            height: 14px;
            fill: none;
            stroke: currentColor;
            stroke-width: 1.8;
            stroke-linecap: round;
            stroke-linejoin: round;
        }

        .action-btn:hover {
            color: #ffffff;
            transform: scale(1.08);
        }

        .delete-btn:hover {
            color: #ff7777;
        }


        /* =========================================
           MODAL
        ========================================= */

        .ticket-modal-overlay {
            display: none;
            position: fixed;
            inset: 0;
            z-index: 9999;
            background: rgba(0, 0, 0, 0.72);
            align-items: center;
            justify-content: center;
        }

        .ticket-modal-overlay.show {
            display: flex;
        }

        .ticket-modal {
            width: 430px;
            max-width: calc(100% - 30px);
            background: #242424;
            border: 1px solid #3a3a3a;
            border-radius: 9px;
            box-shadow: 0 25px 70px rgba(0,0,0,.65);
            overflow: hidden;
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

        .modal-title {
            color: #ffffff;
            font-size: 14px;
            font-weight: 500;
        }

        .modal-close {
            border: none;
            background: transparent;
            color: #999999;
            font-size: 20px;
            cursor: pointer;
        }

        .modal-close:hover {
            color: #ffffff;
        }

        .modal-body {
            padding: 20px;
        }

        .modal-field {
            margin-bottom: 14px;
        }

        .modal-field label {
            display: block;
            color: #858585;
            font-size: 9px;
            text-transform: uppercase;
            letter-spacing: .5px;
            margin-bottom: 6px;
        }

        .modal-field input,
        .modal-field select {
            width: 100%;
            height: 35px;
            background: #181818;
            border: 1px solid #3b3b3b;
            border-radius: 4px;
            color: #eeeeee;
            padding: 0 10px;
            outline: none;
            font-size: 11px;
        }

        .modal-field input:focus,
        .modal-field select:focus {
            border-color: #777777;
        }

        .modal-footer {
            display: flex;
            justify-content: flex-end;
            gap: 8px;
            padding: 15px 20px;
            background: #202020;
            border-top: 1px solid #333333;
        }

        .modal-cancel,
        .modal-save {
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

        .modal-cancel:hover {
            color: #ffffff;
            background: #303030;
        }

        .modal-save {
            background: #ffb6b1;
            border: 1px solid #ffb6b1;
            color: #181818;
            font-weight: 600;
        }

        .modal-save:hover {
            background: #ffc7c3;
        }


        /* =========================================
           DELETE CONFIRM MODAL
        ========================================= */

        .delete-modal {
            width: 350px;
        }

        .delete-message {
            color: #aaaaaa;
            font-size: 11px;
            line-height: 18px;
        }

        .delete-ticket-id {
            color: #eeeeee;
            font-weight: 600;
        }

        .delete-confirm-btn {
            height: 32px;
            padding: 0 16px;
            border: none;
            border-radius: 4px;
            background: #ff5b5b;
            color: white;
            font-size: 10px;
            cursor: pointer;
        }

        .delete-confirm-btn:hover {
            background: #e94949;
        }


        /* =========================================
           FOOTER
        ========================================= */

        .ticket-footer {
            min-height: 45px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 20px;
            color: #858585;
            font-size: 10px;
        }

        .footer-info {
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .footer-right {
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .page-arrow {
            border: none;
            background: transparent;
            color: #aaaaaa;
            cursor: pointer;
            font-size: 18px;
        }

        .page-arrow:hover {
            color: white;
        }


        /* =========================================
           EMPTY MESSAGE
        ========================================= */

        .empty-ticket-message {
            display: none;
            text-align: center;
            padding: 45px 20px;
            color: #777777;
            font-size: 11px;
        }


        /* =========================================
           DYNAMIC HEADER HAMBURGER
        ========================================= */

        .home-hamburger {
            display: flex;
            flex-direction: column;
            justify-content: center;
            gap: 4px;
            width: 24px;
            height: 24px;
            cursor: pointer;
            flex-shrink: 0;
        }

        .home-hamburger span {
            display: block;
            width: 20px;
            height: 2px;
            background: #FFC3B9;
            border-radius: 2px;
            transition: 0.2s;
        }

        .home-hamburger:hover span {
            background: #ffb0a3;
        }


        /* =========================================
           RESPONSIVE
        ========================================= */

        @media screen and (max-width: 900px) {

            .tickets-page {
                padding: 20px 15px 40px 15px;
            }

            .ticket-table-header,
            .ticket-row {
                grid-template-columns: 2fr .7fr .7fr .6fr .9fr .6fr;
            }
        }

        @media screen and (max-width: 700px) {

            .ticket-container {
                overflow-x: auto;
            }

            .ticket-toolbar,
            .ticket-table-header,
            .ticket-row,
            .ticket-footer {
                min-width: 800px;
            }

            .ticket-modal {
                width: 350px;
            }
        }

    </style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <!-- =========================================
         HEADER
    ========================================= -->

    <script>

        document.addEventListener("DOMContentLoaded", function () {

            /* Show hamburger */
            var hamburger = document.getElementById("mainHamburger");

            if (hamburger) {
                hamburger.style.display = "flex";
            }


            /* Add My Tickets title */
            var header = document.querySelector(".cine-header");
            var searchArea = document.querySelector(".header-search-area");

            if (header && searchArea) {

                if (!document.getElementById("ticketsHeaderTitle")) {

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
            }

        });

    </script>


    <!-- =========================================
         MAIN PAGE
    ========================================= -->

    <div class="tickets-page">


        <!-- TOP BAR -->

        <div class="tickets-topbar">

            <button type="button"
                    class="add-ticket-btn"
                    onclick="openAddTicket();">

                ✚ &nbsp; Add Ticket

            </button>

        </div>


        <!-- =========================================
             STATISTICS
        ========================================= -->

        <div class="ticket-stats">

            <div class="stat-card">

                <div class="stat-label">
                    Total Bookings
                </div>

                <div class="stat-number"
                     id="totalBookings">
                    42
                </div>

                <div class="stat-growth">
                    ↗ +12% this month
                </div>

            </div>


            <div class="stat-card upcoming-card">

                <div class="stat-label">
                    Upcoming
                </div>

                <div class="stat-number"
                     id="upcomingBookings">
                    2
                </div>

                <div class="stat-next">
                    ♧ Next: Today 6:00<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;PM
                </div>

            </div>

        </div>


        <!-- =========================================
             TICKET TABLE
        ========================================= -->

        <div class="ticket-container">


            <!-- TOOLBAR -->

            <div class="ticket-toolbar">

                <div class="ticket-tabs">

                    <button type="button"
                            class="ticket-tab active"
                            onclick="showTickets('all', this);">

                        All Tickets

                    </button>

                    <button type="button"
                            class="ticket-tab"
                            onclick="showTickets('upcoming', this);">

                        Upcoming

                    </button>

                    <button type="button"
                            class="ticket-tab"
                            onclick="showTickets('past', this);">

                        Past

                    </button>

                </div>


                <div class="search-wrapper">

                    <span class="search-icon">
                        ⌕
                    </span>

                    <input type="text"
                           id="ticketSearch"
                           class="ticket-search"
                           placeholder="Search by Movie or ID..."
                           onkeyup="searchTickets();" />

                </div>

            </div>


            <!-- TABLE HEADER -->

            <div class="ticket-table-header">

                <div>
                    Movie / Venue
                </div>

                <div>
                    Status
                </div>

                <div>
                    Date &amp; Time
                </div>

                <div>
                    Seats
                </div>

                <div>
                    Ticket ID
                </div>

                <div>
                    Actions
                </div>

            </div>


            <!-- =========================================
                 TICKET 1
            ========================================= -->

            <div class="ticket-row"
                 data-status="upcoming"
                 data-search="spider man brand new day CP94821039">

                <div class="movie-info">

                    <img src="images/spiderman.jpg"
                         class="movie-image"
                         onerror="this.style.background='#171717'; this.removeAttribute('src');" />

                    <div>

                        <div class="movie-name">
                            Spider-Man: Brand New Day
                        </div>

                        <div class="venue-name">
                            ♧ CINEPOLISH, Rajkot
                        </div>

                    </div>

                </div>


                <div>
                    <span class="status confirmed">
                        ● Confirmed
                    </span>
                </div>


                <div class="ticket-date">
                    Today,<br />
                    14 Aug<br />
                    <span>06:00 PM</span>
                </div>


                <div class="seat-list">
                    <span class="seat">E7</span>
                    <span class="seat">E8</span>
                </div>


                <div class="ticket-id">
                    CP94821039
                </div>


                <div class="actions">


                    <!-- VIEW -->

                    <button type="button"
                            class="action-btn"
                            title="View Ticket"
                            onclick="viewTicket(this);">

                        <svg viewBox="0 0 24 24">
                            <path d="M2.5 12s3.5-5 9.5-5 9.5 5 9.5 5-3.5 5-9.5 5-9.5-5-9.5-5z"></path>
                            <circle cx="12" cy="12" r="2.5"></circle>
                        </svg>

                    </button>


                    <!-- EDIT -->

                    <button type="button"
                            class="action-btn"
                            title="Edit Ticket"
                            onclick="editTicket(this);">

                        <svg viewBox="0 0 24 24">
                            <path d="M4 20h4L19 9l-4-4L4 16v4z"></path>
                            <path d="M13.5 6.5l4 4"></path>
                        </svg>

                    </button>


                    <!-- DELETE -->

                    <button type="button"
                            class="action-btn delete-btn"
                            title="Delete Ticket"
                            onclick="deleteTicket(this);">

                        <svg viewBox="0 0 24 24">
                            <path d="M4 7h16"></path>
                            <path d="M9 7V4h6v3"></path>
                            <path d="M6 7l1 13h10l1-13"></path>
                            <path d="M10 11v5"></path>
                            <path d="M14 11v5"></path>
                        </svg>

                    </button>


                </div>

            </div>


            <!-- =========================================
                 TICKET 2
            ========================================= -->

            <div class="ticket-row"
                 data-status="upcoming"
                 data-search="jhamkudi CP94821040">

                <div class="movie-info">

                    <img src="images/jhamkudi.jpg"
                         class="movie-image"
                         onerror="this.style.background='#171717'; this.removeAttribute('src');" />

                    <div>

                        <div class="movie-name">
                            Jhamkudi
                        </div>

                        <div class="venue-name">
                            ♧ Cinepolis: Alpha One, Ahmedabad
                        </div>

                    </div>

                </div>


                <div>
                    <span class="status confirmed">
                        ● Confirmed
                    </span>
                </div>


                <div class="ticket-date">
                    Today,<br />
                    14 Aug<br />
                    <span>06:00 PM</span>
                </div>


                <div class="seat-list">
                    <span class="seat">E7</span>
                    <span class="seat">E8</span>
                </div>


                <div class="ticket-id">
                    CP94821040
                </div>


                <div class="actions">


                    <button type="button"
                            class="action-btn"
                            title="View Ticket"
                            onclick="viewTicket(this);">

                        <svg viewBox="0 0 24 24">
                            <path d="M2.5 12s3.5-5 9.5-5 9.5 5 9.5 5-3.5 5-9.5 5-9.5-5-9.5-5z"></path>
                            <circle cx="12" cy="12" r="2.5"></circle>
                        </svg>

                    </button>


                    <button type="button"
                            class="action-btn"
                            title="Edit Ticket"
                            onclick="editTicket(this);">

                        <svg viewBox="0 0 24 24">
                            <path d="M4 20h4L19 9l-4-4L4 16v4z"></path>
                            <path d="M13.5 6.5l4 4"></path>
                        </svg>

                    </button>


                    <button type="button"
                            class="action-btn delete-btn"
                            title="Delete Ticket"
                            onclick="deleteTicket(this);">

                        <svg viewBox="0 0 24 24">
                            <path d="M4 7h16"></path>
                            <path d="M9 7V4h6v3"></path>
                            <path d="M6 7l1 13h10l1-13"></path>
                            <path d="M10 11v5"></path>
                            <path d="M14 11v5"></path>
                        </svg>

                    </button>


                </div>

            </div>


            <!-- =========================================
                 TICKET 3
            ========================================= -->

            <div class="ticket-row"
                 data-status="past"
                 data-search="cocktail 2 CP82013945">

                <div class="movie-info">

                    <img src="images/cocktail2.jpg"
                         class="movie-image"
                         onerror="this.style.background='#171717'; this.removeAttribute('src');" />

                    <div>

                        <div class="movie-name">
                            Cocktail 2
                        </div>

                        <div class="venue-name">
                            ♧ Cosmoplex, Rajkot
                        </div>

                    </div>

                </div>


                <div>
                    <span class="status past">
                        Past
                    </span>
                </div>


                <div class="ticket-date">
                    Aug<br />
                    12, 2023<br />
                    <span>07:30 PM</span>
                </div>


                <div class="seat-list">
                    <span class="seat">A4</span>
                    <span class="seat">A5</span>
                </div>


                <div class="ticket-id">
                    CP82013945
                </div>


                <div class="actions">


                    <button type="button"
                            class="action-btn"
                            title="View Ticket"
                            onclick="viewTicket(this);">

                        <svg viewBox="0 0 24 24">
                            <path d="M2.5 12s3.5-5 9.5-5 9.5 5 9.5 5-3.5 5-9.5 5-9.5-5-9.5-5z"></path>
                            <circle cx="12" cy="12" r="2.5"></circle>
                        </svg>

                    </button>


                    <button type="button"
                            class="action-btn"
                            title="Edit Ticket"
                            onclick="editTicket(this);">

                        <svg viewBox="0 0 24 24">
                            <path d="M4 20h4L19 9l-4-4L4 16v4z"></path>
                            <path d="M13.5 6.5l4 4"></path>
                        </svg>

                    </button>


                    <button type="button"
                            class="action-btn delete-btn"
                            title="Delete Ticket"
                            onclick="deleteTicket(this);">

                        <svg viewBox="0 0 24 24">
                            <path d="M4 7h16"></path>
                            <path d="M9 7V4h6v3"></path>
                            <path d="M6 7l1 13h10l1-13"></path>
                            <path d="M10 11v5"></path>
                            <path d="M14 11v5"></path>
                        </svg>

                    </button>


                </div>

            </div>


            <!-- =========================================
                 TICKET 4
            ========================================= -->

            <div class="ticket-row"
                 data-status="past"
                 data-search="dune part two CP67420188">

                <div class="movie-info">

                    <img src="images/dune.jpg"
                         class="movie-image"
                         onerror="this.style.background='#171717'; this.removeAttribute('src');" />

                    <div>

                        <div class="movie-name">
                            Dune: Part Two
                        </div>

                        <div class="venue-name">
                            ♧ PVR: Acropolis, Rajkot
                        </div>

                    </div>

                </div>


                <div>
                    <span class="status past">
                        Past
                    </span>
                </div>


                <div class="ticket-date">
                    Mar<br />
                    10, 2024<br />
                    <span>04:15 PM</span>
                </div>


                <div class="seat-list">
                    <span class="seat">J12</span>
                    <span class="seat">J13</span>
                </div>


                <div class="ticket-id">
                    CP67420188
                </div>


                <div class="actions">


                    <button type="button"
                            class="action-btn"
                            title="View Ticket"
                            onclick="viewTicket(this);">

                        <svg viewBox="0 0 24 24">
                            <path d="M2.5 12s3.5-5 9.5-5 9.5 5 9.5 5-3.5 5-9.5 5-9.5-5-9.5-5z"></path>
                            <circle cx="12" cy="12" r="2.5"></circle>
                        </svg>

                    </button>


                    <button type="button"
                            class="action-btn"
                            title="Edit Ticket"
                            onclick="editTicket(this);">

                        <svg viewBox="0 0 24 24">
                            <path d="M4 20h4L19 9l-4-4L4 16v4z"></path>
                            <path d="M13.5 6.5l4 4"></path>
                        </svg>

                    </button>


                    <button type="button"
                            class="action-btn delete-btn"
                            title="Delete Ticket"
                            onclick="deleteTicket(this);">

                        <svg viewBox="0 0 24 24">
                            <path d="M4 7h16"></path>
                            <path d="M9 7V4h6v3"></path>
                            <path d="M6 7l1 13h10l1-13"></path>
                            <path d="M10 11v5"></path>
                            <path d="M14 11v5"></path>
                        </svg>

                    </button>


                </div>

            </div>


            <!-- EMPTY MESSAGE -->

            <div id="emptyTicketMessage"
                 class="empty-ticket-message">

                No tickets found.

            </div>


            <!-- =========================================
                 FOOTER
            ========================================= -->

            <div class="ticket-footer">

                <div class="footer-info">

                    <span>
                        ♧ Scan QR code for entry
                    </span>

                    <span>
                        ↓ Download PDF tickets from actions menu
                    </span>

                </div>


                <div class="footer-right">

                    <span id="showingText">
                        Showing 1-4 of 42
                    </span>

                    <button type="button"
                            class="page-arrow"
                            onclick="previousPage();">

                        ‹

                    </button>

                    <button type="button"
                            class="page-arrow"
                            onclick="nextPage();">

                        ›

                    </button>

                </div>

            </div>


        </div>

    </div>


    <!-- =========================================
         VIEW / EDIT MODAL
    ========================================= -->

    <div id="ticketModal"
         class="ticket-modal-overlay">

        <div class="ticket-modal">


            <div class="modal-header">

                <div id="modalTitle"
                     class="modal-title">

                    Ticket Details

                </div>

                <button type="button"
                        class="modal-close"
                        onclick="closeTicketModal();">

                    ×

                </button>

            </div>


            <div class="modal-body">


                <div class="modal-field">

                    <label>
                        Movie
                    </label>

                    <input type="text"
                           id="modalMovie" />

                </div>


                <div class="modal-field">

                    <label>
                        Venue
                    </label>

                    <input type="text"
                           id="modalVenue" />

                </div>


                <div class="modal-field">

                    <label>
                        Ticket ID
                    </label>

                    <input type="text"
                           id="modalTicketId"
                           readonly />

                </div>


                <div class="modal-field">

                    <label>
                        Status
                    </label>

                    <select id="modalStatus">

                        <option value="upcoming">
                            Confirmed
                        </option>

                        <option value="past">
                            Past
                        </option>

                    </select>

                </div>


            </div>


            <div class="modal-footer">

                <button type="button"
                        class="modal-cancel"
                        onclick="closeTicketModal();">

                    Cancel

                </button>


                <button type="button"
                        id="modalSaveButton"
                        class="modal-save"
                        onclick="saveTicketChanges();">

                    Save Changes

                </button>

            </div>


        </div>

    </div>


    <!-- =========================================
         DELETE MODAL
    ========================================= -->

    <div id="deleteModal"
         class="ticket-modal-overlay">

        <div class="ticket-modal delete-modal">


            <div class="modal-header">

                <div class="modal-title">
                    Delete Ticket
                </div>

                <button type="button"
                        class="modal-close"
                        onclick="closeDeleteModal();">

                    ×

                </button>

            </div>


            <div class="modal-body">

                <div class="delete-message">

                    Are you sure you want to delete ticket

                    <span id="deleteTicketId"
                          class="delete-ticket-id">
                    </span>

                    ?

                    <br /><br />

                    This ticket will be removed from the list.

                </div>

            </div>


            <div class="modal-footer">

                <button type="button"
                        class="modal-cancel"
                        onclick="closeDeleteModal();">

                    Cancel

                </button>


                <button type="button"
                        class="delete-confirm-btn"
                        onclick="confirmDelete();">

                    Delete

                </button>

            </div>


        </div>

    </div>


    <!-- =========================================
         JAVASCRIPT
    ========================================= -->

    <script type="text/javascript">

        var editingRow = null;
        var deletingRow = null;
        var currentFilter = "all";


        /* =========================================
           ADD TICKET
        ========================================= */

        function openAddTicket() {

            document.getElementById("modalTitle").innerText = "Add Ticket";

            document.getElementById("modalMovie").value = "";
            document.getElementById("modalVenue").value = "";
            document.getElementById("modalTicketId").value =
                "CP" + Math.floor(10000000 + Math.random() * 89999999);

            document.getElementById("modalStatus").value = "upcoming";

            editingRow = null;

            document.getElementById("modalSaveButton").innerText =
                "Add Ticket";

            document.getElementById("ticketModal").classList.add("show");

        }


        /* =========================================
           VIEW TICKET
        ========================================= */

        function viewTicket(button) {

            var row = button.closest(".ticket-row");

            if (!row) {
                return;
            }

            var movie =
                row.querySelector(".movie-name").innerText;

            var venue =
                row.querySelector(".venue-name").innerText;

            var ticketId =
                row.querySelector(".ticket-id").innerText;

            var statusElement =
                row.querySelector(".status");

            var statusText =
                statusElement ? statusElement.innerText : "Confirmed";

            document.getElementById("modalTitle").innerText =
                "Ticket Details";

            document.getElementById("modalMovie").value =
                movie;

            document.getElementById("modalVenue").value =
                venue.replace("♧ ", "");

            document.getElementById("modalTicketId").value =
                ticketId;

            document.getElementById("modalStatus").value =
                statusText.toLowerCase().indexOf("past") !== -1
                    ? "past"
                    : "upcoming";

            editingRow = null;

            document.getElementById("modalMovie").readOnly = true;
            document.getElementById("modalVenue").readOnly = true;
            document.getElementById("modalStatus").disabled = true;

            document.getElementById("modalSaveButton").style.display =
                "none";

            document.getElementById("ticketModal").classList.add("show");

        }


        /* =========================================
           EDIT TICKET
        ========================================= */

        function editTicket(button) {

            var row = button.closest(".ticket-row");

            if (!row) {
                return;
            }

            editingRow = row;

            var movie =
                row.querySelector(".movie-name").innerText;

            var venue =
                row.querySelector(".venue-name").innerText;

            var ticketId =
                row.querySelector(".ticket-id").innerText;

            var statusElement =
                row.querySelector(".status");

            var statusText =
                statusElement ? statusElement.innerText : "Confirmed";

            document.getElementById("modalTitle").innerText =
                "Edit Ticket";

            document.getElementById("modalMovie").value =
                movie;

            document.getElementById("modalVenue").value =
                venue.replace("♧ ", "");

            document.getElementById("modalTicketId").value =
                ticketId;

            document.getElementById("modalStatus").value =
                statusText.toLowerCase().indexOf("past") !== -1
                    ? "past"
                    : "upcoming";

            document.getElementById("modalMovie").readOnly = false;
            document.getElementById("modalVenue").readOnly = false;
            document.getElementById("modalStatus").disabled = false;

            document.getElementById("modalSaveButton").innerText =
                "Save Changes";

            document.getElementById("modalSaveButton").style.display =
                "block";

            document.getElementById("ticketModal").classList.add("show");

        }


        /* =========================================
           SAVE EDIT / ADD
        ========================================= */

        function saveTicketChanges() {

            var movie =
                document.getElementById("modalMovie").value.trim();

            var venue =
                document.getElementById("modalVenue").value.trim();

            var ticketId =
                document.getElementById("modalTicketId").value.trim();

            var status =
                document.getElementById("modalStatus").value;

            if (movie === "") {

                alert("Please enter movie name.");
                return;

            }

            if (venue === "") {

                alert("Please enter venue.");
                return;

            }


            /* =====================================
               EDIT EXISTING TICKET
            ===================================== */

            if (editingRow) {

                editingRow.querySelector(".movie-name").innerText =
                    movie;

                editingRow.querySelector(".venue-name").innerText =
                    "♧ " + venue;


                editingRow.setAttribute(
                    "data-search",
                    (
                        movie +
                        " " +
                        venue +
                        " " +
                        ticketId
                    ).toLowerCase()
                );


                editingRow.setAttribute(
                    "data-status",
                    status
                );


                var statusElement =
                    editingRow.querySelector(".status");


                if (status === "past") {

                    statusElement.className =
                        "status past";

                    statusElement.innerText =
                        "Past";

                }
                else {

                    statusElement.className =
                        "status confirmed";

                    statusElement.innerText =
                        "● Confirmed";

                }


                alert("Ticket updated successfully.");

            }


            /* =====================================
               ADD NEW TICKET
            ===================================== */

            else {

                createNewTicket(
                    movie,
                    venue,
                    ticketId,
                    status
                );

                alert("Ticket added successfully.");

            }


            closeTicketModal();

            updateTicketCounts();

            applyCurrentFilter();

        }


        /* =========================================
           CREATE NEW TICKET
        ========================================= */

        function createNewTicket(
            movie,
            venue,
            ticketId,
            status
        ) {

            var container =
                document.querySelector(".ticket-container");

            var footer =
                document.querySelector(".ticket-footer");

            var row =
                document.createElement("div");

            row.className =
                "ticket-row";

            row.setAttribute(
                "data-status",
                status
            );

            row.setAttribute(
                "data-search",
                (
                    movie +
                    " " +
                    venue +
                    " " +
                    ticketId
                ).toLowerCase()
            );


            row.innerHTML =

                '<div class="movie-info">' +

                '<div class="movie-image"></div>' +

                '<div>' +

                '<div class="movie-name">' +
                escapeHtml(movie) +
                '</div>' +

                '<div class="venue-name">' +
                '♧ ' + escapeHtml(venue) +
                '</div>' +

                '</div>' +

                '</div>' +


                '<div>' +

                (
                    status === "past"
                        ? '<span class="status past">Past</span>'
                        : '<span class="status confirmed">● Confirmed</span>'
                ) +

                '</div>' +


                '<div class="ticket-date">' +
                'Today,<br />' +
                '14 Aug<br />' +
                '<span>06:00 PM</span>' +
                '</div>' +


                '<div class="seat-list">' +
                '<span class="seat">E7</span>' +
                '<span class="seat">E8</span>' +
                '</div>' +


                '<div class="ticket-id">' +
                escapeHtml(ticketId) +
                '</div>' +


                '<div class="actions">' +

                '<button type="button" class="action-btn" title="View Ticket" onclick="viewTicket(this);">' +

                '<svg viewBox="0 0 24 24">' +
                '<path d="M2.5 12s3.5-5 9.5-5 9.5 5 9.5 5-3.5 5-9.5 5-9.5-5-9.5-5z"></path>' +
                '<circle cx="12" cy="12" r="2.5"></circle>' +
                '</svg>' +

                '</button>' +


                '<button type="button" class="action-btn" title="Edit Ticket" onclick="editTicket(this);">' +

                '<svg viewBox="0 0 24 24">' +
                '<path d="M4 20h4L19 9l-4-4L4 16v4z"></path>' +
                '<path d="M13.5 6.5l4 4"></path>' +
                '</svg>' +

                '</button>' +


                '<button type="button" class="action-btn delete-btn" title="Delete Ticket" onclick="deleteTicket(this);">' +

                '<svg viewBox="0 0 24 24">' +
                '<path d="M4 7h16"></path>' +
                '<path d="M9 7V4h6v3"></path>' +
                '<path d="M6 7l1 13h10l1-13"></path>' +
                '<path d="M10 11v5"></path>' +
                '<path d="M14 11v5"></path>' +
                '</svg>' +

                '</button>' +

                '</div>';


            container.insertBefore(row, footer);

        }


        /* =========================================
           DELETE TICKET
        ========================================= */

        function deleteTicket(button) {

            var row =
                button.closest(".ticket-row");

            if (!row) {
                return;
            }

            deletingRow = row;

            var ticketId =
                row.querySelector(".ticket-id").innerText;

            document.getElementById("deleteTicketId").innerText =
                ticketId;

            document.getElementById("deleteModal")
                .classList.add("show");

        }


        /* =========================================
           CONFIRM DELETE
        ========================================= */

        function confirmDelete() {

            if (!deletingRow) {
                return;
            }

            deletingRow.remove();

            deletingRow = null;

            closeDeleteModal();

            updateTicketCounts();

            applyCurrentFilter();

            alert("Ticket deleted successfully.");

        }


        /* =========================================
           CLOSE DELETE MODAL
        ========================================= */

        function closeDeleteModal() {

            document.getElementById("deleteModal")
                .classList.remove("show");

            deletingRow = null;

        }


        /* =========================================
           CLOSE TICKET MODAL
        ========================================= */

        function closeTicketModal() {

            document.getElementById("ticketModal")
                .classList.remove("show");

            editingRow = null;

            document.getElementById("modalMovie").readOnly = false;
            document.getElementById("modalVenue").readOnly = false;
            document.getElementById("modalStatus").disabled = false;

            document.getElementById("modalSaveButton").style.display =
                "block";

        }


        /* =========================================
           TABS
        ========================================= */

        function showTickets(type, button) {

            currentFilter = type;

            document.querySelectorAll(".ticket-tab")
                .forEach(function (tab) {

                    tab.classList.remove("active");

                });

            button.classList.add("active");

            applyCurrentFilter();

        }


        /* =========================================
           APPLY FILTER
        ========================================= */

        function applyCurrentFilter() {

            var searchValue =
                document.getElementById("ticketSearch")
                    .value
                    .toLowerCase()
                    .trim();


            var rows =
                document.querySelectorAll(".ticket-row");


            var visibleCount = 0;


            rows.forEach(function (row) {

                var status =
                    row.getAttribute("data-status");

                var searchText =
                    row.getAttribute("data-search") || "";


                var filterMatch =
                    currentFilter === "all" ||
                    status === currentFilter;


                var searchMatch =
                    searchValue === "" ||
                    searchText.indexOf(searchValue) !== -1;


                if (filterMatch && searchMatch) {

                    row.style.display = "grid";

                    visibleCount++;

                }
                else {

                    row.style.display = "none";

                }

            });


            var emptyMessage =
                document.getElementById(
                    "emptyTicketMessage"
                );


            if (visibleCount === 0) {

                emptyMessage.style.display =
                    "block";

            }
            else {

                emptyMessage.style.display =
                    "none";

            }


            updateShowingText(visibleCount);

        }


        /* =========================================
           SEARCH
        ========================================= */

        function searchTickets() {

            applyCurrentFilter();

        }


        /* =========================================
           UPDATE COUNTS
        ========================================= */

        function updateTicketCounts() {

            var rows =
                document.querySelectorAll(".ticket-row");


            var upcoming = 0;


            rows.forEach(function (row) {

                if (
                    row.getAttribute("data-status")
                    === "upcoming"
                ) {

                    upcoming++;

                }

            });


            document.getElementById(
                "totalBookings"
            ).innerText = rows.length;


            document.getElementById(
                "upcomingBookings"
            ).innerText = upcoming;

        }


        /* =========================================
           SHOWING TEXT
        ========================================= */

        function updateShowingText(count) {

            var totalRows =
                document.querySelectorAll(".ticket-row").length;


            var text =
                document.getElementById("showingText");


            if (count === 0) {

                text.innerText =
                    "Showing 0 of " + totalRows;

            }
            else {

                text.innerText =
                    "Showing 1-" +
                    count +
                    " of " +
                    totalRows;

            }

        }


        /* =========================================
           PAGINATION
        ========================================= */

        function previousPage() {

            alert("You are already on the first page.");

        }


        function nextPage() {

            alert("Next page is not available yet.");

        }


        /* =========================================
           ESCAPE HTML
        ========================================= */

        function escapeHtml(text) {

            var div =
                document.createElement("div");

            div.innerText = text;

            return div.innerHTML;

        }


        /* =========================================
           CLOSE MODAL WHEN CLICK OUTSIDE
        ========================================= */

        document.addEventListener(
            "click",
            function (event) {

                var ticketModal =
                    document.getElementById(
                        "ticketModal"
                    );

                var deleteModal =
                    document.getElementById(
                        "deleteModal"
                    );


                if (
                    event.target === ticketModal
                ) {

                    closeTicketModal();

                }


                if (
                    event.target === deleteModal
                ) {

                    closeDeleteModal();

                }

            }
        );


        /* =========================================
           ESC KEY CLOSE
        ========================================= */

        document.addEventListener(
            "keydown",
            function (event) {

                if (event.key === "Escape") {

                    closeTicketModal();
                    closeDeleteModal();

                }

            }
        );

    </script>


</asp:Content>