<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FECredit_BulkData.aspx.cs" Inherits="FECredit_BulkData" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>FECREDIT BULK DATA</title>
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
    <link rel="stylesheet" href="Content/w3.css" />
    <link rel='stylesheet' href='Content/googleapis.css' />
    <link rel="stylesheet" href="Content/font-awesome.min.css" />
    <link href="Content/fonts.googleapis.css" rel="stylesheet" />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css" />
    <link rel="stylesheet" href="/resources/demos/style.css" />
    <link href="css/pikaday.css" rel="stylesheet" />
    <link href="css/site.css" rel="stylesheet" />
    <link href="css/theme.css" rel="stylesheet" />
    <link href="css/triangle.css" rel="stylesheet" />
    <script src="moment.js"></script>
    <script src="pikaday.js"></script>
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
    <%--<script type="text/javascript" src="scripts/jquery.blockUI.js"></script>--%>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
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

        function timerIncrement() {
            idleTime = idleTime + 1;
            if (idleTime > 14) { // 15 minutes
                //alert('reload');
                window.location.href = 'FECredit_Login.aspx';    //.reload();
            }
        }

    </script>
</head>
<body>
    <form class="w3-container" runat="server">
        <div class="w3-container">
            <%--"w3-content w3-margin-top"--%>
            <div class="w3-display-container w3-white w3-padding">
                <div class="w3-content w3-third w3-padding">
                    <a href="https://fecredit.com.vn" target="_blank">
                        <img src="images/logo-vn.png" style="width: 40%; padding: 3% 0% 1% 0%;" alt="FE CREDIT" /></a>
                </div>
                <div class="w3-content w3-third">
                    <h3 class="w3-center w3-padding" style="font-family: 'Volkhov', serif;">Contact Revival Engine</h3>
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
                        &nbsp;|&nbsp;<a href="FECredit_Reports.aspx">Reports</a>&nbsp;|&nbsp;
                        <a href="FECredit_BulkData.aspx">Bulk Data</a>&nbsp;|&nbsp;
                        <a href="FECredit_Logout.aspx">Group Logout</a>    
                        &nbsp;|&nbsp; <a href="FECredit_GroupUserDel.aspx">Group User Delete</a> 
                        &nbsp;|&nbsp;
                        <a href="FECredit_Reset.aspx">Reset Password</a>   &nbsp;|&nbsp;
                        <a href="FD_Admin.aspx">Home</a>                   &nbsp;|&nbsp;
                        <a href="FECredit_ConfigData.aspx">Config Data</a>                        &nbsp;|&nbsp;
                        <asp:LinkButton ID="lnkLogout" runat="server" Text="Logout" OnClick="lnkLogout_Click"></asp:LinkButton>
                    </span>
                </div>
            </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </div>
        <div class="w3-container w3-margin w3-white" id="updateUserDiv" runat="server" style="display: block; min-height: 38em;">
            <div class="w3-modal-content w3-animate-zoom w3-border" style="max-width: 1400px; margin-top: 5em;">
                <div class="w3-section w3-container" id="divRole">
                    <table border="3" align="center">
                        <tr>
                            <th id="Search" colspan="9" style="background-color: #008848;">Search Parameters</th>
                        </tr>
                        <tr>
                            <td>
                                <asp:RadioButtonList runat="server" ID="rdbOptions" CausesValidation="true">
                                    <asp:ListItem Text="National ID" Value="National ID" Selected="True"></asp:ListItem>
                                    <%--<asp:ListItem Text="Contract Number" Value="Contract Number"></asp:ListItem>--%>
                                </asp:RadioButtonList>
                            </td>
                            <td>
                                <asp:FileUpload runat="server" ID="fileUpload"  />
                            </td>
                            <td>
                                <asp:Button ID="btnSearch" runat="server" OnClick="btnSearch_Click" Text="Export" ValidationGroup="submitClick" CssClass="fe-col w3-button w3-block w3-green w3-section w3-padding"></asp:Button>
                            </td>
                        </tr>

                        <tr>
                            <td colspan="3">
                                <asp:Label ID="lblSuccess" runat="server" ForeColor="Green" Visible="false" Text=""></asp:Label>
                                <asp:Label ID="lblError" runat="server" ForeColor="Red" Visible="False" Text=""></asp:Label>
                            </td>
                        </tr>
                    </table>
                    
                </div>
               
            </div>
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
