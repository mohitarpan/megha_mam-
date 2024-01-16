<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FECreditAPIs.aspx.cs" Inherits="FECreditAPIs" MaintainScrollPositionOnPostback="true" %>


<html lang="en">
<title>FE Credit</title>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="APIs.css"> <!-- here is external css file-->
<link rel="stylesheet" href="Content/w3.css">
<link rel='stylesheet' href='Content/googleapis.css'>
<link rel="stylesheet" href="Content/font-awesome.min.css">
<link href="../root/vis-4.21.0/dist/vis.css" rel="stylesheet" type="text/css" />
<link href="Content/fonts.googleapis.css" rel="stylesheet">
<link href="Content/Site.css" rel="stylesheet" />


<script type="text/javascript" src="scripts/OpenLayers.js"></script>
<script type="text/javascript" src="Scripts/loader.js"></script>
<script src="Scripts/jquery-1.11.1.min.js"></script>
<script src="Scripts/jquery.canvasjs.min.js"></script>
<%-- coll script --%>
<link rel="stylesheet" href="Content/jquery-ui-1.10.css" />
<script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
<script type="text/javascript" src="Scripts/jquery-ui.js">
</script>
<script type="text/javascript" src="APIs.js"></script>  <!-- here is external js file  -->
// <script type="text/javascript">
   
