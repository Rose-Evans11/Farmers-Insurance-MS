<%@ Page Title="Add Admin" Language="C#" MasterPageFile="~/AdminDashboard.Master" AutoEventWireup="true" CodeBehind="AdminAddAdmin.aspx.cs" Inherits="Farmers_Insurance_MS.Admin.AdminAddAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="message_con" style="text-align: center; padding-top: 20px; margin-left: 30px; font-size: medium;">
        <asp:Label ID="lbl_note" runat="server" Text=""> </asp:Label>
    </div>
    <div class="row center-block" style="padding-left: 50px; padding-top: 20px;">
        <h5><strong>List of Admin </strong></h5>
        <div class="col-lg-12" style="overflow: scroll;">
            <asp:GridView ID="gv" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="adminID" DataSourceID="SqlDataSourceAdmin" Style="width: max-content" PageSize="5" Font-Size="Smaller" CellPadding="5" EmptyDataText="Null " HorizontalAlign="Center" Width="100%" OnSelectedIndexChanged="gv_report_SelectedIndexChanged" CellSpacing="5">
                <%--OnRowDataBound="gv_report_RowDataBound" OnSelectedIndexChanged="gv_report_SelectedIndexChanged"--%>

                <AlternatingRowStyle BackColor="#FFC107" HorizontalAlign="Center" VerticalAlign="Middle" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="adminID" HeaderText="Admin ID" ReadOnly="True" SortExpression="adminID" InsertVisible="False" />
                    <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
                    <asp:BoundField DataField="middleName" HeaderText="Middle Name" SortExpression="middleName" />
                    <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
                    <asp:BoundField DataField="emailAddress" HeaderText="Email Address" SortExpression="emailAddress" />
                    <asp:BoundField DataField="position" HeaderText="Position" SortExpression="position" />
                </Columns>
                <HeaderStyle BackColor="#FFC107" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" Wrap="False" />
                <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                <RowStyle BorderStyle="None" HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceAdmin" runat="server" ConnectionString="<%$ ConnectionStrings:db_fifmsConnectionString %>" SelectCommand="SELECT [adminID], [firstName], [middleName], [lastName], [emailAddress], [position] FROM [tbl_admin]"></asp:SqlDataSource>
        </div>
    </div>
    <div class="row center-block" style="padding-left: 10px; padding-top: 20px;">
        <center>
            <div class="col-lg-12" id="add_farmer">
                <asp:Label ID="Label1" runat="server" Text="Admin"></asp:Label>
                <asp:Label ID="lbl_id" runat="server"></asp:Label>
                <table style="text-align: left">
                    <tr>
                        <td style="background-color: #FFC107;" colspan="3">Admin's Information </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" Text="First Name "></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" Text="Middle Name"></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" Text="Last Name "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="lbl_fname" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="lbl_fname"
                                InitialValue="" runat="server" ForeColor="Red" ValidationGroup="aa" />
                        </td>
                        <td>
                            <asp:TextBox ID="lbl_mname" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="lbl_mname"
                                InitialValue="" runat="server" ForeColor="Red" ValidationGroup="aa" />
                        </td>
                        <td>
                            <asp:TextBox ID="lbl_lname" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="lbl_lname"
                                InitialValue="" runat="server" ForeColor="Red" ValidationGroup="aa" />
                        </td>
                    </tr>
                    <tr>
                       
                        <td>
                            <asp:Label runat="server" Text="Email"></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" Text="Position "></asp:Label>
                        </td>
                         <td>
                            <asp:Label ID="set_pass" runat="server">Set Password </asp:Label>
                        </td>
                    </tr>
                    <tr>

                        <td>
                            <asp:TextBox ID="lbl_email" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="lbl_email"
                                InitialValue="" runat="server" ForeColor="Red" ValidationGroup="aa" />
                        </td>
                        <td>
                            <asp:TextBox ID="lbl_position" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="lbl_position"
                                InitialValue="" runat="server" ForeColor="Red" ValidationGroup="aa" /></td>
                        <td> <asp:TextBox ID="txt_password" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="txt_password"
                                InitialValue="" runat="server" ForeColor="Red" ValidationGroup="aa" /></td>
                    </tr>
                    <tr>
                        <td style="height: 15px"></td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td>
                           
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td style="height: 15px"></td>
                    </tr>
                    <tr>

                        <td style="text-align: right">
                            <asp:Button ID="btn_edit" runat="server" Text="Edit" class="btn btn-warning" Width="150px" OnClick="btn_edit_Click" /></td>
                        <td style="text-align: right">
                            <asp:Button ID="btn_add" runat="server" Text="Add new farmer" class="btn btn-warning" Width="150px" OnClick="btn_add_Click" />
                            <asp:Button ID="btn_update" runat="server" Text="Update" class="btn btn-warning" Width="150px" OnClick="btn_update_Click" />
                            &nbsp;
                        </td>
                        <td style="text-align: center"></td>

                    </tr>

                </table>
            </div>


        </center>
    </div>
    <asp:Label runat="server" ID="lbl_session" Visible="false"></asp:Label>
    <asp:Label runat="server" ID="lbl_fn" Visible="false"></asp:Label>
    <asp:Label runat="server" ID="lbl_ln" Visible="false"></asp:Label>
</asp:Content>
