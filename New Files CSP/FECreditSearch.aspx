<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FECreditSearch.aspx.cs" Inherits="FDCredit_Abraham.FECreditSearch" %>

<!DOCTYPE html>
<html lang="en">
<head id="Head1" runat="server">
    <title>FE Credit</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
    <link rel="stylesheet" href="Content/w3.css" />
    <link rel='stylesheet' href='Content/googleapis.css' />
    <link rel="stylesheet" href="Content/font-awesome.min.css" />
    <link href="Content/fonts.googleapis.css" rel="stylesheet" />
    <link href="Content/jquery-ui-1.10.css" rel="stylesheet" type="text/css" />
    <script type="Scripts/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="Scripts/jquery-ui.js"></script>
    <link rel="stylesheet" href="search.css"> <!-- here is the external css -->
    <script type="text/javascript" runat="server" src="onejs" ></script> <!-- here is external js file -->
    

</head>
<body class="w3-white">
    <form runat="server">
        <!-- Page Container -->
        <div class="w3-content">
            <div class="w3-display-container w3-white w3-padding">
                <div class="w3-content w3-third w3-padding">
                    <a href="https://fecredit.com.vn" target="_blank">
                        <img class="im" src="images/logo-vn.png" alt="FE CREDIT"></a>
                </div>
                <div class="w3-content w3-third">
                    <h3 class="w3-center w3-padding">Contact Revival Engine</h3>
                </div>
                <div class="w3-content w3-third">
                    <span class="w3-right w3-padding w3-hide-small">
                        <asp:Label ID="lblUser" runat="server" Text="Welcome!"></asp:Label>
                        &nbsp;|&nbsp;
                        <a href="FECredit_ChangePass.aspx" id="chang_p">Change Password</a> &nbsp;|&nbsp;
                        <asp:LinkButton ID="lnkLogout" runat="server" Text="Logout" OnClick="lnkLogout_Click"></asp:LinkButton>
                    </span><%--<a href="FECredit_Login.aspx"><i class="fa fa-sign-out  fa-fw w3-margin-right w3-text-fe-col"></i>Logout</a>--%>
                </div>
            </div>
            <!-- The Grid -->
            <div class="w3-row-padding w3-margin">
                <hr>
                <h5 class="w3-center w3-text-grey">Search for Customer Details</h5>
                <div class="w3-card-2 w3-padding" >
                    <!--left column-->
                    <%--<div class="w3-white w3-text-grey" >--%>
                    <div class="w3-white w3-text-grey">
                        <%--<form class="w3-container">--%>
                        <%--<p id="Sel">Select Criteria</p>--%>
                        <asp:RadioButtonList ID="rbtnSearch" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">

                            <asp:ListItem Selected="True">National Id</asp:ListItem>
                            <asp:ListItem>Mobile No</asp:ListItem>
                            <asp:ListItem>Application Id</asp:ListItem>
                            <asp:ListItem>Contract Number</asp:ListItem>
                            <asp:ListItem>Customer name</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div id="divCustName" runat="server">
                        <%--For search by customer name, please select one of the following as well--%>

                        <asp:DropDownList ID="ddlType" runat="server">
                            <asp:ListItem>National Id</asp:ListItem>
                            <asp:ListItem>Mobile No</asp:ListItem>
                            <asp:ListItem>Application Id</asp:ListItem>
                            <asp:ListItem>Contract Number</asp:ListItem>
                        </asp:DropDownList>
                        <asp:TextBox ID="txtOther" runat="server" placeholder="For search by customer name, please select one of the following as well"></asp:TextBox>
                    </div>
                </div>


                <!-- Right Column -->

                <%--<div class="w3-container w3-white w3-margin-bottom w3-twothird">--%>
                <div class="w3-card-2 w3-container w3-white w3-margin-bottom w3-twothird">
                    <div class="w3-container w3-margin-top">
                        <div class="w3-container">
                            <%--<div id="divCustName" runat="server">
                                For search by customer name, please select one of the following as well
                                
                                <asp:DropDownList ID="ddlType" runat="server">
                                    <asp:ListItem>National Id</asp:ListItem>
                                    <asp:ListItem>Mobile No</asp:ListItem>
                                    <asp:ListItem>Application Id</asp:ListItem>
                                    <asp:ListItem>Contract Number</asp:ListItem>
                                </asp:DropDownList>
                                <asp:TextBox ID="txtOther" runat="server"></asp:TextBox>
                            </div>--%>
                            <br />

                            <asp:TextBox ID="txtSearch" placeholder="Enter customer data.." required runat="server"></asp:TextBox>
                            <asp:Button Style="min-width: 10em; border-color: forestgreen; background-color: forestgreen" Text="Search" runat="server" ID="btnSearch" OnClick="btnSearch_Click" />
                            <%--</form>--%>
                            <div id="dev" >
                    <asp:Label ID="lbl_error" runat="server" Visible="false"/>
                </div>
                            <ul id="myUL">
                            </ul>
                        </div>


                        <!-- End Right Column -->
                    </div>

                    <!-- End Grid -->
                </div>


            </div>
        </div>
        <footer class="fe-col w3-container w3-center w3-padding">
            <p>2020 - Bản quyền thuộc về <a href="https://fecredit.com.vn" target="_blank">FE CREDIT</a></p>
        </footer>
        <!-- End Page Container -->
    </form>
</body>
</html>
