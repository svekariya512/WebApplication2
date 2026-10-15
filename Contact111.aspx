<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site3.Master" AutoEventWireup="true" CodeBehind="Contact111.aspx.cs" Inherits="WebApplication2.Contact111" %>

<asp:Content ID="Content3" ContentPlaceHolderID="head" runat="server">
    <style>
        /* --- Hero / Header Section --- */
        .contact-header {
            padding: 80px 0 40px;
            text-align: center;
        }

        .contact-title {
            font-size: 2.8rem;
            font-weight: 800;
            margin-bottom: 15px;
            color: #fff;
        }

        .contact-subtitle {
            color: #999;
            font-size: 1rem;
            max-width: 600px;
            margin: 0 auto;
            line-height: 1.6;
        }

        /* --- Main Contact Section --- */
        .contact-section {
            padding: 20px 0 60px;
        }

        .contact-grid {
            display: grid;
            grid-template-columns: 2fr 1fr;
            gap: 30px;
        }

        @media (max-width: 900px) {
            .contact-grid { grid-template-columns: 1fr; }
        }

        /* --- Form Card --- */
        .form-card {
            background: #1a1a1a;
            border: 1px solid #2a2a2a;
            border-radius: 12px;
            padding: 30px;
        }

        .form-card h3 {
            font-size: 1.4rem;
            font-weight: 700;
            margin-bottom: 25px;
            color: #fff;
        }

        .form-row {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 20px;
        }

        @media (max-width: 600px) {
            .form-row { grid-template-columns: 1fr; }
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            color: #bbb;
            font-size: 0.85rem;
            margin-bottom: 8px;
            font-weight: 500;
        }

        .form-group .form-control {
            width: 100%;
            background: #0f0f0f;
            border: 1px solid #2a2a2a;
            color: #fff;
            padding: 12px 15px;
            border-radius: 8px;
            font-size: 0.9rem;
            transition: border 0.3s ease;
            font-family: inherit;
        }

        .form-group .form-control:focus {
            outline: none;
            border-color: #e50914;
            background: #0f0f0f;
            color: #fff;
            box-shadow: 0 0 0 2px rgba(229, 9, 20, 0.2);
        }

        .form-group .form-control::placeholder {
            color: #555;
        }

        textarea.form-control {
            resize: vertical;
            min-height: 130px;
        }

        /* --- Send Message Button --- */
        .btn-send {
            background: #e50914;
            color: #fff;
            border: none;
            padding: 12px 30px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.95rem;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 8px;
        }

        .btn-send:hover {
            background: #b80710;
            box-shadow: 0 4px 15px rgba(229, 9, 20, 0.4);
            color: #fff;
        }

        .msg-label {
            display: block;
            margin-top: 15px;
            font-weight: 600;
            font-size: 0.9rem;
        }

        /* --- Contact Info Card --- */
        .info-card {
            background: #1a1a1a;
            border: 1px solid #2a2a2a;
            border-radius: 12px;
            padding: 30px;
        }

        .info-card h3 {
            font-size: 1.4rem;
            font-weight: 700;
            margin-bottom: 30px;
            color: #fff;
        }

        .info-item {
            display: flex;
            gap: 15px;
            margin-bottom: 30px;
        }
        .btn-send {
    float: right;
    /* બાકીનું CSS જેમ છે તેમ */
}
        .info-icon {
            width: 40px;
            height: 40px;
            min-width: 40px;
            background: #2a2a2a;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #e50914;
            font-size: 1rem;
        }

        .info-content h5 {
            color: #fff;
            font-size: 0.95rem;
            font-weight: 600;
            margin-bottom: 6px;
        }

        .info-content p {
            color: #999;
            font-size: 0.85rem;
            margin: 0;
            line-height: 1.5;
        }

        /* --- Custom Modal Styles (Pure CSS + Server Side Control) --- */
        .modal-overlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.8);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 9999;
        }

        .modal-box {
            background: #1e1e1e;
            border: 1px solid #2d2d2d;
            border-radius: 16px;
            padding: 35px;
            width: 90%;
            max-width: 420px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.5);
        }

        .modal-icon {
            width: 50px;
            height: 50px;
            background: #e50914;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
            color: #fff;
            font-size: 1.4rem;
        }

        .modal-title {
            color: #fff;
            font-size: 1.35rem;
            font-weight: 700;
            margin-bottom: 10px;
        }

        .modal-desc {
            color: #aaa;
            font-size: 0.88rem;
            line-height: 1.5;
            margin-bottom: 25px;
        }

        .btn-modal-primary {
            display: block;
            width: 100%;
            background: #e50914;
            color: #fff;
            border: none;
            padding: 12px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.95rem;
            margin-bottom: 10px;
            cursor: pointer;
            text-decoration: none;
        }

        .btn-modal-secondary {
            display: block;
            width: 100%;
            background: #2a2a2a;
            color: #ccc;
            border: 1px solid #3a3a3a;
            padding: 12px;
            border-radius: 8px;
            font-weight: 600;
            font-size: 0.95rem;
            cursor: pointer;
        }

        .btn-modal-secondary:hover {
            background: #333;
            color: #fff;
        }
    </style>
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="MainContent" runat="server">

    <!-- Header Section -->
    <div class="contact-header">
        <div class="container">
            <h1 class="contact-title">Get in Touch</h1>
            <p class="contact-subtitle">
                Have questions about our premium cinematic experience, group bookings, or private screenings? Our team is here to help you.
            </p>
        </div>
    </div>

    <!-- Main Contact Section -->
    <div class="container contact-section">
        <div class="contact-grid">

            <!-- Send us a Message Form -->
            <div class="form-card">
                <h3>Send us a Message</h3>

                <div class="form-row">
                    <div class="form-group">
                        <label>Full Name</label>
                        <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control" placeholder="Jaldhara Jadav"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <label>Email Address</label>
                        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" placeholder="jaldhara@example.com"></asp:TextBox>
                    </div>
                </div>

                <div class="form-group">
                    <label>Subject</label>
                    <asp:DropDownList ID="ddlSubject" runat="server" CssClass="form-control">
                        <asp:ListItem Text="General Inquiry" Value="General Inquiry" />
                        <asp:ListItem Text="Group Booking" Value="Group Booking" />
                        <asp:ListItem Text="Private Screening" Value="Private Screening" />
                        <asp:ListItem Text="Feedback" Value="Feedback" />
                        <asp:ListItem Text="Complaint" Value="Complaint" />
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label>Message</label>
                    <asp:TextBox ID="txtMessage" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" placeholder="How can we help you today?"></asp:TextBox>
                </div>

                <asp:Button ID="btnSend" runat="server" Text="Send Message →" CssClass="btn-send" OnClick="btnSend_Click" />
                <asp:Label ID="lblMessage" runat="server" CssClass="msg-label"></asp:Label>
            </div>

            <!-- Contact Information -->
            <div class="info-card">
                <h3>Contact Information</h3>
                <div class="info-item">
                    <div class="info-icon"><i class="fa-solid fa-location-dot"></i></div>
                    <div class="info-content">
                        <h5>Our Location</h5>
                        <p>123 Cinematic Boulevard<br />Entertainment District<br />Los Angeles, CA 90028</p>
                    </div>
                </div>

                <div class="info-item">
                    <div class="info-icon"><i class="fa-solid fa-phone"></i></div>
                    <div class="info-content">
                        <h5>Phone Number</h5>
                        <p>+1 (555) 123-4567<br />Mon-Sun: 10am - 11pm</p>
                    </div>
                </div>

                <div class="info-item">
                    <div class="info-icon"><i class="fa-solid fa-envelope"></i></div>
                    <div class="info-content">
                        <h5>Email Address</h5>
                        <p>hello@cineplus.com<br />support@cineplus.com</p>
                    </div>
                </div>
            </div>

        </div>
    </div>

    <!-- POPUP MODAL (Server Control with Visible="false" initially) -->
    <asp:Panel ID="pnlSuccessModal" runat="server" CssClass="modal-overlay" Visible="false">
        <div class="modal-box">
            <div class="modal-icon">✓</div>
            <div class="modal-title">Message Sent Successfully!</div>
            <div class="modal-desc">
                Thank you for reaching out. Our team will get back to you shortly.
            </div>
            <asp:Button ID="btnBackHome" runat="server" Text="Back to Home" CssClass="btn-modal-primary" OnClick="btnBackHome_Click" />
            <asp:Button ID="btnCloseModal" runat="server" Text="Close" CssClass="btn-modal-secondary" OnClick="btnCloseModal_Click" />
        </div>
    </asp:Panel>

</asp:Content>