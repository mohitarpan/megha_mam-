<%@ Page Language="C#" AutoEventWireup="true"
CodeFile="FECredit_ActionCode.aspx.cs" Inherits="FECredit_ActionCode"
ValidateRequest="false" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>FECREDIT ACTION CODE SETUP</title>
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
    <link type="text/css" rel="stylesheet" href="all_css.css" />
    <!-- here is external css file -->
    <link rel="stylesheet" href="Content/w3.css" />
    <link rel="stylesheet" href="Content/googleapis.css" />
    <link rel="stylesheet" href="Content/font-awesome.min.css" />
    <link href="Content/fonts.googleapis.css" rel="stylesheet" />
    <script
      type="text/javascript"
      src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"
    ></script>
    <%--
    <script type="text/javascript" src="scripts/jquery.blockUI.js"></script>
    --%>
    <script type="text/javascript" src="alljs.js"></script>
    <!-- here is external css file -->
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
              <a href="FECredit_UserRoleAccess.aspx">Manage Role Access</a
              >&nbsp;|&nbsp;
              <a href="FECredit_Reports.aspx">Reports</a>&nbsp;|&nbsp;
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
          <div class="w3-modal-content w3-animate-zoom w3-border">
            <div class="w3-section w3-container" id="divLogin">
              <label><b>Action Code * </b></label>
              <asp:TextBox
                ID="txtActionCode"
                runat="server"
                MaxLength="8"
                CssClass="w3-input w3-border w3-margin-bottom"
              ></asp:TextBox>
              <asp:RegularExpressionValidator
                ID="revActionCode"
                runat="server"
                ControlToValidate="txtActionCode"
                ForeColor="Red"
                SetFocusOnError="true"
                Display="None"
                ErrorMessage="No Special characters in Action Code"
                ValidationExpression="^[\sa-zA-Z0-9]*$"
                ValidationGroup="submitClick"
              >
              </asp:RegularExpressionValidator>
              <asp:RequiredFieldValidator
                ID="rfvActionCode"
                runat="server"
                ErrorMessage="Please enter Action Code"
                ControlToValidate="txtActionCode"
                Display="None"
                ForeColor="Red"
                SetFocusOnError="True"
                ValidationGroup="submitClick"
              ></asp:RequiredFieldValidator>
              <label><b>Action Code Description * </b></label>
              <asp:TextBox
                ID="txtActionCodeDesc"
                runat="server"
                MaxLength="60"
                CssClass="w3-input w3-border w3-margin-bottom"
              ></asp:TextBox>

              <asp:RequiredFieldValidator
                ID="rfvActionCodeDesc"
                runat="server"
                ErrorMessage="Please enter Action Code Description"
                ControlToValidate="txtActionCodeDesc"
                Display="None"
                ForeColor="Red"
                SetFocusOnError="True"
                ValidationGroup="submitClick"
              ></asp:RequiredFieldValidator>
              <asp:RegularExpressionValidator
                ID="revActionCodeDesc"
                runat="server"
                ControlToValidate="txtActionCodeDesc"
                ForeColor="Red"
                SetFocusOnError="true"
                Display="None"
                ErrorMessage="Invalid characters in Action Description"
                ValidationExpression="[^<]*"
                ValidationGroup="submitClick"
              >
              </asp:RegularExpressionValidator>
              <asp:ValidationSummary
                ID="vsErrorList"
                runat="server"
                HeaderText="Following error occurs: "
                ShowMessageBox="false"
                DisplayMode="List"
                ShowSummary="true"
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
                        OnClick="btnSave_Click"
                        ValidationGroup="submitClick"
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
                        Text="Action Code already exists. Please create with different Action Code"
                      ></asp:Label>
                      <asp:Label
                        ID="lbl_success"
                        runat="server"
                        ForeColor="Green"
                        Visible="False"
                        Text="Action Code creation to the CRE successful!!"
                      ></asp:Label>
                      <asp:ValidationSummary
                        ID="vsEdit"
                        runat="server"
                        HeaderText=""
                        ShowMessageBox="false"
                        DisplayMode="List"
                        ShowSummary="true"
                        Font-Italic="true"
                        ValidationGroup="editClick"
                      />
                    </td>
                  </tr>
                </table>
              </div>
            </div>
            <!-- class name tave -->
            <table class="tave" border="3" align="center">
              <tr>
                <th id="Update">Action Codes</th>
              </tr>
              <tr>
                <td>
                  <asp:GridView
                    ID="gdvActionCode"
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
                    OnRowDataBound="gdvActionCode_RowDataBound"
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
                        HeaderText="Action Code"
                        ItemStyle-Width="150"
                      >
                        <ItemTemplate>
                          <asp:Label
                            ID="lblgdvActionCode"
                            runat="server"
                            Text='<%# Eval("FECREDIT_ACTIONCODE") %>'
                          ></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                          <asp:TextBox
                            ID="txtgdvActionCode"
                            runat="server"
                            MaxLength="8"
                            Enabled="false"
                            Text='<%# Eval("FECREDIT_ACTIONCODE") %>'
                            Width="140"
                          ></asp:TextBox>
                        </EditItemTemplate>
                      </asp:TemplateField>
                      <asp:TemplateField
                        HeaderText="Action Code Description"
                        ItemStyle-Width="150"
                      >
                        <ItemTemplate>
                          <asp:Label
                            ID="lblgdvActionCodeDesc"
                            runat="server"
                            Text='<%# Eval("FECREDIT_ACTIONCODEDESC") %>'
                          ></asp:Label>
                        </ItemTemplate>
                        <EditItemTemplate>
                          <asp:TextBox
                            ID="txtgdvActionCodeDesc"
                            runat="server"
                            MaxLength="60"
                            Text='<%# Eval("FECREDIT_ACTIONCODEDESC") %>'
                            Width="140"
                          ></asp:TextBox>
                          <asp:RegularExpressionValidator
                            ID="revgdvActionCodeDesc"
                            runat="server"
                            ControlToValidate="txtgdvActionCodeDesc"
                            ForeColor="Red"
                            SetFocusOnError="true"
                            Display="None"
                            ErrorMessage="Invalid characters in Action Description"
                            ValidationExpression="[^<]*"
                            ValidationGroup="editClick"
                          >
                          </asp:RegularExpressionValidator>
                        </EditItemTemplate>
                      </asp:TemplateField>
                      <asp:CommandField
                        ShowEditButton="true"
                        ButtonType="Image"
                        EditImageUrl="images/Edit.png"
                        CancelImageUrl="~/images/Cancel.png"
                        UpdateImageUrl="~/images/update.png"
                        HeaderText="Update"
                        ValidationGroup="editClick"
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
                      <%--<asp:CommandField
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
