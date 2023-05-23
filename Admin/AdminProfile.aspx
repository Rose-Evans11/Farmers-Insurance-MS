<%@ Page Title="Admin Profile" Language="C#" MasterPageFile="~/AdminDashboard.Master" AutoEventWireup="true" CodeBehind="AdminProfile.aspx.cs" Inherits="Farmers_Insurance_MS.Admin.AdminProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
     <div class="message_con" style="text-align: center; padding-top: 0px; margin-left: 30px; font-size: medium;">
        <asp:Label ID="lbl_note" runat="server" Text=""> </asp:Label>
    </div>
     <div class="row center-block" style="padding: 50px; padding-top: 100px">
        <center>
            <div class="col-lg-12">
                <table>
                <tr>
                    <td> First Name :</td>
                    <td> <asp:TextBox ID="txt_firstname" runat="server" required></asp:TextBox> </td>
                </tr>  
                    <tr style="height:15px">
                        <td></td>
                        <td></td>
                    </tr>
                <tr>
                    <td> Middle Name :</td>
                    <td> <asp:TextBox ID="txt_middlename" runat="server"></asp:TextBox> </td>
                </tr>
                    <tr style="height:15px">
                        <td></td>
                        <td></td>
                    </tr>
                <tr>
                    <td> Last Name :</td>
                    <td> <asp:TextBox ID="txt_lastname" runat="server" required></asp:TextBox> </td>
                </tr>
                    <tr style="height:15px">
                        <td></td>
                        <td></td>
                    </tr>
                <tr>
                    <td> Position:</td>
                    <td style="width:200px"> <asp:TextBox ID="txt_position" runat="server" required></asp:TextBox> </td>
                </tr>
                    <tr style="height:15px">
                        <td></td>
                        <td></td>
                    </tr>
               
                <%-- <tr>
                    <td> User Photos </td>
                    <td> <asp:FileUpload ID="file_prof" runat="server" /> </td>
                </tr>
               <tr>
                    <td>
                         <ItemTemplate>
                              <asp:Image id="img_profile" ImageUrl='<%# Eval("ProfileImg") %>' runat="server" style="width:200px; height:auto"/>
                          </ItemTemplate>
                    </td>
                </tr>--%>
                    <tr style="height:15px">
                        <td></td>
                        <td></td>
                    </tr>
                <tr>
                    <td> </td>
                    <td> <asp:Button ID="btnSave" runat="server" Text="Saved Changes"  BorderStyle="None" ToolTip="Saved Changes" OnClick="btnSave_Click"  CssClass="btn btn-warning"/> </td>
                </tr>
            </table>
                </div>
            </div>

    <asp:Label runat="server" ID="lbl_session" Visible="false"></asp:Label>
</asp:Content>
