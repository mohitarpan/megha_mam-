<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FECredit_GroupUserDel.aspx.cs" Inherits="FECredit_GroupUserDel" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FECREDIT RESET PASSWORD</title>
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
    <link rel="stylesheet" href="Content/w3.css" />
    <link rel='stylesheet' href='Content/googleapis.css' />
    <link rel="stylesheet" href="Content/font-awesome.min.css" />
    <link href="Content/fonts.googleapis.css" rel="stylesheet" />
    <link rel="stylesheet" href="all_css.css"><!-- here is external css file-->
    <script type="text/javascript" src="newjs.js"></Script><!-- here is external js file-->
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <%--<script type="text/javascript" src="scripts/jquery.blockUI.js"></script>--%>
<body>
    <form class="w3-container" runat="server">
        <div class="w3-container">
            <div class="w3-display-container w3-white w3-padding">
                <div class="w3-content w3-third w3-padding">
                    <a href="https://fecredit.com.vn" target="_blank">
                        <img class="w3-left" src="images/logo-vn.png" alt="FE CREDIT" /></a>
                </div>
                <div class="w3-content w3-third">
                    <h3 class="w3-center w3-padding">Contact Revival Engine</h3>
                </div>
                <div class="w3-content w3-third">
                    <span class="w3-right w3-padding w3-hide-small">
                        <asp:Label ID="lblUser" runat="server" Text="Welcome admin"></asp:Label>
                        &nbsp;|&nbsp;
                        <a href="FECredit_Role.aspx">Manage Roles</a>
                        &nbsp;|&nbsp;
                        <a href="FECredit_ActionCode.aspx">Manage Action Code</a>
                        &nbsp;|&nbsp;
                        <a href="FECredit_UserRoleAccess.aspx">Manage Role Access</a>
                        &nbsp;|&nbsp;
                        <a href="FECredit_Reports.aspx">Reports</a>&nbsp;|&nbsp;
                        <a href="FECredit_BulkData.aspx">Bulk Data</a>    &nbsp;|&nbsp;
                        <a href="FD_Admin.aspx">Home</a>                   &nbsp;|&nbsp;
                        <a href="FECredit_ConfigData.aspx">Config Data</a>                        &nbsp;|&nbsp;
                        <asp:LinkButton ID="lnkLogout" runat="server" Text="Logout" OnClick="lnkLogout_Click"></asp:LinkButton>
                      </span>

                </div>
            </div>

            <div class="w3-container w3-margin w3-white" >
                <div id="w3-modele-zoom-border" class="w3-modal-content w3-animate-zoom w3-border">
                  <%--  <div class="w3-container w3-card w3-white w3-margin-bottom">
                         <div class="w3-container w3-margin-bottom">--%>
                    <div class="w3-section w3-container" id="divLogin">
                        
                        <div>
                            <!-- class="w3-quarter w3-left">-->
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="lblUserList" runat="server" Text="Please Upload .csv file with username List"></asp:Label>
                        <%--<asp:TextBox ID="txtUserName" runat="server" MaxLength="60" CssClass="w3-input w3-border w3-margin-bottom"></asp:TextBox>   --%>
                        <%--<div class="w3-content w3-white w3-padding">--%>
                             <asp:FileUpload ID="fileUploadUser" runat="server" />
                                    </td>
                                    <td>
                                        <asp:Button ID="btnGrpDel" runat="server" Text="Remove"
                                            OnClick="btnGrpDel_Click" ValidationGroup="submitClick" CssClass="fe-col w3-button w3-block w3-green w3-section w3-padding" /></td>
                                </tr>
                                <tr>
                                    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                                   
                                </tr>
                            </table>
                             <asp:Label ID="lbl_error" runat="server" ForeColor="Red" Visible="False" Text="InValid User ID or Password. Enter correct details to Reset Password to the CRE"></asp:Label>
                                    <asp:Label ID="lbl_success" runat="server" ForeColor="Green" Visible="False" Text="Reset Password to the CRE successful!!"></asp:Label>
                        </div>
                    </div>

                </div>
            </div>
            <!-- End Grid -->
        </div>
    </form>
    <!-- End Page Container -->
    <footer class="fe-col w3-container w3-center w3-padding">
        <p>2018 - Bản quyền thuộc về <a href="https://fecredit.com.vn" target="_blank">FE CREDIT</a></p>
    </footer>
</body>
</html>
