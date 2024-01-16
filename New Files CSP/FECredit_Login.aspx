<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FECredit_Login.aspx.cs"
Inherits="FECredit_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>FECREDIT LOGIN</title>
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
    <link rel="stylesheet" href="Content/w3.css" />
    <link rel="stylesheet" href="Content/googleapis.css" />
    <link rel="stylesheet" href="Content/font-awesome.min.css" />
    <link href="Content/fonts.googleapis.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="Credit.css" />
    <!--here is external css file-->
    <script type="text/javascript" src="credit_login.js"></script>
    <!-- here is external js file -->
  </head>
  <body>
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
        <div class="w3-content w3-third"></div>
      </div>

      <div class="w3-container w3-margin w3-white">
        <div class="w3-modal-content w3-animate-zoom w3-border">
          <form class="w3-container" runat="server">
            <div class="w3-section" id="divLogin">
              <label><b>Username</b></label>
              <asp:TextBox
                ID="txt_username"
                runat="server"
                CssClass="w3-input w3-border w3-margin-bottom"
              ></asp:TextBox>
              <label><b>Password</b></label>
              <asp:TextBox
                ID="txt_password"
                TextMode="Password"
                runat="server"
                CssClass="w3-input w3-border w3-margin-bottom"
              ></asp:TextBox>
              <label><b>Enter Captcha</b></label>
              <asp:TextBox ID="txtCaptcha" runat="server"></asp:TextBox>
              <BotDetect:WebFormsCaptcha
                ID="captchaBox"
                runat="server"
                AutoUppercaseInput="false"
              ></BotDetect:WebFormsCaptcha>
              <div>
                <!-- class="w3-quarter w3-left">-->
                <table>
                  <tr>
                    <td>
                      <asp:Button
                        ID="btn_register"
                        runat="server"
                        OnClick="Login_user"
                        Text="Login"
                        CssClass="fe-col w3-button w3-block w3-green w3-section w3-padding"
                      />
                    </td>
                    <td></td>
                  </tr>
                  <tr>
                    <asp:Label
                      ID="lbl_error"
                      runat="server"
                      ForeColor="Red"
                      Visible="False"
                      Text="Wrong User ID or Password. Enter correct details to Login"
                    ></asp:Label>
                    <asp:Label
                      ID="lbl_captcha_error"
                      runat="server"
                      ForeColor="Red"
                      Visible="False"
                      Text="Invalid captcha. Please try again with correct captcha"
                    ></asp:Label>
                  </tr>
                  <tr>
                    <td>
                      <%--<a href="FECredit_ForgotPass.aspx" id="a_forgot"
                        >Forgot Password</a
                      >&nbsp;--%>
                      <a href="FECredit_ChangePass.aspx" id="a_forgot"
                        >Change Password</a
                      >
                    </td>
                  </tr>
                </table>
              </div>
            </div>
            <%--<span class="w3-right w3-padding w3-hide-small"
              ><a href="fecreditregister.aspx">Register</a></span
            >--%>
          </form>
        </div>
      </div>

      <!-- End Grid -->
    </div>

    <!-- End Page Container -->
    <footer class="fe-col w3-container w3-center w3-padding">
      <p>
        2018 - Bản quyền thuộc về
        <a href="https://fecredit.com.vn" target="_blank">FE CREDIT</a>
      </p>
    </footer>
  </body>
</html>
