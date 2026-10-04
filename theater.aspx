<%@ Page Title="Theater" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="theater.aspx.cs" Inherits="WebApplication2.theater" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>

*{
    box-sizing:border-box;
}

/* ==============================
   MAIN PAGE
================================ */

.theater-page{
    min-height:100vh;
    background:#111111;
    color:#ffffff;
    padding:25px 35px 45px 35px;
    font-family:Arial,Helvetica,sans-serif;
}

/* ==============================
   SECTION
================================ */

.theater-section{
    margin-bottom:30px;
}

.section-header{
    display:flex;
    align-items:center;
    justify-content:space-between;
    margin-bottom:12px;
}

.section-heading{
    margin:0;
    color:#eeeeee;
    font-size:16px;
    font-weight:600;
}

.section-description{
    margin:5px 0 0 0;
    color:#8c8c8c;
    font-size:10px;
}

/* ==============================
   ADD BUTTON
================================ */

.add-button{
    background:#ff111c;
    color:#ffffff;
    border:none;
    border-radius:4px;
    padding:8px 14px;
    font-size:11px;
    cursor:pointer;
    white-space:nowrap;
    font-weight:500;
    transition:.2s;
}

.add-button:hover{
    background:#d90009;
    transform:translateY(-1px);
}

/* ==============================
   TABLE BOX
================================ */

.table-box{
    width:100%;
    background:#181818;
    border:1px solid #303030;
    border-radius:5px;
    overflow:hidden;
}

/* ==============================
   TABLE
================================ */

.theater-table{
    width:100%;
    border-collapse:collapse;
    table-layout:auto;
}

.theater-table th{
    height:42px;
    background:#1b1b1b;
    color:#d2a7a7;
    font-size:10px;
    font-weight:500;
    letter-spacing:.7px;
    text-align:left;
    padding:0 15px;
    border-bottom:1px solid #303030;
    text-transform:uppercase;
}

.theater-table td{
    height:52px;
    padding:10px 15px;
    color:#c6c6c6;
    font-size:11px;
    border-bottom:1px solid #292929;
    vertical-align:middle;
}

.theater-table tr:last-child td{
    border-bottom:none;
}

.theater-table tbody tr:hover td{
    background:#202020;
}

/* ==============================
   COLUMNS
================================ */

.number{
    width:32px;
    color:#777777 !important;
}

.theater-name{
    color:#eeeeee !important;
    font-weight:500;
    white-space:nowrap;
}

.location{
    color:#b8b8b8 !important;
    white-space:nowrap;
}

/* ==============================
   AMENITIES
================================ */

.amenities{
    display:flex;
    flex-wrap:wrap;
    gap:5px;
}

.amenity{
    display:inline-block;
    background:#333333;
    color:#c9b2b2;
    border-radius:3px;
    padding:4px 8px;
    font-size:9px;
    white-space:nowrap;
}

/* ==============================
   ACTIONS
================================ */

.actions{
    text-align:right;
    white-space:nowrap;
}

.edit-button{
    background:transparent;
    color:#dddddd;
    border:1px solid #604444;
    border-radius:3px;
    padding:6px 12px;
    font-size:10px;
    cursor:pointer;
    transition:.2s;
}

.edit-button:hover{
    background:#333333;
    color:#ffffff;
}

.delete-button{
    background:#ff111c;
    color:#ffffff;
    border:1px solid #ff111c;
    border-radius:3px;
    padding:6px 12px;
    font-size:10px;
    margin-left:6px;
    cursor:pointer;
    transition:.2s;
}

.delete-button:hover{
    background:#d90009;
    border-color:#d90009;
}

/* ==============================
   MOVIE SHOWING
================================ */

.movie-name{
    color:#eeeeee !important;
    font-weight:500;
    white-space:nowrap;
}

.format{
    color:#bbbbbb !important;
    white-space:nowrap;
}

.show-time{
    color:#bcbcbc !important;
    white-space:nowrap;
}

/* ==============================
   SIGNATURE FEATURES
================================ */

.features{
    display:flex;
    flex-wrap:wrap;
    gap:5px;
    max-width:230px;
}

.feature{
    background:#333333;
    color:#c7c7c7;
    padding:4px 8px;
    border-radius:3px;
    font-size:9px;
}

.signature-time{
    color:#bbbbbb;
    font-size:10px;
    line-height:1.6;
}

/* ==============================
   HAMBURGER
================================ */

.home-hamburger{
    display:flex;
    flex-direction:column;
    justify-content:center;
    gap:4px;
    width:24px;
    height:24px;
    cursor:pointer;
    flex-shrink:0;
}

