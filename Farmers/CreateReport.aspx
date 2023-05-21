<%@ Page Title="Create Report" Language="C#" MasterPageFile="~/UserDashboard.Master" AutoEventWireup="true" CodeBehind="CreateReport.aspx.cs" Inherits="Farmers_Insurance_MS.Farmers.CreateReport" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
<%--This view will show the dashboard including the farmers info, insurance buttons and insurance report history in table...the data shows will based
    on the session that was login in the landing page / login form--%>
    <div class="message_con"  style="text-align:center;padding-top:0px;margin-left: 30px;font-size: medium;">
            <asp:Label ID="lbl_note" runat="server" Text=""> </asp:Label>
            </div>
<div class="row center-block" style="padding-left: 50px; padding-top: 100px">
            <div class="col-md-3">
                <h5><strong>Farmers' Information</strong></h5>
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
                      <tr style="height:15px">
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                <%-- This is to get the record in valid id and display it in dropdown --%>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;Valid ID : </td>
                        <td>&nbsp;&nbsp;<asp:DropDownList ID="dl_ID" runat="server" DataSourceID="SqlDataSourceID" DataTextField="IDName" DataValueField="IDName"  ValidateRequestMode="Enabled"   AppendDataBoundItems="True" Height="25px" Width="128px" >
                          <asp:ListItem Selected="True" Value="" Text="Select Valid ID"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceID" runat="server" ConnectionString="<%$ ConnectionStrings:db_fifmsConnectionString %>" SelectCommand="SELECT [IDName] FROM [tbl_valid] ORDER BY [IDName]"></asp:SqlDataSource>
                           <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="dl_ID"
                                    InitialValue="" runat="server" ForeColor="Red"  ValidationGroup="aa"/></td>
                    </tr>
                </table>
                
            </div>
            <div class="col-md-5">
                <br />
                <br />
                <table>
                    <tr>
                        <td> Contact Number : </td>
                        <td> &nbsp; <asp:TextBox ID="txt_contact" runat="server" ReadOnly="True"></asp:TextBox>&nbsp;</td>
                    </tr>
                    <tr style="height:15px">
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td> &nbsp;&nbsp;&nbsp;&nbsp;Email Address:</td>
                        <td>&nbsp;<asp:TextBox ID="txt_email" runat="server" ReadOnly="True"></asp:TextBox>&nbsp;</td>
                    </tr>
                    <tr style="height:15px">
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Barangay : </td>
                        <td>&nbsp; <asp:TextBox ID="txt_barangay" runat="server" ReadOnly="True"></asp:TextBox>&nbsp;</td>
                    </tr>
                    <tr style="height:15px">
                        <td></td>
                        <td></td>
                    </tr>
                    <tr><%-- This is a file upload control where user can upload their valid id --%>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Valid ID Photo : </td>
                        <td>&nbsp;&nbsp;&nbsp; <asp:FileUpload ID="fl_id" runat="server" Height="25px" Width="200px"  /> 
                        <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="fl_id"
                                    InitialValue="" runat="server" ForeColor="Red"  ValidationGroup="aa"/>&nbsp;</td>
                    </tr>
                </table>
                
            </div>
        </div>
        <div class="row center-block"  style="padding-left: 50px; padding-top: 20px" >
            <h5><strong>Insurance Report</strong></h5>
            <div class="col-md-3">
            </div>
            <div class="col-md-4">
                <br />
                <br />
                <table>
                    <tr>
                        <%-- This dropdown list will display data of Insurance Type --%>
                        <td> &nbsp;&nbsp;&nbsp;Insurance Type : </td>
                        <td> <asp:DropDownList ID="dl_insuranceType" runat="server" DataSourceID="SqlDataSourceInsurance" DataTextField="insuranceType" DataValueField="insuranceType"  ValidateRequestMode="Enabled"   AppendDataBoundItems="True"  Height="25px" Width="128px">
                          <asp:ListItem Selected="True" Value="" Text="Select Insurance Type"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceInsurance" runat="server" ConnectionString="<%$ ConnectionStrings:db_fifmsConnectionString %>" SelectCommand="SELECT [insuranceType] FROM [tbl_insuranceType] ORDER BY [insuranceType]"></asp:SqlDataSource>
                           <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="dl_insuranceType"
                                    InitialValue="" runat="server" ForeColor="Red"  ValidationGroup="aa"/></td>
                    </tr>
                    <tr style="height:15px">
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <%-- This dropdown list will display data of Crop Name --%>
                        <td> &nbsp;&nbsp;&nbsp;Crops : </td>
                        <td> <asp:DropDownList ID="dl_crop" runat="server" DataSourceID="SqlDataSourceCrop" DataTextField="cropName" DataValueField="cropName"  ValidateRequestMode="Enabled"   AppendDataBoundItems="True"  Height="25px" Width="128px">
                          <asp:ListItem Selected="True" Value="" Text="Select Crop"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceCrop" runat="server" ConnectionString="<%$ ConnectionStrings:db_fifmsConnectionString %>" SelectCommand="SELECT [cropName] FROM [tbl_Crop] ORDER BY [cropName]"></asp:SqlDataSource>
                           <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="dl_crop"
                                    InitialValue="" runat="server" ForeColor="Red"  ValidationGroup="aa"/></td>
                    </tr>
                     <tr style="height:15px">
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <%-- This dropdown list will display data of Farm Location --%>
                        <td> &nbsp;&nbsp;&nbsp;Farm Location : </td>
                        <td> <asp:DropDownList ID="dl_farm" runat="server" DataSourceID="SqlDataSourceFarm" DataTextField="FarmLocationName" DataValueField="FarmLocationName"  ValidateRequestMode="Enabled"   AppendDataBoundItems="True"  Height="25px" Width="128px">
                          <asp:ListItem Selected="True" Value="" Text="Select Farm Location"></asp:ListItem>
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSourceFarm" runat="server" ConnectionString="<%$ ConnectionStrings:db_fifmsConnectionString %>" SelectCommand="SELECT [FarmLocationName] FROM [tbl_farmLocation] ORDER BY [FarmLocationName]"></asp:SqlDataSource>
                           <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="dl_insuranceType"
                                    InitialValue="" runat="server" ForeColor="Red"  ValidationGroup="aa"/></td>
                    </tr>
                    
                    <tr style="height:15px">
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td> Date Planted :</td>
                        <td> &nbsp; <asp:TextBox ID="txt_dtPlanted" runat="server"  TextMode="Date"></asp:TextBox>
                      <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="txt_dtPlanted"
                                    InitialValue="" runat="server" ForeColor="Red"  ValidationGroup="aa"/>&nbsp;</td>
                    </tr>
                    <tr style="height:15px">
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td> Date Applied for Insurance :</td>
                        <td> &nbsp; <asp:TextBox ID="txt_dtApplied" runat="server"  TextMode="Date"></asp:TextBox>
                      <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="txt_dtApplied"
                                    InitialValue="" runat="server" ForeColor="Red"  ValidationGroup="aa"/>&nbsp;</td>
                    </tr>
                    <tr style="height:15px">
                        <td></td>
                        <td></td>
                    </tr>
                   
                    <tr>
                        <td> Cost :</td>
                        <td> &nbsp; <asp:TextBox ID="txt_cost" runat="server" ></asp:TextBox>
                      <asp:RequiredFieldValidator ErrorMessage="Required" ControlToValidate="txt_cost"
                                    InitialValue="" runat="server" ForeColor="Red"  ValidationGroup="aa"/>&nbsp;</td>
                    </tr>
                    
                </table>
                
            </div>
            <div class="col-md-4">
                <br />
                <br />
                <table>
                    <tr>
                        <td> Brief Description : </td>
                        <td> &nbsp; <asp:TextBox ID="txt_desc" runat="server"  TextMode="MultiLine" Width="200px"></asp:TextBox>&nbsp;</td>
                    </tr>
                    <tr style="height:15px">
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td> &nbsp;&nbsp;&nbsp;&nbsp;North :</td>
                        <td>&nbsp;<asp:TextBox ID="txt_north" runat="server" ></asp:TextBox>&nbsp;</td>
                    </tr>
                    <tr style="height:15px">
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; East : </td>
                        <td>&nbsp; <asp:TextBox ID="txt_east" runat="server" ></asp:TextBox>&nbsp;</td>
                    </tr>
                    <tr style="height:15px">
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; West : </td>
                        <td>&nbsp; <asp:TextBox ID="txt_west" runat="server"></asp:TextBox>&nbsp;</td>
                    </tr>
                    <tr style="height:15px">
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; South : </td>
                        <td>&nbsp; <asp:TextBox ID="txt_south" runat="server"></asp:TextBox>&nbsp;</td>
                    </tr>
                </table>
                <br />
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="aa"/> 
            </div>
        </div>
<asp:Label runat="server" ID="lbl_session" Visible="false"></asp:Label>
<asp:Label runat="server" ID="lbl_fn" Visible="false"></asp:Label>
<asp:Label runat="server" ID="lbl_ln" Visible="false"></asp:Label>
</asp:Content>
