<%@ Page Language="C#" AutoEventWireup="true"
CodeFile="FECredit_Reports.aspx.cs" Inherits="FECredit_Reports" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <head runat="server">
    <title>FECREDIT REPORTS</title>
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
    <link type="text/css" rel="stylesheet" href="all_css.css" />
    <!--Here is external css-->
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
    <script type="text/javascript" src="Report.js"></script>
    <!-- here external css file -->

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
              <a href="FECredit_UserRoleAccess.aspx">Manage Role Access</a
              >&nbsp;|&nbsp;
              <a href="FECredit_BulkData.aspx">Bulk Data</a>&nbsp;|&nbsp;
              <a href="FECredit_Logout.aspx">Group Logout</a>
              &nbsp;|&nbsp;<a href="FECredit_GroupUserDel.aspx"
                >Group User Delete</a
              >
              &nbsp;|&nbsp;<a href="FECredit_ExcludeNumbers.aspx"
                >Exclude Phone Number</a
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
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
      </div>
      <div
        class="w3-container w3-margin w3-white"
        id="updateUserDiv"
        runat="server"
      >
        <div
          id="w3-modele-zoom-border-fil"
          class="w3-modal-content w3-animate-zoom w3-border"
        >
          <div class="w3-section w3-container" id="divRole">
            <table border="3" align="center">
              <tr>
                <th id="Search" colspan="9">Search Parameters</th>
              </tr>
              <tr>
                <td>
                  <label><b>Start Date</b></label>
                </td>
                <!--id ted-->>
                <td id="ted">
                  <asp:TextBox
                    ID="txtStartDate"
                    runat="server"
                    CssClass="w3-input w3-border w3-margin-bottom"
                  ></asp:TextBox>
                  <asp:RequiredFieldValidator
                    ID="rfvStartDate"
                    runat="server"
                    ErrorMessage="Please select Start Date"
                    ControlToValidate="txtStartDate"
                    Display="None"
                    ForeColor="Red"
                    SetFocusOnError="True"
                    ValidationGroup="submitClick"
                  ></asp:RequiredFieldValidator>
                  <asp:RegularExpressionValidator
                    ID="revStartDate"
                    runat="server"
                    ControlToValidate="txtStartDate"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    Display="None"
                    ErrorMessage="Please enter a Valid Start Date MM/DD/YYYY"
                    ValidationExpression="((1[0-2])|(0[1-9]))/(([1-2][0-9])|(0[1-9])|(3[0-1]))/[0-9]{4}"
                    ValidationGroup="submitClick"
                  >
                  </asp:RegularExpressionValidator>
                </td>
                <td>
                  <label><b>End Date</b></label>
                </td>
                <td id="ted">
                  <asp:TextBox
                    ID="txtEndDate"
                    runat="server"
                    CssClass="w3-input w3-border w3-margin-bottom"
                  ></asp:TextBox>
                  <asp:RequiredFieldValidator
                    ID="rfvEndDate"
                    runat="server"
                    ErrorMessage="Please select End Date"
                    ControlToValidate="txtEndDate"
                    Display="None"
                    ForeColor="Red"
                    SetFocusOnError="True"
                    ValidationGroup="submitClick"
                  ></asp:RequiredFieldValidator>
                  <%-- open in production. commented on local --%>
                  <asp:CompareValidator
                    ID="cmvHighEndDate"
                    runat="server"
                    ControlToCompare="txtStartDate"
                    ControlToValidate="txtEndDate"
                    Operator="GreaterThanEqual"
                    Display="None"
                    ErrorMessage="Start date must be earlier than end date"
                    ForeColor="Red"
                    SetFocusOnError="True"
                    ValidationGroup="submitClick"
                    Type="Date"
                  ></asp:CompareValidator>
                  <asp:RegularExpressionValidator
                    ID="revEndDate"
                    runat="server"
                    ControlToValidate="txtEndDate"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    Display="None"
                    ErrorMessage="Please enter a Valid End Date MM/DD/YYYY"
                    ValidationExpression="((1[0-2])|(0[1-9]))/(([1-2][0-9])|(0[1-9])|(3[0-1]))/[0-9]{4}"
                    ValidationGroup="submitClick"
                  >
                  </asp:RegularExpressionValidator>
                </td>
                <td>
                  <label><b>User ID</b></label>
                </td>
                <td id="ted">
                  <asp:TextBox
                    ID="txtUserID"
                    runat="server"
                    CssClass="w3-input w3-border w3-margin-bottom"
                  ></asp:TextBox>
                  <asp:RegularExpressionValidator
                    ID="revuserName"
                    runat="server"
                    ControlToValidate="txtUserID"
                    ForeColor="Red"
                    SetFocusOnError="true"
                    Display="None"
                    ErrorMessage="Invalid characters in User ID"
                    ValidationExpression="^[\sa-zA-Z0-9.]*$"
                    ValidationGroup="submitClick"
                  ></asp:RegularExpressionValidator>
                </td>
                <td>
                  <label><b>Select Report</b></label>
                </td>
                <!--id is pos-->
                <td id="pos">
                  <asp:DropDownList
                    ID="ddlReportType"
                    runat="server"
                    CssClass="w3-input w3-border w3-margin-bottom"
                  >
                    <asp:ListItem
                      Text="Activity Log Report"
                      Value="ALR"
                    ></asp:ListItem>
                    <asp:ListItem
                      Text="User Detail Report"
                      Value="UDR"
                    ></asp:ListItem>
                    <asp:ListItem
                      Text="Action Code Report"
                      Value="ACR"
                    ></asp:ListItem>
                    <asp:ListItem
                      Text="Audit Trail Report"
                      Value="ATR"
                    ></asp:ListItem>
                    <asp:ListItem
                      Text="Exceed Search Limit Report"
                      Value="SLR"
                    ></asp:ListItem>
                    <asp:ListItem
                      Text="Multiple Location Report"
                      Value="MLR"
                    ></asp:ListItem>
                    <asp:ListItem
                      Text="Multiple Device Report"
                      Value="MDR"
                    ></asp:ListItem>
                    <asp:ListItem
                      Text="Login Failure Report"
                      Value="LFR"
                    ></asp:ListItem>
                    <asp:ListItem
                      Text="Non-Working Hour Report"
                      Value="WHR"
                    ></asp:ListItem>
                    <asp:ListItem
                      Text="Search Velocity Report"
                      Value="SVR"
                    ></asp:ListItem>
                    <asp:ListItem
                      Text="1-minute Search Report"
                      Value="MSR"
                    ></asp:ListItem>
                  </asp:DropDownList>
                </td>
                <td>
                  <asp:Button
                    ID="btnSearch"
                    runat="server"
                    OnClick="btnSearch_Click"
                    Text="Search"
                    ValidationGroup="submitClick"
                    CssClass="fe-col w3-button w3-block w3-green w3-section w3-padding"
                  ></asp:Button>
                </td>
              </tr>
              <tr>
                <td colspan="9">
                  <asp:ValidationSummary
                    ID="vsErrorList"
                    runat="server"
                    HeaderText=""
                    ShowMessageBox="false"
                    DisplayMode="List"
                    ShowSummary="true"
                    BackColor="Snow"
                    ForeColor="Red"
                    Font-Size="Medium"
                    Font-Italic="true"
                    ValidationGroup="submitClick"
                  />
                  <asp:Label
                    ID="lblDateError"
                    runat="server"
                    ForeColor="Red"
                    Visible="False"
                    Text=""
                  ></asp:Label>
                </td>
              </tr>
            </table>
            <div id="dvReport" runat="server">
              <table
                border="3"
                align="center"
                id="tblALR"
                runat="server"
                visible="false"
              >
                <tr>
                  <th id="back">Activity Logs</th>
                </tr>
                <tr>
                  <td colspan="2">
                    <contenttemplate>
                      <asp:GridView
                        ID="grdALR"
                        runat="server"
                        AutoGenerateColumns="false"
                        OnRowDataBound="OnRowDataBoundALR"
                        PageSize="10"
                        AllowPaging="true"
                        OnPageIndexChanging="OnPagingALR"
                        AllowSorting="true"
                        OnSorting="grdALR_Sorting"
                        CssClass="Grid"
                        AlternatingRowStyle-CssClass="alt"
                        PagerStyle-CssClass="pgr"
                        EmptyDataText="No records has been added."
                      >
                        <Columns>
                          <asp:TemplateField
                            HeaderText="Type"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblType"
                                runat="server"
                                Text='<%# Eval("Type") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="User ID"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblUsername"
                                runat="server"
                                Text='<%# Eval("User ID") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Activity"
                            ItemStyle-Width="400"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblActivity"
                                runat="server"
                                Text='<%# Eval("Activity") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Date"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblActivityDate"
                                runat="server"
                                Text='<%# Eval("Date") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                        </Columns>
                      </asp:GridView>
                    </contenttemplate>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <asp:Label
                      ID="Label5"
                      runat="server"
                      ForeColor="Green"
                      Visible="false"
                      Text=""
                    ></asp:Label>
                    <asp:Label
                      ID="Label6"
                      runat="server"
                      ForeColor="Red"
                      Visible="False"
                      Text=""
                    ></asp:Label>
                  </td>
                </tr>
              </table>
              <table
                border="3"
                align="center"
                id="tblATR"
                runat="server"
                visible="false"
              >
                <tr>
                  <!--back is id name -->
                  <th id="back">Audit Trail Report</th>
                </tr>
                <tr>
                  <td colspan="2">
                    <contenttemplate>
                      <asp:GridView
                        ID="grdATR"
                        runat="server"
                        AutoGenerateColumns="false"
                        OnRowDataBound="OnRowDataBoundATR"
                        PageSize="10"
                        AllowPaging="true"
                        OnPageIndexChanging="OnPagingATR"
                        CssClass="Grid"
                        AlternatingRowStyle-CssClass="alt"
                        PagerStyle-CssClass="pgr"
                        EmptyDataText="No records has been added."
                      >
                        <Columns>
                          <asp:TemplateField
                            HeaderText="Search Criteria"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblCriteria"
                                runat="server"
                                Text='<%# Eval("Search Criteria") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Search Value"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblValue"
                                runat="server"
                                Text='<%# Eval("Search Value") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="User ID"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblUserID"
                                runat="server"
                                Text='<%# Eval("User ID") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Search Date-Time"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblSearchDate"
                                runat="server"
                                Text='<%# Eval("Search Date-Time") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Role"
                            ItemStyle-Width="400"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblRole"
                                runat="server"
                                Text='<%# Eval("ROLE").ToString()%>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                        </Columns>
                      </asp:GridView>
                    </contenttemplate>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
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
              <table
                border="3"
                align="center"
                id="tblUDR"
                runat="server"
                visible="false"
              >
                <tr>
                  <th id="back">User Detail Report</th>
                </tr>
                <tr>
                  <td colspan="2">
                    <contenttemplate>
                      <asp:GridView
                        ID="grdUDR"
                        runat="server"
                        AutoGenerateColumns="false"
                        PageSize="10"
                        AllowPaging="true"
                        OnPageIndexChanging="OnPagingUDR"
                        CssClass="Grid"
                        AlternatingRowStyle-CssClass="alt"
                        PagerStyle-CssClass="pgr"
                        EmptyDataText="No records has been added."
                      >
                        <Columns>
                          <asp:TemplateField
                            HeaderText="User Name"
                            ItemStyle-Width="100"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblUsername"
                                runat="server"
                                Text='<%# Eval("User Name") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Role"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblRole"
                                runat="server"
                                Text='<%# Eval("Role").ToString()%>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Disable"
                            ItemStyle-Width="250"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblDisable"
                                runat="server"
                                Text='<%# Eval("Disable") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Last Login Date"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblLastLoginDate"
                                runat="server"
                                Text='<%# Eval("Last Login Date") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="User Created by"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblCreatedBy"
                                runat="server"
                                Text='<%# Eval("User Created by") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Modules Access"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblModules"
                                runat="server"
                                Text='<%# Eval("Modules Access") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                        </Columns>
                      </asp:GridView>
                    </contenttemplate>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <asp:Label
                      ID="Label1"
                      runat="server"
                      ForeColor="Green"
                      Visible="false"
                      Text=""
                    ></asp:Label>
                    <asp:Label
                      ID="Label2"
                      runat="server"
                      ForeColor="Red"
                      Visible="False"
                      Text=""
                    ></asp:Label>
                  </td>
                </tr>
              </table>
              <table
                border="3"
                align="center"
                id="tblACR"
                runat="server"
                visible="false"
              >
                <tr>
                  <th id="back">Action Code Report</th>
                </tr>
                <tr>
                  <td colspan="2">
                    <contenttemplate>
                      <asp:GridView
                        ID="grdACR"
                        runat="server"
                        AutoGenerateColumns="false"
                        OnRowDataBound="OnRowDataBoundACR"
                        PageSize="10"
                        AllowPaging="true"
                        OnPageIndexChanging="OnPagingACR"
                        CssClass="Grid"
                        AlternatingRowStyle-CssClass="alt"
                        PagerStyle-CssClass="pgr"
                        EmptyDataText="No records has been added."
                      >
                        <Columns>
                          <asp:TemplateField
                            HeaderText="National ID"
                            ItemStyle-Width="100"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblNid"
                                runat="server"
                                Text='<%# Eval("National ID") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Action Code"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblActionCode"
                                runat="server"
                                Text='<%# Eval("Action Code").ToString() %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Person Contacted"
                            ItemStyle-Width="50"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblPersContacted"
                                runat="server"
                                Text='<%# Eval("Person Contacted") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Relation"
                            ItemStyle-Width="50"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblRelation"
                                runat="server"
                                Text='<%# Eval("Relation") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Remarks"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblRemarks"
                                runat="server"
                                Text='<%# Eval("Remarks") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Comment Creation Date"
                            ItemStyle-Width="100"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblCreationDate"
                                runat="server"
                                Text='<%# Eval("Comment Creation Date" ) %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Created By"
                            ItemStyle-Width="80"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblCreatedBy"
                                runat="server"
                                Text='<%# Eval("Created By") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Role"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblRole"
                                runat="server"
                                Text='<%# Eval("ROLE").ToString() %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                        </Columns>
                      </asp:GridView>
                    </contenttemplate>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <asp:Label
                      ID="Label3"
                      runat="server"
                      ForeColor="Green"
                      Visible="false"
                      Text=""
                    ></asp:Label>
                    <asp:Label
                      ID="Label4"
                      runat="server"
                      ForeColor="Red"
                      Visible="False"
                      Text=""
                    ></asp:Label>
                  </td>
                </tr>
              </table>
              <table
                border="3"
                align="center"
                id="tblSLR"
                runat="server"
                visible="false"
              >
                <tr>
                  <th id="back">Maximum Search Limit Exceeded Report</th>
                </tr>
                <tr>
                  <td colspan="2">
                    <contenttemplate>
                      <asp:GridView
                        ID="grdSLR"
                        runat="server"
                        AutoGenerateColumns="false"
                        PageSize="10"
                        AllowPaging="true"
                        OnPageIndexChanging="OnPagingSLR"
                        CssClass="Grid"
                        AlternatingRowStyle-CssClass="alt"
                        PagerStyle-CssClass="pgr"
                        EmptyDataText="No records found."
                      >
                        <Columns>
                          <asp:TemplateField
                            HeaderText="User Name"
                            ItemStyle-Width="100"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblUsername"
                                runat="server"
                                Text='<%# Eval("User Name") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Role"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblRole"
                                runat="server"
                                Text='<%# Eval("Role").ToString()%>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Disable"
                            ItemStyle-Width="250"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblDisable"
                                runat="server"
                                Text='<%# Eval("Disable") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Last Login Date"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblLastLoginDate"
                                runat="server"
                                Text='<%# Eval("Last Login Date") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="User Created by"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblCreatedBy"
                                runat="server"
                                Text='<%# Eval("User Created by") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Last Login IP"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblRealIp"
                                runat="server"
                                Text='<%# Eval("Last Login IP") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Limit Reached Date"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblLimitDate"
                                runat="server"
                                Text='<%# Eval("Limit Reached Date") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Limit Value"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblLimitValue"
                                runat="server"
                                Text='<%# Eval("Limit Value") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                        </Columns>
                      </asp:GridView>
                    </contenttemplate>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <asp:Label
                      ID="Label13"
                      runat="server"
                      ForeColor="Green"
                      Visible="false"
                      Text=""
                    ></asp:Label>
                    <asp:Label
                      ID="Label14"
                      runat="server"
                      ForeColor="Red"
                      Visible="False"
                      Text=""
                    ></asp:Label>
                  </td>
                </tr>
              </table>
              <table
                border="3"
                align="center"
                id="tblLFR"
                runat="server"
                visible="false"
              >
                <tr>
                  <th id="back">Login Failure Report</th>
                </tr>
                <tr>
                  <td colspan="2">
                    <contenttemplate>
                      <asp:GridView
                        ID="grdLFR"
                        runat="server"
                        AutoGenerateColumns="false"
                        PageSize="10"
                        AllowPaging="true"
                        OnPageIndexChanging="OnPagingLFR"
                        CssClass="Grid"
                        AlternatingRowStyle-CssClass="alt"
                        PagerStyle-CssClass="pgr"
                        EmptyDataText="No records found!!"
                      >
                        <Columns>
                          <asp:TemplateField
                            HeaderText="User Name"
                            ItemStyle-Width="100"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblUsername"
                                runat="server"
                                Text='<%# Eval("User ID") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Action Time"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblActionTime"
                                runat="server"
                                Text='<%# Eval("Action Time") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Remark"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblRemark"
                                runat="server"
                                Text='<%# Eval("Remarks") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Real IP"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblRealIP"
                                runat="server"
                                Text='<%# Eval("Real IP") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                        </Columns>
                      </asp:GridView>
                    </contenttemplate>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <asp:Label
                      ID="Label7"
                      runat="server"
                      ForeColor="Green"
                      Visible="false"
                      Text=""
                    ></asp:Label>
                    <asp:Label
                      ID="Label8"
                      runat="server"
                      ForeColor="Red"
                      Visible="False"
                      Text=""
                    ></asp:Label>
                  </td>
                </tr>
              </table>
              <table
                border="3"
                align="center"
                id="tblMLR"
                runat="server"
                visible="false"
              >
                <tr>
                  <th id="back">Multiple Location Login Report</th>
                </tr>
                <tr>
                  <td colspan="2">
                    <contenttemplate>
                      <asp:GridView
                        ID="grdMLR"
                        runat="server"
                        AutoGenerateColumns="false"
                        PageSize="10"
                        AllowPaging="true"
                        OnPageIndexChanging="OnPagingMLR"
                        CssClass="Grid"
                        AlternatingRowStyle-CssClass="alt"
                        PagerStyle-CssClass="pgr"
                        EmptyDataText="No records found!!"
                      >
                        <Columns>
                          <asp:TemplateField
                            HeaderText="User Name"
                            ItemStyle-Width="100"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblUsername"
                                runat="server"
                                Text='<%# Eval("User Name") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="IP Address"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblIPAddress"
                                runat="server"
                                Text='<%# Eval("IP Address") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Device Name"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblDeviceName"
                                runat="server"
                                Text='<%# Eval("Device Name") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Login Time"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblLoginTime"
                                runat="server"
                                Text='<%# Eval("Login Time") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Logout Time"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblLogoutTime"
                                runat="server"
                                Text='<%# Eval("Logout Time") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                        </Columns>
                      </asp:GridView>
                    </contenttemplate>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <asp:Label
                      ID="Label15"
                      runat="server"
                      ForeColor="Green"
                      Visible="false"
                      Text=""
                    ></asp:Label>
                    <asp:Label
                      ID="Label16"
                      runat="server"
                      ForeColor="Red"
                      Visible="False"
                      Text=""
                    ></asp:Label>
                  </td>
                </tr>
              </table>
              <table
                border="3"
                align="center"
                id="tblMDR"
                runat="server"
                visible="false"
              >
                <tr>
                  <th id="back">Multiple Device Login Report</th>
                </tr>
                <tr>
                  <td colspan="2">
                    <contenttemplate>
                      <asp:GridView
                        ID="grdMDR"
                        runat="server"
                        AutoGenerateColumns="false"
                        PageSize="10"
                        AllowPaging="true"
                        OnPageIndexChanging="OnPagingMDR"
                        CssClass="Grid"
                        AlternatingRowStyle-CssClass="alt"
                        PagerStyle-CssClass="pgr"
                        EmptyDataText="No records found!!"
                      >
                        <Columns>
                          <asp:TemplateField
                            HeaderText="User Name"
                            ItemStyle-Width="100"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblUsername"
                                runat="server"
                                Text='<%# Eval("User Name") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Device Name"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblDeviceName"
                                runat="server"
                                Text='<%# Eval("Device Name") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Login Time"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblLoginTime"
                                runat="server"
                                Text='<%# Eval("Login Time") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Logout Time"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblLogoutTime"
                                runat="server"
                                Text='<%# Eval("Logout Time") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="IP Address"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblIPAddress"
                                runat="server"
                                Text='<%# Eval("IP Address") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                        </Columns>
                      </asp:GridView>
                    </contenttemplate>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <asp:Label
                      ID="Label9"
                      runat="server"
                      ForeColor="Green"
                      Visible="false"
                      Text=""
                    ></asp:Label>
                    <asp:Label
                      ID="Label10"
                      runat="server"
                      ForeColor="Red"
                      Visible="False"
                      Text=""
                    ></asp:Label>
                  </td>
                </tr>
              </table>
              <table
                border="3"
                align="center"
                id="tblWHR"
                runat="server"
                visible="false"
              >
                <tr>
                  <th id="back">Non Working Hours Login Report</th>
                </tr>
                <tr>
                  <td colspan="2">
                    <contenttemplate>
                      <asp:GridView
                        ID="grdWHR"
                        runat="server"
                        AutoGenerateColumns="false"
                        PageSize="10"
                        AllowPaging="true"
                        OnPageIndexChanging="OnPagingWHR"
                        CssClass="Grid"
                        AlternatingRowStyle-CssClass="alt"
                        PagerStyle-CssClass="pgr"
                        EmptyDataText="No records found!!"
                      >
                        <Columns>
                          <asp:TemplateField
                            HeaderText="User Name"
                            ItemStyle-Width="100"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblUsername"
                                runat="server"
                                Text='<%# Eval("UserName") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Device Name"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblDeviceName"
                                runat="server"
                                Text='<%# Eval("MachineName") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Login Time"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblLoginTime"
                                runat="server"
                                Text='<%# Eval("LoginTime") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Logout Time"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblLogoutTime"
                                runat="server"
                                Text='<%# Eval("LogoutTime") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="IP Address"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblIPAddress"
                                runat="server"
                                Text='<%# Eval("RealIP") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                        </Columns>
                      </asp:GridView>
                    </contenttemplate>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <asp:Label
                      ID="Label11"
                      runat="server"
                      ForeColor="Green"
                      Visible="false"
                      Text=""
                    ></asp:Label>
                    <asp:Label
                      ID="Label12"
                      runat="server"
                      ForeColor="Red"
                      Visible="False"
                      Text=""
                    ></asp:Label>
                  </td>
                </tr>
              </table>
              <table
                border="3"
                align="center"
                id="tblSVR"
                runat="server"
                visible="false"
              >
                <tr>
                  <th id="back">Search Velocity Report</th>
                </tr>
                <tr>
                  <td colspan="2">
                    <contenttemplate>
                      <asp:GridView
                        ID="grdSVR"
                        runat="server"
                        AutoGenerateColumns="false"
                        PageSize="10"
                        AllowPaging="true"
                        OnPageIndexChanging="OnPagingSVR"
                        CssClass="Grid"
                        AlternatingRowStyle-CssClass="alt"
                        PagerStyle-CssClass="pgr"
                        EmptyDataText="No records found!!"
                      >
                        <Columns>
                          <asp:TemplateField
                            HeaderText="User Name"
                            ItemStyle-Width="100"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblUsername"
                                runat="server"
                                Text='<%# Eval("User Name") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Last Login Date"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblLastLoginDate"
                                runat="server"
                                Text='<%# Eval("Last Login Date") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Velocity"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblVelocity"
                                runat="server"
                                Text='<%# Eval("Velocity") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Current Search"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblCurrentSearch"
                                runat="server"
                                Text='<%# Eval("Current Search") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Previous Search"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblPreviousSearch"
                                runat="server"
                                Text='<%# Eval("Previous Search") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                        </Columns>
                      </asp:GridView>
                    </contenttemplate>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <asp:Label
                      ID="Label17"
                      runat="server"
                      ForeColor="Green"
                      Visible="false"
                      Text=""
                    ></asp:Label>
                    <asp:Label
                      ID="Label18"
                      runat="server"
                      ForeColor="Red"
                      Visible="False"
                      Text=""
                    ></asp:Label>
                  </td>
                </tr>
              </table>
              <table
                border="3"
                align="center"
                id="tblMSR"
                runat="server"
                visible="false"
              >
                <tr>
                  <th id="back">1-minute multiple search Report</th>
                </tr>
                <tr>
                  <td colspan="2">
                    <contenttemplate>
                      <asp:GridView
                        ID="grdMSR"
                        runat="server"
                        AutoGenerateColumns="false"
                        PageSize="10"
                        AllowPaging="true"
                        OnPageIndexChanging="OnPagingMSR"
                        CssClass="Grid"
                        AlternatingRowStyle-CssClass="alt"
                        PagerStyle-CssClass="pgr"
                        EmptyDataText="No records found!!"
                      >
                        <Columns>
                          <asp:TemplateField
                            HeaderText="User Name"
                            ItemStyle-Width="100"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblUsername"
                                runat="server"
                                Text='<%# Eval("UserName") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="User Role"
                            ItemStyle-Width="100"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblUserRole"
                                runat="server"
                                Text='<%# Eval("Role") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Real IP"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblRealIP"
                                runat="server"
                                Text='<%# Eval("RealIP") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Device Name"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblDeviceName"
                                runat="server"
                                Text='<%# Eval("MachineName") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField
                            HeaderText="Search Time"
                            ItemStyle-Width="150"
                          >
                            <ItemTemplate>
                              <asp:Label
                                ID="lblSearchTime"
                                runat="server"
                                Text='<%# Eval("SearchTime") %>'
                              ></asp:Label>
                            </ItemTemplate>
                          </asp:TemplateField>
                        </Columns>
                      </asp:GridView>
                    </contenttemplate>
                  </td>
                </tr>
                <tr>
                  <td colspan="2">
                    <asp:Label
                      ID="Label19"
                      runat="server"
                      ForeColor="Green"
                      Visible="false"
                      Text=""
                    ></asp:Label>
                    <asp:Label
                      ID="Label20"
                      runat="server"
                      ForeColor="Red"
                      Visible="False"
                      Text=""
                    ></asp:Label>
                  </td>
                </tr>
              </table>
            </div>
            <div visible="false" runat="server" id="dvExport">
              <!--here id tube
            -->
              <table id="Tube">
                <tr>
                  <td id="tube_Td" colspan="9" align="right">
                    <asp:Button
                      ID="Export"
                      runat="server"
                      OnClick="Export_Click"
                      Text="Export"
                      ValidationGroup="ExportClick"
                      CssClass="fe-col w3-button w3-block w3-green w3-section w3-padding"
                    ></asp:Button>
                  </td>
                </tr>
              </table>
            </div>
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