.home-hamburger span{
    display:block;
    width:20px;
    height:2px;
    background:#FFC3B9;
    border-radius:2px;
    transition:.2s;
}

.home-hamburger:hover span{
    background:#ffb0a3;
}

/* ==============================
   MODAL
================================ */

.theater-modal{
    display:none;
    position:fixed;
    z-index:99999;
    left:0;
    top:0;
    width:100%;
    height:100%;
    background:rgba(0,0,0,.72);
    align-items:center;
    justify-content:center;
}

.theater-modal.show{
    display:flex;
}

.modal-card{
    width:410px;
    max-width:92%;
    background:#242424;
    border:1px solid #3c3c3c;
    border-radius:8px;
    box-shadow:0 20px 60px rgba(0,0,0,.7);
    overflow:hidden;
}

.modal-header{
    height:52px;
    padding:0 18px;
    display:flex;
    align-items:center;
    justify-content:space-between;
    background:#292929;
    border-bottom:1px solid #3b3b3b;
}

.modal-title{
    color:#ffffff;
    font-size:14px;
    font-weight:600;
}

.modal-close{
    border:none;
    background:transparent;
    color:#999999;
    font-size:21px;
    cursor:pointer;
}

.modal-close:hover{
    color:#ffffff;
}

.modal-body{
    padding:20px;
}

.modal-field{
    margin-bottom:14px;
}

.modal-field label{
    display:block;
    color:#999999;
    font-size:10px;
    text-transform:uppercase;
    letter-spacing:.5px;
    margin-bottom:6px;
}

.modal-field input,
.modal-field textarea,
.modal-field select{
    width:100%;
    background:#171717;
    border:1px solid #3c3c3c;
    color:#ffffff;
    border-radius:4px;
    outline:none;
    padding:9px 10px;
    font-family:Arial,Helvetica,sans-serif;
    font-size:11px;
}

.modal-field input{
    height:35px;
}

.modal-field textarea{
    min-height:65px;
    resize:none;
}

.modal-field input:focus,
.modal-field textarea:focus,
.modal-field select:focus{
    border-color:#777777;
}

.modal-buttons{
    display:flex;
    justify-content:flex-end;
    gap:8px;
    margin-top:20px;
}

.modal-cancel{
    height:34px;
    padding:0 15px;
    background:#303030;
    color:#cccccc;
    border:1px solid #454545;
    border-radius:4px;
    font-size:10px;
    cursor:pointer;
}

.modal-save{
    height:34px;
    padding:0 18px;
    background:#ff111c;
    color:#ffffff;
    border:1px solid #ff111c;
    border-radius:4px;
    font-size:10px;
    cursor:pointer;
}

.modal-save:hover{
    background:#d90009;
}

/* ==============================
   DELETE MODAL
================================ */

.delete-card{
    width:340px;
    max-width:92%;
    background:#242424;
    border:1px solid #3c3c3c;
    border-radius:8px;
    padding:25px;
    text-align:center;
}

.delete-icon{
    width:42px;
    height:42px;
    margin:0 auto 14px;
    border-radius:50%;
    background:#421b1b;
    color:#ff5555;
    display:flex;
    align-items:center;
    justify-content:center;
    font-size:19px;
}

.delete-title{
    color:#ffffff;
    font-size:15px;
    margin-bottom:8px;
}

.delete-text{
    color:#999999;
    font-size:11px;
    line-height:17px;
}

.delete-actions{
    margin-top:20px;
    display:flex;
    justify-content:center;
    gap:8px;
}

.delete-cancel{
    height:34px;
    padding:0 18px;
    background:#303030;
    border:1px solid #454545;
    color:#cccccc;
    border-radius:4px;
    cursor:pointer;
    font-size:10px;
}

.delete-confirm{
    height:34px;
    padding:0 18px;
    background:#ff111c;
    border:1px solid #ff111c;
    color:#ffffff;
    border-radius:4px;
    cursor:pointer;
    font-size:10px;
}

.delete-confirm:hover{
    background:#d90009;
}

/* ==============================
   TOAST
================================ */

.theater-toast{
    position:fixed;
    right:25px;
    bottom:25px;
    z-index:100000;
    background:#292929;
    border:1px solid #444444;
    color:#eeeeee;
    padding:12px 18px;
    border-radius:5px;
    font-size:11px;
    box-shadow:0 8px 25px rgba(0,0,0,.5);
    display:none;
}

.theater-toast.show{
    display:block;
    animation:toastIn .25s ease;
}

@keyframes toastIn{
    from{
        opacity:0;
        transform:translateY(10px);
    }
    to{
        opacity:1;
        transform:translateY(0);
    }
}

/* ==============================
   RESPONSIVE
================================ */

