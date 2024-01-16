<%@ Page Language="C#" AutoEventWireup="true"
CodeFile="FECredit_ConfigData.aspx.cs" Inherits="FECredit_ConfigData" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>FECREDIT CONFIGURE DATA</title>
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
    <link rel="stylesheet" href="Content/w3.css" />
    <link rel="stylesheet" href="Content/googleapis.css" />
    <link rel="stylesheet" href="Content/font-awesome.min.css" />
    <link type="text/css" rel="stylesheet" href="all_css.css" />
    <!--here is external css file-->
    <link href="Content/fonts.googleapis.css" rel="stylesheet" />
    <script type="text/javascript" src="newjs.js"></script>
    <!--here is external js file-->
    <script
      type="text/javascript"
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"
    ></script>
    <%--
    <script type="text/javascript" src="scripts/jquery.blockUI.js"></script>
    --%>
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
              <a href="FECredit_Logout.aspx">Group Logout</a>
              &nbsp;|&nbsp;
              <a href="FECredit_GroupUserDel.aspx">Group User Delete</a>
              &nbsp;|&nbsp;<a href="FECredit_ExcludeNumbers.aspx"
                >Exclude Phone Number</a
              >
              &nbsp;|&nbsp;
              <a href="FECredit_Reset.aspx">Reset Password</a> &nbsp;|&nbsp;
              <a href="FD_Admin.aspx">Home</a> &nbsp;|&nbsp;
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
            class="w3-modal-content w3-animate-zoom"
          >
            <%--
            <div class="w3-section w3-container" id="divConfig"></div>
            --%>

            <table id="tblCParameters" runat="server" border="3" align="center">
              <tr>
                <th id="Update">Configuration Parameters</th>
              </tr>
              <tr>
                <td>
                  <asp:GridView
                    ID="gdvCParameters"
                    runat="server"
                    AutoGenerateColumns="false"
                    DataKeyNames="FECREDIT_ID"
                    CssClass="Grid"
                    AlternatingRowStyle-CssClass="alt"
                    EmptyDataText="No parameters configured yet."
                    Width="450"
                    OnRowDataBound="gdvCParameters_RowDataBound"
                  >
                    <Columns>
                      <asp:TemplateField
                        HeaderText="ID"
                        ItemStyle-Width="150"
                        Visible="false"
                      >
                        <ItemTemplate>
                          <asp:Label
                            ID="lblgdvCParameterId"
                            runat="server"
                            Visible="false"
                            Text='<%# Eval("FECREDIT_ID") %>'
                          ></asp:Label>
                        </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField
                        HeaderText="Parameter"
                        ItemStyle-Width="150"
                      >
                        <ItemTemplate>
                          <asp:Label
                            ID="lblgdvCParameterName"
                            runat="server"
                            Text='<%# Eval("FECREDIT_NAME") %>'
                          ></asp:Label>
                        </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField
                        HeaderText="Value"
                        ItemStyle-Width="50"
                        ItemStyle-HorizontalAlign="Center"
                      >
                        <ItemTemplate>
                          <asp:TextBox
                            ID="txtgdvCParameterValue"
                            runat="server"
                            Text='<%# Eval("FECREDIT_VALUE") %>'
                          />
                        </ItemTemplate>
                      </asp:TemplateField>
                    </Columns>
                  </asp:GridView>
                </td>
              </tr>
              <tr>
                <td colspan="2">
                  <asp:Label
                    ID="lblSaturday"
                    runat="server"
                    Visible="true"
                    Text="Coming Saturday"
                  ></asp:Label>
                  <asp:RadioButtonList runat="server" ID="rdbSaturday">
                    <asp:ListItem
                      Text="Not Working"
                      Value="0"
                      Selected="True"
                    ></asp:ListItem>
                    <asp:ListItem Text="Half-Day" Value="1"></asp:ListItem>
                  </asp:RadioButtonList>
                </td>
              </tr>
            </table>
            <div id="dvButtons" runat="server">
              <!-- class="w3-quarter w3-left">-->
              <table>
                <tr>
                  <td>
                    <asp:Button
                      ID="btnSave"
                      runat="server"
                      Text="Save"
                      OnClick="btnSave_Click"
                      ValidationGroup="submitClick"
                      CssClass="fe-col w3-button w3-block w3-green w3-section w3-padding"
                    />
                  </td>

                  <%--
                  <td>
                    <asp:Button
                      ID="btnCancel"
                      runat="server"
                      Text="Cancel"
                      OnClick="btnCancel_Click"
                      CssClass="fe-col w3-button w3-block w3-green w3-section w3-padding"
                    />
                  </td>
                  --%>
                </tr>
              </table>
              <table>
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
                      Text="SError Updating !!"
                    ></asp:Label>
                    <asp:Label
                      ID="lbl_success"
                      runat="server"
                      ForeColor="Green"
                      Visible="False"
                      Text="Configuration Values Updated"
                    ></asp:Label>
                  </td>
                </tr>
              </table>
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
