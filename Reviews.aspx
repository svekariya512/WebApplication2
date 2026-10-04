<%@ Page Title="Reviews" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="WebApplication2.Reviews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .reviews-page {
            width: 100%;
            padding: 25px 35px 50px 35px;
            background: #111111;
            min-height: 100vh;
        }

        /* Page subtitle only (title now in header) */
        .page-subtitle {
            color: #888888;
            font-size: 12px;
            margin-bottom: 20px;
        }

        .export-btn {
            background: #ffc107;
            color: #111;
            border: none;
            padding: 9px 18px;
            border-radius: 4px;
            font-size: 11px;
            font-weight: 600;
            cursor: pointer;
            float: right;
            margin-top: -45px;
            transition: 0.2s;
        }
        .export-btn:hover { background: #e0a800; }

        /* STATS */
        .stats-row {
            display: grid;
            grid-template-columns: repeat(4, 1fr);
            gap: 15px;
            margin-bottom: 25px;
            clear: both;
        }
        .stat-card {
            background: #151515;
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
        }
        .stat-change {
            font-size: 11px;
            color: #4ade80;
            margin-top: 5px;
        }
        .stat-icon {
            position: absolute;
            top: 18px;
            right: 18px;
            font-size: 16px;
        }

        /* CARD */
        .card {
            width: 100%;
            background: #151515;
            border: 1px solid #2a2a2a;
            border-radius: 8px;
            overflow: hidden;
            margin-bottom: 30px;
        }

        .filter-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 15px 20px;
            border-bottom: 1px solid #2a2a2a;
        }

        .filter-tabs { display: flex; gap: 8px; }

        .filter-tab {
            padding: 6px 14px;
            background: #1E1E1E;
            border: 1px solid #2a2a2a;
            border-radius: 5px;
            color: #cccccc;
            font-size: 11px;
            cursor: pointer;
            transition: 0.2s;
        }
        .filter-tab:hover { background: #252525; }
        .filter-tab.active {
            background: #2a2a2a;
            border-color: #FFC3B9;
            color: #FFC3B9;
        }

        /* TABLE */
        .data-table {
            width: 100%;
            border-collapse: collapse;
        }
        .data-table thead th {
            height: 45px;
            background: #111111;
            border-top: 1px solid #252525;
            border-bottom: 1px solid #252525;
            color: #888888;
            font-size: 10px;
            font-weight: normal;
            text-align: left;
            padding: 0 20px;
            text-transform: uppercase;
            letter-spacing: 0.5px;
        }
        .data-table tbody td {
            padding: 16px 20px;
            border-bottom: 1px solid #202020;
            color: #cccccc;
            font-size: 11px;
            vertical-align: middle;
        }
        .data-table tbody tr:last-child td { border-bottom: none; }
        .data-table tbody tr:hover { background: #1a1a1a; }

        /* USER CELL */
        .user-cell { display: flex; align-items: center; gap: 10px; }
        .user-avatar {
            width: 34px;
            height: 34px;
            border-radius: 50%;
            background: #2a2a2a;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #FFC3B9;
            font-size: 12px;
            font-weight: 600;
        }
        .user-name { color: #ffffff; font-size: 12px; font-weight: 500; }
        .user-email { color: #777777; font-size: 10px; }

        /* STARS */
        .stars { color: #ffc107; font-size: 13px; letter-spacing: 1px; }

        /* STATUS BADGES */
        .status-badge {
            display: inline-block;
            padding: 4px 10px;
            border-radius: 4px;
            font-size: 10px;
            font-weight: 500;
            letter-spacing: 0.5px;
        }
        .status-pending { background: rgba(250, 204, 21, 0.15); color: #facc15; }
        .status-approved { background: rgba(74, 222, 128, 0.15); color: #4ade80; }
        .status-flagged { background: rgba(255, 107, 107, 0.15); color: #ff6b6b; }

        /* ACTION ICONS */
        .action-icons { display: flex; gap: 8px; }
        .action-icon {
            width: 28px;
            height: 28px;
            border-radius: 4px;
            border: 1px solid #333;
            background: transparent;
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            color: #cccccc;
            transition: 0.2s;
        }
        .action-icon.view { border-color: #3b82f6; color: #3b82f6; }
        .action-icon.view:hover { background: rgba(59, 130, 246, 0.15); }
        .action-icon.approve { border-color: #4ade80; color: #4ade80; }
        .action-icon.approve:hover { background: rgba(74, 222, 128, 0.15); }
        .action-icon.delete { border-color: #ff6b6b; color: #ff6b6b; }
        .action-icon.delete:hover { background: rgba(255, 107, 107, 0.15); }

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

        /* RESPONSIVE */
        @media screen and (max-width: 1000px) {
            .stats-row { grid-template-columns: repeat(2, 1fr); }
            .export-btn { float: none; margin-top: 10px; }
        }
        @media screen and (max-width: 700px) {
            .reviews-page { padding: 20px 15px 40px 15px; }
            .stats-row { grid-template-columns: 1fr; }
            .filter-bar { flex-direction: column; gap: 10px; align-items: stretch; }
            .data-table { overflow-x: auto; display: block; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- JAVASCRIPT: Show hamburger + Inject "Review Management" title in header -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {

            // 1. Show hamburger menu
            var hamburger = document.getElementById("mainHamburger");
            if (hamburger) {
                hamburger.style.display = "flex";
            }

            // 2. Inject "Review Management" title into header
            var header = document.querySelector(".cine-header");
            var searchArea = document.querySelector(".header-search-area");

            if (header && searchArea) {
                var titleEl = document.createElement("div");
                titleEl.innerText = "Review Management";
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

    <div class="reviews-page">

        <!-- PAGE SUBTITLE (title now in header) -->
        <p class="page-subtitle">Monitor, moderate, and manage user reviews across the platform.</p>

        <button class="export-btn">Export Report</button>


        <!-- STATS -->
        <div class="stats-row">
            <div class="stat-card">
                <div class="stat-label">Avg Rating</div>
                <div class="stat-value">4.5</div>
                <div class="stat-change">↗ +0.2 this week</div>
                <div class="stat-icon">⭐</div>
            </div>
            <div class="stat-card">
                <div class="stat-label">Total Reviews</div>
                <div class="stat-value">12k</div>
                <div class="stat-change">+340 since yesterday</div>
                <div class="stat-icon">📝</div>
            </div>
            <div class="stat-card">
                <div class="stat-label">Pending</div>
                <div class="stat-value">42</div>
                <div class="stat-change" style="color:#facc15;">Requires moderation</div>
                <div class="stat-icon">⏳</div>
            </div>
            <div class="stat-card">
                <div class="stat-label">Flagged</div>
                <div class="stat-value">28</div>
                <div class="stat-change" style="color:#ff6b6b;">High priority review</div>
                <div class="stat-icon">🚩</div>
            </div>
        </div>


        <!-- REVIEWS TABLE -->
        <div class="card">
            <div class="filter-bar">
                <div class="filter-tabs">
                    <button class="filter-tab">All</button>
                    <button class="filter-tab">Pending</button>
                    <button class="filter-tab">Approved</button>
                    <button class="filter-tab">Flagged</button>
                </div>
                <div style="display:flex; gap:10px; align-items:center;">
                    <button class="filter-tab">⚡ Bulk Actions</button>
                    <input type="text" placeholder="Search reviews..." style="background:#1E1E1E; border:1px solid #2a2a2a; border-radius:5px; padding:7px 14px; color:#fff; font-size:11px; outline:none;" />
                </div>
            </div>

            <table class="data-table">
                <thead>
                    <tr>
                        <th>User</th>
                        <th>Movie</th>
                        <th>Rating</th>
                        <th>Review</th>
                        <th>Date</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>
                            <div class="user-cell">
                                <div class="user-avatar">JD</div>
                                <div>
                                    <div class="user-name">John Doe</div>
                                    <div class="user-email">john.doe@example.com</div>
                                </div>
                            </div>
                        </td>
                        <td>Dune: Part Two</td>
                        <td><span class="stars">★★★★☆</span></td>
                        <td>"Incredible visuals, but the pacing..."</td>
                        <td>2h ago</td>
                        <td><span class="status-badge status-pending">Pending</span></td>
                        <td>
                            <div class="action-icons">
                                <button class="action-icon view">👁</button>
                                <button class="action-icon approve">✓</button>
                                <button class="action-icon delete">✕</button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="user-cell">
                                <div class="user-avatar">CP</div>
                                <div>
                                    <div class="user-name">CyberPunk99</div>
                                    <div class="user-email">user_892</div>
                                </div>
                            </div>
                        </td>
                        <td>Blade Runner 2049</td>
                        <td><span class="stars">★★★★★</span></td>
                        <td>"This movie is garbage and..."</td>
                        <td>5h ago</td>
                        <td><span class="status-badge status-flagged">Flagged</span></td>
                        <td>
                            <div class="action-icons">
                                <button class="action-icon view">👁</button>
                                <button class="action-icon approve">✓</button>
                                <button class="action-icon delete">✕</button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="user-cell">
                                <div class="user-avatar">MS</div>
                                <div>
                                    <div class="user-name">MovieSnob</div>
                                    <div class="user-email">Pro_Snob</div>
                                </div>
                            </div>
                        </td>
                        <td>Oppenheimer</td>
                        <td><span class="stars">★★★★★</span></td>
                        <td>"Nolan delivers a masterpiece..."</td>
                        <td>Oct 24, 2023</td>
                        <td><span class="status-badge status-approved">Approved</span></td>
                        <td>
                            <div class="action-icons">
                                <button class="action-icon view">👁</button>
                                <button class="action-icon approve">✓</button>
                                <button class="action-icon delete">✕</button>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="user-cell">
                                <div class="user-avatar">AL</div>
                                <div>
                                    <div class="user-name">Alice L.</div>
                                    <div class="user-email">alice_l@gmail.com</div>
                                </div>
                            </div>
                        </td>
                        <td>The Matrix</td>
                        <td><span class="stars">★★★★☆</span></td>
                        <td>"Classic, but the effects are..."</td>
                        <td>1d ago</td>
                        <td><span class="status-badge status-pending">Pending</span></td>
                        <td>
                            <div class="action-icons">
                                <button class="action-icon view">👁</button>
                                <button class="action-icon approve">✓</button>
                                <button class="action-icon delete">✕</button>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>

    </div>
</asp:Content>