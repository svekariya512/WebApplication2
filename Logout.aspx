
<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Logout - CinePulse</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        html, body {
            width: 100%;
            height: 100%;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #111111;
            color: #ffffff;
            overflow: hidden;
        }

        .logout-page {
            width: 100%;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: radial-gradient(
                circle at center,
                #252525 0%,
                #151515 40%,
                #0b0b0b 100%
            );
        }

        .logout-card {
            width: 320px;
            padding: 25px 22px 22px;
            background: #202020;
            border: 1px solid #333333;
            border-radius: 7px;
            text-align: center;
            box-shadow: 0 20px 50px rgba(0,0,0,.65);
        }

        .logout-icon {
            width: 46px;
            height: 46px;
            margin: 0 auto 15px;
            border-radius: 50%;
            background: #302020;
            border: 1px solid #4a2929;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #ff7777;
            font-size: 22px;
        }

        .logout-title {
            color: #eeeeee;
            font-size: 17px;
            font-weight: 600;
            margin-bottom: 10px;
        }

        .logout-description {
            color: #999999;
            font-size: 11px;
            line-height: 17px;
            max-width: 250px;
            margin: 0 auto 20px;
        }

        .logout-buttons {
            display: flex;
            justify-content: center;
            gap: 9px;
        }

        .cancel-button {
            width: 110px;
            height: 34px;
            background: #202020;
            border: 1px solid #444444;
            border-radius: 4px;
            color: #cccccc;
            font-size: 10px;
            cursor: pointer;
        }

        .cancel-button:hover {
            background: #2b2b2b;
            color: #ffffff;
        }

        .logout-button {
            width: 110px;
            height: 34px;
            background: #ff171f;
            border: 1px solid #ff171f;
            border-radius: 4px;
            color: #ffffff;
            font-size: 10px;
            font-weight: 600;
            cursor: pointer;
        }

        .logout-button:hover {
            background: #df1118;
            border-color: #df1118;
        }

        .logout-footer {
            margin-top: 18px;
            color: #555555;
            font-size: 7px;
            letter-spacing: .8px;
        }

        @media screen and (max-width: 500px) {
            .logout-card {
                width: 290px;
            }
        }
    </style>
</head>

<body>
<form id="logoutForm" runat="server">

    <div class="logout-page">
        <div class="logout-card">

            <div class="logout-icon">⇥</div>

            <div class="logout-title">
                LogOut of CinePulse
            </div>

            <div class="logout-description">
                Are you sure you want to log out?
                You will need to sign back in to
                access your profile and tickets.
            </div>

            <div class="logout-buttons">

                <asp:Button
                    ID="btnCancel"
                    runat="server"
                    Text="Cancel"
                    CssClass="cancel-button"
                    CausesValidation="false"
                    OnClick="btnCancel_Click" />

                <asp:Button
                    ID="btnLogout"
                    runat="server"
                    Text="Logout"
                    CssClass="logout-button"
                    CausesValidation="false"
                    OnClick="btnLogout_Click" />

            </div>

            <div class="logout-footer">
                CINEPULSE GLOBAL CONTROL CENTER
            </div>

        </div>
    </div>

</form>
</body>
</html>

<script runat="server">

    protected void btnCancel_Click(object sender, System.EventArgs e)
    {
        if (Request.UrlReferrer != null &&
            Request.UrlReferrer.Host == Request.Url.Host)
        {
            Response.Redirect(Request.UrlReferrer.AbsoluteUri, false);
            Context.ApplicationInstance.CompleteRequest();
        }
        else
        {
            Response.Redirect("home.aspx", false);
            Context.ApplicationInstance.CompleteRequest();
        }
    }

    protected void btnLogout_Click(object sender, System.EventArgs e)
    {
        // Clear the current user's session
        Session.Clear();
        Session.Abandon();

        // Remove the authentication cookie, if Forms Authentication is used
        System.Web.Security.FormsAuthentication.SignOut();

        // Redirect to Login page
        Response.Redirect("Login.aspx", false);
        Context.ApplicationInstance.CompleteRequest();
    }

</script>
