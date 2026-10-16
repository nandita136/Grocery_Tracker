<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Grocery.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <main>
        <section class="hero">
            <div class="container hero-grid">
                <div>
                    <div class="eyebrow">
                        Smart Meal Planning
                    </div>
                    <h1>Plan Meals.<br>
                        Track Groceries.<br>
                        Save Time.</h1>
                    <p>
                        Your all-in-one weekly meal planner that auto-generates grocery lists, helps you manage pantry items, and lets you order directly through Blinkit.
                    </p>
                    <div class="actions">
                        <a class="btn btn-primary" href="register.aspx">Get Started <i class="fa-solid fa-arrow-right"></i></a><a class="btn btn-secondary" href="login.aspx">Login</a>
                    </div>
                </div>
                <div class="hero-art" aria-label="Fresh grocery illustration">
                </div>
            </div>
        </section>
        <section class="section">
            <div class="container">
                <div class="section-head">
                    <div class="eyebrow">
                        Features
                    </div>
                    <h2>Everything you need, in one place</h2>
                </div>
                <div class="feature-grid">
                    <article class="card feature-card">
                        <i class="fa-solid fa-calendar-days"></i>
                        <h3>Weekly Meal Planning</h3>
                        <p>
                            Plan breakfast, lunch, and dinner for every day of the week.                       
                        </p>
                    </article>
                    <article class="card feature-card">
                        <i class="fa-solid fa-wand-magic-sparkles"></i>
                        <h3>Grocery Suggestions</h3>
                        <p>
                            Instantly generate complete ingredient lists from your selected meals.                       
                        </p>
                    </article>
                    <article class="card feature-card">
                        <i class="fa-solid fa-basket-shopping"></i>
                        <h3>Grocery Management</h3>
                        <p>
                            Add, edit and check off what you need.
                        </p>
                    </article>
                    <article class="card feature-card">
                        <i class="fa-solid fa-cake-candles"></i>
                        <h3>Special Meals</h3>
                        <p>
                            Recipes for celebrations and gatherings.
                        </p>
                    </article>
                    <article class="card feature-card">
                        <i class="fa-solid fa-chart-line"></i>
                        <h3>Order via Blinkit</h3>
                        <p>
                            Directly go to Blinkit and get everything delivered in under 10 minutes.                       
                        </p>
                    </article>
                </div>
            </div>
        </section>
    </main>
</asp:Content>

