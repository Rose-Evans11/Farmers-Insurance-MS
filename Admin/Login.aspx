<%@ Page Title="" Language="C#" MasterPageFile="~/SiteAdmin.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Farmers_Insurance_MS.Admin.Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
     <div class="row" style="padding: 50px">
    <div class="col-md-6">
        <img src="../Images/img_home.png" class="img-responsive" alt="" />
        <br />
        <h5> <b> &nbsp; &nbsp; &nbsp;
            Work in the present, think for future.
            We care for your crops!
        </b></h5>
    </div>
    <div class="col-md-6" style="padding-top: 50px">
        <h4> <b>  Login to your Admin Account</b> </h4>
        <br />
         <table>
                    <tr>
                        <td>Email Address :</td>
                        <td> &nbsp;<asp:TextBox ID="txt_user" runat="server" PlaceHolder="Email Address" required TextMode="Email"></asp:TextBox>&nbsp; </td>
                    </tr>
                     <tr style="height:15px">
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>Password : </td>
                        <td> &nbsp;<asp:TextBox ID="txt_pass" runat="server" Placeholder="Password" TextMode="Password" required></asp:TextBox>&nbsp;</td>
                      
                    </tr>
              
                    <tr> 
                        <td></td>
                            <td> <asp:Label ID="lbl_alert" runat="server" Text=""></asp:Label></td>
                        </tr>
                    <tr>
                        <td></td>
                        <td>
                            <br />&nbsp;
                             <asp:Button ID="btnLogin" OnClick="btnLogin_Click"  runat="server" Text="Log in" class="btn btn-warning btn-s mt-1" style="width: 184px; height: 30px;"  />
                             <asp:Label runat="server" ID="lbl_fn" Visible="false"></asp:Label>
                            <asp:Label runat="server" ID="lbl_ln" Visible="false"></asp:Label>
                        </td>
                        <td></td>
                    </tr>
                </table>
    </div>
</div>

</asp:Content>
