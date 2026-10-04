<%@ Page Title="User Management" Language="C#" MasterPageFile="~/Site1.Master"
    AutoEventWireup="true" CodeBehind="users.aspx.cs" Inherits="WebApplication2.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
    * {
        box-sizing: border-box;
    }

    .users-page {
        width: 100%;
        min-height: 100vh;
        padding: 25px 35px 50px;
        background: #111111;
        color: #ffffff;
        font-family: Arial, Helvetica, sans-serif;
    }

    /* ================= STATS ================= */

    .stats-row {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 20px;
        margin-bottom: 30px;
    }

    .stat-card {
        position: relative;
        min-height: 120px;
        padding: 22px 25px;
        background: #1a1a1a;
        border: 1px solid #2a2a2a;
        border-radius: 10px;
        overflow: hidden;
    }

    .stat-label {
        color: #999;
        font-size: 11px;
        letter-spacing: 1.5px;
        text-transform: uppercase;
    }

    .stat-value {
        margin-top: 22px;
        color: #fff;
        font-size: 26px;
        font-weight: 600;
    }

    .stat-icon {
        position: absolute;
        top: 20px;
        right: 20px;
        font-size: 16px;
    }

    .icon-pink {
        color: #ffc3b9;
    }

    .icon-green {
        color: #4ade80;
    }

    .icon-orange {
        color: #ffa500;
    }

    .stat-graphic {
        position: absolute;
        right: 20px;
        bottom: 18px;
    }

    .sparkline {
        width: 60px;
        height: 24px;
        stroke: #ffc3b9;
        stroke-width: 2;
        fill: none;
    }

    .circle-progress {
        width: 34px;
        height: 34px;
    }

    /* ================= DIRECTORY ================= */

    .directory-card {
        width: 100%;
        background: #151515;
        border: 1px solid #2a2a2a;
        border-radius: 10px;
        overflow: hidden;
    }

    .directory-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 18px 25px;
        border-bottom: 1px solid #252525;
    }

    .directory-title {
        color: #fff;
        font-size: 15px;
        font-weight: 500;
    }

    .directory-actions {
        display: flex;
        align-items: center;
        gap: 12px;
    }

    /* ================= SEARCH ================= */

    .search-box {
        position: relative;
    }

    .search-box input {
        width: 240px;
        height: 36px;
        padding: 0 12px 0 36px;
        background: #1e1e1e;
        border: 1px solid #2f2f2f;
        border-radius: 6px;
        outline: none;
        color: #eee;
        font-size: 12px;
    }

    .search-box input::placeholder {
        color: #777;
    }

    .search-box input:focus {
        border-color: #555;
    }

    .search-box-icon {
        position: absolute;
        left: 12px;
        top: 50%;
        transform: translateY(-50%);
        color: #888;
        font-size: 13px;
    }

    /* ================= BUTTON ================= */

    .new-user-btn {
        padding: 9px 18px;
        background: #ff4d4d;
        border: none;
        border-radius: 6px;
        color: #fff;
        font-size: 11px;
        font-weight: 600;
        letter-spacing: .5px;
        cursor: pointer;
        transition: .2s;
    }

    .new-user-btn:hover {
        background: #ff6666;
    }

    /* ================= TABLE ================= */

    .data-table {
        width: 100%;
        border-collapse: collapse;
    }

    .data-table thead th {
        height: 45px;
        padding: 0 20px;
        background: #1a1a1a;
        border-bottom: 1px solid #252525;
        color: #888;
        text-align: left;
        font-size: 11px;
        font-weight: 500;
        letter-spacing: 1px;
        text-transform: uppercase;
    }

    .data-table tbody td {
        padding: 14px 20px;
        border-bottom: 1px solid #202020;
        color: #ccc;
        font-size: 12px;
        vertical-align: middle;
    }

    .data-table tbody tr:hover {
        background: #1c1c1c;
    }

    .data-table tbody tr:last-child td {
        border-bottom: none;
    }

    /* ================= USER ================= */

    .user-info {
        display: flex;
        align-items: center;
        gap: 12px;
    }

    .user-avatar {
        width: 32px;
        height: 32px;
        flex-shrink: 0;
        display: flex;
        align-items: center;
        justify-content: center;
        border-radius: 50%;
        background: #ff4d4d;
        color: #fff;
        font-size: 11px;
        font-weight: 600;
    }

    .user-name {
        color: #fff;
        font-size: 12px;
        font-weight: 500;
    }

    .password-dots {
        color: #888;
        font-size: 9px;
        letter-spacing: 2px;
    }

    .otp-code {
        color: #ccc;
        font-family: "Courier New", monospace;
        font-size: 12px;
    }

    .created-date {
        color: #ccc;
        font-size: 11px;
        line-height: 16px;
    }

    /* ================= STATUS ================= */

    .status-badge {
        display: inline-flex;
        align-items: center;
        gap: 6px;
        padding: 4px 10px;
        border-radius: 12px;
        font-size: 10px;
        font-weight: 600;
        letter-spacing: .5px;
    }

    .status-badge.active {
        background: rgba(74,222,128,.12);
        color: #4ade80;
    }

    .status-badge.pending {
        background: rgba(250,204,21,.12);
        color: #facc15;
    }

    .status-dot {
        width: 6px;
        height: 6px;
        border-radius: 50%;
        background: currentColor;
    }

    /* ================= ACTIONS ================= */

    .action-icons {
        display: flex;
        align-items: center;
        gap: 14px;
    }

    .action-icon-btn {
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 0;
        background: transparent;
        border: none;
        color: #888;
        cursor: pointer;
        font-size: 15px;
        transition: .2s;
    }

    .action-icon-btn:hover {
        color: #fff;
    }

    .action-icon-btn.delete:hover {
        color: #ff4d4d;
    }

    /* ================= MODAL ================= */

    .modal-overlay {
        position: fixed;
        inset: 0;
        z-index: 9999;
        display: none;
        align-items: center;
        justify-content: center;
        background: rgba(0,0,0,.72);
        backdrop-filter: blur(4px);
    }

    .modal-overlay.show {
        display: flex;
    }

    .user-modal {
        width: 430px;
        max-width: 92%;
        padding: 25px;
        background: #1c1c1c;
        border: 1px solid #333;
        border-radius: 10px;
        box-shadow: 0 20px 60px rgba(0,0,0,.6);
    }

    .modal-header {
        display: flex;
        align-items: center;
        justify-content: space-between;
        margin-bottom: 22px;
    }

    .modal-title {
        color: #fff;
        font-size: 17px;
        font-weight: 500;
    }

    .modal-close {
        border: none;
        background: transparent;
        color: #888;
        cursor: pointer;
        font-size: 22px;
    }

    .modal-close:hover {
        color: #fff;
    }

    .form-group {
        margin-bottom: 15px;
    }

    .form-group label {
        display: block;
        margin-bottom: 7px;
        color: #999;
        font-size: 10px;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    .form-group input,
    .form-group select {
        width: 100%;
        height: 38px;
        padding: 0 12px;
        background: #111;
        border: 1px solid #333;
        border-radius: 5px;
        outline: none;
        color: #eee;
        font-size: 12px;
    }

    .form-group input:focus,
    .form-group select:focus {
        border-color: #ff4d4d;
    }

    .modal-buttons {
        display: flex;
        justify-content: flex-end;
        gap: 10px;
        margin-top: 22px;
    }

    .cancel-btn,
    .save-btn {
        height: 36px;
        padding: 0 18px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 11px;
        font-weight: 600;
    }

    .cancel-btn {
        background: #222;
        border: 1px solid #444;
        color: #bbb;
    }

    .cancel-btn:hover {
        background: #2c2c2c;
        color: #fff;
    }

    .save-btn {
        background: #ff4d4d;
        border: 1px solid #ff4d4d;
        color: #fff;
    }

    .save-btn:hover {
        background: #ff6666;
    }

    /* ================= TOAST ================= */

    .toast {
        position: fixed;
        right: 25px;
        bottom: 25px;
        z-index: 10000;
        min-width: 240px;
        padding: 13px 18px;
        background: #222;
        border: 1px solid #444;
        border-radius: 6px;
        color: #fff;
        font-size: 12px;
        opacity: 0;
        transform: translateY(15px);
        pointer-events: none;
        transition: .25s;
    }

    .toast.show {
        opacity: 1;
        transform: translateY(0);
    }

    /* ================= RESPONSIVE ================= */

    @media screen and (max-width: 1100px) {
        .stats-row {
            grid-template-columns: 1fr;
        }
    }

    @media screen and (max-width: 900px) {
        .users-page {
            padding: 20px 15px 40px;
        }

        .directory-header {
            flex-direction: column;
            align-items: flex-start;
            gap: 12px;
        }

        .directory-actions {
            width: 100%;
        }

        .search-box {
            flex: 1;
        }

        .search-box input {
            width: 100%;
        }

        .directory-card {
            overflow-x: auto;
        }

        .data-table {
            min-width: 900px;
        }
    }
</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<script>
    document.addEventListener("DOMContentLoaded", function () {

        var hamburger = document.getElementById("mainHamburger");
        if (hamburger) {
            hamburger.style.display = "flex";
        }

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

    /* ================= NEW USER ================= */

    function newUser() {

        document.getElementById("modalTitle").innerText = "Add New User";

        document.getElementById("editIndex").value = "-1";

        document.getElementById("userName").value = "";
        document.getElementById("userEmail").value = "";
        document.getElementById("userPassword").value = "";
        document.getElementById("userStatus").value = "ACTIVE";
        document.getElementById("userOtp").value = "";

        document.getElementById("userModal").classList.add("show");

        setTimeout(function () {
            document.getElementById("userName").focus();
        }, 100);
    }

    /* ================= EDIT USER ================= */

    function editUser(button) {

        var row = button.closest("tr");

        var name = row.querySelector(".user-name").innerText.trim();
        var email = row.cells[1].innerText.trim();
        var status = row.querySelector(".status-badge").innerText.trim();
        var otp = row.cells[4].innerText.trim();

        document.getElementById("modalTitle").innerText = "Edit User";

        document.getElementById("editIndex").value =
            row.getAttribute("data-index");

        document.getElementById("userName").value = name;
        document.getElementById("userEmail").value = email;
        document.getElementById("userPassword").value = "";
        document.getElementById("userStatus").value =
            status === "PENDING" ? "PENDING" : "ACTIVE";
        document.getElementById("userOtp").value = otp;

        document.getElementById("userModal").classList.add("show");

        setTimeout(function () {
            document.getElementById("userName").focus();
        }, 100);
    }

    /* ================= SAVE USER ================= */

    function saveUser() {

        var name = document.getElementById("userName").value.trim();
        var email = document.getElementById("userEmail").value.trim();
        var password = document.getElementById("userPassword").value.trim();
        var status = document.getElementById("userStatus").value;
        var otp = document.getElementById("userOtp").value.trim();

        if (name === "") {
            alert("Please enter full name.");
            return;
        }

        if (email === "") {
            alert("Please enter email address.");
            return;
        }

        if (password === "" &&
            document.getElementById("editIndex").value === "-1") {

            alert("Please enter password.");
            return;
        }

        if (otp === "") {
            alert("Please enter Reset OTP.");
            return;
        }

        var editIndex =
            document.getElementById("editIndex").value;

        if (editIndex === "-1") {

            var tbody =
                document.getElementById("userTableBody");

            var rows = tbody.querySelectorAll("tr");

            var initials = getInitials(name);

            var today = new Date();

            var months = [
                "Jan", "Feb", "Mar", "Apr", "May", "Jun",
                "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
            ];

            var dateText =
                String(today.getDate()).padStart(2, "0") +
                " " +
                months[today.getMonth()] +
                "<br>" +
                today.getFullYear();

            var newRow = document.createElement("tr");

            newRow.setAttribute(
                "data-search",
                (name + " " + email).toLowerCase()
            );

            newRow.setAttribute(
                "data-index",
                Date.now()
            );

            newRow.innerHTML = `
                <td>
                    <div class="user-info">
                        <div class="user-avatar">${escapeHtml(initials)}</div>
                        <div class="user-name">${escapeHtml(name)}</div>
                    </div>
                </td>

                <td>${escapeHtml(email)}</td>

                <td>
                    <span class="password-dots">
                        ••••••••
                    </span>
                </td>

                <td>
                    <span class="status-badge ${status === "PENDING" ? "pending" : "active"}">
                        <span class="status-dot"></span>
                        ${status}
                    </span>
                </td>

                <td>
                    <span class="otp-code">
                        ${escapeHtml(otp)}
                    </span>
                </td>

                <td>
                    <div class="created-date">
                        ${dateText}
                    </div>
                </td>

                <td>
                    <div class="action-icons">

                        <button type="button"
                                class="action-icon-btn"
                                onclick="editUser(this)"
                                title="Edit">
                            ✎
                        </button>

                        <button type="button"
                                class="action-icon-btn delete"
                                onclick="deleteUser(this)"
                                title="Delete">
                            🗑
                        </button>

                    </div>
                </td>
            `;

            tbody.appendChild(newRow);

            updateStats();

            closeUserModal();

            showToast("New user added successfully.");

        } else {

            var row = document.querySelector(
                'tr[data-index="' + editIndex + '"]'
            );

            if (!row) {
                alert("User row not found.");
                return;
            }

            row.querySelector(".user-name").innerText = name;

            row.querySelector(".user-avatar").innerText =
                getInitials(name);

            row.cells[1].innerText = email;

            row.querySelector(".status-badge").className =
                "status-badge " +
                (status === "PENDING" ? "pending" : "active");

            row.querySelector(".status-badge").innerHTML =
                '<span class="status-dot"></span>' + status;

            row.cells[4].innerHTML =
                '<span class="otp-code">' +
                escapeHtml(otp) +
                '</span>';

            row.setAttribute(
                "data-search",
                (name + " " + email).toLowerCase()
            );

            closeUserModal();

            showToast("User updated successfully.");
        }
    }

    /* ================= DELETE USER ================= */

    function deleteUser(button) {

        var row = button.closest("tr");

        var name =
            row.querySelector(".user-name").innerText.trim();

        if (confirm(
            'Are you sure you want to delete "' +
            name +
            '"?'
        )) {

            row.remove();

            updateStats();

            showToast(name + " deleted successfully.");
        }
    }

    /* ================= SEARCH ================= */

    function searchUsers(query) {

        var q = query.toLowerCase().trim();

        var rows =
            document.querySelectorAll("#userTableBody tr");

        rows.forEach(function (row) {

            var text =
                row.getAttribute("data-search") || "";

            row.style.display =
                text.toLowerCase().indexOf(q) !== -1
                    ? ""
                    : "none";
        });
    }

    /* ================= CLOSE MODAL ================= */

    function closeUserModal() {
        document.getElementById("userModal")
            .classList.remove("show");
    }

    /* ================= STATS ================= */

    function updateStats() {

        var rows =
            document.querySelectorAll("#userTableBody tr");

        var total = rows.length;
        var active = 0;
        var pending = 0;

        rows.forEach(function (row) {

            var badge =
                row.querySelector(".status-badge");

            if (!badge) return;

            if (badge.innerText.trim() === "ACTIVE") {
                active++;
            }

            if (badge.innerText.trim() === "PENDING") {
                pending++;
            }
        });

        /*
           Starting dashboard value was 12,482.
           New rows are added/removed relative to the
           displayed demo data.
        */

        var totalDisplay =
            12482 - 5 + total;

        var activeDisplay =
            11940 - 3 + active;

        var pendingDisplay =
            542 - 2 + pending;

        document.getElementById("totalUsers").innerText =
            totalDisplay.toLocaleString();

        document.getElementById("activeUsers").innerText =
            activeDisplay.toLocaleString();

        document.getElementById("pendingUsers").innerText =
            pendingDisplay.toLocaleString();
    }

    /* ================= INITIALS ================= */

    function getInitials(name) {

        var parts =
            name.trim().split(/\s+/);

        if (parts.length === 1) {
            return parts[0].substring(0, 2).toUpperCase();
        }

        return (
            parts[0].charAt(0) +
            parts[parts.length - 1].charAt(0)
        ).toUpperCase();
    }

    /* ================= HTML SAFETY ================= */

    function escapeHtml(value) {

        return String(value)
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;")
            .replace(/"/g, "&quot;")
            .replace(/'/g, "&#039;");
    }

    /* ================= TOAST ================= */

    var toastTimer;

    function showToast(message) {

        var toast =
            document.getElementById("toast");

        toast.innerText = message;

        toast.classList.add("show");

        clearTimeout(toastTimer);

        toastTimer = setTimeout(function () {
            toast.classList.remove("show");
        }, 2200);
    }

    /* ================= OUTSIDE CLICK ================= */

    document.addEventListener("click", function (event) {

        var modal =
            document.getElementById("userModal");

        if (event.target === modal) {
            closeUserModal();
        }
    });

    /* ================= ESCAPE ================= */

    document.addEventListener("keydown", function (event) {

        if (event.key === "Escape") {
            closeUserModal();
        }
    });
</script>


<div class="users-page">

    <!-- ================= STATS ================= -->

    <div class="stats-row">

        <div class="stat-card">

            <div class="stat-label">
                Total Users
            </div>

            <div class="stat-value" id="totalUsers">
                12,482
            </div>

            <div class="stat-icon icon-pink">
                👥
            </div>

            <svg class="stat-graphic sparkline"
                 viewBox="0 0 60 24"
                 preserveAspectRatio="none">

                <path d="M 0 18 L 12 14 L 20 16 L 30 8 L 40 12 L 50 4 L 60 10" />

            </svg>

        </div>


        <div class="stat-card">

            <div class="stat-label">
                Active Accounts
            </div>

            <div class="stat-value" id="activeUsers">
                11,940
            </div>

            <div class="stat-icon icon-green">
                ✓
            </div>

            <svg class="stat-graphic circle-progress"
                 viewBox="0 0 36 36">

                <circle cx="18"
                        cy="18"
                        r="14"
                        fill="none"
                        stroke="#2a2a2a"
                        stroke-width="3" />

                <circle cx="18"
                        cy="18"
                        r="14"
                        fill="none"
                        stroke="#4ade80"
                        stroke-width="3"
                        stroke-dasharray="88"
                        stroke-dashoffset="20"
                        stroke-linecap="round"
                        transform="rotate(-90 18 18)" />

            </svg>

        </div>


        <div class="stat-card">

            <div class="stat-label">
                Pending Activation
            </div>

            <div class="stat-value" id="pendingUsers">
                542
            </div>

            <div class="stat-icon icon-orange">
                ⏳
            </div>

            <svg class="stat-graphic sparkline"
                 viewBox="0 0 60 24"
                 preserveAspectRatio="none">

                <path d="M 0 8 L 10 12 L 20 10 L 30 16 L 40 14 L 50 20 L 60 18"
                      stroke="#ffa500" />

            </svg>

        </div>

    </div>


    <!-- ================= USER DIRECTORY ================= -->

    <div class="directory-card">

        <div class="directory-header">

            <div class="directory-title">
                User Directory
            </div>

            <div class="directory-actions">

                <div class="search-box">

                    <span class="search-box-icon">
                        🔍
                    </span>

                    <input type="text"
                           placeholder="Search users..."
                           onkeyup="searchUsers(this.value)" />

                </div>

                <button type="button"
                        class="new-user-btn"
                        onclick="newUser()">

                    + NEW USER

                </button>

            </div>

        </div>


        <!-- ================= TABLE ================= -->

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


            <tbody id="userTableBody">

                <!-- USER 1 -->

                <tr data-index="1"
                    data-search="jaldhara jadav jaldhara@example.com">

                    <td>

                        <div class="user-info">

                            <div class="user-avatar">
                                JJ
                            </div>

                            <div class="user-name">
                                Jaldhara Jadav
                            </div>

                        </div>

                    </td>

                    <td>
                        jaldhara@example.com
                    </td>

                    <td>
                        <span class="password-dots">
                            ••••••••
                        </span>
                    </td>

                    <td>

                        <span class="status-badge active">
                            <span class="status-dot"></span>
                            ACTIVE
                        </span>

                    </td>

                    <td>
                        <span class="otp-code">
                            782914
                        </span>
                    </td>

                    <td>
                        <div class="created-date">
                            12 Aug<br />
                            2026
                        </div>
                    </td>

                    <td>

                        <div class="action-icons">

                            <button type="button"
                                    class="action-icon-btn"
                                    onclick="editUser(this)"
                                    title="Edit">

                                ✎

                            </button>

                            <button type="button"
                                    class="action-icon-btn delete"
                                    onclick="deleteUser(this)"
                                    title="Delete">

                                🗑

                            </button>

                        </div>

                    </td>

                </tr>


                <!-- USER 2 -->

                <tr data-index="2"
                    data-search="rajesh kumar rajesh@example.com">

                    <td>

                        <div class="user-info">

                            <div class="user-avatar">
                                RK
                            </div>

                            <div class="user-name">
                                Rajesh Kumar
                            </div>

                        </div>

                    </td>

                    <td>
                        rajesh@example.com
                    </td>

                    <td>
                        <span class="password-dots">
                            ••••••••
                        </span>
                    </td>

                    <td>

                        <span class="status-badge active">
                            <span class="status-dot"></span>
                            ACTIVE
                        </span>

                    </td>

                    <td>
                        <span class="otp-code">
                            112233
                        </span>
                    </td>

                    <td>
                        <div class="created-date">
                            15 Aug<br />
                            2026
                        </div>
                    </td>

                    <td>

                        <div class="action-icons">

                            <button type="button"
                                    class="action-icon-btn"
                                    onclick="editUser(this)"
                                    title="Edit">

                                ✎

                            </button>

                            <button type="button"
                                    class="action-icon-btn delete"
                                    onclick="deleteUser(this)"
                                    title="Delete">

                                🗑

                            </button>

                        </div>

                    </td>

                </tr>


                <!-- USER 3 -->

                <tr data-index="3"
                    data-search="priya sharma priya@example.com">

                    <td>

                        <div class="user-info">

                            <div class="user-avatar">
                                PS
                            </div>

                            <div class="user-name">
                                Priya Sharma
                            </div>

                        </div>

                    </td>

                    <td>
                        priya@example.com
                    </td>

                    <td>
                        <span class="password-dots">
                            ••••••••
                        </span>
                    </td>

                    <td>

                        <span class="status-badge pending">
                            <span class="status-dot"></span>
                            PENDING
                        </span>

                    </td>

                    <td>
                        <span class="otp-code">
                            908765
                        </span>
                    </td>

                    <td>
                        <div class="created-date">
                            10 Aug<br />
                            2026
                        </div>
                    </td>

                    <td>

                        <div class="action-icons">

                            <button type="button"
                                    class="action-icon-btn"
                                    onclick="editUser(this)"
                                    title="Edit">

                                ✎

                            </button>

                            <button type="button"
                                    class="action-icon-btn delete"
                                    onclick="deleteUser(this)"
                                    title="Delete">

                                🗑

                            </button>

                        </div>

                    </td>

                </tr>


                <!-- USER 4 -->

                <tr data-index="4"
                    data-search="amit patel amit@example.com">

                    <td>

                        <div class="user-info">

                            <div class="user-avatar">
                                AP
                            </div>

                            <div class="user-name">
                                Amit Patel
                            </div>

                        </div>

                    </td>

                    <td>
                        amit@example.com
                    </td>

                    <td>
                        <span class="password-dots">
                            ••••••••
                        </span>
                    </td>

                    <td>

                        <span class="status-badge active">
                            <span class="status-dot"></span>
                            ACTIVE
                        </span>

                    </td>

                    <td>
                        <span class="otp-code">
                            441122
                        </span>
                    </td>

                    <td>
                        <div class="created-date">
                            08 Aug<br />
                            2026
                        </div>
                    </td>

                    <td>

                        <div class="action-icons">

                            <button type="button"
                                    class="action-icon-btn"
                                    onclick="editUser(this)"
                                    title="Edit">

                                ✎

                            </button>

                            <button type="button"
                                    class="action-icon-btn delete"
                                    onclick="deleteUser(this)"
                                    title="Delete">

                                🗑

                            </button>

                        </div>

                    </td>

                </tr>


                <!-- USER 5 -->

                <tr data-index="5"
                    data-search="sneha gupta sneha@example.com">

                    <td>

                        <div class="user-info">

                            <div class="user-avatar">
                                SG
                            </div>

                            <div class="user-name">
                                Sneha Gupta
                            </div>

                        </div>

                    </td>

                    <td>
                        sneha@example.com
                    </td>

                    <td>
                        <span class="password-dots">
                            ••••••••
                        </span>
                    </td>

                    <td>

                        <span class="status-badge pending">
                            <span class="status-dot"></span>
                            PENDING
                        </span>

                    </td>

                    <td>
                        <span class="otp-code">
                            889900
                        </span>
                    </td>

                    <td>
                        <div class="created-date">
                            02 Aug<br />
                            2026
                        </div>
                    </td>

                    <td>

                        <div class="action-icons">

                            <button type="button"
                                    class="action-icon-btn"
                                    onclick="editUser(this)"
                                    title="Edit">

                                ✎

                            </button>

                            <button type="button"
                                    class="action-icon-btn delete"
                                    onclick="deleteUser(this)"
                                    title="Delete">

                                🗑

                            </button>

                        </div>

                    </td>

                </tr>

            </tbody>

        </table>

    </div>

</div>


<!-- ================= USER MODAL ================= -->

<div id="userModal"
     class="modal-overlay">

    <div class="user-modal">

        <div class="modal-header">

            <div id="modalTitle"
                 class="modal-title">

                Add New User

            </div>

            <button type="button"
                    class="modal-close"
                    onclick="closeUserModal()">

                ×

            </button>

        </div>


        <input type="hidden"
               id="editIndex"
               value="-1" />


        <div class="form-group">

            <label>
                Full Name
            </label>

            <input type="text"
                   id="userName"
                   placeholder="Enter full name" />

        </div>


        <div class="form-group">

            <label>
                Email Address
            </label>

            <input type="email"
                   id="userEmail"
                   placeholder="Enter email address" />

        </div>


        <div class="form-group">

            <label>
                Password
            </label>

            <input type="password"
                   id="userPassword"
                   placeholder="Enter password" />

        </div>


        <div class="form-group">

            <label>
                Status
            </label>

            <select id="userStatus">

                <option value="ACTIVE">
                    ACTIVE
                </option>

                <option value="PENDING">
                    PENDING
                </option>

            </select>

        </div>


        <div class="form-group">

            <label>
                Reset OTP
            </label>

            <input type="text"
                   id="userOtp"
                   maxlength="6"
                   placeholder="Enter 6 digit OTP" />

        </div>


        <div class="modal-buttons">

            <button type="button"
                    class="cancel-btn"
                    onclick="closeUserModal()">

                Cancel

            </button>

            <button type="button"
                    class="save-btn"
                    onclick="saveUser()">

                Save User

            </button>

        </div>

    </div>

</div>


<!-- ================= TOAST ================= -->

<div id="toast"
     class="toast">
</div>


</asp:Content>