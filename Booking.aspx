<%@ Page Title="Booking" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Booking.aspx.cs" Inherits="WebApplication2.Booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>

/* =========================================
   PAGE CONTAINER
========================================= */

.page-container {
    padding: 25px 35px 50px 35px;
}

.page-subtitle {
    font-size: 12px;
    color: #888888;
    margin-bottom: 25px;
}


/* =========================================
   TOP ACTION BAR
========================================= */

.action-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 20px;
}

.filter-tabs {
    display: flex;
    gap: 10px;
}

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

.filter-tab:hover {
    background: #2a2a2a;
}

.filter-tab.active {
    background: #2a2a2a;
    border-color: #FFC3B9;
    color: #FFC3B9;
}

.export-btn {
    padding: 8px 18px;
    background: #FFC3B9;
    border: none;
    border-radius: 5px;
    color: #111111;
    font-size: 12px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.2s;
}

.export-btn:hover {
    background: #ffb0a3;
    transform: translateY(-1px);
}


/* =========================================
   STATS CARDS
========================================= */

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

.stat-change {
    font-size: 11px;
    color: #4ade80;
}

.stat-change.negative {
    color: #ff6b6b;
}

.stat-icon {
    position: absolute;
    top: 18px;
    right: 18px;
    width: 28px;
    height: 28px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 14px;
}

.stat-icon.pink {
    background: rgba(255, 195, 185, 0.15);
    color: #FFC3B9;
}

.stat-icon.green {
    background: rgba(74, 222, 128, 0.15);
    color: #4ade80;
}


/* =========================================
   TABLE SECTION
========================================= */

.table-wrapper {
    background: #1a1a1a;
    border: 1px solid #2a2a2a;
    border-radius: 8px;
    overflow: visible;
    position: relative;
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
    width: 13px;
    height: 13px;
    stroke: #888888;
    margin-right: 8px;
    flex-shrink: 0;
}

.table-search input {
    background: transparent;
    border: none;
    outline: none;
    color: #eeeeee;
    font-size: 12px;
    width: 100%;
}

.table-search input::placeholder {
    color: #666666;
}

.table-filters {
    display: flex;
    gap: 10px;
    position: relative;
}


/* =========================================
   FILTER / SETTINGS BUTTON
========================================= */

.filter-icon-btn {
    width: 30px;
    height: 30px;
    background: #222222;
    border: 1px solid #333333;
    border-radius: 5px;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    color: #cccccc;
    transition: 0.2s;
}

.filter-icon-btn:hover {
    background: #2d2d2d;
    color: #FFC3B9;
    border-color: #FFC3B9;
}


/* =========================================
   SETTINGS MESSAGE
========================================= */

.settings-message {
    display: none;
    position: absolute;
    right: 0;
    top: 40px;
    background: #222;
    border: 1px solid #444;
    border-radius: 5px;
    padding: 10px 13px;
    color: #bbb;
    font-size: 10px;
    z-index: 100;
    white-space: nowrap;
}

.settings-message.show {
    display: block;
}


/* =========================================
   TABLE
========================================= */

.data-table {
    width: 100%;
    border-collapse: collapse;
}

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

.data-table tbody tr:hover {
    background: #1f1f1f;
}

.booking-id {
    color: #FFC3B9;
    font-weight: bold;
    font-size: 11px;
}


/* =========================================
   STATUS BADGES
========================================= */

.status-badge {
    display: inline-block;
    padding: 3px 10px;
    border-radius: 4px;
    font-size: 10px;
    font-weight: bold;
    letter-spacing: 0.5px;
}

.status-success {
    background: rgba(74, 222, 128, 0.15);
    color: #4ade80;
}

.status-pending {
    background: rgba(250, 204, 21, 0.15);
    color: #facc15;
}


/* =========================================
   ACTION ICONS
========================================= */

.action-icons {
    display: flex;
    gap: 10px;
    align-items: center;
}

