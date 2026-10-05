<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="WebApplication2.Feedback" %>

<asp:Content ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">

    <style>

        .feedback-page {
            min-height: 100vh;
            background: #111111;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #ffffff;
            padding: 30px;
        }

        .feedback-card {
            width: 330px;
            background: #1d1d1d;
            border: 1px solid #292929;
            border-radius: 6px;
            padding: 24px;
            box-sizing: border-box;
            box-shadow: 0 8px 25px rgba(0,0,0,0.35);
            text-align: center;
        }

        .feedback-card h1 {
            font-size: 17px;
            margin: 0 0 5px;
            color: #eeeeee;
        }

        .feedback-card .subtitle {
            font-size: 7px;
            color: #777777;
            margin: 0 0 18px;
        }

        /* Stars */

        .rating-title {
            font-size: 7px;
            color: #888888;
            margin-bottom: 7px;
        }

        .stars {
            display: flex;
            justify-content: center;
            gap: 5px;
            margin-bottom: 18px;
        }

        .stars label {
            font-size: 18px;
            color: #555555;
            cursor: pointer;
            transition: 0.2s;
        }

        .stars label:hover {
            color: #ffcc00;
        }

        .stars input {
            display: none;
        }

        .stars input:checked + label {
            color: #ffcc00;
        }

        /* Textarea */

        .feedback-text {
            width: 100%;
            height: 75px;
            resize: none;
            box-sizing: border-box;
            background: #292929;
            border: 1px solid #363636;
            border-radius: 4px;
            padding: 9px;
            color: #dddddd;
            font-size: 7px;
            outline: none;
            margin-bottom: 12px;
        }

        .feedback-text::placeholder {
            color: #777777;
        }

        .feedback-text:focus {
            border-color: #555555;
        }

        /* Buttons */

        .feedback-buttons {
            display: flex;
            gap: 8px;
        }

        .feedback-btn {
            flex: 1;
            height: 28px;
            border-radius: 4px;
            font-size: 7px;
            cursor: pointer;
            text-decoration: none;
            display: flex;
            align-items: center;
            justify-content: center;
            box-sizing: border-box;
        }

        .skip-btn {
            background: #202020;
            border: 1px solid #333333;
            color: #bbbbbb;
        }

        .skip-btn:hover {
            color: #ffffff;
        }

        .submit-btn {
            background: #ed101c;
            border: 1px solid #ed101c;
            color: #ffffff;
        }

        .submit-btn:hover {
            background: #ff1d29;
        }


        .stars {
    display: flex;
    flex-direction: row-reverse;
    justify-content: center;
    gap: 5px;
    margin-bottom: 18px;
}

.stars input {
    display: none;
}

.stars label {
    font-size: 22px;
    color: #555555;
    cursor: pointer;
    transition: 0.2s;
}

/* Hover */
.stars label:hover,
.stars label:hover ~ label {
    color: #ffcc00;
}

/* Selected */
.stars input:checked ~ label {
    color: #ffcc00;
}
    </style>

</asp:Content>


<asp:Content ID="Content2"
    ContentPlaceHolderID="MainContent"
    runat="server">

    <div class="feedback-page">

        <div class="feedback-card">

            <h1>
                Rate Your Experience
            </h1>

            <p class="subtitle">
                How was your experience with CinePulse?
            </p>


            <div class="rating-title">
                Tap a star to rate
            </div>

            <div class="stars">

    <input type="radio" name="rating" id="star5" value="5" />
    <label for="star5">★</label>

    <input type="radio" name="rating" id="star4" value="4" />
    <label for="star4">★</label>

    <input type="radio" name="rating" id="star3" value="3" />
    <label for="star3">★</label>

    <input type="radio" name="rating" id="star2" value="2" />
    <label for="star2">★</label>

    <input type="radio" name="rating" id="star1" value="1" />
    <label for="star1">★</label>

</div>


            <textarea
                id="txtFeedback"
                runat="server"
                class="feedback-text"
                placeholder="Write your feedback..."></textarea>


            <div class="feedback-buttons">

                <a href="PaymentSuccess.aspx"
                   class="feedback-btn skip-btn">
                    Skip
                </a>


                <asp:Button ID="btnSubmit"
                    runat="server"
                    Text="Submit Feedback"
                    CssClass="feedback-btn submit-btn"
                    OnClick="btnSubmit_Click" />

            </div>

        </div>

    </div>

</asp:Content>
