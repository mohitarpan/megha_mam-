<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FECredit_Role.aspx.cs"
Inherits="FECredit_Role" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>FECREDIT ROLE SETUP</title>
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
    <link rel="stylesheet" href="Content/w3.css" />
    <link rel="stylesheet" href="Content/googleapis.css" />
    <link rel="stylesheet" href="Content/font-awesome.min.css" />
    <link href="Content/fonts.googleapis.css" rel="stylesheet" />
    <link type="text/css" rel="stylesheet" href="all_css.css" />
    <!-- Here is external css file-->
    <script
      type="text/javascript"
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"
    ></script>
    <%--
    <script type="text/javascript" src="scripts/jquery.blockUI.js"></script>
    --%>

    <script type="text/javascript" src="Credit_role.js"></script>
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
            <span class="w3-right w3-padding w3-hide-small">
              <asp:Label
                ID="lblUser"
                runat="server"
                Text="Welcome admin"
              ></asp:Label>
              &nbsp;|&nbsp;
              <a href="FECredit_ActionCode.aspx">Manage Action Code</a>
              &nbsp;|&nbsp;
              <a href="FECredit_UserRoleAccess.aspx">Manage Role Access</a
              >&nbsp;|&nbsp;
              <a href="FECredit_Reports.aspx">Reports</a>&nbsp;|&nbsp;
              <a href="FECredit_BulkData.aspx">Bulk Data</a>&nbsp;|&nbsp;
              <a href="FECredit_Logout.aspx">Group Logout</a>
              &nbsp;|&nbsp;<a href="FECredit_GroupUserDel.aspx"
                >Group User Delete</a
              >
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

        <div class="w3-container w3-margin w3-white">
          <div class="w3-modal-content w3-animate-zoom w3-border">
            <div class="w3-section w3-container" id="divRole">
              <label><b>Role Id *</b></label>
              <asp:TextBox
                ID="txtRoleId"
                runat="server"
                MaxLength="8"
                CssClass="w3-input w3-border w3-margin-bottom"
              ></asp:TextBox>
              <asp:RegularExpressionValidator
                ID="revRoleId"
                runat="server"
                ControlToValidate="txtRoleId"
                ForeColor="Red"
                SetFocusOnError="True"
                Display="None"
                ErrorMessage="No Special characters in Role ID"
                ValidationExpression="^[\sa-zA-Z0-9]*$"
                ValidationGroup="submitClick"
              ></asp:RegularExpressionValidator>
              <asp:RequiredFieldValidator
                ID="rfvRoleId"
                runat="server"
                ErrorMessage="Please enter Role Id"
                ControlToValidate="txtRoleId"
                Display="None"
                ForeColor="Red"
                SetFocusOnError="True"
                ValidationGroup="submitClick"
              ></asp:RequiredFieldValidator>
              <label><b>Role Description * </b></label>
              <asp:TextBox
                ID="txtRoleDesc"
                runat="server"
                MaxLength="60"
                CssClass="w3-input w3-border w3-margin-bottom"
              ></asp:TextBox>
              <asp:RequiredFieldValidator
                ID="rfvRoleDesc"
                runat="server"
                ErrorMessage="Please enter Role Description"
                ControlToValidate="txtRoleDesc"
                Display="None"
                ForeColor="Red"
                SetFocusOnError="True"
                ValidationGroup="submitClick"
              ></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator
                ID="revRoleDesc"
                runat="server"
                ControlToValidate="txtRoleDesc"
                ForeColor="Red"
                SetFocusOnError="True"
                Display="None"
                ErrorMessage="No Special characters in Role Description"
                ValidationExpression="^[\sa-zA-Z0-9]*$"
                ValidationGroup="submitClick"
              >
              </asp:RegularExpressionValidator>
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
                        ID="btnSave"
                        runat="server"
                        Text="Save"
                        ValidationGroup="submitClick"
                        OnClick="btnSave_Click"
                        CssClass="fe-col w3-button w3-block w3-green w3-section w3-padding"
                      />
                    </td>

                    <td>
                      <asp:Button
                        ID="btnCancel"
                        runat="server"
                        Text="Cancel"
                        OnClick="btnCancel_Click"
                        CssClass="fe-col w3-button w3-block w3-green w3-section w3-padding"
                      />
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
                        Text="Role ID already exists. Please create with different Role ID"
                      ></asp:Label>
                      <asp:Label
                        ID="lbl_success"
                        runat="server"
                        ForeColor="Green"
                        Visible="False"
                        Text="Role creation to the CRE successful!!"
                      ></asp:Label>
                    </td>
                  </tr>
                </table>
              </div>
            </div>

            <table class="tava" border="3" align="center">
              <tr>
                <th id="Update">Roles</th>
              </tr>
              <tr>
                <td>
                  <asp:GridView
                    ID="gdvRole"
                    runat="server"
                    AutoGenerateColumns="false"
                    DataKeyNames="FECREDIT_ID"
                    OnRowEditing="OnRowEditing"
                    OnRowCancelingEdit="OnRowCancelingEdit"
                    PageSize="10"
                    AllowPaging="true"
                    OnPageIndexChanging="OnPaging"
                    OnRowUpdating="OnRowUpdating"
                    OnRowDeleting="OnRowDeleting"
                    CssClass="Grid"
                    AlternatingRowStyle-CssClass="alt"
                    PagerStyle-CssClass="pgr"
                    EmptyDataText="No records has been added."
                    Width="450"
                    OnRowDataBound="gdvRole_RowDataBound"
                  >
                    <Columns>
                      <asp:TemplateField HeaderText="ID" ItemStyle-Width="150">
                        <ItemTemplate>
                          <asp:Label
                            ID="lblgdvid"
                            runat="server"
                            Text='<%# Eval("FECREDIT_ID") %>'
                          ></asp:Label>
                        </ItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField
                        HeaderText="ROLE ID"
                        ItemStyle-Width="150"
                      >
                        <ItemTemplate>
                          <asp:Label
                            ID="lblgdvRoleId"
                            runat="server"
                            Text='<%# Eval("FECREDIT_ROLEID") %>'
                          ></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                          <asp:TextBox
                            ID="txtgdvRoleId"
                            Enabled="false"
                            runat="server"
                            MaxLength="8"
                            Text='<%# Eval("FECREDIT_ROLEID") %>'
                            Width="140"
                          ></asp:TextBox>
                        </EditItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField
                        HeaderText="Role Description"
                        ItemStyle-Width="150"
                      >
                        <ItemTemplate>
                          <asp:Label
                            ID="lblgdvRoleDesc"
                            runat="server"
                            Text='<%# Eval("FECREDIT_ROLEDESC") %>'
                          ></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                          <asp:TextBox
                            ID="txtgdvRoleDesc"
                            runat="server"
                            MaxLength="60"
                            Text='<%# Eval("FECREDIT_ROLEDESC") %>'
                            Width="140"
                          ></asp:TextBox>
                        </EditItemTemplate>
                      </asp:TemplateField>
                      <asp:CommandField
                        ShowEditButton="true"
                        ButtonType="Image"
                        EditImageUrl="images/Edit.png"
                        CancelImageUrl="~/images/Cancel.png"
                        UpdateImageUrl="~/images/update.png"
                        HeaderText="Update"
                      />
                      <asp:TemplateField HeaderText="Delete">
                        <ItemTemplate>
                          <asp:ImageButton
                            ID="lnk_RemoveFromlist"
                            runat="server"
                            Text="Delete"
                            ImageUrl="images/Delete.png"
                            CommandName="Delete"
                            CommandArgument='<%# Eval("FECREDIT_ID") %>'
                            OnClientClick="return ConfirmDelete()"
                          ></asp:ImageButton>
                        </ItemTemplate>
                      </asp:TemplateField>
                      <%--
                      <asp:CommandField
                        ShowDeleteButton="true"
                        ButtonType="Image"
                        DeleteImageUrl="images/Delete.png"
                        HeaderText="Delete"
                      />--%>
                    </Columns>
                  </asp:GridView>
                </td>
              </tr>
            </table>
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
