<%@ Page Title="Notifications" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .notif-page {
            width: 100%;
            min-height: calc(100vh - 82px);
            background: #111111;
            padding: 25px 35px 40px 35px;
            color: #ffffff;
        }

        .notif-subtitle {
            color: #888888;
            font-size: 12px;
            margin-bottom: 22px;
        }

        /* STATS */
        .notif-stats {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 14px;
            margin-bottom: 26px;
        }

        .notif-stat-card {
            background: #171717;
            border: 1px solid #292929;
            border-radius: 8px;
            padding: 18px 20px;
            position: relative;
        }

        .notif-stat-label {
            color: #888888;
            font-size: 10px;
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 10px;
        }

        .notif-stat-value {
            color: #ffffff;
            font-size: 24px;
            font-weight: 600;
        }

        .notif-stat-icon {
            position: absolute;
            top: 16px; right: 18px;
            font-size: 16px;
            color: #FFC3B9;
        }

        /* MAIN CARD */
        .notif-card {
            width: 100%;
            background: #171717;
            border: 1px solid #292929;
            border-radius: 8px;
            overflow: hidden;
        }

        .notif-card-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 18px 22px;
            border-bottom: 1px solid #252525;
            flex-wrap: wrap;
            gap: 12px;
        }

        .notif-card-title {
            color: #ffffff;
            font-size: 15px;
            font-weight: 500;
        }

        .notif-actions {
            display: flex;
            gap: 10px;
            align-items: center;
        }

        .notif-search {
            background: #1E1E1E;
            border: 1px solid #2f2f2f;
            border-radius: 5px;
            padding: 8px 12px;
            color: #eeeeee;
            font-size: 11px;
            outline: none;
            width: 240px;
        }
        .notif-search::placeholder { color: #666666; }
        .notif-search:focus { border-color: #FFC3B9; }

        /* LIST */
        .notif-list { padding: 8px 0; }

        .notif-item {
            display: grid;
            grid-template-columns: 45px 1fr auto auto;
            align-items: center;
            gap: 15px;
            padding: 16px 22px;
            border-bottom: 1px solid #1f1f1f;
            transition: 0.2s;
        }

        .notif-item:hover { background: #1c1c1c; }
        .notif-item:last-child { border-bottom: none; }

        .notif-item-icon {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
            flex-shrink: 0;
        }

        .notif-item-icon.ticket {
            background: rgba(255, 195, 185, 0.15);
            color: #FFC3B9;
        }
        .notif-item-icon.alert {
            background: rgba(255, 95, 95, 0.15);
            color: #ff5f5f;
        }
        .notif-item-icon.success {
            background: rgba(74, 222, 128, 0.15);
            color: #4ade80;
        }
        .notif-item-icon.info {
            background: rgba(96, 165, 250, 0.15);
            color: #60a5fa;
        }

        .notif-item-content { min-width: 0; }

        .notif-item-title {
            color: #ffffff;
            font-size: 13px;
            font-weight: 500;
            margin-bottom: 4px;
        }

        .notif-item-message {
            color: #888888;
            font-size: 11px;
            line-height: 16px;
        }

        .notif-item-time {
            color: #666666;
            font-size: 10px;
            white-space: nowrap;
        }

        .notif-item-actions { display: flex; gap: 8px; }

        .notif-action-btn {
            background: transparent;
            border: 1px solid #333333;
            border-radius: 4px;
            color: #999999;
            font-size: 12px;
            width: 28px;
            height: 28px;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            transition: 0.2s;
        }

        .notif-action-btn:hover {
            color: #ffffff;
            border-color: #555555;
        }

        .notif-action-btn.delete:hover {
            color: #ff5f5f;
            border-color: #ff5f5f;
        }

        /* DYNAMIC HAMBURGER */
        .home-hamburger {
            display: flex; flex-direction: column; justify-content: center;
            gap: 4px; width: 24px; height: 24px;
            cursor: pointer; flex-shrink: 0;
        }
        .home-hamburger span {
            display: block; width: 20px; height: 2px;
            background: #FFC3B9; border-radius: 2px;
        }

        @media screen and (max-width: 900px) {
            .notif-stats { grid-template-columns: repeat(2, 1fr); }
            .notif-item { grid-template-columns: 45px 1fr; }
            .notif-item-time, .notif-item-actions { grid-column: span 2; }
        }

        @media screen and (max-width: 600px) {
            .notif-page { padding: 20px 15px; }
            .notif-stats { grid-template-columns: 1fr; }
            .notif-card-header { flex-direction: column; align-items: stretch; }
            .notif-search { width: 100%; }
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- JAVASCRIPT: Show hamburger + Inject "Notifications" title in header -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var hamburger = document.getElementById("mainHamburger");
            if (hamburger) { hamburger.style.display = "flex"; }

            var header = document.querySelector(".cine-header");
            var searchArea = document.querySelector(".header-search-area");

            if (header && searchArea) {
                var oldTitle = document.getElementById("notifHeaderTitle");
                if (!oldTitle) {
                    var titleEl = document.createElement("div");
                    titleEl.id = "notifHeaderTitle";
                    titleEl.innerText = "Notifications";
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

    <div class="notif-page">

        <p class="notif-subtitle">
            Stay updated with new ticket bookings, alerts, and system messages.
        </p>


        <!-- STATS -->
        <div class="notif-stats">

            <div class="notif-stat-card">
                <div class="notif-stat-label">New Tickets</div>
                <div class="notif-stat-value">24</div>
                <div class="notif-stat-icon">🎟</div>
            </div>

            <div class="notif-stat-card">
                <div class="notif-stat-label">Unread</div>
                <div class="notif-stat-value">12</div>
                <div class="notif-stat-icon">📩</div>
            </div>

            <div class="notif-stat-card">
                <div class="notif-stat-label">Today</div>
                <div class="notif-stat-value">8</div>
                <div class="notif-stat-icon">📅</div>
            </div>

            <div class="notif-stat-card">
                <div class="notif-stat-label">Total</div>
                <div class="notif-stat-value">142</div>
                <div class="notif-stat-icon">📊</div>
            </div>

        </div>


        <!-- NOTIFICATION LIST CARD -->
        <div class="notif-card">

            <div class="notif-card-header">
                <div class="notif-card-title">Recent Notifications</div>
                <div class="notif-actions">
                    <input type="text" class="notif-search" placeholder="Search notifications..." />
                </div>
            </div>


            <!-- NOTIFICATION ITEMS -->
            <div class="notif-list" id="notifList">

                <!-- ITEM 1 -->
                <div class="notif-item">
                    <div class="notif-item-icon ticket">🎟</div>
                    <div class="notif-item-content">
                        <div class="notif-item-title">New Ticket Booked</div>
                        <div class="notif-item-message">
                            Rahul Sharma booked 2 tickets for "Jhamkudi" at Cinépolis Alpha One.
                        </div>
                    </div>
                    <div class="notif-item-time">2 min ago</div>
                    <div class="notif-item-actions">
                        <button type="button" class="notif-action-btn" title="Mark Read">✓</button>
                        <button type="button" class="notif-action-btn delete" title="Delete">✕</button>
                    </div>
                </div>


                <!-- ITEM 2 -->
                <div class="notif-item">
                    <div class="notif-item-icon ticket">🎟</div>
                    <div class="notif-item-content">
                        <div class="notif-item-title">New Ticket Booked</div>
                        <div class="notif-item-message">
                            Priya Patel booked 2 tickets for "Deadpool & Wolverine" at PVR Acropolis.
                        </div>
                    </div>
                    <div class="notif-item-time">18 min ago</div>
                    <div class="notif-item-actions">
                        <button type="button" class="notif-action-btn" title="Mark Read">✓</button>
                        <button type="button" class="notif-action-btn delete" title="Delete">✕</button>
                    </div>
                </div>


                <!-- ITEM 3 -->
                <div class="notif-item">
                    <div class="notif-item-icon success">✓</div>
                    <div class="notif-item-content">
                        <div class="notif-item-title">Payment Successful</div>
                        <div class="notif-item-message">
                            Payment of Rs. 700 received for booking CP90481239.
                        </div>
                    </div>
                    <div class="notif-item-time">1 hour ago</div>
                    <div class="notif-item-actions">
                        <button type="button" class="notif-action-btn" title="Mark Read">✓</button>
                        <button type="button" class="notif-action-btn delete" title="Delete">✕</button>
                    </div>
                </div>


                <!-- ITEM 4 -->
                <div class="notif-item">
                    <div class="notif-item-icon alert">⚠</div>
                    <div class="notif-item-content">
                        <div class="notif-item-title">Payment Pending</div>
                        <div class="notif-item-message">
                            Booking CP90481240 is pending payment confirmation for over 24 hours.
                        </div>
                    </div>
                    <div class="notif-item-time">3 hours ago</div>
                    <div class="notif-item-actions">
                        <button type="button" class="notif-action-btn" title="Mark Read">✓</button>
                        <button type="button" class="notif-action-btn delete" title="Delete">✕</button>
                    </div>
                </div>


                <!-- ITEM 5 -->
                <div class="notif-item">
                    <div class="notif-item-icon info">ℹ</div>
                    <div class="notif-item-content">
                        <div class="notif-item-title">New Review Submitted</div>
                        <div class="notif-item-message">
                            John Doe submitted a 4-star review for "Dune: Part Two".
                        </div>
                    </div>
                    <div class="notif-item-time">5 hours ago</div>
                    <div class="notif-item-actions">
                        <button type="button" class="notif-action-btn" title="Mark Read">✓</button>
                        <button type="button" class="notif-action-btn delete" title="Delete">✕</button>
                    </div>
                </div>

            </div>

        </div>

    </div>

</asp:Content>