<%@ Page Title="Admin Dashboard" Language="C#" MasterPageFile="~/AdminDashboard.Master" AutoEventWireup="true" CodeBehind="AdminDash.aspx.cs" Inherits="Farmers_Insurance_MS.Admin.Dashboard" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
      <%--This view will show the dashboard including the farmers info, insurance buttons and insurance report history in table...the data shows will based
   on the session that was login in the landing page / login form--%>
     <div class="row center-block" style="padding-left: 80px; padding-top: 100px">
            <div class="col-md-3">
                <h5><strong>Admin's Information</strong></h5>
                <br />
              <img src="\Images\img_profile.png" alt="" class="img-responsive img-circle" width="150" height="150"/>
            </div>
            <div class="col-md-4">
                <br />
                <br />
                <table>
                    <tr>
                        <td> &nbsp;&nbsp;&nbsp;First Name : </td>
                        <td>  &nbsp;<asp:TextBox ID="txt_fname" runat="server" ReadOnly="True"></asp:TextBox>&nbsp;</td>
                    </tr>
                    <tr style="height:15px">
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td> Middle Name :</td>
                        <td> &nbsp; <asp:TextBox ID="txt_mname" runat="server" ReadOnly="True"></asp:TextBox>&nbsp;</td>
                    </tr>
                    <tr style="height:15px">
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;Last Name : </td>
                        <td> &nbsp;<asp:TextBox ID="txt_lname" runat="server" ReadOnly="True"></asp:TextBox>&nbsp;</td>
                    </tr>
                </table>
            </div>
            <div class="col-md-4">
                <br />
                <br />
                <table>
                    <tr>
                        <td> &nbsp;&nbsp;&nbsp;&nbsp;Email Address:</td>
                        <td>&nbsp;<asp:TextBox ID="txt_email" runat="server" ReadOnly="True"></asp:TextBox>&nbsp;</td>
                    </tr>
                    <tr style="height:15px">
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Position : </td>
                        <td>&nbsp; <asp:TextBox ID="txt_position" runat="server" ReadOnly="True"></asp:TextBox>&nbsp;</td>
                    </tr>
                </table>
            </div>
        </div>
        <div class="row center-block"  style="padding-left: 80px; padding-top: 20px" >
            <h5><strong>Insurance Report</strong></h5>
            <div class="col-md-3">
            </div>
            <div class="col-md-4" style="overflow-x:auto;">
                <table class="table-responsive" style="border:hidden">
                    <tr>
                        <td>
                            <asp:LinkButton ID="link_pending" runat="server" onclick="link_pending_Click"><img src="\Images\ic_pending.png" style="width:80px; height:auto" class="img-responsive" /></asp:LinkButton>
                        </td>
                        <td width="50px"></td>
                        <td>
                            <asp:LinkButton ID="link_process" runat="server" onclick="link_process_Click"><img src="\Images\ic_process.png" style="width:80px; height:auto" class="img-responsive" /></asp:LinkButton>
                        </td>
                        <td width="50px"></td>
                        <td>
                           <asp:LinkButton ID="link_close" runat="server" onclick="link_close_Click"><img src="\Images\ic_close.png" style="width:80px; height:auto" class="img-responsive" /></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="col-md-4">
                
            </div>
        </div>
        <div class="row center-block"  style="padding-left: 50px; padding-top: 20px;  overflow: scroll;">
            <h5><strong>Insurance Report History</strong></h5>
            <div class="col-lg-12">
                <asp:GridView ID="gv_report" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="reportID" DataSourceID="SqlDataSourceReport" style="width:100%" PageSize="5"  Font-Size="Smaller" CellPadding="5" EmptyDataText="Null " HorizontalAlign="Center" Width="100%" OnRowDataBound="gv_report_RowDataBound"> <%--OnSelectedIndexChanged="gv_history_SelectedIndexChanged"  OnRowDataBound="gv_history_RowDataBound"--%>
                  <AlternatingRowStyle BackColor="#FFC107" HorizontalAlign="Center" VerticalAlign="Middle" />
                  <Columns>
                      <%--<asp:CommandField ShowSelectButton="True"  SelectText="View" />--%>
                      <asp:BoundField DataField="reportID" HeaderText="Report ID" ReadOnly="True" SortExpression="reportID" InsertVisible="False" />
                      <asp:BoundField DataField="firstName" HeaderText="First Name" SortExpression="firstName"  />
                      <asp:BoundField DataField="middleName" HeaderText="Middle Name" SortExpression="middleName"/>
                      <asp:BoundField DataField="lastName" HeaderText="Last Name" SortExpression="lastName" />
                      <asp:BoundField DataField="contactNumber" HeaderText="Contact Number" SortExpression="contactNumber" />
                      <asp:BoundField DataField="IDName" HeaderText="Valid ID" SortExpression="IDName" />
                      <%--<asp:BoundField DataField="IDPhoto" HeaderText="Valid ID Photo" SortExpression="IDPhoto" />--%>
                      <asp:BoundField DataField="barangayName" HeaderText="Barangay Name" SortExpression="barangayName" />
                      <asp:BoundField DataField="insuranceType" HeaderText="Insurance Type" SortExpression="insuranceType" />
                      <asp:BoundField DataField="cropName" HeaderText="Crop Name" SortExpression="cropName"  />
                      <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description"  />
                      <asp:BoundField DataField="farmLocationName" HeaderText="Farm Location Name" SortExpression="farmLocationName"  />
                      <asp:BoundField DataField="cost" HeaderText="Initial Cost" SortExpression="cost"  />
                      <asp:BoundField DataField="north" HeaderText="North" SortExpression="north"  />
                      <asp:BoundField DataField="east" HeaderText="East" SortExpression="east"  />
                      <asp:BoundField DataField="west" HeaderText="West" SortExpression="west"  />
                      <asp:BoundField DataField="south" HeaderText="South" SortExpression="south"  />
                      <asp:BoundField DataField="remarks" HeaderText="Remarks" SortExpression="remarks"  />
                      <asp:BoundField DataField="datePlanted" HeaderText="Date Planted" SortExpression="datePlanted" ApplyFormatInEditMode="true" DataFormatString="{0:d}"/>
                      <asp:BoundField DataField="dateApplied" HeaderText="Date Applied" SortExpression="dateApplied" ApplyFormatInEditMode="true" DataFormatString="{0:d}"/>
                      <asp:BoundField DataField="emailAddress" HeaderText="Email Address" SortExpression="emailAddress" />
                      <asp:BoundField DataField="farmPortion" HeaderText="Farm Portion" SortExpression="farmPortion" />
                       <asp:TemplateField HeaderText="Valid ID Photo" SortExpression="IDPhoto">
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
                <asp:SqlDataSource ID="SqlDataSourceReport" runat="server" ConnectionString="<%$ ConnectionStrings:db_fifmsConnectionString %>" SelectCommand="SELECT * FROM [tbl_report]">
                </asp:SqlDataSource>
            </div>
        </div>
          <asp:Label runat="server" ID="lbl_session" Visible="false"></asp:Label>
          <asp:Label runat="server" ID="lbl_fn" Visible="false"></asp:Label>
          <asp:Label runat="server" ID="lbl_ln" Visible="false"></asp:Label>
</asp:Content>
