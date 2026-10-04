<%@ Page Title="Help & Support" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .help-page {
            width: 100%;
            min-height: calc(100vh - 82px);
            background: #111111;
            padding: 25px 35px 40px 35px;
            color: #ffffff;
        }

        .help-subtitle {
            color: #888888;
            font-size: 12px;
            margin-bottom: 26px;
        }

        /* 2 SIMPLE CARDS */
        .help-cards {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 18px;
            margin-bottom: 28px;
        }

        .help-card {
            background: #171717;
            border: 1px solid #292929;
            border-radius: 8px;
            padding: 22px;
            transition: 0.2s;
            cursor: pointer;
        }

        .help-card:hover {
            border-color: #FFC3B9;
            transform: translateY(-2px);
        }

        .help-card-header {
            display: flex;
            align-items: center;
            gap: 12px;
            margin-bottom: 10px;
        }

        .help-card-icon {
            width: 38px;
            height: 38px;
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
        }

        .help-card-icon.privacy { background: rgba(96, 165, 250, 0.15); color: #60a5fa; }
        .help-card-icon.safety  { background: rgba(74, 222, 128, 0.15); color: #4ade80; }

        .help-card-title {
            color: #ffffff;
            font-size: 14px;
            font-weight: 600;
        }

        .help-card-desc {
            color: #888888;
            font-size: 11px;
            line-height: 16px;
        }

        /* FAQ SECTION */
        .help-section {
            background: #171717;
            border: 1px solid #292929;
            border-radius: 8px;
            padding: 22px 26px;
            margin-bottom: 18px;
        }

        .help-section-title {
            color: #ffffff;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 16px;
            padding-bottom: 12px;
            border-bottom: 1px solid #242424;
        }

        .faq-item {
            padding: 12px 0;
            border-bottom: 1px solid #1f1f1f;
        }

        .faq-item:last-child { border-bottom: none; padding-bottom: 0; }

        .faq-question {
            color: #dddddd;
            font-size: 12px;
            font-weight: 500;
            margin-bottom: 6px;
        }

        .faq-answer {
            color: #888888;
            font-size: 11px;
            line-height: 17px;
        }

        /* DYNAMIC HAMBURGER */
        .home-hamburger {
            display: flex; flex-direction: column; justify-content: center;
            gap: 4px; width: 24px; height: 24px;
            cursor: pointer; flex-shrink: 0;
        }
        .home-hamburger span {
            display: block; width: 20px; height: 2px;
            background: #FFC3B9; border-radius: 2px;
        }

        @media screen and (max-width: 700px) {
            .help-page { padding: 20px 15px; }
            .help-cards { grid-template-columns: 1fr; }
        }
    </style>
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!-- JAVASCRIPT: Show hamburger + Add "Help & Support" title -->
    <script>
        document.addEventListener("DOMContentLoaded", function () {
            var hamburger = document.getElementById("mainHamburger");
            if (hamburger) { hamburger.style.display = "flex"; }

            var header = document.querySelector(".cine-header");
            var searchArea = document.querySelector(".header-search-area");

            if (header && searchArea) {
                var oldTitle = document.getElementById("helpHeaderTitle");
                if (!oldTitle) {
                    var titleEl = document.createElement("div");
                    titleEl.id = "helpHeaderTitle";
                    titleEl.innerText = "Help & Support";
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
    </script>

    <div class="help-page">

        <p class="help-subtitle">
            Find answers and learn about privacy & safety.
        </p>


        <!-- 2 SIMPLE CARDS -->
        <div class="help-cards">

            <div class="help-card" onclick="scrollToSection('privacySection');">
                <div class="help-card-header">
                    <div class="help-card-icon privacy">🔒</div>
                    <div class="help-card-title">Privacy Policy</div>
                </div>
                <div class="help-card-desc">
                    Learn how we protect your data and respect your privacy.
                </div>
            </div>

            <div class="help-card" onclick="scrollToSection('safetySection');">
                <div class="help-card-header">
                    <div class="help-card-icon safety">🛡</div>
                    <div class="help-card-title">Safety Guidelines</div>
                </div>
                <div class="help-card-desc">
                    Best practices for keeping your account secure.
                </div>
            </div>

        </div>


        <!-- PRIVACY SECTION -->
        <div id="privacySection" class="help-section">
            <div class="help-section-title">Privacy Policy</div>

            <div class="faq-item">
                <div class="faq-question">What data do we collect?</div>
                <div class="faq-answer">
                    We collect only the information necessary to provide our services — your name, email, booking history, and payment details. We never sell your personal data to third parties.
                </div>
            </div>

            <div class="faq-item">
                <div class="faq-question">How is my data protected?</div>
                <div class="faq-answer">
                    All data is encrypted using industry-standard SSL/TLS encryption. Our servers use multi-layer security with firewalls, regular audits, and 24/7 monitoring.
                </div>
            </div>

            <div class="faq-item">
                <div class="faq-question">Can I delete my account and data?</div>
                <div class="faq-answer">
                    Yes. You can request complete account deletion from Settings → Privacy. All your personal data will be permanently removed within 30 days.
                </div>
            </div>

            <div class="faq-item">
                <div class="faq-question">Do you use cookies?</div>
                <div class="faq-answer">
                    We use essential cookies to keep you logged in and improve your experience. You can manage cookie preferences in your browser settings.
                </div>
            </div>
        </div>


        <!-- SAFETY SECTION -->
        <div id="safetySection" class="help-section">
            <div class="help-section-title">Safety Guidelines</div>

            <div class="faq-item">
                <div class="faq-question">Use a strong password</div>
                <div class="faq-answer">
                    Choose passwords with at least 12 characters, mixing uppercase, lowercase, numbers, and symbols. Never reuse passwords across different services.
                </div>
            </div>

            <div class="faq-item">
                <div class="faq-question">Enable Two-Factor Authentication (2FA)</div>
                <div class="faq-answer">
                    Add an extra layer of security by enabling 2FA in Settings → Security. You'll receive a code on your phone each time you log in.
                </div>
            </div>

            <div class="faq-item">
                <div class="faq-question">Recognize phishing attempts</div>
                <div class="faq-answer">
                    We will never ask for your password via email or phone. Always verify the sender's email address and never click suspicious links.
                </div>
            </div>

            <div class="faq-item">
                <div class="faq-question">Log out from shared devices</div>
                <div class="faq-answer">
                    Always log out after using a public or shared computer. You can also remotely sign out all devices from your Profile settings.
                </div>
            </div>
        </div>

    </div>


    <script>
        function scrollToSection(id) {
            var el = document.getElementById(id);
            if (el) {
                el.scrollIntoView({ behavior: "smooth", block: "start" });
            }
        }
    </script>

</asp:Content>