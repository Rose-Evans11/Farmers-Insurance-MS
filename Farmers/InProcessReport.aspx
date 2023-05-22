<%@ Page Title="" Language="C#" MasterPageFile="~/UserDashboard.Master" AutoEventWireup="true" CodeBehind="InProcessReport.aspx.cs" Inherits="Farmers_Insurance_MS.Farmers.InProcessReport" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row center-block" style="padding-left: 50px; padding-top: 20px;">
        <h5><strong>Insurance Report History</strong></h5>
        <div class="col-lg-12" style="overflow: scroll;">
            <asp:GridView ID="gv" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="reportID" DataSourceID="SqlDataSourceReport" Style="width: max-content" PageSize="5" Font-Size="Smaller" CellPadding="5" EmptyDataText="Null " HorizontalAlign="Center" Width="100%" OnRowDataBound="gv_report_RowDataBound" OnSelectedIndexChanged="gv_report_SelectedIndexChanged">

                <AlternatingRowStyle BackColor="#FFC107" HorizontalAlign="Center" VerticalAlign="Middle" />
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="reportID" HeaderText="Report ID" ReadOnly="True" SortExpression="reportID" InsertVisible="False" />
                    <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName" />
                    <asp:BoundField DataField="middleName" HeaderText="Middle Name" SortExpression="middleName" />
                    <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
                    <asp:BoundField DataField="contactNumber" HeaderText="Contact Number" SortExpression="contactNumber" />
                    <asp:BoundField DataField="IDName" HeaderText="ID Name" SortExpression="IDName" />
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
                    <asp:BoundField DataField="datePlanted" HeaderText="Date Planted" SortExpression="datePlanted" ApplyFormatInEditMode="true" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="dateApplied" HeaderText="Date Applied" SortExpression="dateApplied" ApplyFormatInEditMode="true" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="emailAddress" HeaderText="Email Address" SortExpression="emailAddress" />
                    <asp:BoundField DataField="farmPortion" HeaderText="Farm Portion" SortExpression="farmPortion" />
                    <asp:TemplateField HeaderText="ID Photo" SortExpression="IDPhoto">
                        <ItemTemplate>
                            <img src='<%# Eval("IDPhoto") %>' id="imageControl" runat="server" width="100" height="100" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="#FFC107" ForeColor="Black" HorizontalAlign="Center" VerticalAlign="Middle" Width="100px" Wrap="False" />
                <EditRowStyle HorizontalAlign="Center" VerticalAlign="Middle" Wrap="True" />
                <EmptyDataTemplate>No Record Available</EmptyDataTemplate>
                <RowStyle BorderStyle="None" HorizontalAlign="Center" VerticalAlign="Middle" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSourceReport" runat="server" ConnectionString="<%$ ConnectionStrings:db_fifmsConnectionString %>" SelectCommand="SELECT * FROM [tbl_report] WHERE (([emailAddress] = @emailAddress) AND ([remarks] = @remarks))">
                <SelectParameters>
                    <asp:ControlParameter ControlID="lbl_session" Name="emailAddress" PropertyName="Text" Type="String" />
                    <%--<asp:QueryStringParameter Name="emailAddress" DbType = "String" Direction = "Input" QueryStringField="emailAddress" DefaultValue="" ConvertEmptyStringToNull="True" />--%>
                    <asp:Parameter DefaultValue="In Process" Name="remarks" Type="String" />
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
                            <asp:DropDownList ID="dl_insurance" runat="server" DataSourceID="SqlDataSourceInsurance" DataTextField="insuranceType" DataValueField="insuranceType">
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceInsurance" runat="server" ConnectionString="<%$ ConnectionStrings:db_fifmsConnectionString %>" SelectCommand="SELECT [insuranceType] FROM [tbl_insuranceType] ORDER BY [insuranceType]"></asp:SqlDataSource>
                        </td>
                        <td>
                            <asp:DropDownList ID="dl_crop" runat="server" DataSourceID="SqlDataSourceCrop" DataTextField="cropName" DataValueField="cropName"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceCrop" runat="server" ConnectionString="<%$ ConnectionStrings:db_fifmsConnectionString %>" SelectCommand="SELECT [cropName] FROM [tbl_crop] ORDER BY [cropName]"></asp:SqlDataSource>
                        </td>
                        <td>
                            <asp:DropDownList ID="dl_farm" runat="server" DataSourceID="SqlDataSourceFarm" DataTextField="farmLocationName" DataValueField="farmLocationName"></asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceFarm" runat="server" ConnectionString="<%$ ConnectionStrings:db_fifmsConnectionString %>" SelectCommand="SELECT [farmLocationName] FROM [tbl_farmLocation] ORDER BY [farmLocationName]"></asp:SqlDataSource>
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
                            <asp:TextBox ID="lbl_cost" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="lbl_planted" runat="server" TextMode="Date"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="lbl_applied" runat="server" TextMode="Date"></asp:TextBox>


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
                            <asp:TextBox ID="lbl_desc" runat="server" TextMode="MultiLine" Style="resize: none; height: 80px; width: 150px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="lbl_north" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="lbl_east" runat="server"></asp:TextBox>
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
                            <asp:TextBox ID="lbl_portion" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="lbl_west" runat="server"></asp:TextBox>
                        </td>
                        <td>
                            <asp:TextBox ID="lbl_south" runat="server"></asp:TextBox>
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
                            <asp:Label ID="lbl_change" runat="server" Text="Change Image" Visible="false"></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:DropDownList ID="dl_ID" runat="server" DataSourceID="SqlDataSourceID" DataTextField="IDName" DataValueField="IDName" ValidateRequestMode="Enabled" AppendDataBoundItems="True" Height="25px" Width="128px">
                                <asp:ListItem Selected="True" Value="" Text="Select Valid ID"></asp:ListItem>
                            </asp:DropDownList>
                            <asp:SqlDataSource ID="SqlDataSourceID" runat="server" ConnectionString="<%$ ConnectionStrings:db_fifmsConnectionString %>" SelectCommand="SELECT [IDName] FROM [tbl_valid] ORDER BY [IDName]"></asp:SqlDataSource>
                            <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="dl_ID"
                                InitialValue="" runat="server" ForeColor="Red" ValidationGroup="aa" />
                        </td>
                    <td colspan="2">
                        <itemtemplate>
                            <asp:Image ID="img_photo" ImageUrl='<%# Eval("IDPhoto") %>' runat="server" Style="width: 100px; height: auto" />
                        </itemtemplate>
                    </td>
                        <td>
                            <asp:FileUpload ID="fl_change" runat="server" Visible="false" /></td>
                    </tr>


                </table>
            </div>
        </center>
    </div>
    <asp:Label runat="server" ID="lbl_session" Visible="false"></asp:Label>
</asp:Content>
