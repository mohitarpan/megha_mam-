<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FD_Admin.aspx.cs" Inherits="FD_Admin" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
    <style type="text/css">
        .on {
            display: block;
        }

        .off {
            display: none;
        }

        body {
            font-family: Arial;
            font-size: 12pt;
        }

        headttable {
            padding: 4px 2px;
            color: #fff;
            background: #363670 url(images/grid-header.png) repeat-x top;
            border-left: solid 1px #525252;
            font-size: 0.9em;
        }

        table {
            border: 1px solid #ccc;
            border-collapse: collapse;
            background-color: #fff;
        }

            table th {
                background-color: #B8DBFD;
                color: #333;
                font-weight: bold;
            }

            table th, table td {
                padding: 5px;
                border: 1px solid #ccc;
            }

            table, table table td {
                border: 0px solid #ccc;
            }

        .Grid {
            background-color: #fff;
            margin: 5px 0 10px 0;
            border: solid 1px #525252;
            border-collapse: collapse;
            font-family: Calibri;
            color: #474747;
        }

            .Grid td {
                padding: 2px;
                border: solid 1px #c1c1c1;
            }

            .Grid th {
                padding: 4px 2px;
                color: #fff;
                background: #363670 url(images/grid-header.png) repeat-x top;
                border-left: solid 1px #525252;
                font-size: 0.9em;
            }

            .Grid .alt {
                background: #fcfcfc url(images/grid-alt.png) repeat-x top;
            }

            .Grid .pgr {
                background: #363670 url(images/grid-pgr.png) repeat-x top;
            }

                .Grid .pgr table {
                    margin: 3px 0;
                }

                .Grid .pgr td {
                    border-width: 0;
                    padding: 0 6px;
                    border-left: solid 1px #666;
                    font-weight: bold;
                    color: #fff;
                    line-height: 12px;
                }

                .Grid .pgr a {
                    color: Gray;
                    text-decoration: none;
                }

                    .Grid .pgr a:hover {
                        color: #000;
                        text-decoration: none;
                    }
    </style>
    <title>Admin</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto' />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Volkhov" rel="stylesheet" />
    <style type="text/css">
        html, body, h1, h2, h3, h4, h5, h6 {
            font-family: "Roboto", sans-serif
        }

        .fe-col {
            background-color: #008848 !important;
            color: #ffffff;
        }
    </style>
    <script type="text/javascript">

        var idleTime = 0;
        
        var idleInterval = setInterval(timerIncrement, 60000); // 1 minute

        //Zero the idle timer on mouse movement.
        $(this).mousemove(function (e) {
            idleTime = 0;
        });
        $(this).keypress(function (e) {
            idleTime = 0;
        });
        // });

        function timerIncrement() {        
            idleTime = idleTime + 1;
            if (idleTime > 14) { // 15 minutes                
                window.location.href = 'FECredit_Login.aspx';    //.reload();
            }
        }
        function ConfirmDelete() {
            var Ok = confirm('Are you sure you want to delete?');
            if (Ok == false) {
                return false;
            }
            else {
                return true;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="w3-content w3-margin-top" style="max-width: 1400px">
            <div class="w3-display-container w3-white w3-padding">
                <div class="w3-content w3-third w3-padding">
                    <a href="https://fecredit.com.vn" target="_blank">
                        <img src="images/logo-vn.png" style="width: 40%; padding: 3% 0% 1% 0%;" alt="FE CREDIT"></a>
                </div>
                <div class="w3-content w3-third">
                    <h3 class="w3-center w3-padding" style="font-family: 'Volkhov', serif;">Welcome Admin</h3>
                </div>
                <div class="w3-content w3-third" style="padding: 1%;">
                    <span class="w3-right w3-padding w3-hide-small">
                        <asp:Label ID="lblUser" runat="server" Text="Welcome!"></asp:Label>
                        <a href="FECredit_Role.aspx">Manage Roles</a>
                        &nbsp;|&nbsp;
                        <a href="FECredit_ActionCode.aspx">Manage Action Code</a>
                        &nbsp;|&nbsp;
                        <a href="FECredit_UserRoleAccess.aspx">Manage Role Access</a>&nbsp;|&nbsp;
                        <a href="FECredit_Reports.aspx">Reports</a>&nbsp;|&nbsp;
                        <a href="FECredit_BulkData.aspx">Bulk Data</a>&nbsp;|&nbsp;
                        <a href="FECredit_Logout.aspx">Group Logout</a>    
                        &nbsp;|&nbsp; <a href="FECredit_GroupUserDel.aspx">Group User Delete</a>    
                        &nbsp;|&nbsp;<a href="FECredit_ExcludeNumbers.aspx">Exclude Phone Number</a>    
                        &nbsp;|&nbsp;
                        <a href="FECredit_Reset.aspx">Reset Password</a>                        &nbsp;|&nbsp;
                        <a href="FECredit_ConfigData.aspx">Config Data</a>                        &nbsp;|&nbsp;
                        <asp:LinkButton ID="lnkLogout" runat="server" Text="Logout" OnClick="lnkLogout_Click"></asp:LinkButton>
                    </span>
                </div>
            </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </div>
        <div id="updateUserDiv" runat="server" style="display: block; min-height: 38em;">
            <div class="w3-section w3-container" id="divRole">
                <table border="3" align="center">
                    <tr>
                        <td>
                            <label><b>Search</b></label></td>
                        <td>
                            <asp:TextBox ID="txt_SearchUser" runat="server" CssClass="w3-input w3-border w3-margin-bottom"></asp:TextBox></td>
                        <td>
                            <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Search" CssClass="fe-col w3-button w3-block w3-green w3-section w3-padding"></asp:Button>
                        </td>
                    </tr>
                </table>
            </div>
            <table border="3" align="center" style="margin-top: 2px;">
                <tr>
                    <th id="Update" style="background-color: #008848">Update\Delete Existing User</th>
                    <th style="background-color: #008848"><a href="FECredit_NewUser.aspx" style="text-decoration-color: white; align-items: flex-end;">Add New User</a>
                    </th>
                </tr>
                <tr>
                    <td colspan="2" headers="Add New User">
                        <contenttemplate>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" OnRowDataBound="OnRowDataBound"
                        DataKeyNames="ID" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
                        PageSize="10" AllowPaging="true"  OnPageIndexChanging="OnPaging" OnRowUpdating="OnRowUpdating"
                         OnRowDeleting="OnRowDeleting" CssClass="Grid"  AlternatingRowStyle-CssClass="alt" PagerStyle-CssClass="pgr"  EmptyDataText="No records has been added." Width="450">
                        <Columns>
                            <asp:TemplateField HeaderText="ID" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="lblid" runat="server" Text='<%# Eval("ID") %>'></asp:Label>
                                </ItemTemplate>
                            
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Username" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="lblName" runat="server" Text='<%# Eval("FECREDIT_USERNAME") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtName" runat="server" MaxLength="60" Text='<%# Eval("FECREDIT_USERNAME") %>' Width="140"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Password" ItemStyle-Width="150" Visible="false" >
                                <ItemTemplate>
                                    <asp:Label ID="lblpass" runat="server" Visible="false" Text='<%# Eval("FECREDIT_PASSWORD") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtpass" runat="server" Visible="false" MaxLength="15" Text='<%# Eval("FECREDIT_PASSWORD") %>' Width="140"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Role" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="lblrole" runat="server" ToolTip='<%# Eval("FECREDIT_ROLE") %>' Text='<%# Eval("FECREDIT_ROLE") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlrole" runat="server" AppendDataBoundItems="true" Width="140"></asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="IsDisabled?" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="lbldisabled" runat="server" Text='<%# Eval("FECREDIT_IS_DISABLED") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddldisabled" runat="server" AppendDataBoundItems="true" Width="140"></asp:DropDownList>                                    
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Last Login Date" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="lbldate" runat="server" Text='<%# Eval("FECREDIT_LOGIN_DATE1") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtditesabled" runat="server" Enabled="false" Text='<%# Eval("FECREDIT_LOGIN_DATE1") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Email ID" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="lblEmailId" runat="server" Text='<%# Eval("FECREDIT_EMAILID") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEmailId" runat="server" MaxLength="60" Text='<%# Eval("FECREDIT_EMAILID") %>' Width="140"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Role Desc" ItemStyle-Width="150" Visible="false">
                                <ItemTemplate>
                                    <asp:Label ID="lblRoleDesc" runat="server" Visible="false" Text='<%# Eval("FECREDIT_ROLEDESC") %>'></asp:Label>
                                </ItemTemplate>
                                </asp:TemplateField>
                            <asp:TemplateField HeaderText="Installation ID" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="lblInstallationId" runat="server" Text='<%# Eval("FECREDIT_InstallationID") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtInstallationId" runat="server" MaxLength="60" Text='<%# Eval("FECREDIT_InstallationID") %>' Width="140"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Created By" ItemStyle-Width="150" >
                                <ItemTemplate>
                                    <asp:Label ID="lblCreatedBy" runat="server" Text='<%# Eval("FECREDIT_CREATEDBY") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCreatedBy" runat="server" Enabled="false" MaxLength="15" Text='<%# Eval("FECREDIT_CREATEDBY") %>' Width="140"></asp:TextBox>
                                </EditItemTemplate>
                                </asp:TemplateField>
                            <asp:TemplateField HeaderText="Creation Date" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="lblCreationDate" runat="server" Text='<%# Eval("FECREDIT_CREATIONDATE") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtCreationDate" runat="server" Enabled="false" MaxLength="15" Text='<%# Eval("FECREDIT_CREATIONDATE") %>' Width="140"></asp:TextBox>
                                </EditItemTemplate>
                                </asp:TemplateField>
                            <asp:CommandField ShowEditButton="true" ButtonType ="Image" EditImageUrl="images/Edit.png" CancelImageUrl="~/images/Cancel.png"  UpdateImageUrl="~/images/Update.png"
                                  HeaderText="Update"   />       
                            <asp:TemplateField HeaderText="Delete">
                <ItemTemplate>
                    <asp:ImageButton ID="lnk_RemoveFromlist" runat="server" Text="Delete" ImageUrl="images/Delete.png"
                        CommandName="Delete" CommandArgument='<%# Eval("ID") %>' OnClientClick='return ConfirmDelete()'></asp:ImageButton>
                </ItemTemplate>
            </asp:TemplateField>
                         <%--<asp:CommandField ShowDeleteButton="true"  ButtonType="Image" DeleteImageUrl="images/Delete.png" HeaderText="Delete" /> --%>
                       
                        </Columns>
                    </asp:GridView>
                   
                </contenttemplate>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblStatus" runat="server" ForeColor="Green" Visible="false" Text=""></asp:Label>
                        <asp:Label ID="lbl_error" runat="server" ForeColor="Red" Visible="False" Text="InValid User ID or Password. Enter correct details to Reset Password to the CRE"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>




        <!-- End Grid -->


        <!-- End Page Container -->
        <footer class="fe-col w3-container w3-center w3-padding">
       
        <p>2018 - Bản quyền thuộc về <a href="https://fecredit.com.vn" target="_blank">FE CREDIT</a></p>
    </footer>
    </form>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <%--<script type="text/javascript" src="scripts/jquery.blockUI.js"></script>--%>
    <script type="text/javascript">       
        $(function () {
            BlockUI("dvGrid");
            $.blockUI.defaults.css = {};
        });
        function BlockUI(elementID) {
            var prm = Sys.WebForms.PageRequestManager.getInstance();
            prm.add_beginRequest(function () {
                $("#" + elementID).block({
                    message: '<div align = "center">' + '<img src="images/loadingAnim.gif"/></div>',
                    css: {},
                    overlayCSS: { backgroundColor: '#000000', opacity: 0.6, border: '3px solid #63B2EB' }
                });
            });
            prm.add_endRequest(function () {
                $("#" + elementID).unblock();
            });
        };

    </script>
</body>
</html>
