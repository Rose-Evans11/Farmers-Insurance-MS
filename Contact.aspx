<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Farmers_Insurance_MS.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
   <div class="row" style="padding:80px">
    <div class="col-md-6">
        <h2> <b> Contact Us</b> </h2>
        <br />
        <address>
            Thank you for considering FIFMS. We would love to hear from you! <br />
            Please find our contact information below:<br />
            Office Address: 1234 Tanauan City Batangas<br />
            Phone Number: 09171547444 / 545-0000 <br />
            Email: fifms.services@gmail.com <br />
            Business Hours: Monday - Friday: 8:00 AM - 5: 00 PM <br />
            Saturday - Sunday: Closed <br />
        </address>
        <address>
             <a href="mailto:Support@example.com" class="btn btn-warning btn-s mt-1">Send us a messages! </a><br />
        </address>
        <p> </p>
    </div>
    <div class="col-md-6">
        <img src="Images/img_contact.png" class="img-responsive" alt="" />
    </div>
</div>
</asp:Content>