@media screen and (max-width:1000px){

    .theater-page{
        padding:20px 18px 40px 18px;
    }

    .theater-table{
        min-width:750px;
    }

    .table-box{
        overflow-x:auto;
    }
}

@media screen and (max-width:700px){

    .section-header{
        flex-direction:column;
        align-items:flex-start;
        gap:10px;
    }

    .section-heading{
        font-size:15px;
    }
}

</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<script>

    document.addEventListener("DOMContentLoaded", function () {

        /* SHOW HAMBURGER */

        var hamburger = document.getElementById("mainHamburger");

        if (hamburger) {
            hamburger.style.display = "flex";
        }


        /* HEADER TITLE */

        var header = document.querySelector(".cine-header");
        var searchArea = document.querySelector(".header-search-area");

        if (header && searchArea) {

            var oldTitle = header.querySelector(".theater-header-title");

            if (!oldTitle) {

                var titleEl = document.createElement("div");

                titleEl.className = "theater-header-title";
                titleEl.innerText = "Theater Management";

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


    /* =========================================================
       VARIABLES
    ========================================================= */

    var currentAction = "";
    var currentRow = null;
    var currentDeleteType = "";
    var currentDeleteRow = null;


    /* =========================================================
       OPEN ADD THEATER
    ========================================================= */

    function addTheater() {

        currentAction = "addTheater";

        document.getElementById("modalTitle").innerText = "Add Theater";

        document.getElementById("theaterName").value = "";
        document.getElementById("theaterLocation").value = "";
        document.getElementById("theaterAmenities").value = "";

        document.getElementById("theaterModal").classList.add("show");
    }


    /* =========================================================
       EDIT THEATER
    ========================================================= */

    function editTheater(button) {

        currentAction = "editTheater";
        currentRow = button.closest("tr");

        var cells = currentRow.cells;

        document.getElementById("modalTitle").innerText = "Edit Theater";

        document.getElementById("theaterName").value =
            cells[1].innerText.trim();

        document.getElementById("theaterLocation").value =
            cells[2].innerText.trim();

        var amenities = [];

        cells[3].querySelectorAll(".amenity").forEach(function (item) {

            amenities.push(item.innerText.trim());

        });

        document.getElementById("theaterAmenities").value =
            amenities.join(", ");

        document.getElementById("theaterModal").classList.add("show");
    }


    /* =========================================================
       SAVE THEATER
    ========================================================= */

    function saveTheater() {

        var name =
            document.getElementById("theaterName").value.trim();

        var location =
            document.getElementById("theaterLocation").value.trim();

        var amenities =
            document.getElementById("theaterAmenities").value.trim();


        if (name === "" || location === "") {

            alert("Please enter Theater Name and Location.");

            return;
        }


        if (currentAction === "addTheater") {

            var table =
                document.querySelector("#theaterTable tbody");

            var row =
                table.insertRow(-1);

            var rowNumber =
                table.rows.length;


            row.innerHTML =

                '<td class="number">' +
                rowNumber +
                '</td>' +

                '<td class="theater-name">' +
                escapeHtml(name) +
                '</td>' +

                '<td class="location">' +
                escapeHtml(location) +
                '</td>' +

                '<td>' +
                createAmenityHTML(amenities) +
                '</td>' +

                '<td class="actions">' +

                '<button type="button" class="edit-button" onclick="editTheater(this)">✎ Edit</button>' +

                '<button type="button" class="delete-button" onclick="deleteTheater(this)">🗑 Delete</button>' +

                '</td>';


            showToast("Theater added successfully.");

        }

        else if (currentAction === "editTheater") {

            var cells = currentRow.cells;

            cells[1].innerText = name;

            cells[2].innerText = location;

            cells[3].innerHTML =
                createAmenityHTML(amenities);

            showToast("Theater updated successfully.");
        }


        closeTheaterModal();

        updateTheaterCount();
    }


    /* =========================================================
       DELETE THEATER
    ========================================================= */

    function deleteTheater(button) {

        currentDeleteType = "theater";
        currentDeleteRow = button.closest("tr");

        var name =
            currentDeleteRow.cells[1].innerText.trim();

        document.getElementById("deleteItemName").innerText =
            name;

        document.getElementById("deleteModal").classList.add("show");
    }


    /* =========================================================
       ADD SHOWING
    ========================================================= */

    function addShowing() {

        currentAction = "addShowing";
        currentRow = null;

        document.getElementById("showingModalTitle").innerText =
            "Add Movie Showing";

        document.getElementById("showMovie").value = "";
        document.getElementById("showFormat").value = "";
        document.getElementById("showTiming").value = "";

        document.getElementById("showingModal").classList.add("show");
    }


    /* =========================================================
       EDIT SHOWING
    ========================================================= */

    function editShowing(button) {

        currentAction = "editShowing";
        currentRow = button.closest("tr");

        var cells = currentRow.cells;

        document.getElementById("showingModalTitle").innerText =
            "Edit Movie Showing";

        document.getElementById("showMovie").value =
            cells[1].innerText.trim();

        document.getElementById("showFormat").value =
            cells[2].innerText.trim();

        document.getElementById("showTiming").value =
            cells[3].innerText.trim();

        document.getElementById("showingModal").classList.add("show");
    }


    /* =========================================================
       SAVE SHOWING
    ========================================================= */

    function saveShowing() {

        var movie =
            document.getElementById("showMovie").value.trim();

        var format =
            document.getElementById("showFormat").value.trim();

        var timing =
            document.getElementById("showTiming").value.trim();


        if (movie === "" || format === "" || timing === "") {

            alert("Please fill all fields.");

            return;
        }


        if (currentAction === "addShowing") {

            var table =
                document.querySelector("#showingTable tbody");

            var row =
                table.insertRow(-1);

            var rowNumber =
                table.rows.length;


            row.innerHTML =

                '<td class="number">' +
                rowNumber +
                '</td>' +

                '<td class="movie-name">' +
                escapeHtml(movie) +
                '</td>' +

                '<td class="format">' +
                escapeHtml(format) +
                '</td>' +

                '<td class="show-time">' +
                escapeHtml(timing) +
                '</td>' +

                '<td class="actions">' +

                '<button type="button" class="edit-button" onclick="editShowing(this)">✎ Edit</button>' +

                '<button type="button" class="delete-button" onclick="deleteShowing(this)">🗑 Delete</button>' +

                '</td>';


            showToast("Movie showing added successfully.");

        }

        else if (currentAction === "editShowing") {

            var cells = currentRow.cells;

            cells[1].innerText = movie;
            cells[2].innerText = format;
            cells[3].innerText = timing;

            showToast("Movie showing updated successfully.");
        }


        closeShowingModal();
    }


    /* =========================================================
       DELETE SHOWING
    ========================================================= */

    function deleteShowing(button) {

        currentDeleteType = "showing";
        currentDeleteRow = button.closest("tr");

        var name =
            currentDeleteRow.cells[1].innerText.trim();

        document.getElementById("deleteItemName").innerText =
            name;

        document.getElementById("deleteModal").classList.add("show");
    }


    /* =========================================================
       ADD SIGNATURE SCREEN
    ========================================================= */

    function addSignatureScreen() {

        currentAction = "addSignature";
        currentRow = null;

        document.getElementById("signatureModalTitle").innerText =
            "Add Signature Screen";

        document.getElementById("signatureMovie").value = "";
        document.getElementById("signatureFormat").value = "";
        document.getElementById("signatureFeatures").value = "";
        document.getElementById("signatureTiming").value = "";

        document.getElementById("signatureModal").classList.add("show");
    }


    /* =========================================================
       EDIT SIGNATURE SCREEN
    ========================================================= */

    function editSignature(button) {

        currentAction = "editSignature";
        currentRow = button.closest("tr");

        var cells = currentRow.cells;

        document.getElementById("signatureModalTitle").innerText =
            "Edit Signature Screen";

        document.getElementById("signatureMovie").value =
            cells[1].innerText.trim();

        document.getElementById("signatureFormat").value =
            cells[2].innerText.trim();


        var features = [];

        cells[3].querySelectorAll(".feature").forEach(function (item) {

            features.push(item.innerText.trim());

        });

        document.getElementById("signatureFeatures").value =
            features.join(", ");


        document.getElementById("signatureTiming").value =
            cells[4].innerText.trim();

        document.getElementById("signatureModal").classList.add("show");
    }


    /* =========================================================
       SAVE SIGNATURE
    ========================================================= */

    function saveSignature() {

        var movie =
            document.getElementById("signatureMovie").value.trim();

        var format =
            document.getElementById("signatureFormat").value.trim();

        var features =
            document.getElementById("signatureFeatures").value.trim();

        var timing =
            document.getElementById("signatureTiming").value.trim();


        if (movie === "" || format === "" || timing === "") {

            alert("Please fill Movie, Format and Show Timings.");

            return;
        }


        if (currentAction === "addSignature") {

            var table =
                document.querySelector("#signatureTable tbody");

            var row =
                table.insertRow(-1);

            var rowNumber =
                table.rows.length;


            row.innerHTML =

                '<td class="number">' +
                rowNumber +
                '</td>' +

                '<td class="movie-name">' +
                escapeHtml(movie) +
                '</td>' +

                '<td class="format">' +
                escapeHtml(format) +
                '</td>' +

                '<td>' +
                createFeatureHTML(features) +
                '</td>' +

                '<td class="signature-time">' +
                escapeHtml(timing) +
                '</td>' +

                '<td class="actions">' +

                '<button type="button" class="edit-button" onclick="editSignature(this)">✎ Edit</button>' +

                '<button type="button" class="delete-button" onclick="deleteSignature(this)">🗑 Delete</button>' +

                '</td>';


            showToast("Signature screen added successfully.");

        }

        else if (currentAction === "editSignature") {

            var cells = currentRow.cells;

            cells[1].innerText = movie;
            cells[2].innerText = format;

            cells[3].innerHTML =
                createFeatureHTML(features);

            cells[4].innerText = timing;

            showToast("Signature screen updated successfully.");
        }


        closeSignatureModal();
    }


    /* =========================================================
       DELETE SIGNATURE
    ========================================================= */

    function deleteSignature(button) {

        currentDeleteType = "signature";
        currentDeleteRow = button.closest("tr");

        var name =
            currentDeleteRow.cells[1].innerText.trim();

        document.getElementById("deleteItemName").innerText =
            name;

        document.getElementById("deleteModal").classList.add("show");
    }


    /* =========================================================
       CONFIRM DELETE
    ========================================================= */

    function confirmDelete() {

        if (!currentDeleteRow) {

            closeDeleteModal();

            return;
        }


        var deletedName =
            currentDeleteRow.cells[1].innerText.trim();


        currentDeleteRow.remove();


        if (currentDeleteType === "theater") {

            renumberTable("#theaterTable");

            updateTheaterCount();

            showToast(
                "Theater \"" +
                deletedName +
                "\" deleted successfully."
            );
        }

        else if (currentDeleteType === "showing") {

            renumberTable("#showingTable");

            showToast(
                "Showing \"" +
                deletedName +
                "\" deleted successfully."
            );
        }

        else if (currentDeleteType === "signature") {

            renumberTable("#signatureTable");

            showToast(
                "Signature screen \"" +
                deletedName +
                "\" deleted successfully."
            );
        }


        currentDeleteRow = null;

        closeDeleteModal();
    }


    /* =========================================================
       CREATE AMENITY HTML
    ========================================================= */

    function createAmenityHTML(value) {

        if (!value) {
            return '<div class="amenities"></div>';
        }

        var items =
            value.split(",");

        var html =
            '<div class="amenities">';


        items.forEach(function (item) {

            item = item.trim();

            if (item !== "") {

                html +=
                    '<span class="amenity">' +
                    escapeHtml(item) +
                    '</span>';
            }

        });


        html += "</div>";

        return html;
    }


    /* =========================================================
       CREATE FEATURE HTML
    ========================================================= */

    function createFeatureHTML(value) {

        if (!value) {
            return '<div class="features"></div>';
        }

        var items =
            value.split(",");

        var html =
            '<div class="features">';


        items.forEach(function (item) {

            item = item.trim();

            if (item !== "") {

                html +=
                    '<span class="feature">' +
                    escapeHtml(item) +
                    '</span>';
            }

        });


        html += "</div>";

        return html;
    }


    /* =========================================================
       ESCAPE HTML
    ========================================================= */

    function escapeHtml(text) {

        var div =
            document.createElement("div");

        div.textContent = text;

        return div.innerHTML;
    }


    /* =========================================================
       RENUMBER TABLE
    ========================================================= */

    function renumberTable(tableId) {

        var rows =
            document.querySelectorAll(
                tableId + " tbody tr"
            );


        rows.forEach(function (row, index) {

            row.cells[0].innerText =
                index + 1;

        });
    }


    /* =========================================================
       UPDATE THEATER COUNT
    ========================================================= */

    function updateTheaterCount() {

        var rows =
            document.querySelectorAll(
                "#theaterTable tbody tr"
            );

        var count =
            document.getElementById("theaterCount");

        if (count) {

            count.innerText =
                rows.length +
                " Theaters Active";
        }
    }


    /* =========================================================
       CLOSE MODALS
    ========================================================= */

    function closeTheaterModal() {

        document
            .getElementById("theaterModal")
            .classList.remove("show");
    }


    function closeShowingModal() {

        document
            .getElementById("showingModal")
            .classList.remove("show");
    }


    function closeSignatureModal() {

        document
            .getElementById("signatureModal")
            .classList.remove("show");
    }


    function closeDeleteModal() {

        document
            .getElementById("deleteModal")
            .classList.remove("show");
    }


    /* =========================================================
       TOAST
    ========================================================= */

    function showToast(message) {

        var toast =
            document.getElementById("theaterToast");

        toast.innerText = message;

        toast.classList.add("show");


        setTimeout(function () {

            toast.classList.remove("show");

        }, 2500);
    }


    /* =========================================================
       CLOSE MODAL WHEN CLICK OUTSIDE
    ========================================================= */

    window.addEventListener("click", function (event) {

        if (event.target.classList.contains("theater-modal")) {

            event.target.classList.remove("show");
        }

    });

</script>


<div class="theater-page">


<!-- =====================================================
     THEATER LISTINGS
===================================================== -->

<div class="theater-section">

    <div class="section-header">

        <div>

            <h2 class="section-heading">
                Theater Listings
            </h2>

            <p class="section-description">
                Manage theater locations and amenities.
            </p>

        </div>

        <button type="button"
                class="add-button"
                onclick="addTheater()">

            + Add Theater

        </button>

    </div>


    <div class="table-box">

        <table class="theater-table"
               id="theaterTable">

            <thead>

                <tr>

                    <th style="width:35px;">
                        #
                    </th>

                    <th>
                        Theater Name
                    </th>

                    <th>
                        Location
                    </th>

                    <th>
                        Amenities
                    </th>

                    <th style="text-align:right;">
                        Actions
                    </th>

                </tr>

            </thead>


            <tbody>

                <tr>

                    <td class="number">
                        1
                    </td>

                    <td class="theater-name">
                        Cineplus Downtown
                    </td>

                    <td class="location">
                        Mumbai, MH
                    </td>

                    <td>

                        <div class="amenities">

                            <span class="amenity">
                                IMAX
                            </span>

                            <span class="amenity">
                                ATMOS
                            </span>

                        </div>

                    </td>

                    <td class="actions">

                        <button type="button"
                                class="edit-button"
                                onclick="editTheater(this)">
                            ✎ Edit
                        </button>

                        <button type="button"
                                class="delete-button"
                                onclick="deleteTheater(this)">
                            🗑 Delete
                        </button>

                    </td>

                </tr>


                <tr>

                    <td class="number">
                        2
                    </td>

                    <td class="theater-name">
                        Cineplus Westside
                    </td>

                    <td class="location">
                        Ahmedabad, GJ
                    </td>

                    <td>

                        <div class="amenities">

                            <span class="amenity">
                                ATMOS
                            </span>

                            <span class="amenity">
                                GOLD CLASS
                            </span>

                        </div>

                    </td>

                    <td class="actions">

                        <button type="button"
                                class="edit-button"
                                onclick="editTheater(this)">
                            ✎ Edit
                        </button>

                        <button type="button"
                                class="delete-button"
                                onclick="deleteTheater(this)">
                            🗑 Delete
                        </button>

                    </td>

                </tr>


                <tr>

                    <td class="number">
                        3
                    </td>

                    <td class="theater-name">
                        Cineplus Metro
                    </td>

                    <td class="location">
                        Bengaluru, KA
                    </td>

                    <td>

                        <div class="amenities">

                            <span class="amenity">
                                IMAX
                            </span>

                        </div>

                    </td>

                    <td class="actions">

                        <button type="button"
                                class="edit-button"
                                onclick="editTheater(this)">
                            ✎ Edit
                        </button>

                        <button type="button"
                                class="delete-button"
                                onclick="deleteTheater(this)">
                            🗑 Delete
                        </button>

                    </td>

                </tr>


                <tr>

                    <td class="number">
                        4
                    </td>

                    <td class="theater-name">
                        Cineplus Grand
                    </td>

                    <td class="location">
                        New Delhi, DL
                    </td>

                    <td>

                        <div class="amenities">

                            <span class="amenity">
                                IMAX
                            </span>

                            <span class="amenity">
                                ATMOS
                            </span>

                            <span class="amenity">
                                LUXE
                            </span>

                        </div>

                    </td>

                    <td class="actions">

                        <button type="button"
                                class="edit-button"
                                onclick="editTheater(this)">
                            ✎ Edit
                        </button>

                        <button type="button"
                                class="delete-button"
                                onclick="deleteTheater(this)">
                            🗑 Delete
                        </button>

                    </td>

                </tr>

            </tbody>

        </table>

    </div>

</div>



<!-- =====================================================
     MOVIE SHOWINGS
===================================================== -->

<div class="theater-section">

    <div class="section-header">

        <div>

            <h2 class="section-heading">
                Movie Showings
            </h2>

            <p class="section-description">
                Manage signature screens and show timings.
            </p>

        </div>

        <button type="button"
                class="add-button"
                onclick="addShowing()">

            + Add Showing

        </button>

    </div>


    <div class="table-box">

        <table class="theater-table"
               id="showingTable">

            <thead>

                <tr>

                    <th style="width:35px;">
                        #
                    </th>

                    <th>
                        Movie
                    </th>

                    <th>
                        Format
                    </th>

                    <th>
                        Show Timings
                    </th>

                    <th style="text-align:right;">
                        Actions
                    </th>

                </tr>

            </thead>


            <tbody>

                <tr>

                    <td class="number">
                        1
                    </td>

                    <td class="movie-name">
                        Dune: Part Two
                    </td>

                    <td class="format">
                        IMAX 70mm
                    </td>

                    <td class="show-time">
                        10:00 AM, 02:30 PM, 07:00 PM
                    </td>

                    <td class="actions">

                        <button type="button"
                                class="edit-button"
                                onclick="editShowing(this)">
                            ✎ Edit
                        </button>

                        <button type="button"
                                class="delete-button"
                                onclick="deleteShowing(this)">
                            🗑 Delete
                        </button>

                    </td>

                </tr>


                <tr>

                    <td class="number">
                        2
                    </td>

                    <td class="movie-name">
                        Oppenheimer
                    </td>

                    <td class="format">
                        IMAX
                    </td>

                    <td class="show-time">
                        11:15 AM, 04:00 PM, 08:45 PM
                    </td>

                    <td class="actions">

                        <button type="button"
                                class="edit-button"
                                onclick="editShowing(this)">
                            ✎ Edit
                        </button>

                        <button type="button"
                                class="delete-button"
                                onclick="deleteShowing(this)">
                            🗑 Delete
                        </button>

                    </td>

                </tr>

            </tbody>

        </table>

    </div>

</div>



<!-- =====================================================
     SIGNATURE SCREEN
===================================================== -->

<div class="theater-section">

    <div class="section-header">

        <div>

            <h2 class="section-heading">
                Signature Screens Management
            </h2>

            <p class="section-description">
                Manage premium viewing formats and signature experiences.
            </p>

        </div>

        <button type="button"
                class="add-button"
                onclick="addSignatureScreen()">

            + Add Signature Screen

        </button>

    </div>


    <div class="table-box">

        <table class="theater-table"
               id="signatureTable">

            <thead>

                <tr>

                    <th style="width:35px;">
                        #
                    </th>

                    <th>
                        Movie
                    </th>

                    <th>
                        Format
                    </th>

                    <th>
                        Features
                    </th>

                    <th>
                        Show Timings
                    </th>

                    <th style="text-align:right;">
                        Actions
                    </th>

                </tr>

            </thead>


            <tbody>

                <tr>

                    <td class="number">
                        1
                    </td>

                    <td class="movie-name">
                        FIGHTER
                    </td>

                    <td class="format">
                        IMAX
                    </td>

                    <td>

                        <div class="features">

                            <span class="feature">
                                Expanded Ratio
                            </span>

                            <span class="feature">
                                12-Channel Sound
                            </span>

                        </div>

                    </td>

                    <td class="signature-time">
                        2:30 PM, 6:00 PM (Book Now), 9:45 PM
                    </td>

                    <td class="actions">

                        <button type="button"
                                class="edit-button"
                                onclick="editSignature(this)">
                            ✎ Edit
                        </button>

                        <button type="button"
                                class="delete-button"
                                onclick="deleteSignature(this)">
                            🗑 Delete
                        </button>

                    </td>

                </tr>


                <tr>

                    <td class="number">
                        2
                    </td>

                    <td class="movie-name">
                        JAWAN
                    </td>

                    <td class="format">
                        4DX
                    </td>

                    <td>

                        <div class="features">

                            <span class="feature">
                                Dolby Vision
                            </span>

                            <span class="feature">
                                Dolby Atmos
                            </span>

                        </div>

                    </td>

                    <td class="signature-time">
                        12:00 PM, 08:00 PM, 10:00 AM (Book Now)
                    </td>

                    <td class="actions">

                        <button type="button"
                                class="edit-button"
                                onclick="editSignature(this)">
                            ✎ Edit
                        </button>

                        <button type="button"
                                class="delete-button"
                                onclick="deleteSignature(this)">
                            🗑 Delete
                        </button>

                    </td>

                </tr>

            </tbody>

        </table>

    </div>

</div>


</div>



<!-- =====================================================
     ADD / EDIT THEATER MODAL
===================================================== -->

<div id="theaterModal"
     class="theater-modal">

    <div class="modal-card">

        <div class="modal-header">

            <div id="modalTitle"
                 class="modal-title">
                Add Theater
            </div>

            <button type="button"
                    class="modal-close"
                    onclick="closeTheaterModal()">
                ×
            </button>

        </div>


        <div class="modal-body">

            <div class="modal-field">

                <label>
                    Theater Name
                </label>

                <input type="text"
                       id="theaterName"
                       placeholder="Enter theater name" />

            </div>


            <div class="modal-field">

                <label>
                    Location
                </label>

                <input type="text"
                       id="theaterLocation"
                       placeholder="Enter city and state" />

            </div>


            <div class="modal-field">

                <label>
                    Amenities
                </label>

                <input type="text"
                       id="theaterAmenities"
                       placeholder="IMAX, ATMOS, GOLD CLASS" />

            </div>


            <div class="modal-buttons">

                <button type="button"
                        class="modal-cancel"
                        onclick="closeTheaterModal()">
                    Cancel
                </button>

                <button type="button"
                        class="modal-save"
                        onclick="saveTheater()">
                    Save Theater
                </button>

            </div>

        </div>

    </div>

</div>



<!-- =====================================================
     ADD / EDIT SHOWING MODAL
===================================================== -->

<div id="showingModal"
     class="theater-modal">

    <div class="modal-card">

        <div class="modal-header">

            <div id="showingModalTitle"
                 class="modal-title">
                Add Movie Showing
            </div>

            <button type="button"
                    class="modal-close"
                    onclick="closeShowingModal()">
                ×
            </button>

        </div>


        <div class="modal-body">

            <div class="modal-field">

                <label>
                    Movie
                </label>

                <input type="text"
                       id="showMovie"
                       placeholder="Enter movie name" />

            </div>


            <div class="modal-field">

                <label>
                    Format
                </label>

                <input type="text"
                       id="showFormat"
                       placeholder="IMAX, 4DX, Dolby..." />

            </div>


            <div class="modal-field">

                <label>
                    Show Timings
                </label>

                <textarea id="showTiming"
                          placeholder="10:00 AM, 02:30 PM, 07:00 PM"></textarea>

            </div>


            <div class="modal-buttons">

                <button type="button"
                        class="modal-cancel"
                        onclick="closeShowingModal()">
                    Cancel
                </button>

                <button type="button"
                        class="modal-save"
                        onclick="saveShowing()">
                    Save Showing
                </button>

            </div>

        </div>

    </div>

</div>



<!-- =====================================================
     ADD / EDIT SIGNATURE MODAL
===================================================== -->

<div id="signatureModal"
     class="theater-modal">

    <div class="modal-card">

        <div class="modal-header">

            <div id="signatureModalTitle"
                 class="modal-title">
                Add Signature Screen
            </div>

            <button type="button"
                    class="modal-close"
                    onclick="closeSignatureModal()">
                ×
            </button>

        </div>


        <div class="modal-body">

            <div class="modal-field">

                <label>
                    Movie
                </label>

                <input type="text"
                       id="signatureMovie"
                       placeholder="Enter movie name" />

            </div>


            <div class="modal-field">

                <label>
                    Format
                </label>

                <input type="text"
                       id="signatureFormat"
                       placeholder="IMAX / 4DX / Dolby" />

            </div>


            <div class="modal-field">

                <label>
                    Features
                </label>

                <input type="text"
                       id="signatureFeatures"
                       placeholder="Dolby Vision, Dolby Atmos" />

            </div>


            <div class="modal-field">

                <label>
                    Show Timings
                </label>

                <textarea id="signatureTiming"
                          placeholder="12:00 PM, 06:00 PM, 09:45 PM"></textarea>

            </div>


            <div class="modal-buttons">

                <button type="button"
                        class="modal-cancel"
                        onclick="closeSignatureModal()">
                    Cancel
                </button>

                <button type="button"
                        class="modal-save"
                        onclick="saveSignature()">
                    Save Screen
                </button>

            </div>

        </div>

    </div>

</div>



<!-- =====================================================
     DELETE CONFIRMATION MODAL
===================================================== -->

<div id="deleteModal"
     class="theater-modal">

    <div class="delete-card">

        <div class="delete-icon">
            🗑
        </div>

        <div class="delete-title">
            Confirm Delete
        </div>

        <div class="delete-text">

            Are you sure you want to delete
            <strong id="deleteItemName"
                    style="color:#ffffff;">
            </strong>?

            <br />

            This action will remove it from the current list.

        </div>


        <div class="delete-actions">

            <button type="button"
                    class="delete-cancel"
                    onclick="closeDeleteModal()">
                Cancel
            </button>

            <button type="button"
                    class="delete-confirm"
                    onclick="confirmDelete()">
                Delete
            </button>

        </div>

    </div>

</div>



<!-- TOAST -->

<div id="theaterToast"
     class="theater-toast">
</div>


</asp:Content>