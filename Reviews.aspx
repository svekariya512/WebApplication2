<%@ Page Title="Reviews" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Reviews.aspx.cs" Inherits="WebApplication2.Reviews" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
    .reviews-page {
        width: 100%;
        padding: 25px 35px 50px 35px;
        background: #111111;
        min-height: 100vh;
    }

    .page-subtitle {
        color: #888888;
        font-size: 12px;
        margin-bottom: 20px;
    }

    /* STATS */
    .stats-row {
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        gap: 15px;
        margin-bottom: 25px;
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
        flex-wrap: wrap;
        gap: 12px;
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
        text-decoration: none;
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
        background: #ff4d4d;
        display: flex;
        align-items: center;
        justify-content: center;
        color: #ffffff;
        font-size: 11px;
        font-weight: 600;
    }
    .user-name { color: #ffffff; font-size: 12px; font-weight: 500; }
    .user-email { color: #777777; font-size: 10px; }

    /* STARS */
    .stars { color: #ffc107; font-size: 13px; letter-spacing: 1px; }

    /* STATUS */
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

    /* ACTIONS */
    .action-icons {
        display: flex;
        gap: 8px;
        align-items: center;
    }

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
        text-decoration: none;
        padding: 0;
    }

    .action-icon svg {
        width: 14px;
        height: 14px;
        stroke: currentColor;
        fill: none;
        stroke-width: 2;
        stroke-linecap: round;
        stroke-linejoin: round;
    }

    .action-icon.view {
        border-color: #3b82f6;
        color: #3b82f6;
    }
    .action-icon.view:hover { background: rgba(59, 130, 246, 0.15); }

    .action-icon.approve {
        border-color: #4ade80;
        color: #4ade80;
    }
    .action-icon.approve:hover { background: rgba(74, 222, 128, 0.15); }

    .action-icon.delete {
        border-color: #ff6b6b;
        color: #ff6b6b;
    }
    .action-icon.delete:hover { background: rgba(255, 107, 107, 0.15); }

    /* MODAL */
    .review-modal-overlay {
        display: none;
        position: fixed;
        inset: 0;
        z-index: 9999;
        background: rgba(0,0,0,0.75);
        align-items: center;
        justify-content: center;
        padding: 20px;
    }
    .review-modal-overlay.show { display: flex; }

    .review-modal {
        width: 500px;
        max-width: 100%;
        background: #1c1c1c;
        border: 1px solid #383838;
        border-radius: 9px;
        overflow: hidden;
        box-shadow: 0 25px 70px rgba(0,0,0,0.7);
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
        color: #FFC3B9;
        font-size: 14px;
        font-weight: 600;
    }

    .modal-close {
        border: none;
        background: transparent;
        color: #999;
        font-size: 22px;
        cursor: pointer;
        padding: 0;
    }
    .modal-close:hover { color: #fff; }

    .modal-body { padding: 22px; }

    .modal-row {
        display: grid;
        grid-template-columns: 120px 1fr;
        gap: 12px;
        margin-bottom: 15px;
        align-items: start;
    }

    .modal-label {
        color: #888;
        font-size: 10px;
        text-transform: uppercase;
        letter-spacing: 0.5px;
        padding-top: 3px;
    }

    .modal-value {
        color: #eee;
        font-size: 12px;
        line-height: 18px;
    }

    .modal-value.stars {
        color: #ffc107;
        font-size: 14px;
        letter-spacing: 2px;
    }

    .modal-review-text {
        background: #111;
        border: 1px solid #2a2a2a;
        border-radius: 5px;
        padding: 12px 15px;
        color: #ccc;
        font-size: 12px;
        line-height: 18px;
        font-style: italic;
    }

    .modal-footer {
        padding: 15px 20px;
        background: #202020;
        border-top: 1px solid #333;
        display: flex;
        justify-content: flex-end;
        gap: 10px;
    }

    .btn-modal-approve {
        background: #4ade80;
        color: #0d1c12;
        border: none;
        border-radius: 5px;
        padding: 9px 18px;
        font-size: 11px;
        font-weight: 600;
        cursor: pointer;
        transition: 0.2s;
    }
    .btn-modal-approve:hover { background: #3bc96e; }

    .btn-modal-close {
        background: transparent;
        color: #ccc;
        border: 1px solid #444;
        border-radius: 5px;
        padding: 9px 18px;
        font-size: 11px;
        cursor: pointer;
        transition: 0.2s;
    }
    .btn-modal-close:hover { background: #2a2a2a; color: #fff; }

    @media screen and (max-width: 1000px) {
        .stats-row { grid-template-columns: repeat(2, 1fr); }
    }
    @media screen and (max-width: 700px) {
        .reviews-page { padding: 20px 15px 40px 15px; }
        .stats-row { grid-template-columns: 1fr; }
        .filter-bar { flex-direction: column; gap: 10px; align-items: stretch; }
        .modal-row { grid-template-columns: 1fr; gap: 5px; }
    }
</style>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var hamburger = document.getElementById("mainHamburger");
            if (hamburger) { hamburger.style.display = "flex"; }

            var header = document.querySelector(".cine-header");
            var searchArea = document.querySelector(".header-search-area");

            if (header && searchArea && !document.getElementById("reviewsHeaderTitle")) {
                var titleEl = document.createElement("div");
                titleEl.id = "reviewsHeaderTitle";
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

        function closeReviewModal() {
            document.getElementById("reviewModal").classList.remove("show");
        }

        document.addEventListener("click", function (event) {
            var modal = document.getElementById("reviewModal");
            if (event.target === modal) { closeReviewModal(); }
        });

        document.addEventListener("keydown", function (event) {
            if (event.key === "Escape") { closeReviewModal(); }
        });
    </script>

    <div class="reviews-page">

        <p class="page-subtitle">Monitor, moderate, and manage user reviews across the platform.</p>

        <!-- STATS -->
        <div class="stats-row">
            <div class="stat-card">
                <div class="stat-label">Avg Rating</div>
                <div class="stat-value"><asp:Label ID="lblAvgRating" runat="server" Text="0" /></div>
                <div class="stat-change">↗ +0.2 this week</div>
                <div class="stat-icon">⭐</div>
            </div>

            <div class="stat-card">
                <div class="stat-label">Total Reviews</div>
                <div class="stat-value"><asp:Label ID="lblTotalReviews" runat="server" Text="0" /></div>
                <div class="stat-change">+340 since yesterday</div>
                <div class="stat-icon">📝</div>
            </div>

            <div class="stat-card">
                <div class="stat-label">Pending</div>
                <div class="stat-value"><asp:Label ID="lblPending" runat="server" Text="0" /></div>
                <div class="stat-change" style="color:#facc15;">Requires moderation</div>
                <div class="stat-icon">⏳</div>
            </div>

            <div class="stat-card">
                <div class="stat-label">Flagged</div>
                <div class="stat-value"><asp:Label ID="lblFlagged" runat="server" Text="0" /></div>
                <div class="stat-change" style="color:#ff6b6b;">High priority review</div>
                <div class="stat-icon">🚩</div>
            </div>
        </div>


        <!-- TABLE -->
        <div class="card">

            <div class="filter-bar">
                <div class="filter-tabs">
                    <asp:LinkButton runat="server" CssClass="filter-tab" Text="All"
                        CommandArgument="All" OnClick="FilterTab_Click" />
                    <asp:LinkButton runat="server" CssClass="filter-tab" Text="Pending"
                        CommandArgument="Pending" OnClick="FilterTab_Click" />
                    <asp:LinkButton runat="server" CssClass="filter-tab" Text="Approved"
                        CommandArgument="Approved" OnClick="FilterTab_Click" />
                    <asp:LinkButton runat="server" CssClass="filter-tab" Text="Flagged"
                        CommandArgument="Flagged" OnClick="FilterTab_Click" />
                </div>

                <div>
                    <asp:TextBox ID="txtReviewSearch" runat="server" ClientIDMode="Static"
                        placeholder="Search reviews..."
                        AutoPostBack="true" OnTextChanged="txtReviewSearch_TextChanged"
                        Style="background:#1E1E1E; border:1px solid #2a2a2a; border-radius:5px; padding:7px 14px; color:#fff; font-size:11px; outline:none; width:220px;" />
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
                    <asp:Repeater ID="rptReviews" runat="server" OnItemCommand="rptReviews_ItemCommand">
                        <ItemTemplate>
                            <tr>
                                <td>
                                    <div class="user-cell">
                                        <div class="user-avatar"><%# GetInitials(Eval("UserName").ToString()) %></div>
                                        <div>
                                            <div class="user-name"><%# Eval("UserName") %></div>
                                            <div class="user-email"><%# Eval("UserEmail") %></div>
                                        </div>
                                    </div>
                                </td>
                                <td><%# Eval("MovieName") %></td>
                                <td><span class="stars"><%# GetStars(Convert.ToInt32(Eval("Rating"))) %></span></td>
                                <td><%# Eval("ReviewText") %></td>
                                <td><%# Convert.ToDateTime(Eval("CreatedAt")).ToString("dd MMM yyyy") %></td>
                                <td>
                                    <span class='<%# "status-badge " + GetStatusClass(Eval("Status").ToString()) %>'>
                                        <%# Eval("Status") %>
                                    </span>
                                </td>
                                <td>
                                    <div class="action-icons">
                                        <asp:LinkButton runat="server" CssClass="action-icon view"
                                            CommandName="ViewReview" CommandArgument='<%# Eval("Id") %>'
                                            ToolTip="View Review">
                                            <svg viewBox="0 0 24 24">
                                                <path d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8S1 12 1 12z"></path>
                                                <circle cx="12" cy="12" r="3"></circle>
                                            </svg>
                                        </asp:LinkButton>

                                        <asp:LinkButton runat="server" CssClass="action-icon approve"
                                            CommandName="ApproveReview" CommandArgument='<%# Eval("Id") %>'
                                            ToolTip="Approve">
                                            <svg viewBox="0 0 24 24">
                                                <polyline points="20 6 9 17 4 12"></polyline>
                                            </svg>
                                        </asp:LinkButton>

                                        <asp:LinkButton runat="server" CssClass="action-icon delete"
                                            CommandName="DeleteReview" CommandArgument='<%# Eval("Id") %>'
                                            ToolTip="Delete"
                                            OnClientClick="return confirm('Delete this review?');">
                                            <svg viewBox="0 0 24 24">
                                                <line x1="18" y1="6" x2="6" y2="18"></line>
                                                <line x1="6" y1="6" x2="18" y2="18"></line>
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


    <!-- ============ VIEW MODAL ============ -->
    <div id="reviewModal" class="review-modal-overlay">
        <div class="review-modal">

            <div class="modal-header">
                <div class="modal-title">Review Details</div>
                <button type="button" class="modal-close" onclick="closeReviewModal();">×</button>
            </div>

            <div class="modal-body">

                <div class="modal-row">
                    <div class="modal-label">User</div>
                    <div class="modal-value"><asp:Label ID="lblModalUser" runat="server" /></div>
                </div>

                <div class="modal-row">
                    <div class="modal-label">Email</div>
                    <div class="modal-value"><asp:Label ID="lblModalEmail" runat="server" /></div>
                </div>

                <div class="modal-row">
                    <div class="modal-label">Movie</div>
                    <div class="modal-value"><asp:Label ID="lblModalMovie" runat="server" /></div>
                </div>

                <div class="modal-row">
                    <div class="modal-label">Rating</div>
                    <div class="modal-value stars"><asp:Label ID="lblModalStars" runat="server" /></div>
                </div>

                <div class="modal-row">
                    <div class="modal-label">Date</div>
                    <div class="modal-value"><asp:Label ID="lblModalDate" runat="server" /></div>
                </div>

                <div class="modal-row">
                    <div class="modal-label">Status</div>
                    <div class="modal-value"><asp:Label ID="lblModalStatus" runat="server" /></div>
                </div>

                <div class="modal-row">
                    <div class="modal-label">Review</div>
                    <div class="modal-value" style="grid-column: 1 / -1;">
                        <div class="modal-review-text">
                            <asp:Label ID="lblModalReview" runat="server" />
                        </div>
                    </div>
                </div>

            </div>

            <div class="modal-footer">
                <asp:Button ID="btnModalApprove" runat="server" Text="✓ Approve"
                    CssClass="btn-modal-approve"
                    OnClick="btnModalApprove_Click" />
                <button type="button" class="btn-modal-close" onclick="closeReviewModal();">Close</button>
            </div>

        </div>
    </div>

</asp:Content>