// </script>
<%--coll end--%>
<link href="Content/Site.css" rel="stylesheet" />
<body class="w3-white">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <!-- Page Container -->
        <div class="w3-content w3-margin-top">

            <!--header-->
            <div class="w3-display-container w3-white w3-padding">
                <div class="w3-content w3-third w3-padding">
                    <a href="https://fecredit.com.vn" target="_blank">
                        <img class="im" src="images/logo-vn.png"  alt="FE CREDIT"></a> <!-- here class is assigned -->
                </div>
                <div class="w3-content w3-third">
                    <h3 class="w3-center w3-padding">Contact Revival Engine</h3>
                </div>
                <div class="w3-content w3-thirde" ><!-- here i change the namew3-content w3-third to w3-content w3-thirde-->
                    <span class="w3-right w3-padding w3-hide-small">
                        <asp:Label ID="lblUser" runat="server" Text="Welcome!"></asp:Label>
                        &nbsp;|&nbsp;
                        <a href="FECredit_ChangePass.aspx">Change Password</a> &nbsp;|&nbsp;
                        <asp:LinkButton ID="lnkLogout" runat="server" Text="Logout" OnClick="lnkLogout_Click"></asp:LinkButton>
                    </span><%--<a href="FECredit_Login.aspx"><i class="fa fa-sign-out  fa-fw w3-margin-right w3-text-fe-col"></i>Logout</a>--%>
                </div>
            </div>
            <asp:Label ID="catch_error" runat="server" Text="catch_error"></asp:Label>
            <!-- The Grid -->
            <div class="w3-row-padding w3-margin">

                <!--left-->
                <%--<div class="w3-third w3-card-2 w3-padding">--%>
                <div class="w3-card-2 w3-padding">
                    <div class="w3-white w3-text-grey w3-container">
                        <%--<input class="w3-container w3-round w3-padding w3-margin" type="text" id="myInput" onkeyup="myFunction()" placeholder="Search customer...">--%>
                        <div class="w3-container">
                            <asp:TextBox ID="txtSearch" placeholder="Search.." runat="server"></asp:TextBox>
                            <span id="srchspan">
                                <asp:Button runat="server" ID="btnSearch" Text="Search" OnClick="btnSearch_Click" />
                                <!--<img class="searchimg" src="images/search.png" alt="Info"/>-->
                            </span>
                        </div>
                        <hr>
                        <%--<form class="w3-container">--%>
                        <%--<p>Select Criteria</p>--%>
                        <asp:RadioButtonList ID="rbtnSearch" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal">

                            <asp:ListItem>National Id</asp:ListItem>
                            <asp:ListItem>Mobile No</asp:ListItem>
                            <asp:ListItem>Application Id</asp:ListItem>
                            <asp:ListItem>Contract Number</asp:ListItem>
                            <asp:ListItem>Customer name</asp:ListItem>
                        </asp:RadioButtonList>
                        </div>
                        <div id="divCustName" runat="server">
                            <%--<center>For search by customer name, please select one of the following as well</center>--%>
                                
                            <asp:DropDownList ID="ddlType" runat="server">
                                <asp:ListItem>National Id</asp:ListItem>
                                <asp:ListItem>Mobile No</asp:ListItem>
                                <asp:ListItem>Application Id</asp:ListItem>
                                <asp:ListItem>Contract Number</asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="txtOther" runat="server" placeholder="For search by customer name, please select one of the following as well"></asp:TextBox>
                        </div>



                        <%--</form>--%>
                    
                </div>
                <div class="lbl_div">    <!-- here class name added-->
                    <asp:Label ID="lbl_error" runat="server" Visible="false" />
                </div>
                <!-- The Grid -->
                <%--<div class="w3-twothird">--%>
                <div class="w3-card-2 w3-twothird">
                    <div runat="server" id="divSelection" visible="false">
                        <span><i class="fa fa-exclamation-triangle"></i>
                            <!--<img src="images/Cancel.png" alt="Info"/>-->
                            &nbsp; Multiple customers were found for the given search criteria. Click on the name to view details.</span>
                        <asp:GridView ID="gridSelection" runat="server" CssClass="w3-table-all" PagerStyle-CssClass="pgr"
                            AlternatingRowStyle-CssClass="alt" OnRowDataBound="gridSelection_RowDataBound">
                            <AlternatingRowStyle CssClass="alt" BackColor="White" ForeColor="#284775"></AlternatingRowStyle>

                            <PagerStyle CssClass="pgr" BackColor="#585858" ForeColor="#ffffff" HorizontalAlign="Center"></PagerStyle>
                        </asp:GridView>
                    </div>
                    <div runat="server" id="divInformation" visible="true">

                        <%--<div class="w3-content w3-border fe-col" id=".fe-col" >--%>
                        <div class="w3-content w3-border fe-col" id=".fe-col">
                            <button id="btnSummary" runat="server" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'Summary')">Summary</button>
                            <button id="btnCI" runat="server" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'CI')">Contact Info</button>
                            <button id="btnCD" runat="server" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'CD')">Case Details</button>
                            <button id="btnNG" runat="server" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'NG')">Network Graph</button>
                            <button id="btnGM" runat="server" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'GM')">Geo Location</button>
                            <button id="btnTR" runat="server" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'TR')">PCB Skip TR</button>
                            <button id="btnCIN" runat="server" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'CIN')">Customer Interaction</button>
                            <button id="btnCG" runat="server" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'CG')">Contactability Grid</button>
                            <button id="btnApi" runat="server" class="w3-bar-item w3-button tablink w3-red" onclick="openCity(event, 'API')">3rd Party APIs</button>
                        </div>

                        <div id="API" class="w3-content city">
                            <div class="w3-content">
                                <div class="w3-container w3-card w3-white w3-margin-bottom">
                                    <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-user fa-fw w3-margin-right w3-xxlarge w3-text-fe-col"></i>
                                        <asp:Label ID="lblAPI" runat="server"></asp:Label></h2>
                                    <div class="w3-container w3-margin-bottom">
                                        <p class="w3-opacity">
                                            <b>National ID :  
                                            <asp:Label ID="lblAPINid" runat="server">234455557</asp:Label></b>
                                        </p>
                                        <%--<asp:Button ID="ButtonAPI" runat="server" Text="Fetch Historical Data" OnClick="apiCalls" CssClass="fe-col w3-button w3-block w3-green w3-section w3-padding"/>--%>
                                        <asp:Label ID="lblAPIError" runat="server" ForeColor="Red" Visible="False" Text=""></asp:Label>
                                        <div class="w3-content w3-white w3-padding">
                                            <asp:Label ID="lblMultiNID" runat="server" Text="Select NID for making API call"></asp:Label>
                                            <asp:RadioButtonList ID="rblNID" runat="server" RepeatLayout="Flow" RepeatDirection="Horizontal"></asp:RadioButtonList>
                                            <asp:GridView ID="grdCIC" runat="server" Caption="CIC"
                                                AutoGenerateColumns="true" CssClass="w3-table-all" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" EmptyDataText="No records has been added."
                                                Width="100%">
                                                <AlternatingRowStyle CssClass="alt" />
                                                <HeaderStyle BackColor="#585858" ForeColor="White" />
                                                <PagerStyle CssClass="pgr" />
                                            </asp:GridView>
                                            <asp:Button ID="btnCIC" runat="server" Text="Execute" Visible="false" OnClick="btnCIC_Click" CssClass="fe-col w3-button w3-block w3-green w3-section w3-padding" />
                                            <asp:GridView ID="grdExCIC" runat="server" Caption="CIC API"
                                                AutoGenerateColumns="true" CssClass="w3-table-all" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" EmptyDataText="No data returned from API."
                                                Width="100%" Visible="false">
                                                <AlternatingRowStyle CssClass="alt" />
                                                <HeaderStyle BackColor="#585858" ForeColor="White" />
                                                <PagerStyle CssClass="pgr" />
                                            </asp:GridView>
                                            <asp:GridView ID="grdPCB" runat="server" Caption="PCB"
                                                AutoGenerateColumns="true" CssClass="w3-table-all" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" EmptyDataText="No records has been added."
                                                Width="100%">
                                                <AlternatingRowStyle CssClass="alt" />
                                                <HeaderStyle BackColor="#585858" ForeColor="White" />
                                                <PagerStyle CssClass="pgr" />
                                            </asp:GridView>
                                            <asp:Button ID="btnPCB" runat="server" Text="Execute" Visible="false" OnClick="btnPCB_Click" CssClass="fe-col w3-button w3-block w3-green w3-section w3-padding" />
                                            <asp:GridView ID="grdExPCB" runat="server" Caption="PCB API"
                                                AutoGenerateColumns="true" CssClass="w3-table-all" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" EmptyDataText="No data returned from API."
                                                Width="100%" Visible="false">
                                                <AlternatingRowStyle CssClass="alt" />
                                                <HeaderStyle BackColor="#585858" ForeColor="White" />
                                                <PagerStyle CssClass="pgr" />
                                            </asp:GridView>
                                            <asp:GridView ID="grdVMG" runat="server" Caption="VMG"
                                                AutoGenerateColumns="true" CssClass="w3-table-all" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" EmptyDataText="No records has been added."
                                                Width="100%">
                                                <AlternatingRowStyle CssClass="alt" />
                                                <HeaderStyle BackColor="#585858" ForeColor="White" />
                                                <PagerStyle CssClass="pgr" />
                                            </asp:GridView>
                                            <asp:Button ID="btnVMG" runat="server" Text="Execute" Visible="false" OnClick="btnVMG_Click" CssClass="fe-col w3-button w3-block w3-green w3-section w3-padding" />
                                            <asp:GridView ID="grdExVMG" runat="server" Caption="VMG API"
                                                AutoGenerateColumns="true" CssClass="w3-table-all" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" EmptyDataText="No data returned from API."
                                                Width="100%" Visible="false">
                                                <AlternatingRowStyle CssClass="alt" />
                                                <HeaderStyle BackColor="#585858" ForeColor="White" />
                                                <PagerStyle CssClass="pgr" />
                                            </asp:GridView>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- End Grid -->
                </div>

                <!-- End Page Container -->
            </div>
        </div>
        <footer class="fe-col w3-container w3-center w3-padding">
            <p>2020 - Bản quyền thuộc về <a href="https://fecredit.com.vn" target="_blank">FE CREDIT</a></p>
        </footer>
    </form>
</body>
</html>
