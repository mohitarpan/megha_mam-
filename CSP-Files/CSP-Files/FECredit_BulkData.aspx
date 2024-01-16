<%@ Page Language="C#" AutoEventWireup="true"
CodeFile="FECredit_BulkData.aspx.cs" Inherits="FECredit_BulkData" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>FECREDIT BULK DATA</title>
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
    <link type="text/css" rel="stylesheet" href="all_css.css" />
    <!--here external css-->
    <link rel="stylesheet" href="Content/w3.css" />
    <link rel="stylesheet" href="Content/googleapis.css" />
    <link rel="stylesheet" href="Content/font-awesome.min.css" />
    <link href="Content/fonts.googleapis.css" rel="stylesheet" />
    <link
      rel="stylesheet"
      href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"
    />
    <link rel="stylesheet" href="/resources/demos/style.css" />
    <link href="css/pikaday.css" rel="stylesheet" />
    <link href="css/site.css" rel="stylesheet" />
    <link href="css/theme.css" rel="stylesheet" />
    <link href="css/triangle.css" rel="stylesheet" />
    <script src="moment.js"></script>
    <script src="pikaday.js"></script>
    <script type="text/javascript" src="alljs.js"></script>
    <!--here external js file-->
    <%--
    <script type="text/javascript" src="scripts/jquery.blockUI.js"></script>
    --%>
    <script
      type="text/javascript"
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"
    ></script>
    <script
      type="text/javascript"
      src="https://code.jquery.com/jquery-1.12.4.js"
    ></script>
    <script
      type="text/javascript"
      src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"
    ></script>
  </head>
  <body>
    <form class="w3-container" runat="server">
      <div class="w3-container">
        <%--"w3-content w3-margin-top"--%>
        <div class="w3-display-container w3-white w3-padding">
          <div class="w3-content w3-third w3-padding">
            <a href="https://fecredit.com.vn" target="_blank">
              <img class="im" src="images/logo-vn.png" alt="FE CREDIT"
            /></a>
          </div>
          <div class="w3-content w3-third">
            <h3 class="w3-center w3-padding">Contact Revival Engine</h3>
          </div>
          <div class="w3-content w3-third">
            <span class="w3-right w3-padding w3-hide-small">
              <asp:Label ID="lblUser" runat="server" Text="Welcome"></asp:Label>
              &nbsp;|&nbsp;
              <a href="FECredit_Role.aspx">Manage Roles</a>
              &nbsp;|&nbsp;
              <a href="FECredit_ActionCode.aspx">Manage Action Code</a>
              &nbsp;|&nbsp;
              <a href="FECredit_UserRoleAccess.aspx">Manage Role Access</a>
              &nbsp;|&nbsp;<a href="FECredit_Reports.aspx">Reports</a
              >&nbsp;|&nbsp;
              <a href="FECredit_BulkData.aspx">Bulk Data</a>&nbsp;|&nbsp;
              <a href="FECredit_Logout.aspx">Group Logout</a>
              &nbsp;|&nbsp;
              <a href="FECredit_GroupUserDel.aspx">Group User Delete</a>
              &nbsp;|&nbsp;
              <a href="FECredit_Reset.aspx">Reset Password</a> &nbsp;|&nbsp;
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
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
      </div>
      <div
        class="w3-container w3-margin w3-white"
        id="updateUserDiv"
        runat="server"
      >
        <div class="w3-modal-content w3-animate-zoom w3-border">
          <div class="w3-section w3-container" id="divRole">
            <table border="3" align="center">
              <tr>
                <th id="Search" colspan="9">Search Parameters</th>
              </tr>
              <tr>
                <td>
                  <asp:RadioButtonList
                    runat="server"
                    ID="rdbOptions"
                    CausesValidation="true"
                  >
                    <asp:ListItem
                      Text="National ID"
                      Value="National ID"
                      Selected="True"
                    ></asp:ListItem>
                    <%--<asp:ListItem
                      Text="Contract Number"
                      Value="Contract Number"
                    ></asp:ListItem
                    >--%>
                  </asp:RadioButtonList>
                </td>
                <td>
                  <asp:FileUpload runat="server" ID="fileUpload" />
                </td>
                <td>
                  <asp:Button
                    ID="btnSearch"
                    runat="server"
                    OnClick="btnSearch_Click"
                    Text="Export"
                    ValidationGroup="submitClick"
                    CssClass="fe-col w3-button w3-block w3-green w3-section w3-padding"
                  ></asp:Button>
                </td>
              </tr>

              <tr>
                <td colspan="3">
                  <asp:Label
                    ID="lblSuccess"
                    runat="server"
                    ForeColor="Green"
                    Visible="false"
                    Text=""
                  ></asp:Label>
                  <asp:Label
                    ID="lblError"
                    runat="server"
                    ForeColor="Red"
                    Visible="False"
                    Text=""
                  ></asp:Label>
                </td>
              </tr>
            </table>
          </div>
        </div>
      </div>
      <!-- End Grid -->

      <!-- End Page Container -->
      <footer class="fe-col w3-container w3-center w3-padding">
        <p>
          2018 - Bản quyền thuộc về
          <a href="https://fecredit.com.vn" target="_blank">FE CREDIT</a>
        </p>
      </footer>
    </form>
    <script
      type="text/javascript"
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"
    ></script>
    <%--
    <script type="text/javascript" src="scripts/jquery.blockUI.js"></script>
    --%>
  </body>
</html>
