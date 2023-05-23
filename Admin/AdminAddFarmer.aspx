<%@ Page Title="Add Farmers" Language="C#" MasterPageFile="~/AdminDashboard.Master" AutoEventWireup="true" CodeBehind="AdminAddFarmer.aspx.cs" Inherits="Farmers_Insurance_MS.Admin.AdminAddFarmers" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="message_con" style="text-align: center; padding-top: 0px; margin-left: 30px; font-size: medium;">
        <asp:Label ID="lbl_note" runat="server" Text=""> </asp:Label>
    </div>
    <div class="row center-block" style="padding-left: 50px; padding-top: 20px;">
        <h5><strong>List of Farmers </strong></h5>
        <div class="col-lg-12" style="overflow: scroll;">
            <asp:GridView ID="gv" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="farmerID" DataSourceID="SqlDataSourceFarmer" Style="width: max-content" PageSize="5" Font-Size="Smaller" CellPadding="5" EmptyDataText="Null " HorizontalAlign="Center" Width="100%" OnSelectedIndexChanged="gv_report_SelectedIndexChanged" CellSpacing="5">
                <%--OnRowDataBound="gv_report_RowDataBound" OnSelectedIndexChanged="gv_report_SelectedIndexChanged"--%>

                <AlternatingRowStyle BackColor="#FFC107" HorizontalAlign="Center" VerticalAlign="Middle" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="farmerID" HeaderText="Farmer ID" ReadOnly="True" SortExpression="farmerID" InsertVisible="False" />
                    <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
                    <asp:BoundField DataField="middleName" HeaderText="Middle Name" SortExpression="middleName" />
                    <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
                    <asp:BoundField DataField="barangayName" HeaderText="Barangay Name" SortExpression="barangayName" />
                    <asp:BoundField DataField="contactNumber" HeaderText="Contact Number" SortExpression="contactNumber" />
                    <asp:BoundField DataField="emailAddress" HeaderText="Email Address" SortExpression="emailAddress" />
                </Columns>
                <HeaderStyle BackColor="#FFC107" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" Wrap="False" />
                <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                <RowStyle BorderStyle="None" HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceFarmer" runat="server" ConnectionString="<%$ ConnectionStrings:db_fifmsConnectionString %>" SelectCommand="SELECT [farmerID], [firstName], [middleName], [lastName], [barangayName], [contactNumber], [emailAddress], [password] FROM [tbl_farmers]"></asp:SqlDataSource>
        </div>
    </div>
    <div class="row center-block" style="padding-left: 10px; padding-top: 20px;">
        <center>
            <div class="col-lg-12" id="add_farmer">
                <asp:Label ID="Label1" runat="server" Text="Farmers"></asp:Label>
                <asp:Label ID="lbl_id" runat="server" Text=""></asp:Label>
                <table style="text-align: left">
                    <tr>
                        <td style="background-color: #FFC107;" colspan="3">Farmer's Information </td>
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
                            <asp:Label runat="server" Text="Barangay "></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" Text="Contact Number "></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" Text="Email "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="dl_barangay" runat="server" DataSourceID="SqlDataSourceBarangay" DataTextField="barangayName" DataValueField="barangayName" ValidateRequestMode="Enabled" AppendDataBoundItems="True" Height="25px" Width="128px">
                                <asp:ListItem Selected="True" Value="" Text="Select Barangay"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceBarangay" runat="server" ConnectionString="<%$ ConnectionStrings:db_fifmsConnectionString %>" SelectCommand="SELECT [barangayName] FROM [tbl_barangay] ORDER BY [barangayName]"></asp:SqlDataSource>
                            <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="dl_barangay"
                                InitialValue="" runat="server" ForeColor="Red" ValidationGroup="aa" /></td>

                        <td>
                            <asp:TextBox ID="lbl_contact" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="lbl_contact"
                                InitialValue="" runat="server" ForeColor="Red" ValidationGroup="aa" />
                        </td>
                        <td>
                            <asp:TextBox ID="lbl_email" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="lbl_email"
                                InitialValue="" runat="server" ForeColor="Red" ValidationGroup="aa" />
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 15px"></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="set_pass" runat="server">Set Password </asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txt_password" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="txt_password"
                                InitialValue="" runat="server" ForeColor="Red" ValidationGroup="aa" />
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
