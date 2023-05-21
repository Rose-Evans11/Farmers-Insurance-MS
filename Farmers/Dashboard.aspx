<%@ Page Title="Dashboard" Language="C#" MasterPageFile="~/UserDashboard.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Farmers_Insurance_MS.Dashboard" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <%--This view will show the dashboard including the farmers info, insurance buttons and insurance report history in table...the data shows will based
   on the session that was login in the landing page / login form--%>
     <div class="row center-block" style="padding-left: 80px; padding-top: 100px">
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
                </table>
            </div>
            <div class="col-md-4">
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
        <div class="row center-block"  style="padding-left: 80px; padding-top: 20px">
            <h5><strong>Insurance Report History</strong></h5>
            <div class="col-md-3">

            </div>
            <div class="col-md-4">
                onging on creating data view
            </div>
            <div class="col-md-4">

            </div>
        </div>
          <asp:Label runat="server" ID="lbl_session" Visible="false"></asp:Label>
          <asp:Label runat="server" ID="lbl_fn" Visible="false"></asp:Label>
          <asp:Label runat="server" ID="lbl_ln" Visible="false"></asp:Label>
</asp:Content>
