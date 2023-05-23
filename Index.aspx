<%@ Page Title="Index" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="Farmers_Insurance_MS.Index" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row" style="padding: 50px">
        <div class="col-md-6">
            <img src="Images/img_home.png" class="img-responsive" alt="" />
            <br />
            <h5><b>&nbsp; &nbsp; &nbsp;
            Work in the present, think for future.
            We care for your crops!
            </b></h5>
        </div>
        <div class="col-md-6" style="padding-top: 50px">
            <h4><b>Login to your Account</b> </h4>
            <br />
            <table>
                <tr>
                    <td>
                        <asp:Button ID="btnAdmin" runat="server" Text="Admin" class="btn btn-warning btn-s mt-1" Style="width: 184px; height: 30px;" OnClick="btnAdmin_Click" />

                    </td>
                </tr>
                <tr>
                    <td style="height:15px"> </td>
                </tr>
                <tr>
                    <td>

                        <asp:Button ID="btnFarmers" runat="server" Text="Farmers" class="btn btn-warning btn-s mt-1" Style="width: 184px; height: 30px;" OnClick="btnFarmers_Click1" />

                    </td>
                </tr>
            </table>
        </div>
    </div>

</asp:Content>

