﻿<%@ Page Language="C#" AutoEventWireup="true"
CodeFile="FECredit_ExcludeNumbers.aspx.cs" Inherits="FECredit_ExcludeNumbers" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>FECREDIT EXCLUDE NUMBERS</title>
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
    <link rel="stylesheet" href="Content/w3.css" />
    <link rel="stylesheet" href="Content/googleapis.css" />
    <link rel="stylesheet" href="Content/font-awesome.min.css" />
    <link href="Content/fonts.googleapis.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="all_css.css" />
    <!-- here is external css-->
    <script
      type="text/javascript"
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"
    ></script>
    <%--
    <script type="text/javascript" src="scripts/jquery.blockUI.js"></script>
    --%>
    <script type="text/javascript" src="alljs.js"></script>
    <!--here is external js file -->
  </head>
  <body>
    <form class="w3-container" runat="server">
      <div class="w3-container">
        <div class="w3-display-container w3-white w3-padding">
          <div class="w3-content w3-third w3-padding">
            <a href="https://fecredit.com.vn" target="_blank">
              <img class="w3-left" src="images/logo-vn.png" alt="FE CREDIT"
            /></a>
          </div>
          <div class="w3-content w3-third">
            <h3 class="w3-center w3-padding">Contact Revival Engine</h3>
          </div>
          <div class="w3-content w3-third">
            <span class="w3-right w3-padding w3-hide-small">
              <asp:Label
                ID="lblUser"
                runat="server"
                Text="Welcome admin"
              ></asp:Label>
              &nbsp;|&nbsp;
              <a href="FECredit_Role.aspx">Manage Roles</a>
              &nbsp;|&nbsp;
              <a href="FECredit_ActionCode.aspx">Manage Action Code</a>
              &nbsp;|&nbsp;
              <a href="FECredit_UserRoleAccess.aspx">Manage Role Access</a>
              &nbsp;|&nbsp;
              <a href="FECredit_Reports.aspx">Reports</a>&nbsp;|&nbsp;
              <a href="FECredit_BulkData.aspx">Bulk Data</a> &nbsp;|&nbsp;
              <a href="FD_Admin.aspx">Home</a> &nbsp;|&nbsp;
              <a href="FECredit_ConfigData.aspx">Config Data</a> &nbsp;|&nbsp;
              <asp:LinkButton
                ID="lnkLogout"
                runat="server"
                Text="Logout"
                OnClick="lnkLogout_Click"
              ></asp:LinkButton>
            </span>
          </div>
        </div>

        <div class="w3-container w3-margin w3-white">
          <div
            id="w3-modele-zoom-border"
            class="w3-modal-content w3-animate-zoom w3-border"
          >
            <div class="w3-section w3-container" id="divLogin">
              <div>
                <table>
                  <tr>
                    <td>
                      <asp:Label
                        ID="lblUserList"
                        runat="server"
                        Text="Please Upload .csv file with phone Numbers(One or multiple)"
                      ></asp:Label>
                      <asp:FileUpload ID="fileUploadUser" runat="server" />
                    </td>
                    <td>
                      <asp:Button
                        ID="btnExclude"
                        runat="server"
                        Text="Exclude"
                        OnClick="btnExclude_Click"
                        ValidationGroup="submitClick"
                        CssClass="fe-col w3-button w3-block w3-green w3-section w3-padding"
                      />
                    </td>
                  </tr>
                  <tr>
                    <asp:Label
                      ID="lblStatus"
                      runat="server"
                      Text=""
                    ></asp:Label>
                  </tr>
                </table>
                <asp:Label
                  ID="lbl_error"
                  runat="server"
                  ForeColor="Red"
                  Visible="False"
                  Text="Error in operation!! Please contact administrator."
                ></asp:Label>
                <asp:Label
                  ID="lbl_success"
                  runat="server"
                  ForeColor="Green"
                  Visible="False"
                  Text="Numbers excluded from CRE system!!"
                ></asp:Label>
              </div>
            </div>
          </div>
        </div>
        <!-- End Grid -->
      </div>
    </form>
    <!-- End Page Container -->
    <footer class="fe-col w3-container w3-center w3-padding">
      <p>
        2018 - Bản quyền thuộc về
        <a href="https://fecredit.com.vn" target="_blank">FE CREDIT</a>
      </p>
    </footer>
  </body>
</html>
