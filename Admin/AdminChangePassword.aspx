<%@ Page Title="" Language="C#" MasterPageFile="~/AdminDashboard.Master" AutoEventWireup="true" CodeBehind="AdminChangePassword.aspx.cs" Inherits="Farmers_Insurance_MS.Admin.AdminChangePassword" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row center-block" style="padding-left: 50px; padding-top: 100px">
        <center>
            <div class="col-lg-12">
                <asp:ChangePassword ID="ChangePassword" runat="server" OnChangingPassword="OnChangingPassword" NewPasswordRegularExpression="^[\s\S]{5,}$" NewPasswordRegularExpressionErrorMessage="Password must be of minimum 5 characters." CancelDestinationPageUrl="~/Farmers/FarmerChangePassword.aspx" RenderOuterTable="False">
                    <CancelButtonStyle CssClass="btn btn-warning" />
                    <ChangePasswordButtonStyle CssClass="btn btn-warning" />
                    <TitleTextStyle Font-Bold="True" Font-Size="15pt" />
                </asp:ChangePassword>
                <asp:Label ID="lblMessage" runat="server" />
            </div>
          <asp:Label runat="server" ID="lbl_session" Visible="false"></asp:Label>
        </center>
    </div>
</asp:Content>
