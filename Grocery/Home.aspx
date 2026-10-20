<%@ Page Title="Home" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Grocery.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <main>
        <section class="hero">
            <div class="container hero-grid">
                <div>
                    <div class="eyebrow">
                        <i class="fa-solid fa-leaf"></i> Smart Meal Planning
                    </div>
                    <h1>
                        Plan Meals.<br>
                        <span class="highlight">Track Groceries.</span><br>
                        Save Time.
                    </h1>
                    <p>Your all-in-one weekly meal planner that auto-generates grocery lists, helps you manage pantry items, and lets you order directly through Blinkit.</p>
                    <div class="actions">
                        <a class="btn btn-primary" href="register.aspx">Get Started <i class="fa-solid fa-arrow-right"></i></a>
                        <a class="btn btn-secondary" href="login.aspx">Login</a>
                    </div>
                </div>
                
                <div class="hero-art">
                    <img src="images/Grocery.jpg" alt="Fresh grocery illustration" style="width: 100%; height: 100%; object-fit: cover; border-radius: 28px;">
                </div>
                
            </div>
        </section>

        <section class="section">
            <div class="container">
                <div class="section-head">
                    <div class="eyebrow">Features</div>
                    <h2>Everything you need, in one place</h2>
                </div>
                <div class="feature-grid">
                    <!-- Card 1 -->
                    <article class="card feature-card">
                        <i class="fa-solid fa-calendar-days"></i>
                        <h3>Weekly Meal Planning</h3>
                        <p>Plan breakfast, lunch, and dinner for every day of the week with our intuitive drag-and-drop planner.</p>
                    </article>
                    
                    <!-- Card 2 -->
                    <article class="card feature-card">
                        <i class="fa-solid fa-cart-shopping"></i>
                        <h3>Auto Grocery Lists</h3>
                        <p>Instantly generate complete ingredient lists from your selected meals — no manual entry needed.</p>
                    </article>
                    
                    <!-- Card 3 -->
                    <article class="card feature-card">
                        <i class="fa-solid fa-bookmark"></i>
                        <h3>Save & Reuse Plans</h3>
                        <p>Save your favorite weekly meal plans and reload them anytime to save hours of planning effort.</p>
                    </article>
                    
                    <!-- Card 4 -->
                    <article class="card feature-card">
                        <i class="fa-solid fa-share-from-square"></i>
                        <h3>Order via Blinkit</h3>
                        <p>Send your grocery list directly to Blinkit and get everything delivered in under 10 minutes.</p>
                    </article>
                    
                    <!-- Card 5 -->
                    <article class="card feature-card">
                        <i class="fa-solid fa-chart-line"></i>
                        <h3>Nutrition Insights</h3>
                        <p>Track nutritional balance across your weekly meals to ensure a healthy, varied diet.</p>
                    </article>
                    
                    <!-- Card 6 -->
                    <article class="card feature-card">
                        <i class="fa-solid fa-clock"></i>
                        <h3>Save Time & Money</h3>
                        <p>Reduce food waste and impulse buying by shopping only for what you actually need each week.</p>
                    </article>
                </div>
            </div>
        </section>
    </main>
</asp:Content>