.action-icons svg {
    width: 15px;
    height: 15px;
    stroke: #888888;
    cursor: pointer;
    transition: 0.2s;
}

.action-icons svg:hover {
    stroke: #FFC3B9;
    transform: scale(1.12);
}

.delete-icon:hover {
    stroke: #ff6b6b !important;
}

.view-icon:hover {
    stroke: #FFC3B9 !important;
}


/* =========================================
   PAGINATION
========================================= */

.pagination-bar {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 15px 20px;
    font-size: 12px;
    color: #888888;
}

.pagination-controls {
    display: flex;
    gap: 5px;
}

.page-btn {
    padding: 6px 12px;
    background: #222222;
    border: 1px solid #333333;
    border-radius: 4px;
    color: #cccccc;
    font-size: 12px;
    cursor: pointer;
    transition: 0.2s;
}

.page-btn:hover:not(:disabled) {
    background: #2a2a2a;
    color: #FFC3B9;
}

.page-btn.active {
    background: #FFC3B9;
    color: #111111;
    border-color: #FFC3B9;
    font-weight: bold;
}

.page-btn:disabled {
    opacity: 0.35;
    cursor: not-allowed;
}


/* =========================================
   VIEW MODAL
========================================= */

.booking-modal-overlay {
    display: none;
    position: fixed;
    inset: 0;
    background: rgba(0,0,0,0.72);
    z-index: 9999;
    align-items: center;
    justify-content: center;
}

.booking-modal-overlay.show {
    display: flex;
}

.booking-modal {
    width: 500px;
    max-width: 92%;
    background: #1c1c1c;
    border: 1px solid #383838;
    border-radius: 9px;
    box-shadow: 0 25px 70px rgba(0,0,0,0.7);
    overflow: hidden;
}

.modal-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    padding: 17px 20px;
    border-bottom: 1px solid #303030;
}

.modal-title {
    color: #FFC3B9;
    font-size: 15px;
    font-weight: 600;
}

.modal-close {
    background: transparent;
    border: none;
    color: #777;
    font-size: 22px;
    cursor: pointer;
    line-height: 1;
}

.modal-close:hover {
    color: #fff;
}

.modal-body {
    padding: 20px;
}

.form-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 14px;
}

.form-group {
    display: flex;
    flex-direction: column;
    gap: 6px;
}

.form-label {
    font-size: 10px;
    color: #888;
    text-transform: uppercase;
    letter-spacing: 0.8px;
}

.form-input,
.form-select {
    height: 35px;
    background: #252525;
    border: 1px solid #383838;
    border-radius: 5px;
    color: #eee;
    padding: 0 10px;
    outline: none;
    font-size: 11px;
}

.form-input:focus,
.form-select:focus {
    border-color: #FFC3B9;
}

.form-input[readonly] {
    color: #cccccc;
    cursor: default;
}

.modal-footer {
    display: flex;
    justify-content: flex-end;
    gap: 9px;
    padding: 15px 20px;
    border-top: 1px solid #303030;
}

.modal-cancel {
    padding: 8px 17px;
    border-radius: 5px;
    cursor: pointer;
    font-size: 11px;
    background: #222;
    color: #ccc;
    border: 1px solid #444;
}

.modal-cancel:hover {
    background: #2c2c2c;
}


/* =========================================
   COMPACT MODE
========================================= */

.compact-mode .data-table tbody td {
    padding-top: 8px;
    padding-bottom: 8px;
}

.compact-mode .data-table thead th {
    padding-top: 8px;
    padding-bottom: 8px;
}


/* =========================================
   EMPTY STATE
========================================= */

.empty-row {
    text-align: center !important;
    padding: 30px !important;
    color: #666 !important;
}


/* =========================================
   RESPONSIVE
========================================= */

@media screen and (max-width: 1100px) {

    .data-table {
        min-width: 1000px;
    }

    .table-wrapper {
        overflow-x: auto;
    }
}

