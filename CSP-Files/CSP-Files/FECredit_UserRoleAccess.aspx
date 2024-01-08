<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FECredit_UserRoleAccess.aspx.cs" Inherits="FECredit_UserRoleAccess" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FECREDIT USER ROLE ACCESS</title>
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
    <link rel="stylesheet" href="Content/w3.css" />
    <link rel='stylesheet' href='Content/googleapis.css' />
    <link rel="stylesheet" href="Content/font-awesome.min.css" />
    <link href="Content/fonts.googleapis.css" rel="stylesheet" />
    <style>
        html, body, h1, h2, h3, h4, h5, h6 {
            font-family: "Roboto", sans-serif
        }

        .fe-col {
            background-color: #008848 !important;
            color: #ffffff;
        }

        .errcolor {
        }
    </style>
    <script type="text/javascript">
        function executeCheckboxChecked(checkBox) {

            var gridView = document.getElementById('gdvModules');
            var index = checkBox.parentElement.parentElement.rowIndex;
            if (checkBox.checked == true) {
                gridView.rows[index].cells[1].getElementsByTagName("INPUT")[0].checked = true;
            }
        }

        function viewCheckboxUnChecked(checkBox) {
            var gridView = document.getElementById('gdvModules');
            var index = checkBox.parentElement.parentElement.rowIndex;

            if (checkBox.checked == false) {
                if (gridView.rows[index].cells[2].getElementsByTagName("INPUT")) {
                    gridView.rows[index].cells[2].getElementsByTagName("INPUT")[0].checked = false;
                }
            }
        }
    </script>
</head>
<body>
    <form class="w3-container" runat="server">
        <div class="w3-container">
            <div class="w3-display-container w3-white w3-padding">
                <div class="w3-content w3-third w3-padding">
                    <a href="https://fecredit.com.vn" target="_blank">
                        <img class="w3-left" src="images/logo-vn.png" style="width: 40%; padding: 3% 0% 1% 0%;" alt="FE CREDIT" /></a>
                </div>
                <div class="w3-content w3-third">
                    <h3 class="w3-center w3-padding" style="font-family: 'Volkhov', serif;">Contact Revival Engine</h3>
                </div>
                <div class="w3-content w3-third">
                    <span class="w3-right w3-padding w3-hide-small">
                        <asp:Label ID="lblUser" runat="server" Text="Welcome admin"></asp:Label>
                        &nbsp;|&nbsp;
                        <a href="FECredit_Role.aspx">Manage Roles</a>
                        &nbsp;|&nbsp;
                        <a href="FECredit_ActionCode.aspx">Manage Action Code</a>
                        &nbsp;|&nbsp;
                        <a href="FECredit_Reports.aspx">Reports</a>&nbsp;|&nbsp;
                        <a href="FECredit_BulkData.aspx">Bulk Data</a>&nbsp;|&nbsp;
                        <a href="FECredit_Logout.aspx">Group Logout</a>
                        &nbsp;|&nbsp;<a href="FECredit_GroupUserDel.aspx">Group User Delete</a>     &nbsp;|&nbsp;
                        <a href="FECredit_Reset.aspx">Reset Password</a>   &nbsp;|&nbsp;
                        <a href="FD_Admin.aspx">Home</a>                   &nbsp;|&nbsp;
                        <a href="FECredit_ConfigData.aspx">Config Data</a>                        &nbsp;|&nbsp;
                        <asp:LinkButton ID="lnkLogout" runat="server" Text="Logout" OnClick="lnkLogout_Click"></asp:LinkButton>
                    </span>
                </div>
            </div>
            <div class="w3-container w3-margin w3-white" style="min-height: 38em;">
                <div class="w3-modal-content w3-animate-zoom w3-border" style="max-width: 500px; margin-top: 5em;">
                    <div class="w3-section w3-container" id="divRole">
                        <label><b>Role Description *</b></label>
                        <asp:DropDownList ID="ddlRole" runat="server" CssClass="w3-input w3-border w3-margin-bottom" AutoPostBack="true" OnSelectedIndexChanged="ddlRole_SelectedIndexChanged" />
                        <asp:RequiredFieldValidator ID="rfvRole" runat="server"
                            ErrorMessage="Please select Role" ControlToValidate="ddlRole"
                            Display="None" ForeColor="Red" SetFocusOnError="True" ValidationGroup="submitClick" InitialValue="0"></asp:RequiredFieldValidator>

                    </div>
                    <table id="tblModules" runat="server" border="3" align="center" style="margin-top: 2px;">
                        <tr>
                            <th id="Update" style="background-color: #008848">User Role Access</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:GridView ID="gdvModules" runat="server" AutoGenerateColumns="false"
                                    DataKeyNames="FECREDIT_SCREENID" CssClass="Grid" AlternatingRowStyle-CssClass="alt"
                                    EmptyDataText="No records has been added." Width="450" OnRowDataBound="gdvModules_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="ID" ItemStyle-Width="150" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgdvid" runat="server" Visible="false" Text='<%# Eval("FECREDIT_SCREENID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Screens" ItemStyle-Width="150">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgdvScreenName" runat="server" Text='<%# Eval("FECREDIT_SCREENNAME") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="View" ItemStyle-Width="50" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkgdvView" runat="server" onclick="viewCheckboxUnChecked(this);" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Execution" ItemStyle-Width="50" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:CheckBox ID="chkgdvExecute" runat="server" onclick="executeCheckboxChecked(this)" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Options" ItemStyle-Width="150" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lblgdvOptions" runat="server" Visible="false" Text='<%# Eval("FECREDIT_option") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </td>
                        </tr>
                    </table>
                    <div id="dvButtons" runat="server">
                        <!-- class="w3-quarter w3-left">-->
                        <table>
                            <tr>
                                <td>
                                    <asp:Button ID="btnSave" runat="server" Text="Save"
                                        OnClick="btnSave_Click" ValidationGroup="submitClick" CssClass="fe-col w3-button w3-block w3-green w3-section w3-padding" />
                                </td>

                                <td>
                                    <asp:Button ID="btnCancel" runat="server" Text="Cancel"
                                        OnClick="btnCancel_Click" CssClass="fe-col w3-button w3-block w3-green w3-section w3-padding" />
                                </td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblStatus" runat="server" Text=""></asp:Label>
                                    <asp:Label ID="lbl_error" runat="server" ForeColor="Red" Visible="False" Text="Select Role"></asp:Label>
                                    <asp:Label ID="lbl_success" runat="server" ForeColor="Green" Visible="False" Text="Role access updated"></asp:Label>
                                </td>

                            </tr>
                        </table>
                    </div>
                </div>
            </div>
            <!-- End Grid -->
        </div>
        <!-- End Page Container -->
    </form>
    <footer class="fe-col w3-container w3-center w3-padding">
        <p>2018 - Bản quyền thuộc về <a href="https://fecredit.com.vn" target="_blank">FE CREDIT</a></p>
    </footer>
</body>
</html>
