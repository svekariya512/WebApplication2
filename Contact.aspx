<%@ Page Title="Contact Management" Language="C#" MasterPageFile="~/Site1.master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebApplication2.Contact" %>

<asp:Content ID="ContactHead" ContentPlaceHolderID="head" runat="server">
    <style>
        /* =========================================
           CONTACT MANAGEMENT PAGE
        ========================================= */
        .contact-page {
            width: 100%;
            min-height: calc(100vh - 82px);
            background: #111111;
            color: #ffffff;
            padding: 25px 35px 40px 35px;
        }

        /* =========================================
           PAGE HEADER (Filter button only, title moved to header)
        ========================================= */
        .contact-page-header {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-bottom: 25px;
        }

        /* Page subtitle only */
        .contact-subtitle {
            margin: 0;
            color: #888888;
            font-size: 12px;
        }

        /* =========================================
           FILTER BUTTON
        ========================================= */
        .contact-filter-button {
            height: 34px;
            min-width: 70px;
            padding: 0 14px;
            background: #ff2029;
            color: #ffffff;
            border: none;
            border-radius: 3px;
            font-size: 11px;
            cursor: pointer;
            transition: 0.2s;
            font-weight: 500;
        }
        .contact-filter-button:hover { background: #e91820; }

        .filter-icon { margin-right: 5px; font-size: 9px; }

        /* =========================================
           STATISTICS
        ========================================= */
        .contact-stat-grid {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 12px;
            margin-bottom: 26px;
        }

        .contact-stat-card {
            min-height: 85px;
            background: #151515;
            border: 1px solid #292929;
            border-radius: 5px;
            padding: 16px 15px;
        }

        .contact-stat-title {
            color: #888888;
            font-size: 9px;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 10px;
        }

        .contact-stat-bottom {
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .contact-stat-number {
            color: #dddddd;
            font-size: 20px;
            font-weight: 600;
        }
        .contact-stat-number.red { color: #ff252d; }
        .contact-stat-number.white { color: #eeeeee; }

        .contact-stat-change {
            font-size: 9px;
            padding: 4px 8px;
            border-radius: 3px;
        }
        .contact-stat-change.green {
            color: #00d879;
            background: #08271d;
        }
        .contact-stat-change.red {
            color: #ff3b42;
            background: #301316;
        }

        .contact-stat-circle {
            width: 16px;
            height: 16px;
            border: 1px solid #454545;
            border-radius: 50%;
            position: relative;
        }
        .contact-stat-circle:after {
            content: "";
            position: absolute;
            width: 4px;
            height: 4px;
            border-right: 1px solid #666666;
            border-bottom: 1px solid #666666;
            right: 3px;
            bottom: 4px;
            transform: rotate(45deg);
        }

        /* =========================================
           CONTACT TABLE CARD
        ========================================= */
        .contact-table-card {
            width: 100%;
            background: #141414;
            border: 1px solid #292929;
            border-radius: 5px;
            overflow: hidden;
        }

        .contact-table-head {
            display: grid;
            grid-template-columns:
                45px
                minmax(130px, 1.05fr)
                minmax(150px, 1.15fr)
                minmax(120px, 0.95fr)
                minmax(220px, 1.7fr)
                70px;
            align-items: center;
            min-height: 48px;
            background: #111111;
            border-bottom: 1px solid #292929;
            padding: 0 15px;
            color: #8b8b8b;
            font-size: 10px;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        .contact-row {
            display: grid;
            grid-template-columns:
                45px
                minmax(130px, 1.05fr)
                minmax(150px, 1.15fr)
                minmax(120px, 0.95fr)
                minmax(220px, 1.7fr)
                70px;
            align-items: center;
            min-height: 65px;
            padding: 0 15px;
            border-bottom: 1px solid #252525;
            background: #141414;
            color: #d9d9d9;
            font-size: 11px;
        }
        .contact-row:last-child { border-bottom: none; }
        .contact-row:hover { background: #191919; }

        .contact-number { color: #999999; font-size: 11px; }

        .contact-user {
            display: flex;
            align-items: center;
            gap: 8px;
            min-width: 0;
        }

        .contact-avatar {
            width: 26px;
            height: 26px;
            min-width: 26px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            background: #333333;
            color: #aaaaaa;
            font-size: 9px;
            font-weight: 600;
        }
        .contact-avatar.red {
            background: #e91c2a;
            color: #ffffff;
        }

        .contact-user-name {
            color: #dcdcdc;
            line-height: 14px;
            font-size: 11px;
        }

        .contact-email {
            color: #aaaaaa;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }

        .contact-subject {
            display: inline-flex;
            width: fit-content;
            max-width: 110px;
            padding: 5px 10px;
            background: #1c1c1c;
            border: 1px solid #282828;
            border-radius: 3px;
            color: #d5d5d5;
            font-size: 10px;
            line-height: 12px;
        }
        .contact-subject.booking {
            color: #ff333b;
            background: #241416;
            border-color: #4a2023;
        }

        .contact-message {
            color: #aaaaaa;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
            padding-right: 15px;
        }

        .contact-date {
            color: #aaaaaa;
            line-height: 14px;
            font-size: 10px;
        }

        /* =========================================
           TABLE FOOTER
        ========================================= */
        .contact-table-footer {
            min-height: 48px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 15px;
            border-top: 1px solid #292929;
            background: #111111;
        }

        .contact-entry-count {
            color: #8b8b8b;
            font-size: 10px;
        }

        .contact-pagination {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .contact-page-button {
            width: 26px;
            height: 26px;
            display: flex;
            align-items: center;
            justify-content: center;
            background: transparent;
            border: 1px solid #333333;
            border-radius: 3px;
            color: #aaaaaa;
            font-size: 11px;
            cursor: pointer;
            transition: 0.2s;
        }
        .contact-page-button:hover {
            background: #292929;
            color: #ffffff;
        }
        .contact-page-button.active {
            background: #ff2029;
            border-color: #ff2029;
            color: #ffffff;
        }

        .contact-page-dots {
            color: #777777;
            font-size: 11px;
            padding: 0 3px;
        }

        /* =========================================
           FILTER POPUP
        ========================================= */
        .contact-filter-panel {
            display: none;
            position: absolute;
            right: 35px;
            top: 130px;
            width: 200px;
            background: #202020;
            border: 1px solid #363636;
            border-radius: 5px;
            padding: 14px;
            z-index: 50;
            box-shadow: 0 15px 40px rgba(0,0,0,0.5);
        }
        .contact-filter-panel.show { display: block; }

        .contact-filter-panel label {
            display: block;
            color: #999999;
            font-size: 10px;
            margin-bottom: 6px;
        }

        .contact-filter-panel select {
            width: 100%;
            height: 32px;
            background: #141414;
            border: 1px solid #3a3a3a;
            color: #eeeeee;
            border-radius: 3px;
            padding: 0 8px;
            font-size: 11px;
            outline: none;
        }

        /* DYNAMIC HAMBURGER */
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
        .home-hamburger:hover span { background: #ffb0a3; }

        /* =========================================
           RESPONSIVE
        ========================================= */
        @media screen and (max-width: 1100px) {
            .contact-stat-grid { grid-template-columns: repeat(2, 1fr); }
            .contact-table-card { overflow-x: auto; }
            .contact-table-head, .contact-row { min-width: 900px; }
        }

        @media screen and (max-width: 700px) {
            .contact-page { padding: 20px 15px 30px 15px; }
            .contact-stat-grid { grid-template-columns: 1fr; }
            .contact-filter-panel { right: 15px; }
        }
    </style>
</asp:Content>


<asp:Content ID="ContactContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- JAVASCRIPT: Show hamburger + Inject "Contact Management" title in header -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {

            // 1. Show hamburger menu
            var hamburger = document.getElementById("mainHamburger");
            if (hamburger) {
                hamburger.style.display = "flex";
            }

            // 2. Inject "Contact Management" title into header
            var header = document.querySelector(".cine-header");
            var searchArea = document.querySelector(".header-search-area");

            if (header && searchArea) {
                var titleEl = document.createElement("div");
                titleEl.innerText = "Contact Management";
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
    </script>

    <div class="contact-page">

        <!-- =====================================
             PAGE HEADER (subtitle + filter)
        ====================================== -->
        <div class="contact-page-header">

            <p class="contact-subtitle">
                Manage and respond to customer inquiries and support requests.
            </p>

            <button type="button" class="contact-filter-button" onclick="toggleContactFilter();">
                <span class="filter-icon">▼</span>
                Filter
            </button>

        </div>


        <!-- =====================================
             FILTER PANEL
        ====================================== -->
        <div id="contactFilterPanel" class="contact-filter-panel">
            <label>Message Status</label>
            <select onchange="filterContacts(this.value);">
                <option value="all">All Messages</option>
                <option value="unread">Unread</option>
                <option value="read">Read</option>
            </select>
        </div>


        <!-- =====================================
             STATISTICS
        ====================================== -->
        <div class="contact-stat-grid">

            <div class="contact-stat-card">
                <div class="contact-stat-title">Total Inquiries</div>
                <div class="contact-stat-bottom">
                    <div class="contact-stat-number">2,845</div>
                    <div class="contact-stat-change green">↑ 12%</div>
                </div>
            </div>

            <div class="contact-stat-card">
                <div class="contact-stat-title">Unread Messages</div>
                <div class="contact-stat-bottom">
                    <div class="contact-stat-number red">42</div>
                    <div class="contact-stat-change red">↓ 5%</div>
                </div>
            </div>

            <div class="contact-stat-card">
                <div class="contact-stat-title">Avg. Response Time</div>
                <div class="contact-stat-bottom">
                    <div class="contact-stat-number white">1.2h</div>
                    <div class="contact-stat-change green">↓ 8%</div>
                </div>
            </div>

            <div class="contact-stat-card">
                <div class="contact-stat-title">Resolution Rate</div>
                <div class="contact-stat-bottom">
                    <div class="contact-stat-number white">94%</div>
                    <div class="contact-stat-circle"></div>
                </div>
            </div>

        </div>


        <!-- =====================================
             CONTACT TABLE
        ====================================== -->
        <div class="contact-table-card">

            <div class="contact-table-head">
                <div>#</div>
                <div>Full Name</div>
                <div>Email Address</div>
                <div>Subject</div>
                <div>Message Snippet</div>
                <div>Date</div>
            </div>

            <!-- ROW 01 -->
            <div class="contact-row" data-status="unread">
                <div class="contact-number">01</div>
                <div class="contact-user">
                    <div class="contact-avatar red">JJ</div>
                    <div class="contact-user-name">Jaldhara<br />Jadav</div>
                </div>
                <div class="contact-email">j.jaldhara@example.com</div>
                <div><span class="contact-subject">General<br />Inquiry</span></div>
                <div class="contact-message">How can we help you today?</div>
                <div class="contact-date">2026-<br />08-09</div>
            </div>

            <!-- ROW 02 -->
            <div class="contact-row" data-status="unread">
                <div class="contact-number">02</div>
                <div class="contact-user">
                    <div class="contact-avatar">RK</div>
                    <div class="contact-user-name">Rajesh<br />Kumar</div>
                </div>
                <div class="contact-email">rajesh@gmail.com</div>
                <div><span class="contact-subject booking">Booking<br />Issue</span></div>
                <div class="contact-message">My tickets didn't get confirmed.</div>
                <div class="contact-date">2026-<br />08-08</div>
            </div>

            <!-- ROW 03 -->
            <div class="contact-row" data-status="read">
                <div class="contact-number">03</div>
                <div class="contact-user">
                    <div class="contact-avatar red">PS</div>
                    <div class="contact-user-name">Priya<br />Sharma</div>
                </div>
                <div class="contact-email">priya@gmail.com</div>
                <div><span class="contact-subject">Group<br />Booking</span></div>
                <div class="contact-message">Interested in booking for 20 people.</div>
                <div class="contact-date">2026-<br />08-07</div>
            </div>

            <!-- ROW 04 -->
            <div class="contact-row" data-status="read">
                <div class="contact-number">04</div>
                <div class="contact-user">
                    <div class="contact-avatar">AP</div>
                    <div class="contact-user-name">Amit<br />Patel</div>
                </div>
                <div class="contact-email">amit@gmail.com</div>
                <div><span class="contact-subject">Private<br />Screening</span></div>
                <div class="contact-message">Can we book a private screening?</div>
                <div class="contact-date">2026-<br />08-06</div>
            </div>

            <!-- FOOTER -->
            <div class="contact-table-footer">
                <div class="contact-entry-count">Showing 1 to 4 of 2,845 entries</div>
                <div class="contact-pagination">
                    <button type="button" class="contact-page-button">‹</button>
                    <button type="button" class="contact-page-button active">1</button>
                    <button type="button" class="contact-page-button">2</button>
                    <button type="button" class="contact-page-button">3</button>
                    <span class="contact-page-dots">...</span>
                    <button type="button" class="contact-page-button">›</button>
                </div>
            </div>

        </div>

    </div>


    <!-- =========================================
         JAVASCRIPT
    ========================================= -->
    <script type="text/javascript">

        function toggleContactFilter() {
            var panel = document.getElementById("contactFilterPanel");
            if (panel.classList.contains("show")) {
                panel.classList.remove("show");
            } else {
                panel.classList.add("show");
            }
        }

        function filterContacts(status) {
            var rows = document.querySelectorAll(".contact-row");
            for (var i = 0; i < rows.length; i++) {
                var rowStatus = rows[i].getAttribute("data-status");
                if (status === "all" || status === rowStatus) {
                    rows[i].style.display = "grid";
                } else {
                    rows[i].style.display = "none";
                }
            }
        }

        document.addEventListener("click", function (event) {
            var panel = document.getElementById("contactFilterPanel");
            var button = document.querySelector(".contact-filter-button");
            if (!panel.contains(event.target) && !button.contains(event.target)) {
                panel.classList.remove("show");
            }
        });

    </script>

</asp:Content>