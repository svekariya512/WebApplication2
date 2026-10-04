<%@ Page Title="Manage About" Language="C#" MasterPageFile="~/Site1.Master"
    AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="WebApplication2.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

<style>
    * {
        box-sizing: border-box;
    }

    .about-page {
        width: 100%;
        min-height: 100vh;
        padding: 25px 35px 50px;
        background: #111111;
        color: #ffffff;
        font-family: Arial, Helvetica, sans-serif;
    }

    /* ================= CARD ================= */

    .card {
        width: 100%;
        background: #151515;
        border: 1px solid #2a2a2a;
        border-radius: 8px;
        overflow: hidden;
        margin-bottom: 30px;
    }

    .card-header {
        display: flex;
        align-items: flex-start;
        justify-content: space-between;
        padding: 20px 25px 15px;
    }

    .card-header-left h2 {
        margin: 0 0 6px;
        color: #fff;
        font-size: 16px;
        font-weight: 500;
    }

    .card-header-left p {
        margin: 0;
        color: #777;
        font-size: 11px;
    }

    /* ================= ADD BUTTON ================= */

    .add-btn {
        padding: 8px 16px;
        background: #ff2222;
        border: none;
        border-radius: 4px;
        color: #fff;
        font-size: 11px;
        font-weight: 500;
        letter-spacing: .5px;
        cursor: pointer;
        transition: .2s;
    }

    .add-btn:hover {
        background: #ff4444;
    }

    /* ================= TABLE ================= */

    .data-table {
        width: 100%;
        border-collapse: collapse;
    }

    .data-table thead th {
        height: 40px;
        padding: 0 25px;
        background: #111;
        border-top: 1px solid #252525;
        border-bottom: 1px solid #252525;
        color: #888;
        text-align: left;
        font-size: 11px;
        font-weight: normal;
        letter-spacing: .5px;
    }

    .data-table tbody td {
        padding: 16px 25px;
        border-bottom: 1px solid #202020;
        color: #ccc;
        font-size: 12px;
        line-height: 18px;
        vertical-align: top;
    }

    .data-table tbody tr:last-child td {
        border-bottom: none;
    }

    .data-table tbody tr:hover {
        background: #1a1a1a;
    }

    .section-label {
        color: #888;
        font-size: 11px;
    }

    .content-label {
        color: #ccc;
        font-size: 12px;
    }

    /* ================= ACTIONS ================= */

    .actions {
        display: flex;
        gap: 8px;
    }

    .btn-edit,
    .btn-delete {
        height: 26px;
        padding: 0 14px;
        border-radius: 4px;
        cursor: pointer;
        font-size: 10px;
        font-weight: 500;
        letter-spacing: .5px;
        transition: .2s;
    }

    .btn-edit {
        background: #ff2222;
        border: 1px solid #ff2222;
        color: #fff;
    }

    .btn-edit:hover {
        background: #ff4444;
        border-color: #ff4444;
    }

    .btn-delete {
        background: transparent;
        border: 1px solid #444;
        color: #ccc;
    }

    .btn-delete:hover {
        background: #292929;
        color: #fff;
    }

    /* ================= MODAL ================= */

    .modal-overlay {
        position: fixed;
        inset: 0;
        z-index: 9999;
        display: none;
        align-items: center;
        justify-content: center;
        background: rgba(0,0,0,.75);
        backdrop-filter: blur(4px);
    }

    .modal-overlay.show {
        display: flex;
    }

    .about-modal {
        width: 470px;
        max-width: 92%;
        max-height: 90vh;
        overflow-y: auto;
        padding: 25px;
        background: #1c1c1c;
        border: 1px solid #333;
        border-radius: 9px;
        box-shadow: 0 20px 60px rgba(0,0,0,.65);
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
        padding: 0;
        background: transparent;
        border: none;
        color: #888;
        cursor: pointer;
        font-size: 24px;
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
        letter-spacing: 1px;
        text-transform: uppercase;
    }

    .form-group input,
    .form-group textarea,
    .form-group select {
        width: 100%;
        padding: 10px 12px;
        background: #111;
        border: 1px solid #333;
        border-radius: 5px;
        outline: none;
        color: #eee;
        font-family: Arial, Helvetica, sans-serif;
        font-size: 12px;
    }

    .form-group input {
        height: 38px;
    }

    .form-group textarea {
        min-height: 90px;
        resize: vertical;
        line-height: 18px;
    }

    .form-group input:focus,
    .form-group textarea:focus,
    .form-group select:focus {
        border-color: #ff3333;
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
        background: #2d2d2d;
        color: #fff;
    }

    .save-btn {
        background: #ff2222;
        border: 1px solid #ff2222;
        color: #fff;
    }

    .save-btn:hover {
        background: #ff4444;
    }

    /* ================= TOAST ================= */

    .toast {
        position: fixed;
        right: 25px;
        bottom: 25px;
        z-index: 10001;
        min-width: 230px;
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

    @media screen and (max-width: 900px) {

        .about-page {
            padding: 20px 15px 40px;
        }

        .card {
            overflow-x: auto;
        }

        .data-table {
            min-width: 700px;
        }
    }
</style>

</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<script>

    /* ================= HEADER ================= */

    document.addEventListener("DOMContentLoaded", function () {

        var hamburger =
            document.getElementById("mainHamburger");

        if (hamburger) {
            hamburger.style.display = "flex";
        }

        var header =
            document.querySelector(".cine-header");

        var searchArea =
            document.querySelector(".header-search-area");

        if (header && searchArea &&
            !document.querySelector(".page-title-header-about")) {

            var titleEl =
                document.createElement("div");

            titleEl.className =
                "page-title-header-about";

            titleEl.innerText =
                "Manage About Content";

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


    /* ================= EDIT ================= */

    function editItem(button) {

        var row =
            button.closest("tr");

        var section =
            row.cells[0].innerText.trim();

        var content =
            row.cells[1].innerText.trim();

        document.getElementById("modalTitle").innerText =
            "Edit " + section;

        document.getElementById("itemType").value =
            "edit";

        document.getElementById("editRow").value =
            "";

        document.getElementById("itemName").value =
            section;

        document.getElementById("itemContent").value =
            content;

        document.getElementById("itemLocation").value =
            row.cells.length > 2
                ? row.cells[1].innerText.trim()
                : "";

        document.getElementById("itemAmenities").value =
            "";

        document.getElementById("aboutModal")
            .classList.add("show");

        document.getElementById("itemContent").focus();
    }


    /* ================= ADD FEATURE ================= */

    function addFeature() {

        document.getElementById("modalTitle").innerText =
            "Add New Feature";

        document.getElementById("itemType").value =
            "feature";

        document.getElementById("editRow").value =
            "";

        document.getElementById("itemName").value =
            "";

        document.getElementById("itemContent").value =
            "";

        document.getElementById("itemLocation").value =
            "";

        document.getElementById("itemAmenities").value =
            "";

        document.getElementById("aboutModal")
            .classList.add("show");

        document.getElementById("itemName").focus();
    }


    /* ================= ADD THEATER ================= */

    function addTheater() {

        document.getElementById("modalTitle").innerText =
            "Add New Theater";

        document.getElementById("itemType").value =
            "theater";

        document.getElementById("editRow").value =
            "";

        document.getElementById("itemName").value =
            "";

        document.getElementById("itemContent").value =
            "";

        document.getElementById("itemLocation").value =
            "";

        document.getElementById("itemAmenities").value =
            "";

        document.getElementById("aboutModal")
            .classList.add("show");

        document.getElementById("itemName").focus();
    }


    /* ================= SAVE ================= */

    function saveItem() {

        var type =
            document.getElementById("itemType").value;

        var name =
            document.getElementById("itemName").value.trim();

        var content =
            document.getElementById("itemContent").value.trim();

        var location =
            document.getElementById("itemLocation").value.trim();

        var amenities =
            document.getElementById("itemAmenities").value.trim();


        if (type === "feature") {

            if (name === "") {
                alert("Please enter feature name.");
                return;
            }

            if (content === "") {
                alert("Please enter feature description.");
                return;
            }

            var featureTable =
                document.querySelectorAll(".feature-table tbody")[0];

            var row =
                featureTable.insertRow();

            row.innerHTML =
                '<td class="content-label">' +
                escapeHtml(name) +
                '</td>' +

                '<td class="content-label">' +
                escapeHtml(content) +
                '</td>' +

                '<td>' +
                '<div class="actions">' +

                '<button class="btn-edit" type="button" onclick="editItem(this)">' +
                'EDIT' +
                '</button>' +

                '<button class="btn-delete" type="button" onclick="deleteItem(this)">' +
                'DELETE' +
                '</button>' +

                '</div>' +
                '</td>';

            closeModal();

            showToast("Feature added successfully.");

            return;
        }


        if (type === "theater") {

            if (name === "") {
                alert("Please enter theater name.");
                return;
            }

            if (location === "") {
                alert("Please enter location.");
                return;
            }

            if (amenities === "") {
                alert("Please enter amenities.");
                return;
            }

            var theaterTable =
                document.querySelectorAll(".theater-table tbody")[0];

            var theaterRow =
                theaterTable.insertRow();

            theaterRow.innerHTML =
                '<td class="content-label">' +
                escapeHtml(name) +
                '</td>' +

                '<td class="content-label">' +
                escapeHtml(location) +
                '</td>' +

                '<td class="content-label">' +
                escapeHtml(amenities) +
                '</td>' +

                '<td>' +
                '<div class="actions">' +

                '<button class="btn-edit" type="button" onclick="editTheaterItem(this)">' +
                'EDIT' +
                '</button>' +

                '<button class="btn-delete" type="button" onclick="deleteTheaterItem(this)">' +
                'DELETE' +
                '</button>' +

                '</div>' +
                '</td>';

            closeModal();

            showToast("Theater added successfully.");

            return;
        }


        /* EDIT EXISTING */

        var selectedRow =
            window.currentEditRow;

        if (!selectedRow) {
            alert("Unable to find selected item.");
            return;
        }

        if (selectedRow.cells.length === 3) {

            if (name === "" || content === "") {
                alert("Please fill all fields.");
                return;
            }

            selectedRow.cells[0].innerText =
                name;

            selectedRow.cells[1].innerText =
                content;

            closeModal();

            showToast("Content updated successfully.");

            return;
        }

        if (selectedRow.cells.length === 4) {

            if (name === "" ||
                location === "" ||
                amenities === "") {

                alert("Please fill all fields.");

                return;
            }

            selectedRow.cells[0].innerText =
                name;

            selectedRow.cells[1].innerText =
                location;

            selectedRow.cells[2].innerText =
                amenities;

            closeModal();

            showToast("Theater updated successfully.");
        }
    }


    /* ================= DELETE ================= */

    function deleteItem(button) {

        var row =
            button.closest("tr");

        var name =
            row.cells[0].innerText.trim();

        if (confirm(
            'Are you sure you want to delete "' +
            name +
            '"?'
        )) {

            row.remove();

            showToast(
                name + " deleted successfully."
            );
        }
    }


    /* ================= THEATER EDIT ================= */

    function editTheaterItem(button) {

        var row =
            button.closest("tr");

        window.currentEditRow =
            row;

        document.getElementById("modalTitle").innerText =
            "Edit Theater";

        document.getElementById("itemType").value =
            "edit";

        document.getElementById("itemName").value =
            row.cells[0].innerText.trim();

        document.getElementById("itemContent").value =
            "";

        document.getElementById("itemLocation").value =
            row.cells[1].innerText.trim();

        document.getElementById("itemAmenities").value =
            row.cells[2].innerText.trim();

        document.getElementById("aboutModal")
            .classList.add("show");
    }


    /* ================= THEATER DELETE ================= */

    function deleteTheaterItem(button) {

        var row =
            button.closest("tr");

        var name =
            row.cells[0].innerText.trim();

        if (confirm(
            'Are you sure you want to delete "' +
            name +
            '"?'
        )) {

            row.remove();

            showToast(
                name + " deleted successfully."
            );
        }
    }


    /* ================= CLOSE ================= */

    function closeModal() {

        document.getElementById("aboutModal")
            .classList.remove("show");

        window.currentEditRow = null;
    }


    /* ================= ESCAPE HTML ================= */

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

        toast.innerText =
            message;

        toast.classList.add("show");

        clearTimeout(toastTimer);

        toastTimer =
            setTimeout(function () {

                toast.classList.remove("show");

            }, 2200);
    }


    /* ================= OUTSIDE CLICK ================= */

    document.addEventListener("click", function (event) {

        var modal =
            document.getElementById("aboutModal");

        if (event.target === modal) {
            closeModal();
        }
    });


    /* ================= ESC KEY ================= */

    document.addEventListener("keydown", function (event) {

        if (event.key === "Escape") {
            closeModal();
        }
    });

</script>


<div class="about-page">


    <!-- =====================================================
         CARD 1 : HERO & STORY CONTENT
    ====================================================== -->

    <div class="card">

        <div class="card-header">

            <div class="card-header-left">

                <h2>
                    Hero &amp; Story Content
                </h2>

                <p>
                    Manage main headings and brand story
                </p>

            </div>

        </div>


        <table class="data-table">

            <thead>

                <tr>
                    <th>Section</th>
                    <th>Content</th>
                    <th>Action</th>
                </tr>

            </thead>


            <tbody>

                <tr>

                    <td class="section-label">
                        Main Title
                    </td>

                    <td class="content-label">
                        Redefining the Cinematic Experience
                    </td>

                    <td>

                        <div class="actions">

                            <button type="button"
                                    class="btn-edit"
                                    onclick="startHeroEdit(this)">
                                EDIT
                            </button>

                            <button type="button"
                                    class="btn-delete"
                                    onclick="deleteItem(this)">
                                DELETE
                            </button>

                        </div>

                    </td>

                </tr>


                <tr>

                    <td class="section-label">
                        Description
                    </td>

                    <td class="content-label">
                        Where cutting-edge technology meets unparalleled luxury. Step into a world where every screening is an event.
                    </td>

                    <td>

                        <div class="actions">

                            <button type="button"
                                    class="btn-edit"
                                    onclick="startHeroEdit(this)">
                                EDIT
                            </button>

                            <button type="button"
                                    class="btn-delete"
                                    onclick="deleteItem(this)">
                                DELETE
                            </button>

                        </div>

                    </td>

                </tr>


                <tr>

                    <td class="section-label">
                        Story Title
                    </td>

                    <td class="content-label">
                        Our Story
                    </td>

                    <td>

                        <div class="actions">

                            <button type="button"
                                    class="btn-edit"
                                    onclick="startHeroEdit(this)">
                                EDIT
                            </button>

                            <button type="button"
                                    class="btn-delete"
                                    onclick="deleteItem(this)">
                                DELETE
                            </button>

                        </div>

                    </td>

                </tr>


                <tr>

                    <td class="section-label">
                        Story Content
                    </td>

                    <td class="content-label">
                        Founded in 2010...
                    </td>

                    <td>

                        <div class="actions">

                            <button type="button"
                                    class="btn-edit"
                                    onclick="startHeroEdit(this)">
                                EDIT
                            </button>

                            <button type="button"
                                    class="btn-delete"
                                    onclick="deleteItem(this)">
                                DELETE
                            </button>

                        </div>

                    </td>

                </tr>

            </tbody>

        </table>

    </div>


    <!-- =====================================================
         CARD 2 : QUALITY
    ====================================================== -->

    <div class="card">

        <div class="card-header">

            <div class="card-header-left">

                <h2>
                    Uncompromising Quality
                </h2>

                <p>
                    The finest technology for the ultimate immersion.
                </p>

            </div>

            <button type="button"
                    class="add-btn"
                    onclick="addFeature()">

                + ADD FEATURE

            </button>

        </div>


        <table class="data-table feature-table">

            <thead>

                <tr>
                    <th>Feature</th>
                    <th>Description</th>
                    <th>Action</th>
                </tr>

            </thead>


            <tbody>

                <tr>

                    <td class="content-label">
                        Dolby Atmos
                    </td>

                    <td class="content-label">
                        Sound that moves around you in three-dimensional space, bringing every scene to vivid life.
                    </td>

                    <td>

                        <div class="actions">

                            <button type="button"
                                    class="btn-edit"
                                    onclick="editItem(this)">
                                EDIT
                            </button>

                            <button type="button"
                                    class="btn-delete"
                                    onclick="deleteItem(this)">
                                DELETE
                            </button>

                        </div>

                    </td>

                </tr>


                <tr>

                    <td class="content-label">
                        Luxury Recliners
                    </td>

                    <td class="content-label">
                        Plush leather push-back seats with extra legroom, designed for maximum comfort during long movies.
                    </td>

                    <td>

                        <div class="actions">

                            <button type="button"
                                    class="btn-edit"
                                    onclick="editItem(this)">
                                EDIT
                            </button>

                            <button type="button"
                                    class="btn-delete"
                                    onclick="deleteItem(this)">
                                DELETE
                            </button>

                        </div>

                    </td>

                </tr>


                <tr>

                    <td class="content-label">
                        IMAX with Laser
                    </td>

                    <td class="content-label">
                        Crystal clear, larger-than-life images with unprecedented contrast and color accuracy.
                    </td>

                    <td>

                        <div class="actions">

                            <button type="button"
                                    class="btn-edit"
                                    onclick="editItem(this)">
                                EDIT
                            </button>

                            <button type="button"
                                    class="btn-delete"
                                    onclick="deleteItem(this)">
                                DELETE
                            </button>

                        </div>

                    </td>

                </tr>

            </tbody>

        </table>

    </div>


    <!-- =====================================================
         CARD 3 : OUR THEATERS
    ====================================================== -->

    <div class="card">

        <div class="card-header">

            <div class="card-header-left">

                <h2>
                    Our Theaters
                </h2>

                <p>
                    Find a premium Cineplus experience near you.
                </p>

            </div>

            <button type="button"
                    class="add-btn"
                    onclick="addTheater()">

                + ADD THEATER

            </button>

        </div>


        <table class="data-table theater-table">

            <thead>

                <tr>
                    <th>Theater Name</th>
                    <th>Location</th>
                    <th>Amenities</th>
                    <th>Action</th>
                </tr>

            </thead>


            <tbody>

                <tr>

                    <td class="content-label">
                        Cineplus Downtown
                    </td>

                    <td class="content-label">
                        Mumbai, MH
                    </td>

                    <td class="content-label">
                        IMAX, ATMOS
                    </td>

                    <td>

                        <div class="actions">

                            <button type="button"
                                    class="btn-edit"
                                    onclick="editTheaterItem(this)">
                                EDIT
                            </button>

                            <button type="button"
                                    class="btn-delete"
                                    onclick="deleteTheaterItem(this)">
                                DELETE
                            </button>

                        </div>

                    </td>

                </tr>


                <tr>

                    <td class="content-label">
                        Cineplus Westside
                    </td>

                    <td class="content-label">
                        Ahmedabad, GJ
                    </td>

                    <td class="content-label">
                        ATMOS, GOLD CLASS
                    </td>

                    <td>

                        <div class="actions">

                            <button type="button"
                                    class="btn-edit"
                                    onclick="editTheaterItem(this)">
                                EDIT
                            </button>

                            <button type="button"
                                    class="btn-delete"
                                    onclick="deleteTheaterItem(this)">
                                DELETE
                            </button>

                        </div>

                    </td>

                </tr>

            </tbody>

        </table>

    </div>

</div>


<!-- =====================================================
     ADD / EDIT MODAL
====================================================== -->

<div id="aboutModal"
     class="modal-overlay">

    <div class="about-modal">

        <div class="modal-header">

            <div id="modalTitle"
                 class="modal-title">
                Add New Feature
            </div>

            <button type="button"
                    class="modal-close"
                    onclick="closeModal()">
                ×
            </button>

        </div>


        <input type="hidden"
               id="itemType"
               value="" />

        <input type="hidden"
               id="editRow"
               value="" />


        <div class="form-group">

            <label>
                Name / Title
            </label>

            <input type="text"
                   id="itemName"
                   placeholder="Enter name or title" />

        </div>


        <div class="form-group">

            <label>
                Content / Description
            </label>

            <textarea id="itemContent"
                      placeholder="Enter description or content"></textarea>

        </div>


        <div class="form-group">

            <label>
                Location
            </label>

            <input type="text"
                   id="itemLocation"
                   placeholder="Enter location" />

        </div>


        <div class="form-group">

            <label>
                Amenities
            </label>

            <input type="text"
                   id="itemAmenities"
                   placeholder="Example: IMAX, ATMOS, GOLD CLASS" />

        </div>


        <div class="modal-buttons">

            <button type="button"
                    class="cancel-btn"
                    onclick="closeModal()">

                Cancel

            </button>

            <button type="button"
                    class="save-btn"
                    onclick="saveItem()">

                Save Changes

            </button>

        </div>

    </div>

</div>


<!-- ================= TOAST ================= -->

<div id="toast"
     class="toast">
</div>


<script>

    /* =====================================================
       HERO / STORY EDIT
    ====================================================== */

    function startHeroEdit(button) {

        var row =
            button.closest("tr");

        window.currentEditRow =
            row;

        var section =
            row.cells[0].innerText.trim();

        var content =
            row.cells[1].innerText.trim();

        document.getElementById("modalTitle").innerText =
            "Edit " + section;

        document.getElementById("itemType").value =
            "hero";

        document.getElementById("itemName").value =
            section;

        document.getElementById("itemContent").value =
            content;

        document.getElementById("itemLocation").value =
            "";

        document.getElementById("itemAmenities").value =
            "";

        document.getElementById("aboutModal")
            .classList.add("show");

        document.getElementById("itemContent")
            .focus();
    }


    /* =====================================================
       EDIT FEATURE
    ====================================================== */

    function editItem(button) {

        var row =
            button.closest("tr");

        window.currentEditRow =
            row;

        var name =
            row.cells[0].innerText.trim();

        var content =
            row.cells[1].innerText.trim();

        document.getElementById("modalTitle").innerText =
            "Edit Feature";

        document.getElementById("itemType").value =
            "featureEdit";

        document.getElementById("itemName").value =
            name;

        document.getElementById("itemContent").value =
            content;

        document.getElementById("itemLocation").value =
            "";

        document.getElementById("itemAmenities").value =
            "";

        document.getElementById("aboutModal")
            .classList.add("show");

        document.getElementById("itemName")
            .focus();
    }


    /* =====================================================
       ADD FEATURE
    ====================================================== */

    function addFeature() {

        window.currentEditRow =
            null;

        document.getElementById("modalTitle").innerText =
            "Add New Feature";

        document.getElementById("itemType").value =
            "feature";

        document.getElementById("itemName").value =
            "";

        document.getElementById("itemContent").value =
            "";

        document.getElementById("itemLocation").value =
            "";

        document.getElementById("itemAmenities").value =
            "";

        document.getElementById("aboutModal")
            .classList.add("show");

        document.getElementById("itemName")
            .focus();
    }


    /* =====================================================
       ADD THEATER
    ====================================================== */

    function addTheater() {

        window.currentEditRow =
            null;

        document.getElementById("modalTitle").innerText =
            "Add New Theater";

        document.getElementById("itemType").value =
            "theater";

        document.getElementById("itemName").value =
            "";

        document.getElementById("itemContent").value =
            "";

        document.getElementById("itemLocation").value =
            "";

        document.getElementById("itemAmenities").value =
            "";

        document.getElementById("aboutModal")
            .classList.add("show");

        document.getElementById("itemName")
            .focus();
    }


    /* =====================================================
       EDIT THEATER
    ====================================================== */

    function editTheaterItem(button) {

        var row =
            button.closest("tr");

        window.currentEditRow =
            row;

        document.getElementById("modalTitle").innerText =
            "Edit Theater";

        document.getElementById("itemType").value =
            "theaterEdit";

        document.getElementById("itemName").value =
            row.cells[0].innerText.trim();

        document.getElementById("itemContent").value =
            "";

        document.getElementById("itemLocation").value =
            row.cells[1].innerText.trim();

        document.getElementById("itemAmenities").value =
            row.cells[2].innerText.trim();

        document.getElementById("aboutModal")
            .classList.add("show");
    }


    /* =====================================================
       SAVE
    ====================================================== */

    function saveItem() {

        var type =
            document.getElementById("itemType").value;

        var name =
            document.getElementById("itemName")
                .value.trim();

        var content =
            document.getElementById("itemContent")
                .value.trim();

        var location =
            document.getElementById("itemLocation")
                .value.trim();

        var amenities =
            document.getElementById("itemAmenities")
                .value.trim();


        /* ---------- HERO EDIT ---------- */

        if (type === "hero") {

            if (name === "" || content === "") {
                alert("Please fill all fields.");
                return;
            }

            var heroRow =
                window.currentEditRow;

            if (!heroRow) {
                alert("Selected row not found.");
                return;
            }

            heroRow.cells[0].innerText =
                name;

            heroRow.cells[1].innerText =
                content;

            closeModal();

            showToast(
                "Content updated successfully."
            );

            return;
        }


        /* ---------- ADD FEATURE ---------- */

        if (type === "feature") {

            if (name === "") {
                alert("Please enter feature name.");
                return;
            }

            if (content === "") {
                alert("Please enter feature description.");
                return;
            }

            var tbody =
                document.querySelector(
                    ".feature-table tbody"
                );

            var row =
                document.createElement("tr");

            row.innerHTML =
                '<td class="content-label">' +
                escapeHtml(name) +
                '</td>' +

                '<td class="content-label">' +
                escapeHtml(content) +
                '</td>' +

                '<td>' +
                '<div class="actions">' +

                '<button type="button" ' +
                'class="btn-edit" ' +
                'onclick="editItem(this)">' +
                'EDIT' +
                '</button>' +

                '<button type="button" ' +
                'class="btn-delete" ' +
                'onclick="deleteItem(this)">' +
                'DELETE' +
                '</button>' +

                '</div>' +
                '</td>';

            tbody.appendChild(row);

            closeModal();

            showToast(
                "Feature added successfully."
            );

            return;
        }


        /* ---------- FEATURE EDIT ---------- */

        if (type === "featureEdit") {

            if (name === "" || content === "") {
                alert("Please fill all fields.");
                return;
            }

            var featureRow =
                window.currentEditRow;

            if (!featureRow) {
                alert("Selected feature not found.");
                return;
            }

            featureRow.cells[0].innerText =
                name;

            featureRow.cells[1].innerText =
                content;

            closeModal();

            showToast(
                "Feature updated successfully."
            );

            return;
        }


        /* ---------- ADD THEATER ---------- */

        if (type === "theater") {

            if (name === "") {
                alert("Please enter theater name.");
                return;
            }

            if (location === "") {
                alert("Please enter location.");
                return;
            }

            if (amenities === "") {
                alert("Please enter amenities.");
                return;
            }

            var theaterBody =
                document.querySelector(
                    ".theater-table tbody"
                );

            var theaterRow =
                document.createElement("tr");

            theaterRow.innerHTML =
                '<td class="content-label">' +
                escapeHtml(name) +
                '</td>' +

                '<td class="content-label">' +
                escapeHtml(location) +
                '</td>' +

                '<td class="content-label">' +
                escapeHtml(amenities) +
                '</td>' +

                '<td>' +
                '<div class="actions">' +

                '<button type="button" ' +
                'class="btn-edit" ' +
                'onclick="editTheaterItem(this)">' +
                'EDIT' +
                '</button>' +

                '<button type="button" ' +
                'class="btn-delete" ' +
                'onclick="deleteTheaterItem(this)">' +
                'DELETE' +
                '</button>' +

                '</div>' +
                '</td>';

            theaterBody.appendChild(theaterRow);

            closeModal();

            showToast(
                "Theater added successfully."
            );

            return;
        }


        /* ---------- THEATER EDIT ---------- */

        if (type === "theaterEdit") {

            if (name === "" ||
                location === "" ||
                amenities === "") {

                alert("Please fill all fields.");
                return;
            }

            var selectedTheater =
                window.currentEditRow;

            if (!selectedTheater) {
                alert("Selected theater not found.");
                return;
            }

            selectedTheater.cells[0].innerText =
                name;

            selectedTheater.cells[1].innerText =
                location;

            selectedTheater.cells[2].innerText =
                amenities;

            closeModal();

            showToast(
                "Theater updated successfully."
            );

            return;
        }
    }


    /* =====================================================
       DELETE NORMAL ITEM
    ====================================================== */

    function deleteItem(button) {

        var row =
            button.closest("tr");

        var name =
            row.cells[0].innerText.trim();

        if (confirm(
            'Are you sure you want to delete "' +
            name +
            '"?'
        )) {

            row.remove();

            showToast(
                name +
                " deleted successfully."
            );
        }
    }


    /* =====================================================
       DELETE THEATER
    ====================================================== */

    function deleteTheaterItem(button) {

        var row =
            button.closest("tr");

        var name =
            row.cells[0].innerText.trim();

        if (confirm(
            'Are you sure you want to delete "' +
            name +
            '"?'
        )) {

            row.remove();

            showToast(
                name +
                " deleted successfully."
            );
        }
    }


    /* =====================================================
       CLOSE MODAL
    ====================================================== */

    function closeModal() {

        document.getElementById("aboutModal")
            .classList.remove("show");

        window.currentEditRow =
            null;
    }


    /* =====================================================
       ESCAPE HTML
    ====================================================== */

    function escapeHtml(value) {

        return String(value)
            .replace(/&/g, "&amp;")
            .replace(/</g, "&lt;")
            .replace(/>/g, "&gt;")
            .replace(/"/g, "&quot;")
            .replace(/'/g, "&#039;");
    }


    /* =====================================================
       TOAST
    ====================================================== */

    var toastTimer;

    function showToast(message) {

        var toast =
            document.getElementById("toast");

        toast.innerText =
            message;

        toast.classList.add("show");

        clearTimeout(toastTimer);

        toastTimer =
            setTimeout(function () {

                toast.classList.remove("show");

            }, 2200);
    }


    /* =====================================================
       OUTSIDE CLICK
    ====================================================== */

    document.addEventListener("click", function (event) {

        var modal =
            document.getElementById("aboutModal");

        if (event.target === modal) {
            closeModal();
        }
    });


    /* =====================================================
       ESC KEY
    ====================================================== */

    document.addEventListener("keydown", function (event) {

        if (event.key === "Escape") {
            closeModal();
        }
    });

</script>

</asp:Content>