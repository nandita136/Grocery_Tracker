<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Grocery.register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/auth.css">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
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
                    <a class="btn btn-primary" href="register.html">Get Started Free <i class="fa-solid fa-arrow-right"></i></a><a class="btn btn-secondary" href="login.aspx">Login</a></div>
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
    <div class="auth-shell" style="min-height: 100vh; display: flex; justify-content: center; align-items: center; background: #fff;">
        <main class="auth-panel" style="width: 100%; display: flex; justify-content: center; align-items: center; padding: 30px;">
<div id="register-form" class="form-card" style="display: block; width: 470px; max-width: 92%; background: #fff; padding: 34px; border-radius: 20px; border: 1px solid #dcebe1; box-shadow: 0 10px 30px rgba(31,93,58,.1);">                <h1>Create account</h1>
                <div id="form-error" class="form-error"></div>
                <div id="form-success" class="form-success"></div>
                <%--<div class="form-group">
                    <asp:Label ID="Label1" runat="server" Text="Name"></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </div>--%>
                <div class="form-group" style="display: block; width: 100%;">
                    <asp:Label ID="Label1" runat="server" Text="Name"
                        Style="display: block; margin-bottom: 6px;">
                    </asp:Label>

                    <asp:TextBox ID="TextBox1" runat="server"
                        Style="width: 100%; padding: 11px 13px; border: 1px solid #cfe1d5; border-radius: 9px;">
                    </asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" Text="Email"></asp:Label>
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" Text="Password"></asp:Label>
                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label4" runat="server" Text="Confirm Password"></asp:Label>
                    <asp:TextBox ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox>
                </div>
                <asp:Button ID="Button1" CssClass="btn btn-primary" Style="width: 100%; margin-top: 10px" runat="server" Text="Register" OnClick="Button1_Click" />
                <p class="small muted" style="text-align: center; margin-top: 20px">Already registered? <a href="login.aspx" style="color: var(--green); font-weight: 800">Sign in</a></p>
            </div>
        </main>
    </div>
    <script src="js/storage.js"></script>
    <script src="js/common.js"></script>
    <script src="js/auth.js"></script>
    <script>registerUser();</script>
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder1">
    <%--<!doctype html>
                <html>
                <head>
                    <meta charset="UTF-8">
                    <meta name="viewport" content="width=device-width,initial-scale=1"><title>Grocery Tracker | Plan better, shop smarter</title>
                    <link rel="preconnect" href="https://fonts.googleapis.com">
                    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800;900&family=Quicksand:wght@600;700&display=swap" rel="stylesheet">
                    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css">
                    <link rel="stylesheet" href="css/style.css">
                </head>
                <body>
                    <header class="site-header">
                        <div class="container nav-wrap">
                            <a class="brand" href="Home.aspx"><i class="fa-solid fa-leaf"></i>Grocery Tracker</a><nav class="nav-links">
                                <a class="active" href="Home.aspx">Home</a><a href="about.aspx">About</a><a href="contact.aspx">Contact</a><a href="login.aspx">Login</a><a class="btn btn-primary" href="register.html">Register</a></nav>
                        </div>
                    </header>--%>
</asp:Content>


<asp:Content ID="Content4" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <%--    <footer class="footer">
        <div class="container footer-grid">
            <div class="brand" style="color: #fff">
                <i class="fa-solid fa-leaf"></i>Grocery Tracker</div>
            <div class="footer-links">
                <a href="about.aspx">About</a><a href="contact.aspx">Contact</a><a href="login.aspx">Privacy</a><a href="login.aspx">Terms</a></div>
        </div>
    </footer>--%>
    <div class="toast-wrap">
    </div>
    <script src="js/storage.js"></script>
    <script src="js/common.js"></script>
    <script src="js/home.js"></script>
</asp:Content>
