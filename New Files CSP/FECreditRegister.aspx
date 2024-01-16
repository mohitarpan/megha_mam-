<%@ Page Language="C#" AutoEventWireup="true"
CodeBehind="FECreditRegister.aspx.cs"
Inherits="FDCredit_Abraham.FECreditRegister" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    />
    <link
      href="https://fonts.googleapis.com/css?family=Volkhov"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="all_css.css" />
    <!-- here is external css file -->
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
        <div
          id="w3-modele-zoom-border"
          class="w3-modal-content w3-animate-zoom w3-border"
        >
          <form class="w3-container" runat="server">
            <div class="w3-section">
              <label><b>Username</b></label>
              <asp:TextBox
                ID="txt_username"
                runat="server"
                CssClass="w3-input w3-border w3-margin-bottom"
                OnTextChanged="txt_username_TextChanged"
              ></asp:TextBox>

              <label><b>Password</b></label>
              <asp:TextBox
                ID="txt_password"
                TextMode="Password"
                runat="server"
                CssClass="w3-input w3-border w3-margin-bottom"
              ></asp:TextBox>

              <label><b>Confirm Password</b></label>
              <asp:TextBox
                ID="txt_cnfpassword"
                TextMode="Password"
                runat="server"
                CssClass="w3-input w3-border"
              ></asp:TextBox>

              <div class="w3-quarter w3-left">
                <asp:Button
                  ID="btn_register"
                  runat="server"
                  OnClick="Register_new_user"
                  Text="Register"
                  CssClass="fe-col w3-button w3-block w3-green w3-section w3-padding"
                />
              </div>
            </div>
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
