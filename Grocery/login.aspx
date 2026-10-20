<%@ Page Title="" Language="C#" MasterPageFile="~/Auth.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Grocery.login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/auth.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--<main>
    <section class="hero">
        <div class="container hero-grid">
            <div>
                <div class="eyebrow">
                    Fresh planning, less waste</div>
                <h1>Plan Meals.<br>Track Groceries.<br>Save Time.</h1>
                <p>
                    Plan your weekly meals, automatically generate grocery suggestions, manage your shopping list, and organize special meals in one simple application.</p>
                <div class="actions">
                    <a class="btn btn-primary" href="register.aspx">Get Started Free <i class="fa-solid fa-arrow-right"></i></a><a class="btn btn-secondary" href="login.aspx">Login</a></div>
            </div>
            <div class="hero-art" aria-label="Fresh grocery illustration">
            </div>
        </div>
    </section>
    <section class="section">
        <div class="container">
            <div class="section-head">
                <div class="eyebrow">
                    Everything in one place</div>
                <h2>Your kitchen, a little more organized</h2>
                <p>
                    Turn a handful of meal ideas into a calm, confident shopping routine.</p>
            </div>
            <div class="feature-grid">
                <article class="card feature-card">
                    <i class="fa-solid fa-calendar-days"></i>
                    <h3>Weekly Meal Planning</h3>
                    <p>
                        Map breakfast, lunch and dinner across your week.</p>
                </article>
                <article class="card feature-card">
                    <i class="fa-solid fa-wand-magic-sparkles"></i>
                    <h3>Grocery Suggestions</h3>
                    <p>
                        Let your meal choices build an ingredient list.</p>
                </article>
                <article class="card feature-card">
                    <i class="fa-solid fa-basket-shopping"></i>
                    <h3>Grocery Management</h3>
                    <p>
                        Add, edit and check off what you need.</p>
                </article>
                <article class="card feature-card">
                    <i class="fa-solid fa-cake-candles"></i>
                    <h3>Special Meals</h3>
                    <p>
                        Scale recipes for celebrations and gatherings.</p>
                </article>
                <article class="card feature-card">
                    <i class="fa-solid fa-chart-line"></i>
                    <h3>Easy Tracking</h3>
                    <p>
                        See your plans, lists and requests at a glance.</p>
                </article>
            </div>
        </div>
    </section>
    <section class="section about-band">
        <div class="container hero-grid">
            <div>
                <div class="eyebrow">
                    About Grocery Tracker</div>
                <h2>Good food starts with a good plan.</h2>
                <p class="muted">
                    Grocery Tracker is a practical meal planning companion for students and busy households. It keeps your recipes, shopping list and special occasions connected, using your browser for private, persistent storage.</p>
                <a class="btn btn-secondary" href="about.aspx">Learn more <i class="fa-solid fa-arrow-right"></i></a>
            </div>
            <div class="card">
                <h3><i class="fa-solid fa-seedling" style="color: var(--green)"></i>Built for everyday decisions</h3>
                <p class="muted">
                    Choose meals, adjust servings and let the quantities do the arithmetic. Less mental load, fewer forgotten ingredients.</p>
            </div>
        </div>
    </section>
    </main>--%>

    <div class="auth-shell" style="display: flex !important; justify-content: center !important; align-items: center !important; width: 100% !important;">
        <main class="auth-panel" style="width: 100% !important; display: flex !important; justify-content: center !important;">
            <div id="login-form" class="form-card">
                <h1>Welcome back</h1>
                <p class="sub">
                    Sign in to continue planning.
                </p>

                <div id="form-error" class="form-error"></div>
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Email"></asp:Label>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>
                </div>


                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
                    <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <div class="inline small">


                    <a href="forgot-password.aspx" class="btn btn-ghost" style="background: transparent;
                    color: var(--green);
                    border: 0;
                    cursor: pointer;
                    padding: 0;
                    font-weight: 800;
                    text-decoration: none;">Forgot Password ?</a>
                </div>

                <asp:Button ID="btnSignIn"
                    runat="server"
                    CssClass="btn btn-primary"
                    Style="width: 100%; margin-top: 20px"
                    Text="Sign In"
                    OnClick="btnSignIn_Click" />

                <p
                    class="small muted"
                    style="text-align: center; margin-top: 20px">
                    New here ?

                    <a
                        href="register.aspx"
                        style="color: var(--green); font-weight: 800">Create an account

                    </a>

                </p>

                <p
                    class="small"
                    style="text-align: center">
                    <a
                        href="admin-login.aspx"
                        style="color: var(--purple); font-weight: 800">Admin Login

                    </a>
                </p>
            </div>

        </main>

    </div>


    <div class="toast-wrap"></div>


    <script src="js/storage.js"></script>
    <script src="js/common.js"></script>

   

</asp:Content>






