<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="Grocery.about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <main class="section">
        <div class="container">
            <!-- Page Header -->
            <div class="section-head">
                <div class="eyebrow">About</div>
                <h1>Grocery Tracker & Helper</h1>
            </div>

            <!-- Mission Section with Side-by-Side Layout -->
            <section class="hero">
                <div class="container hero-grid">
                    <!-- Left Column: Text Content -->
                    <div>
                        <div class="eyebrow">Our Mission</div>
                        <h3>Eliminating weekly meal-planning stress</h3>
                        <p>We believe that cooking at home should be a joy, not a chore. Most people spend over an hour each week just deciding what to eat and writing grocery lists. Our platform compresses that to minutes — select meals, get a list, shop or order.</p>
                    </div>
                    
                    <!-- Right Column: Image (MOVED OUTSIDE the text div) -->
                    <div class="hero-art">
                        <img src="images/Grocery2.jpg" alt="Fresh grocery illustration" style="width: 100%; height: 100%; object-fit: cover; border-radius: 28px;">
                    </div>
                </div>
            </section>

            <!-- Features Section -->
            <div class="section-head">
                <div class="eyebrow">Features</div>
                <h2>Everything you need, in one place</h2>
            </div>
            <div class="feature-grid">
                <article class="card feature-card">
                    <i class="fa-solid fa-calendar-days"></i>
                    <h3>Weekly Meal Planning</h3>
                    <p>Plan breakfast, lunch, and dinner for every day of the week.</p>
                </article>
                <article class="card feature-card">
                    <i class="fa-solid fa-wand-magic-sparkles"></i>
                    <h3>Grocery Suggestions</h3>
                    <p>Instantly generate complete ingredient lists from your selected meals.</p>
                </article>
                <article class="card feature-card">
                    <i class="fa-solid fa-basket-shopping"></i>
                    <h3>Grocery Management</h3>
                    <p>Add, edit and check off what you need.</p>
                </article>
                <article class="card feature-card">
                    <i class="fa-solid fa-cake-candles"></i>
                    <h3>Special Meals</h3>
                    <p>Recipes for celebrations and gatherings.</p>
                </article>
                <article class="card feature-card">
                    <i class="fa-solid fa-chart-line"></i>
                    <h3>Order via Blinkit</h3>
                    <p>Directly go to Blinkit and get everything delivered in under 10 minutes.</p>
                </article>
            </div>

            <!-- Bottom About Section -->
            <section class="section about-band">
                <div class="container hero-grid">
                    <div>
                        <h2>Good food starts with a good plan.</h2>
                        <p class="muted">Grocery Tracker is a practical meal planning companion for busy households. It keeps your recipes, shopping list and special occasions connected.</p>
                    </div>
                    <div class="card">
                        <h3><i class="fa-solid fa-seedling" style="color: var(--green)"></i>Built for everyday decisions</h3>
                        <p class="muted">Choose meals, adjust servings and let the quantities do the arithmetic. Less mental load, fewer forgotten ingredients.</p>
                    </div>
                </div>
            </section>
        </div>
    </main>
</asp:Content>