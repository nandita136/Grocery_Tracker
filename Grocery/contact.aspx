<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Grocery.contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="ContentPlaceHolder2">
    <main>
        <!-- Page Header -->
        <section class="contact-hero">
            <div class="container">
                <div class="eyebrow-pill">Get in Touch</div>
                <h1 style="font-family: Quicksand, sans-serif; font-weight: 900; font-size: clamp(2rem, 4vw, 3rem); color: var(--dark); margin: 12px 0;">Contact Us</h1>
                <p style="color: var(--muted); font-size: 1.05rem; max-width: 600px; margin: 0 auto;">Have a question or feedback? We would love to hear from you.</p>
            </div>
        </section>

        <!-- Two Column Layout -->
        <section class="container">
            <div class="contact-grid">
                
                <!-- LEFT: Contact Information -->
                <div class="contact-info">
                    <h3>Contact Information</h3>
                    
                    <div class="contact-info-card">
                        <div class="contact-info-icon">
                            <i class="fa-solid fa-envelope"></i>
                        </div>
                        <div class="contact-info-text">
                            <span class="label">Email</span>
                            <span class="value">hello@grocerytracker.in</span>
                        </div>
                    </div>
                    
                    <div class="contact-info-card">
                        <div class="contact-info-icon">
                            <i class="fa-solid fa-phone"></i>
                        </div>
                        <div class="contact-info-text">
                            <span class="label">Phone</span>
                            <span class="value">+91 98765 43210</span>
                        </div>
                    </div>
                </div>

                <!-- RIGHT: Contact Form -->
                <div class="contact-form-card">
                    <h3>Send a Message</h3>
                    
                    <div class="contact-form-row">
                        <div class="form-group">
                            <label>Your Name</label>
                            <div class="contact-input-wrap">
                                <i class="fa-regular fa-user"></i>
                                <asp:TextBox ID="TextBox1" runat="server" placeholder="John Doe"></asp:TextBox>
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <label>Email Address</label>
                            <div class="contact-input-wrap">
                                <i class="fa-regular fa-envelope"></i>
                                <asp:TextBox ID="TextBox2" runat="server" TextMode="Email" placeholder="john@example.com"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Subject</label>
                        <div class="contact-input-wrap">
                            <i class="fa-regular fa-bookmark"></i>
                            <asp:TextBox ID="TextBox3" runat="server" placeholder="How can we help?"></asp:TextBox>
                        </div>
                    </div>

                    <div class="form-group">
                        <label>Message</label>
                        <div class="contact-input-wrap">
                            <i class="fa-regular fa-comment" style="top: 20px; transform: none;"></i>
                            <asp:TextBox ID="TextBox4" runat="server" TextMode="MultiLine" Rows="5" placeholder="Write your message here..."></asp:TextBox>
                        </div>
                    </div>

                    <asp:Button ID="Button1" runat="server" Text="Send Message" CssClass="btn-send" OnClick="Button1_Click" />
                </div>

            </div>
        </section>
    </main>
</asp:Content>