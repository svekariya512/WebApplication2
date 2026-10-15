<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="WebApplication2.UserProfile" %>


<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        .profile-page {
            padding: 42px 38px;
            min-height: 100vh;
            background: #111111;
        }

        /* Header */

        .profile-header h1 {
            font-size: 25px;
            font-weight: 700;
            color: #f1f1f1;
            margin-bottom: 8px;
        }

        .profile-header p {
            font-size: 11px;
            color: #999999;
            margin-bottom: 24px;
        }

        /* Main area */

        .profile-layout {
            display: flex;
            gap: 55px;
            align-items: flex-start;
        }

        /* Profile photo */

        .photo-section {
            width: 165px;
            padding-top: 1px;
            text-align: center;
        }

        .profile-image {
            width: 96px;
            height: 96px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #272727;
            display: block;
            margin: 0 auto 10px auto;
        }

        .change-photo {
            color: #ffaaa0;
            font-size: 9px;
            text-decoration: none;
        }

        .change-photo:hover {
            color: #ff4b4b;
        }



        .profile-card {
            width: 344px;
            background: #191919;
            border: 1px solid #292929;
            border-radius: 7px;
            padding: 20px 19px;
        }

        .form-row {
            display: flex;
            gap: 14px;
        }

        .form-group {
            flex: 1;
            margin-bottom: 14px;
        }

        .form-group.full {
            width: 100%;
        }

        .form-group label {
            display: block;
            color: #d5b5b0;
            font-size: 9px;
            margin-bottom: 6px;
        }

        .form-control {
            width: 100%;
            height: 31px;
            background: #1b1f20;
            border: 1px solid #4b5153;
            border-radius: 4px;
            color: #dddddd;
            font-size: 9px;
            padding: 0 10px;
            outline: none;
        }

        .form-control:focus {
            border-color: #777777;
        }

        textarea.form-control {
            height: 60px;
            resize: none;
            padding-top: 9px;
        }

        .form-control::placeholder {
            color: #777777;
        }

        /* Bottom line */

        .form-footer {
            border-top: 1px solid #303030;
            margin-top: 3px;
            padding-top: 19px;
            display: flex;
            justify-content: flex-end;
        }

        .save-btn {
            background: #ed101c;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 9px 18px;
            font-size: 9px;
            font-weight: bold;
            cursor: pointer;
        }

        .save-btn:hover {
            background: #ff1d29;
        }

        @media (max-width: 800px) {

            .profile-page {
                padding: 30px 20px;
            }

            .profile-layout {
                flex-direction: column;
                gap: 25px;
            }

            .profile-card {
                width: 100%;
                max-width: 500px;
            }

        }

    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="profile-page">

        <!-- PAGE HEADER -->

        <div class="profile-header">

            <h1>Personal Information</h1>

            <p>
                Manage your profile details below.
            </p>

        </div>


        <!-- PHOTO + FORM -->

        <div class="profile-layout">


            <!-- PROFILE PHOTO -->

            <div class="photo-section">
       <img src="<%= ResolveUrl("~/Images/profile.png") %>"
     class="profile-image"
     alt="Profile Photo" />

                <a href="#"
                   class="change-photo">

                    <i class="fa-solid fa-pen"></i>
                    Change Photo

                </a>

            </div>


            <!-- PROFILE FORM -->

            <div class="profile-card">


                <!-- Full Name + Mobile -->

                <div class="form-row">

                    <div class="form-group">

                        <label>Full Name</label>

                        <asp:TextBox
                            ID="txtFullName"
                            runat="server"
                            CssClass="form-control"
                            Text="Mital">
                        </asp:TextBox>

                    </div>


                    <div class="form-group">

                        <label>Mobile Number</label>

                        <asp:TextBox
                            ID="txtMobile"
                            runat="server"
                            CssClass="form-control"
                            Text="+91 98765 43210">
                        </asp:TextBox>

                    </div>

                </div>


                <!-- Email -->

                <div class="form-group full">

                    <label>Email Address</label>

                    <asp:TextBox
                        ID="txtEmail"
                        runat="server"
                        CssClass="form-control"
                        Text="mital@example.com">
                    </asp:TextBox>

                </div>


                <!-- DOB + Gender -->

                <div class="form-row">

                    <div class="form-group">

                        <label>Date of Birth</label>

                        <asp:TextBox
                            ID="txtDOB"
                            runat="server"
                            CssClass="form-control"
                            Text="01/01/2006">
                        </asp:TextBox>

                    </div>


                    <div class="form-group">

                        <label>Gender</label>

                        <asp:DropDownList
                            ID="ddlGender"
                            runat="server"
                            CssClass="form-control">

                            <asp:ListItem>Female</asp:ListItem>
                            <asp:ListItem>Male</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>

                        </asp:DropDownList>

                    </div>

                </div>


                <!-- Address -->

                <div class="form-group full">

                    <label>Address</label>

                    <asp:TextBox
                        ID="txtAddress"
                        runat="server"
                        CssClass="form-control"
                        TextMode="MultiLine"
                        placeholder="Enter your full address (e.g., Rajkot, Gujarat)">
                    </asp:TextBox>

                </div>


                <!-- SAVE -->

                <div class="form-footer">

                    <asp:Button
                        ID="btnSave"
                        runat="server"
                        Text="Save Changes"
                        CssClass="save-btn"
                        OnClick="btnSave_Click" />

                </div>

            </div>

        </div>

    </div>

</asp:Content>