@media screen and (max-width: 900px) {

    .page-container {
        padding: 20px 15px 40px 15px;
    }

    .stats-row {
        grid-template-columns: 1fr;
    }

    .action-bar {
        flex-direction: column;
        align-items: flex-start;
        gap: 12px;
    }

    .table-header {
        flex-direction: column;
        align-items: stretch;
        gap: 12px;
    }

    .table-search {
        width: 100%;
    }

    .table-filters {
        justify-content: flex-end;
    }

    .form-grid {
        grid-template-columns: 1fr;
    }

    .pagination-bar {
        flex-direction: column;
        gap: 12px;
    }
}

</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<script type="text/javascript">

    /* =========================================
       VARIABLES
    ========================================= */

    var currentStatus = "ALL";
    var currentPage = 1;
    var pageSize = 5;
    var viewingRow = null;


    /* =========================================
       PAGE LOAD
    ========================================= */

    document.addEventListener("DOMContentLoaded", function () {

        var hamburger = document.getElementById("mainHamburger");

        if (hamburger) {
            hamburger.style.display = "flex";
        }

        var header = document.querySelector(".cine-header");
        var searchArea = document.querySelector(".header-search-area");

        if (header && searchArea) {

            var oldTitle = document.getElementById("bookingHeaderTitle");

            if (!oldTitle) {

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
        }

        initializeBookingPage();
    });


    /* =========================================
       INITIALIZE
    ========================================= */

    function initializeBookingPage() {

        var rows = document.querySelectorAll("#bookingTableBody tr");

        for (var i = 0; i < rows.length; i++) {

            attachRowEvents(rows[i]);

        }

        updateStats();
        applyFilters();
    }


    /* =========================================
       VIEW / DELETE EVENTS
    ========================================= */

    function attachRowEvents(row) {

        var icons = row.querySelectorAll(".action-icons svg");

        if (icons.length >= 2) {

            icons[0].onclick = function () {
                viewBooking(row);
            };

            icons[1].onclick = function () {
                deleteBooking(row);
            };
        }
    }


    /* =========================================
       STATUS FILTER
    ========================================= */

    function setStatusFilter(status, button) {

        currentStatus = status;
        currentPage = 1;

        var tabs = document.querySelectorAll(".filter-tab");

        for (var i = 0; i < tabs.length; i++) {

            tabs[i].classList.remove("active");

        }

        if (button) {
            button.classList.add("active");
        }

        applyFilters();
    }


    /* =========================================
       SEARCH + FILTER
    ========================================= */

    function applyFilters() {

        var searchInput = document.getElementById("bookingSearch");

        var searchValue = "";

        if (searchInput) {
            searchValue = searchInput.value.toLowerCase().trim();
        }

        var rows = document.querySelectorAll("#bookingTableBody tr");

        var matchingRows = [];

        for (var i = 0; i < rows.length; i++) {

            var row = rows[i];

            if (row.classList.contains("empty-row")) {
                continue;
            }

            var rowText = row.innerText.toLowerCase();

            var statusElement = row.querySelector(".status-badge");

            var rowStatus = "";

            if (statusElement) {
                rowStatus = statusElement.innerText.trim().toUpperCase();
            }

            var statusMatch =
                currentStatus === "ALL" ||
                rowStatus === currentStatus;

            var searchMatch =
                searchValue === "" ||
                rowText.indexOf(searchValue) !== -1;

            if (statusMatch && searchMatch) {

                matchingRows.push(row);

            }

            row.style.display = "none";
        }


        var totalPages = Math.max(
            1,
            Math.ceil(matchingRows.length / pageSize)
        );

        if (currentPage > totalPages) {
            currentPage = totalPages;
        }


        var startIndex = (currentPage - 1) * pageSize;
        var endIndex = startIndex + pageSize;


        for (
            var j = startIndex;
            j < endIndex && j < matchingRows.length;
            j++
        ) {

            matchingRows[j].style.display = "";

        }


        updatePagination(
            matchingRows.length,
            totalPages
        );

        updateShowingText(
            matchingRows.length,
            startIndex,
            endIndex
        );

        showEmptyState(
            matchingRows.length
        );
    }


    /* =========================================
       EMPTY STATE
    ========================================= */

    function showEmptyState(count) {

        var oldEmpty =
            document.getElementById("emptyBookingRow");

        if (oldEmpty) {
            oldEmpty.remove();
        }

        if (count === 0) {

            var tbody =
                document.getElementById("bookingTableBody");

            var row =
                document.createElement("tr");

            row.id =
                "emptyBookingRow";

            row.innerHTML =
                '<td colspan="9" class="empty-row">' +
                'No booking transactions found.' +
                '</td>';

            tbody.appendChild(row);
        }
    }


    /* =========================================
       SEARCH
    ========================================= */

    function searchBookings() {

        currentPage = 1;

        applyFilters();
    }


    /* =========================================
       SETTINGS
    ========================================= */

    function toggleSettings() {

        var message =
            document.getElementById("settingsMessage");

        if (message) {

            message.innerText =
                "Table settings are available.";

            message.classList.toggle("show");

            setTimeout(function () {

                message.classList.remove("show");

            }, 2500);
        }
    }


    /* =========================================
       COMPACT MODE
    ========================================= */

    function toggleCompactMode() {

        var wrapper =
            document.querySelector(".table-wrapper");

        if (wrapper) {

            wrapper.classList.toggle("compact-mode");

        }

        var message =
            document.getElementById("settingsMessage");

        if (message) {

            message.innerText =
                "Table display settings updated.";

            message.classList.add("show");

            setTimeout(function () {

                message.classList.remove("show");

            }, 1800);
        }
    }


    /* =========================================
       VIEW BOOKING
    ========================================= */

    function viewBooking(row) {

        viewingRow = row;

        var cells =
            row.querySelectorAll("td");

        document.getElementById("viewBookingId").value =
            cells[0].innerText.trim();

        document.getElementById("viewMovie").value =
            cells[1].innerText.trim();

        document.getElementById("viewCustomer").value =
            cells[2].innerText.trim();

        document.getElementById("viewTheater").value =
            cells[3].innerText.trim();

        document.getElementById("viewDateTime").value =
            cells[4].innerText.trim();

        document.getElementById("viewSeats").value =
            cells[5].innerText.trim();

        document.getElementById("viewAmount").value =
            cells[6].innerText.trim();

        document.getElementById("viewStatus").value =
            cells[7].innerText.trim().toUpperCase();

        document
            .getElementById("bookingModal")
            .classList.add("show");
    }


    /* =========================================
       DELETE BOOKING
    ========================================= */

    function deleteBooking(row) {

        var cells =
            row.querySelectorAll("td");

        var bookingId =
            cells[0].innerText.trim();

        var customer =
            cells[2].innerText.trim();

        var confirmed =
            confirm(
                "Are you sure you want to delete booking " +
                bookingId +
                " for " +
                customer +
                "?"
            );

        if (!confirmed) {
            return;
        }

        row.remove();

        updateStats();

        applyFilters();

        alert("Booking deleted successfully.");
    }


    /* =========================================
       CLOSE MODAL
    ========================================= */

    function closeBookingModal() {

        viewingRow = null;

        var modal =
            document.getElementById("bookingModal");

        if (modal) {

            modal.classList.remove("show");

        }
    }


    /* =========================================
       CLICK OUTSIDE MODAL
    ========================================= */

    document.addEventListener("click", function (event) {

        var modal =
            document.getElementById("bookingModal");

        if (
            modal &&
            event.target === modal
        ) {

            closeBookingModal();

        }
    });


    /* =========================================
       UPDATE STATS
    ========================================= */

    function updateStats() {

        var rows =
            document.querySelectorAll(
                "#bookingTableBody tr"
            );

        var totalRevenue = 0;
        var totalTransactions = 0;
        var successfulPayments = 0;

        for (var i = 0; i < rows.length; i++) {

            var row = rows[i];

            if (
                row.classList.contains("empty-row")
            ) {
                continue;
            }

            totalTransactions++;

            var cells =
                row.querySelectorAll("td");

            if (cells.length < 8) {
                continue;
            }

            var amountText =
                cells[6].innerText
                    .replace("Rs.", "")
                    .replace(/,/g, "")
                    .trim();

            var amount =
                parseFloat(amountText);

            if (!isNaN(amount)) {
                totalRevenue += amount;
            }

            var status =
                cells[7].innerText
                    .trim()
                    .toUpperCase();

            if (status === "SUCCESS") {
                successfulPayments++;
            }
        }


        var successPercentage =
            totalTransactions > 0
                ? Math.round(
                    (successfulPayments /
                        totalTransactions) * 100
                )
                : 0;


        var statValues =
            document.querySelectorAll(
                ".stat-value"
            );

        if (statValues.length >= 3) {

            statValues[0].innerText =
                "Rs. " +
                formatNumber(totalRevenue);

            statValues[1].innerText =
                totalTransactions;

            statValues[2].innerText =
                successPercentage + "%";
        }
    }


    /* =========================================
       NUMBER FORMAT
    ========================================= */

    function formatNumber(number) {

        return number.toLocaleString("en-IN");
    }


    /* =========================================
       PAGINATION
    ========================================= */

    function updatePagination(
        totalItems,
        totalPages
    ) {

        var controls =
            document.getElementById(
                "paginationControls"
            );

        if (!controls) {
            return;
        }

        controls.innerHTML = "";


        /* PREVIOUS */

        var previous =
            createPageButton(
                "Previous",
                currentPage > 1
            );

        previous.onclick = function () {

            if (currentPage > 1) {

                currentPage--;

                applyFilters();

            }
        };

        controls.appendChild(previous);


        /* PAGE NUMBERS */

        for (
            var page = 1;
            page <= totalPages;
            page++
        ) {

            var pageButton =
                createPageButton(
                    page,
                    true
                );

            if (page === currentPage) {

                pageButton.classList.add("active");

            }

            pageButton.onclick =
                (function (selectedPage) {

                    return function () {

                        currentPage =
                            selectedPage;

                        applyFilters();

                    };

                })(page);

            controls.appendChild(
                pageButton
            );
        }


        /* NEXT */

        var next =
            createPageButton(
                "Next",
                currentPage < totalPages
            );

        next.onclick = function () {

            if (
                currentPage <
                totalPages
            ) {

                currentPage++;

                applyFilters();

            }
        };

        controls.appendChild(next);
    }


    function createPageButton(
        text,
        enabled
    ) {

        var button =
            document.createElement("button");

        button.type = "button";

        button.className =
            "page-btn";

        button.innerText = text;

        button.disabled =
            !enabled;

        return button;
    }


    /* =========================================
       SHOWING TEXT
    ========================================= */

    function updateShowingText(
        total,
        startIndex,
        endIndex
    ) {

        var text =
            document.getElementById(
                "showingText"
            );

        if (!text) {
            return;
        }

        if (total === 0) {

            text.innerText =
                "Showing 0 entries";

            return;
        }

        var start =
            startIndex + 1;

        var end =
            Math.min(
                endIndex,
                total
            );

        text.innerText =
            "Showing " +
            start +
            " to " +
            end +
            " of " +
            total +
            " entries";
    }


    /* =========================================
       EXPORT CSV
    ========================================= */



    /* =========================================
       ESC KEY
    ========================================= */

    document.addEventListener(
        "keydown",
        function (event) {

            if (event.key === "Escape") {

                closeBookingModal();

            }
        }
    );

</script>


<div class="page-container">


    <!-- PAGE SUBTITLE -->

    <div class="page-subtitle">

        Overview and management of all booking payments.

    </div>


    <!-- =========================================
         TOP ACTION BAR
    ========================================= -->

    <div class="action-bar">

        <div class="filter-tabs">

            <button
                type="button"
                class="filter-tab active"
                onclick="setStatusFilter('ALL', this);">

                All

            </button>


            <button
                type="button"
                class="filter-tab"
                onclick="setStatusFilter('PENDING', this);">

                Pending

            </button>


            <button
                type="button"
                class="filter-tab"
                onclick="setStatusFilter('SUCCESS', this);">

                Successful

            </button>

        </div>


       

    </div>


    <!-- =========================================
         STATS CARDS
    ========================================= -->

    <div class="stats-row">

        <div class="stat-card">

            <div class="stat-label">
                Total Revenue
            </div>

            <div class="stat-value">
                Rs. 3,700
            </div>

            <div class="stat-change">
                ↗ +8.2% from last week
            </div>

            <div class="stat-icon pink">
                📊
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-label">
                Total Transactions
            </div>

            <div class="stat-value">
                5
            </div>

            <div class="stat-change">
                ↗ +12.4% from last week
            </div>

            <div class="stat-icon pink">
                📈
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-label">
                Successful Payments
            </div>

            <div class="stat-value">
                40%
            </div>

            <div class="stat-change negative">
                ↘ -0.5% failure rate
            </div>

            <div class="stat-icon green">
                ✔
            </div>

        </div>

    </div>


    <!-- =========================================
         TABLE
    ========================================= -->

    <div class="table-wrapper">


        <!-- TABLE HEADER -->

        <div class="table-header">


            <!-- SEARCH -->

            <div class="table-search">

                <svg
                    viewBox="0 0 24 24"
                    fill="none"
                    stroke="currentColor"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round">

                    <circle
                        cx="11"
                        cy="11"
                        r="8">
                    </circle>

                    <line
                        x1="21"
                        y1="21"
                        x2="16.65"
                        y2="16.65">
                    </line>

                </svg>

                <input
                    id="bookingSearch"
                    type="text"
                    placeholder="Search Booking ID..."
                    onkeyup="searchBookings();" />

            </div>


            <!-- SETTINGS ONLY -->

            <div class="table-filters">

                <div
                    class="filter-icon-btn"
                    title="Table Settings"
                    onclick="toggleSettings();">

                    ⚙

                </div>


                <div
                    id="settingsMessage"
                    class="settings-message">

                    Table settings are available.

                </div>

            </div>

        </div>


        <!-- =========================================
             DATA TABLE
        ========================================= -->

        <table class="data-table">

            <thead>

                <tr>

                    <th>
                        Booking ID
                    </th>

                    <th>
                        Movie
                    </th>

                    <th>
                        Customer Name
                    </th>

                    <th>
                        Theater
                    </th>

                    <th>
                        Date & Time
                    </th>

                    <th>
                        Seats
                    </th>

                    <th>
                        Amount
                    </th>

                    <th>
                        Status
                    </th>

                    <th>
                    </th>

                </tr>

            </thead>


            <tbody id="bookingTableBody">


                <!-- ROW 1 -->

                <tr>

                    <td class="booking-id">
                        CP90481239
                    </td>

                    <td>
                        Jhamkudi
                    </td>

                    <td>
                        Rahul Sharma
                    </td>

                    <td>
                        Cinépolis Alpha One
                    </td>

                    <td>
                        14 Aug, 06:00 PM
                    </td>

                    <td>
                        E7, E8
                    </td>

                    <td>
                        Rs. 700
                    </td>

                    <td>

                        <span class="status-badge status-success">
                            SUCCESS
                        </span>

                    </td>

                    <td>

                        <div class="action-icons">

                            <!-- VIEW -->

                            <svg
                                class="view-icon"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                title="View Booking">

                                <path
                                    d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8S1 12 1 12z">
                                </path>

                                <circle
                                    cx="12"
                                    cy="12"
                                    r="3">
                                </circle>

                            </svg>


                            <!-- DELETE -->

                            <svg
                                class="delete-icon"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                title="Delete">

                                <polyline
                                    points="3 6 5 6 21 6">
                                </polyline>

                                <path
                                    d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                                </path>

                            </svg>

                        </div>

                    </td>

                </tr>


                <!-- ROW 2 -->

                <tr>

                    <td class="booking-id">
                        CP90481240
                    </td>

                    <td>
                        Deadpool & Wolverine
                    </td>

                    <td>
                        Priya Patel
                    </td>

                    <td>
                        PVR Acropolis
                    </td>

                    <td>
                        14 Aug, 09:30 PM
                    </td>

                    <td>
                        P1, P2
                    </td>

                    <td>
                        Rs. 800
                    </td>

                    <td>

                        <span class="status-badge status-pending">
                            PENDING
                        </span>

                    </td>

                    <td>

                        <div class="action-icons">

                            <!-- VIEW -->

                            <svg
                                class="view-icon"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                title="View Booking">

                                <path
                                    d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8S1 12 1 12z">
                                </path>

                                <circle
                                    cx="12"
                                    cy="12"
                                    r="3">
                                </circle>

                            </svg>


                            <!-- DELETE -->

                            <svg
                                class="delete-icon"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                title="Delete">

                                <polyline
                                    points="3 6 5 6 21 6">
                                </polyline>

                                <path
                                    d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                                </path>

                            </svg>

                        </div>

                    </td>

                </tr>


                <!-- ROW 3 -->

                <tr>

                    <td class="booking-id">
                        CP90481241
                    </td>

                    <td>
                        Stree 2
                    </td>

                    <td>
                        Amit Singh
                    </td>

                    <td>
                        INOX: City Gold
                    </td>

                    <td>
                        15 Aug, 12:15 PM
                    </td>

                    <td>
                        G4, G5, G6
                    </td>

                    <td>
                        Rs. 1050
                    </td>

                    <td>

                        <span class="status-badge status-pending">
                            PENDING
                        </span>

                    </td>

                    <td>

                        <div class="action-icons">

                            <!-- VIEW -->

                            <svg
                                class="view-icon"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                title="View Booking">

                                <path
                                    d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8S1 12 1 12z">
                                </path>

                                <circle
                                    cx="12"
                                    cy="12"
                                    r="3">
                                </circle>

                            </svg>


                            <!-- DELETE -->

                            <svg
                                class="delete-icon"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                title="Delete">

                                <polyline
                                    points="3 6 5 6 21 6">
                                </polyline>

                                <path
                                    d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                                </path>

                            </svg>

                        </div>

                    </td>

                </tr>


                <!-- ROW 4 -->

                <tr>

                    <td class="booking-id">
                        CP90481243
                    </td>

                    <td>
                        Kalki 2898 AD
                    </td>

                    <td>
                        Vikas Reddy
                    </td>

                    <td>
                        PVR Acropolis
                    </td>

                    <td>
                        15 Aug, 08:00 PM
                    </td>

                    <td>
                        A1, A2
                    </td>

                    <td>
                        Rs. 800
                    </td>

                    <td>

                        <span class="status-badge status-pending">
                            PENDING
                        </span>

                    </td>

                    <td>

                        <div class="action-icons">

                            <!-- VIEW -->

                            <svg
                                class="view-icon"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                title="View Booking">

                                <path
                                    d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8S1 12 1 12z">
                                </path>

                                <circle
                                    cx="12"
                                    cy="12"
                                    r="3">
                                </circle>

                            </svg>


                            <!-- DELETE -->

                            <svg
                                class="delete-icon"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                title="Delete">

                                <polyline
                                    points="3 6 5 6 21 6">
                                </polyline>

                                <path
                                    d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                                </path>

                            </svg>

                        </div>

                    </td>

                </tr>


                <!-- ROW 5 -->

                <tr>

                    <td class="booking-id">
                        CP90481244
                    </td>

                    <td>
                        Munjya
                    </td>

                    <td>
                        Karan Johar
                    </td>

                    <td>
                        INOX: City Gold
                    </td>

                    <td>
                        16 Aug, 11:00 AM
                    </td>

                    <td>
                        F10
                    </td>

                    <td>
                        Rs. 350
                    </td>

                    <td>

                        <span class="status-badge status-success">
                            SUCCESS
                        </span>

                    </td>

                    <td>

                        <div class="action-icons">

                            <!-- VIEW -->

                            <svg
                                class="view-icon"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                title="View Booking">

                                <path
                                    d="M1 12s4-8 11-8 11 8 11 8-4 8-11 8S1 12 1 12z">
                                </path>

                                <circle
                                    cx="12"
                                    cy="12"
                                    r="3">
                                </circle>

                            </svg>


                            <!-- DELETE -->

                            <svg
                                class="delete-icon"
                                viewBox="0 0 24 24"
                                fill="none"
                                stroke="currentColor"
                                stroke-width="2"
                                title="Delete">

                                <polyline
                                    points="3 6 5 6 21 6">
                                </polyline>

                                <path
                                    d="M19 6v14a2 2 0 0 1-2 2H7a2 2 0 0 1-2-2V6m3 0V4a2 2 0 0 1 2-2h4a2 2 0 0 1 2 2v2">
                                </path>

                            </svg>

                        </div>

                    </td>

                </tr>

            </tbody>

        </table>


        <!-- PAGINATION -->

        <div class="pagination-bar">

            <div id="showingText">
                Showing 1 to 5 of 5 entries
            </div>

            <div
                id="paginationControls"
                class="pagination-controls">
            </div>

        </div>

    </div>

</div>


<!-- =========================================
     VIEW BOOKING MODAL
========================================= -->

<div
    id="bookingModal"
    class="booking-modal-overlay">

    <div class="booking-modal">

        <div class="modal-header">

            <div class="modal-title">
                View Booking
            </div>

            <button
                type="button"
                class="modal-close"
                onclick="closeBookingModal();">

                ×

            </button>

        </div>


        <div class="modal-body">

            <div class="form-grid">


                <div class="form-group">

                    <label class="form-label">
                        Booking ID
                    </label>

                    <input
                        id="viewBookingId"
                        class="form-input"
                        type="text"
                        readonly />

                </div>


                <div class="form-group">

                    <label class="form-label">
                        Movie
                    </label>

                    <input
                        id="viewMovie"
                        class="form-input"
                        type="text"
                        readonly />

                </div>


                <div class="form-group">

                    <label class="form-label">
                        Customer Name
                    </label>

                    <input
                        id="viewCustomer"
                        class="form-input"
                        type="text"
                        readonly />

                </div>


                <div class="form-group">

                    <label class="form-label">
                        Theater
                    </label>

                    <input
                        id="viewTheater"
                        class="form-input"
                        type="text"
                        readonly />

                </div>


                <div class="form-group">

                    <label class="form-label">
                        Date & Time
                    </label>

                    <input
                        id="viewDateTime"
                        class="form-input"
                        type="text"
                        readonly />

                </div>


                <div class="form-group">

                    <label class="form-label">
                        Seats
                    </label>

                    <input
                        id="viewSeats"
                        class="form-input"
                        type="text"
                        readonly />

                </div>


                <div class="form-group">

                    <label class="form-label">
                        Amount
                    </label>

                    <input
                        id="viewAmount"
                        class="form-input"
                        type="text"
                        readonly />

                </div>


                <div class="form-group">

                    <label class="form-label">
                        Status
                    </label>

                    <input
                        id="viewStatus"
                        class="form-input"
                        type="text"
                        readonly />

                </div>

            </div>

        </div>


        <div class="modal-footer">

            <button
                type="button"
                class="modal-cancel"
                onclick="closeBookingModal();">

                Close

            </button>

        </div>

    </div>

</div>

</asp:Content>