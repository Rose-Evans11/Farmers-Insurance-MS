<%@ Page Title="Farmer Profile" Language="C#" MasterPageFile="~/UserDashboard.Master" AutoEventWireup="true" CodeBehind="FarmerProfile.aspx.cs" Inherits="Farmers_Insurance_MS.Farmers.FarmerProfile" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
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
                    <td> Contact Number :</td>
                    <td style="width:200px"> <asp:TextBox ID="txt_contact" runat="server" required></asp:TextBox> </td>
                </tr>
                    <tr style="height:15px">
                        <td></td>
                        <td></td>
                    </tr>
                <tr>
                    <td> Address :</td>
                    <td>
                        <asp:DropDownList ID="dl_address" runat="server" DataSourceID="SqlDataSourcesAddress" DataTextField="barangayName" DataValueField="barangayName">
                        <asp:ListItem >Select Barangay</asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourcesAddress" runat="server" ConnectionString="<%$ ConnectionStrings:db_fifmsConnectionString %>" SelectCommand="SELECT [barangayName] FROM [tbl_barangay] ORDER BY [barangayName]"></asp:SqlDataSource>
                    </td>
                     <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="dl_address"
                                    InitialValue="" runat="server" ForeColor="Red"  ValidationGroup="aa"/>
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
                    <td> <asp:Button ID="btnSave" runat="server" Text="Saved Changes"  BorderStyle="None" ToolTip="Saved Changes" OnClick="btnSave_Click" ValidationGroup="aa" CssClass="btn btn-warning"/> </td>
                </tr>
            </table>
                </div>
            </div>

    <asp:Label runat="server" ID="lbl_session" Visible="false"></asp:Label>
</asp:Content>
