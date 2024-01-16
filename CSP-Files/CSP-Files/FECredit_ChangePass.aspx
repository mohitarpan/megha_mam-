<%@ Page Language="C#" AutoEventWireup="true"
CodeFile="FECredit_ChangePass.aspx.cs" Inherits="FECredit_ChangePass" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>FECREDIT CHANGE PASSWORD</title>
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
    <link rel="stylesheet" href="Content/w3.css" />
    <link rel="stylesheet" href="Content/googleapis.css" />
    <link rel="stylesheet" href="Content/font-awesome.min.css" />
    <link href="Content/fonts.googleapis.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="all_css.css" />
    <!--here is external css file-->
    <script
      type="text/javascript"
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"
    ></script>
    <%--
    <script type="text/javascript" src="scripts/jquery.blockUI.js"></script>
    --%>
    <script type="text/javascript" src="alljs.js"></script>
    <!-- here is external js file-->
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
            <span
              class="w3-right w3-padding w3-hide-small"
              id="spTopLinks"
              runat="server"
            >
              <asp:Label
                ID="lblUser"
                runat="server"
                Text="Welcome!"
              ></asp:Label>
              &nbsp;|&nbsp;
              <asp:LinkButton
                ID="lnkLogout"
                runat="server"
                Text="Logout"
                OnClick="lnkLogout_Click"
              ></asp:LinkButton> </span
            ><%--<a href="FECredit_Login.aspx"
              ><i
                class="fa fa-sign-out fa-fw w3-margin-right w3-text-fe-col"
              ></i
              >Logout</a
            >--%>
          </div>
        </div>

        <div class="w3-container w3-margin w3-white">
          <div
            id="w3-modele-zoom-border"
            class="w3-modal-content w3-animate-zoom w3-border"
          >
            <div class="w3-section w3-container" id="divLogin">
              <label><b>User Name *</b></label>
              <asp:TextBox
                ID="txtUserName"
                runat="server"
                MaxLength="60"
                CssClass="w3-input w3-border w3-margin-bottom"
              ></asp:TextBox>
              <asp:RequiredFieldValidator
                ID="rfvuserName"
                runat="server"
                ErrorMessage="Please enter User Name"
                ControlToValidate="txtUserName"
                Display="None"
                ForeColor="Red"
                SetFocusOnError="True"
                ValidationGroup="submitClick"
              ></asp:RequiredFieldValidator>
              <label><b>Old Password * </b></label>
              <asp:TextBox
                ID="txtOldPwd"
                runat="server"
                TextMode="Password"
                MaxLength="15"
                CssClass="w3-input w3-border w3-margin-bottom"
              ></asp:TextBox>
              <asp:RequiredFieldValidator
                ID="rfvOldPwd"
                runat="server"
                ErrorMessage="Please enter old password"
                ControlToValidate="txtOldPwd"
                Display="None"
                ForeColor="Red"
                SetFocusOnError="True"
                ValidationGroup="submitClick"
              ></asp:RequiredFieldValidator>
              <label><b>New Password * </b></label>
              <asp:TextBox
                ID="txtNewPwd"
                runat="server"
                TextMode="Password"
                MaxLength="15"
                CssClass="w3-input w3-border w3-margin-bottom"
              ></asp:TextBox>
              <asp:RequiredFieldValidator
                ID="rfvNewPwd"
                runat="server"
                ErrorMessage="Please enter new password"
                ControlToValidate="txtNewPwd"
                Display="None"
                ForeColor="Red"
                SetFocusOnError="True"
                ValidationGroup="submitClick"
              ></asp:RequiredFieldValidator>
              <label><b>Reconfirm Password * </b></label>
              <asp:TextBox
                ID="txtConfirmPwd"
                runat="server"
                TextMode="Password"
                MaxLength="15"
                CssClass="w3-input w3-border w3-margin-bottom"
              ></asp:TextBox>
              <asp:RequiredFieldValidator
                ID="rfvConfirmPwd"
                runat="server"
                ErrorMessage="Please re-enter password to confirm"
                ControlToValidate="txtConfirmPwd"
                Display="None"
                ForeColor="Red"
                SetFocusOnError="True"
                ValidationGroup="submitClick"
              ></asp:RequiredFieldValidator>
              <asp:CompareValidator
                ID="cmvConfirmPwd"
                runat="server"
                ControlToCompare="txtNewPwd"
                ControlToValidate="txtConfirmPwd"
                Display="None"
                ErrorMessage="New and confirm password didn't match"
                ForeColor="Red"
                SetFocusOnError="True"
                ValidationGroup="submitClick"
              ></asp:CompareValidator>
              <asp:ValidationSummary
                ID="vsErrorList"
                runat="server"
                HeaderText="Following error occurs: "
                ShowMessageBox="false"
                DisplayMode="BulletList"
                ShowSummary="true"
                BackColor="Snow"
                ForeColor="Red"
                Font-Size="Medium"
                Font-Italic="true"
                ValidationGroup="submitClick"
              />
              <div>
                <!-- class="w3-quarter w3-left">-->
                <table>
                  <tr>
                    <td>
                      <asp:Button
                        ID="btnChange"
                        runat="server"
                        Text="Change Password"
                        OnClick="btnChange_Click"
                        ValidationGroup="submitClick"
                        CssClass="fe-col w3-button w3-block w3-green w3-section w3-padding"
                      />
                      <asp:Button
                        ID="btnGoBack"
                        runat="server"
                        Text="Go Back"
                        OnClick="btnGoBack_Click"
                        CssClass="fe-col w3-button w3-block w3-green w3-section w3-padding"
                      />

                      <%--<a
                        id="aGoBack"
                        runat="server"
                        href="FECredit_Login.aspx"
                        onclick=""
                        >Go Back</a
                      >--%>
                    </td>
                  </tr>
                  <tr>
                    <td>
                      <asp:Label
                        ID="lblStatus"
                        runat="server"
                        Text=""
                      ></asp:Label>
                      <asp:Label
                        ID="lbl_error"
                        runat="server"
                        ForeColor="Red"
                        Visible="False"
                        Text="InValid User ID or Password. Enter correct details to Change Password"
                      ></asp:Label>
                      <asp:Label
                        ID="lbl_success"
                        runat="server"
                        ForeColor="Green"
                        Visible="False"
                        Text="Password changed successfully!!"
                      ></asp:Label>
                    </td>
                  </tr>
                </table>
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
