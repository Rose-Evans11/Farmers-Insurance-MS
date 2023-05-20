<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Farmers_Insurance_MS._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row" style="padding: 50px">
    <div class="col-md-6">
        <img src="Images/img_home.png" class="img-responsive" alt="" />
        <br />
        <h5> <b> &nbsp; &nbsp; &nbsp;
            Work in the present, think for future.
            We care for your crops!
        </b></h5>
    </div>
    <div class="col-md-6" style="padding-top: 50px">
        <h4> <b>  Login to your Account</b> </h4>
        <br />
        <asp:Login ID="UserLogin" runat="server" Height="200px" TitleText="" Width="300px">
            <LoginButtonStyle BorderStyle="None" CssClass="btn-warning btn-sm" />
        </asp:Login>
    </div>
</div>

</asp:Content>
