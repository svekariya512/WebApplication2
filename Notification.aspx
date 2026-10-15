<%@ Page Title="Notifications" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Notification.aspx.cs" Inherits="WebApplication2.Notification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
.notif-page { width: 100%; min-height: calc(100vh - 82px); background: #111111; padding: 25px 35px 40px 35px; color: #ffffff; }
.notif-subtitle { color: #888888; font-size: 12px; margin-bottom: 22px; }

/* STATS */
.stats-row { display: grid; grid-template-columns: repeat(4, 1fr); gap: 14px; margin-bottom: 26px; }
.stat-card { background: #171717; border: 1px solid #292929; border-radius: 8px; padding: 18px 20px; position: relative; }
.stat-label { color: #888888; font-size: 10px; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 10px; }
.stat-value { color: #ffffff; font-size: 24px; font-weight: 600; }
.stat-icon { position: absolute; top: 16px; right: 18px; font-size: 16px; color: #FFC3B9; }

/* MAIN CARD */
.notif-card { width: 100%; background: #171717; border: 1px solid #292929; border-radius: 8px; overflow: hidden; }
.notif-card-header { display: flex; justify-content: space-between; align-items: center; padding: 18px 22px; border-bottom: 1px solid #252525; flex-wrap: wrap; gap: 12px; }
.notif-card-title { color: #ffffff; font-size: 15px; font-weight: 500; }
.notif-actions { display: flex; gap: 10px; align-items: center; }

.notif-search { background: #1E1E1E; border: 1px solid #2f2f2f; border-radius: 5px; padding: 8px 12px; color: #eeeeee; font-size: 11px; outline: none; width: 240px; }
.notif-search::placeholder { color: #666666; }
.notif-search:focus { border-color: #FFC3B9; }

/* LIST */
.notif-list { padding: 8px 0; }
.notif-item { display: grid; grid-template-columns: 45px 1fr auto auto; align-items: center; gap: 15px; padding: 16px 22px; border-bottom: 1px solid #1f1f1f; transition: 0.2s; }
.notif-item:last-child { border-bottom: none; }
.notif-item:hover { background: #1c1c1c; }

.notif-icon { width: 40px; height: 40px; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 18px; flex-shrink: 0; }
.notif-icon.ticket { background: rgba(255, 195, 185, 0.15); color: #FFC3B9; }
.notif-icon.alert { background: rgba(255, 95, 95, 0.15); color: #ff5f5f; }
.notif-icon.success { background: rgba(74, 222, 128, 0.15); color: #4ade80; }
.notif-icon.info { background: rgba(96, 165, 250, 0.15); color: #60a5fa; }

.notif-content { min-width: 0; }
.notif-title { color: #ffffff; font-size: 13px; font-weight: 500; margin-bottom: 4px; }
.notif-message { color: #888888; font-size: 11px; line-height: 16px; }
.notif-time { color: #666666; font-size: 10px; white-space: nowrap; }

/* ICON BUTTONS */
.notif-actions-cell { display: flex; gap: 8px; }

.notif-action-btn {
    background: transparent;
    border: 1px solid #333333;
    border-radius: 4px;
    color: #999999;
    font-size: 14px;
    font-weight: 600;
    width: 30px;
    height: 30px;
    display: inline-flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    transition: 0.2s;
    padding: 0;
    text-decoration: none;
    line-height: 1;
}

.notif-action-btn.read {
    color: #4ade80;
    border-color: rgba(74, 222, 128, 0.35);
    background: rgba(74, 222, 128, 0.05);
}
.notif-action-btn.read:hover {
    background: #4ade80;
    color: #111111;
    border-color: #4ade80;
    text-decoration: none;
}

.notif-action-btn.delete {
    color: #ff6666;
    border-color: rgba(255, 102, 102, 0.35);
    background: rgba(255, 102, 102, 0.05);
}
.notif-action-btn.delete:hover {
    background: #ff2633;
    color: #ffffff;
    border-color: #ff2633;
    text-decoration: none;
}

.unread-dot { display: inline-block; width: 7px; height: 7px; background: #ff2a2a; border-radius: 50%; margin-right: 6px; }

@media screen and (max-width: 900px) {
    .stats-row { grid-template-columns: repeat(2, 1fr); }
    .notif-item { grid-template-columns: 45px 1fr; }
    .notif-time, .notif-actions-cell { grid-column: span 2; }
}
@media screen and (max-width: 600px) {
    .notif-page { padding: 20px 15px; }
    .stats-row { grid-template-columns: 1fr; }
    .notif-card-header { flex-direction: column; align-items: stretch; }
    .notif-search { width: 100%; }
}
</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<div class="notif-page">

    <p class="notif-subtitle">
        Stay updated with new ticket bookings, alerts, and system messages.
    </p>

    <!-- STATS -->
    <div class="stats-row">
        <div class="stat-card">
            <div class="stat-label">New Tickets</div>
            <div class="stat-value"><asp:Label ID="lblNewTickets" runat="server" Text="0" /></div>
            <div class="stat-icon">🎟</div>
        </div>
        <div class="stat-card">
            <div class="stat-label">Unread</div>
            <div class="stat-value"><asp:Label ID="lblUnread" runat="server" Text="0" /></div>
            <div class="stat-icon">📩</div>
        </div>
        <div class="stat-card">
            <div class="stat-label">Today</div>
            <div class="stat-value"><asp:Label ID="lblToday" runat="server" Text="0" /></div>
            <div class="stat-icon">📅</div>
        </div>
        <div class="stat-card">
            <div class="stat-label">Total</div>
            <div class="stat-value"><asp:Label ID="lblTotalNotif" runat="server" Text="0" /></div>
            <div class="stat-icon">📊</div>
        </div>
    </div>


    <!-- NOTIFICATION LIST -->
    <div class="notif-card">
        <div class="notif-card-header">
            <div class="notif-card-title">Recent Notifications</div>
            <div class="notif-actions">
                <asp:TextBox ID="txtNotifSearch" runat="server" ClientIDMode="Static"
                    CssClass="notif-search" placeholder="Search notifications..."
                    AutoPostBack="true" OnTextChanged="txtNotifSearch_TextChanged" />
            </div>
        </div>

        <div class="notif-list">
            <asp:Repeater ID="rptNotifications" runat="server" OnItemCommand="rptNotifications_ItemCommand">
                <ItemTemplate>
                    <div class="notif-item">
                        <div class='<%# "notif-icon " + GetTypeClass(Eval("Type").ToString()) %>'>
                            <%# GetTypeIcon(Eval("Type").ToString()) %>
                        </div>

                        <div class="notif-content">
                            <div class="notif-title">
                                <%# Convert.ToBoolean(Eval("IsRead")) ? "" : "<span class='unread-dot'></span>" %>
                                <%# Eval("Title") %>
                            </div>
                            <div class="notif-message">
                                <%# Eval("Message") %>
                            </div>
                        </div>

                        <div class="notif-time">
                            <%# Convert.ToDateTime(Eval("CreatedAt")).ToString("dd MMM, hh:mm tt") %>
                        </div>

                        <div class="notif-actions-cell">
                            <asp:LinkButton runat="server" CssClass="notif-action-btn read"
                                CommandName="MarkRead" CommandArgument='<%# Eval("Id") %>'
                                ToolTip="Mark as Read" CausesValidation="false">✓</asp:LinkButton>

                            <asp:LinkButton runat="server" CssClass="notif-action-btn delete"
                                CommandName="DeleteNotification" CommandArgument='<%# Eval("Id") %>'
                                ToolTip="Delete" CausesValidation="false"
                                OnClientClick="return confirm('Delete this notification?');">✗</asp:LinkButton>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

</div>

</asp:Content>
