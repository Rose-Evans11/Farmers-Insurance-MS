<%@ Page Title="Pending Report" Language="C#" MasterPageFile="~/AdminDashboard.Master" AutoEventWireup="true" CodeBehind="AdminPendingReport.aspx.cs" Inherits="Farmers_Insurance_MS.Admin.AdminPendingReport" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--This view will show the dashboard including the farmers info, insurance buttons and insurance report history in table...the data shows will based
   on the session that was login in the landing page / login form--%>
    <div class="message_con" style="text-align: center; padding-top: 0px; margin-left: 30px; font-size: medium;">
        <asp:Label ID="lbl_note" runat="server" Text=""> </asp:Label>
    </div>
    <div class="row center-block" style="padding-left: 50px; padding-top: 20px; overflow: scroll;">
        <h5><strong>Insurance Report History</strong></h5>
        <div class="col-lg-12">
            <asp:GridView ID="gv_report" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="reportID" DataSourceID="SqlDataSourceReport" Style="width: 100%" PageSize="5" Font-Size="Smaller" CellPadding="5" EmptyDataText="Null " HorizontalAlign="Center" Width="100%" OnSelectedIndexChanged="gv_report_SelectedIndexChanged" OnRowDataBound="gv_report_RowDataBound">
                <%--  OnRowDataBound="gv_history_RowDataBound"--%>
                <AlternatingRowStyle BackColor="#FFC107" HorizontalAlign="Center" VerticalAlign="Middle" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True"  SelectText="View" />
                    <asp:BoundField DataField="reportID" HeaderText="Report ID" ReadOnly="True" SortExpression="reportID" InsertVisible="False" />
                    <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
                    <asp:BoundField DataField="middleName" HeaderText="Middle Name" SortExpression="middleName" />
                    <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
                    <asp:BoundField DataField="contactNumber" HeaderText="Contact Number" SortExpression="contactNumber" />
                    <asp:BoundField DataField="IDName" HeaderText="Valid ID" SortExpression="IDName" />
                    <%--<asp:BoundField DataField="IDPhoto" HeaderText="Valid ID Photo" SortExpression="IDPhoto" />--%>
                    <asp:BoundField DataField="barangayName" HeaderText="Barangay Name" SortExpression="barangayName" />
                    <asp:BoundField DataField="insuranceType" HeaderText="Insurance Type" SortExpression="insuranceType" />
                    <asp:BoundField DataField="cropName" HeaderText="Crop Name" SortExpression="cropName" />
                    <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
                    <asp:BoundField DataField="farmLocationName" HeaderText="Farm Location Name" SortExpression="farmLocationName" />
                    <asp:BoundField DataField="cost" HeaderText="Cost" SortExpression="cost" />
                    <asp:BoundField DataField="north" HeaderText="North" SortExpression="north" />
                    <asp:BoundField DataField="east" HeaderText="East" SortExpression="east" />
                    <asp:BoundField DataField="west" HeaderText="West" SortExpression="west" />
                    <asp:BoundField DataField="south" HeaderText="South" SortExpression="south" />
                    <asp:BoundField DataField="remarks" HeaderText="Remarks" SortExpression="remarks" />
                    <asp:BoundField DataField="datePlanted" HeaderText="Date Planted" SortExpression="datePlanted" ApplyFormatInEditMode="true" DataFormatString="{0:d}"/>
                    <asp:BoundField DataField="dateApplied" HeaderText="Date Applied" SortExpression="dateApplied" ApplyFormatInEditMode="true" DataFormatString="{0:d}"/>
                    <asp:BoundField DataField="dateStatus" HeaderText="Date Status" SortExpression="dateStatus" ApplyFormatInEditMode="true" DataFormatString="{0:d}"/>
                    <asp:BoundField DataField="emailAddress" HeaderText="Email Address" SortExpression="emailAddress" />
                    <asp:BoundField DataField="farmPortion" HeaderText="Farm Portion" SortExpression="farmPortion" />
                    <asp:TemplateField HeaderText="ID Photo" SortExpression="IDPhoto">
                        <ItemTemplate>
                            <img src='<%# Eval("IDPhoto") %>' id="imageControl" runat="server" width="100" height="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                <HeaderStyle BackColor="#FFC107" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" Width="500px" />
                <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                <EmptyDataRowStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                <PagerStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                <RowStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="False" />
                <SelectedRowStyle Wrap="False" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceReport" runat="server" ConnectionString="<%$ ConnectionStrings:db_fifmsConnectionString %>" SelectCommand="SELECT * FROM [tbl_report] WHERE ([remarks] = @remarks)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Pending" Name="remarks" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>
        </div>
    </div>

    <div class="row center-block" style="padding-left: 10px; padding-top: 20px;">
        <center>
            <div class="col-lg-12">
                <asp:Label ID="Label1" runat="server" Text="Report ID: "></asp:Label>
                <asp:Label ID="lbl_report_id" runat="server"></asp:Label>
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
                            <asp:TextBox ID="lbl_fname" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="lbl_mname" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="lbl_lname" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" Text="Barangay"></asp:Label>
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
                            <asp:TextBox ID="lbl_brgy" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="lbl_contact" runat="server" Text=" " ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="lbl_email" runat="server" Text=" " ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 15px"></td>
                    </tr>
                    <tr>
                        <td style="background-color: #FFC107;" colspan="3">Report Information </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" Text="Insurance Type "></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" Text="Crops "></asp:Label>

                        </td>
                        <td>
                            <asp:Label ID="Label6" runat="server" Text="Farm Location "></asp:Label>
                        </td>

                    </tr>
                    <tr>

                        <td>
                            <asp:TextBox ID="lbl_insurance" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="lbl_crop" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="lbl_farm" runat="server" Text="" ReadOnly="true"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server" Text="Initial Cost "></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" Text="Date Planted "></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" Text="Date Applied for  "></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="lbl_cost" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="lbl_planted" runat="server" ReadOnly="true"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="lbl_applied" runat="server" ReadOnly="true"></asp:TextBox>


                        </td>
                    </tr>
                    <tr>
                        <td style="height: 15px"></td>
                    </tr>
                    <tr>
                        <td style="background-color: #FFC107;" colspan="3">Brief Description </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server">Description</asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server">North</asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server">East</asp:Label>
                        </td>
                    </tr>
                    <tr>

                        <td>
                            <asp:TextBox ID="lbl_desc" runat="server" TextMode="MultiLine" Style="resize: none; height: 80px; width: 150px" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="lbl_north" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="lbl_east" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server">Farm Portion</asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server">West</asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server">South</asp:Label>
                        </td>
                    </tr>
                    <tr>

                        <td>
                            <asp:TextBox ID="lbl_portion" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="lbl_west" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="lbl_south" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 15px"></td>
                    </tr>
                    <tr>
                        <td style="background-color: #FFC107;" colspan="3">Other Information </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label runat="server">Valid ID Type</asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label10" runat="server" Text="Valid ID"></asp:Label>
                        </td>
                        <td>
                            <asp:Label runat="server" Text="Status"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:TextBox ID="lbl_valid" runat="server" ReadOnly="true"></asp:TextBox>
                        </td>
                        <td>
                            <itemtemplate>
                                <asp:Image ID="img_photo" ImageUrl='<%# Eval("IDPhoto") %>' runat="server" Style="width: 100px; height: auto" />
                            </itemtemplate>
                        </td>
                        <td>
                            <asp:DropDownList ID="dl_status" runat="server" DataSourceID="SqlDataSourceStatus" DataTextField="remarks" DataValueField="remarks" ValidateRequestMode="Enabled" AppendDataBoundItems="True" Height="25px" Width="128px">
                                <asp:ListItem Selected="True" Value="" Text="Select Status"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceStatus" runat="server" ConnectionString="<%$ ConnectionStrings:db_fifmsConnectionString %>" SelectCommand="SELECT [remarks] FROM [tbl_remark] ORDER BY [remarks]"></asp:SqlDataSource>
                            <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="dl_status"
                                InitialValue="" runat="server" ForeColor="Red" ValidationGroup="aa" />
                        </td>
                    </tr> 
                    <tr>
                        <td style="height: 15px"></td>
                    </tr>
                    <tr>
                        <td></td>
                        <td style="text-align: right">&nbsp;
                        </td>
                        <td style="text-align: center">
                            <asp:Button ID="btn_update" runat="server" Text="Update" class="btn btn-warning" Width="150px" OnClick="btn_update_Click" />
                        </td>
                    </tr>

                </table>
            </div>
        </center>
    </div>
    <asp:Label runat="server" ID="lbl_session" Visible="false"></asp:Label>
    <asp:Label runat="server" ID="lbl_fn" Visible="false"></asp:Label>
    <asp:Label runat="server" ID="lbl_ln" Visible="false"></asp:Label>
</asp:Content>
