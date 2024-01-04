<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FECreditAPIs.aspx.cs" Inherits="FECreditAPIs" MaintainScrollPositionOnPostback="true" %>


<html lang="en">
<title>FE Credit</title>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="Content/w3.css">
<link rel='stylesheet' href='Content/googleapis.css'>
<link rel="stylesheet" href="Content/font-awesome.min.css">
<link href="../root/vis-4.21.0/dist/vis.css" rel="stylesheet" type="text/css" />
<link href="Content/fonts.googleapis.css" rel="stylesheet">
<link href="Content/Site.css" rel="stylesheet" />

<style type="text/css">
    #txtOther {
    margin: 2% !important;
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
            background: #363670 url(Images/grid-header.png) repeat-x top;
            border-left: solid 1px #525252;
            font-size: 0.9em;
        }

        .Grid .alt {
            background: #fcfcfc url(Images/grid-alt.png) repeat-x top;
        }

        .Grid .pgr {
            background: #363670 url(Images/grid-pgr.png) repeat-x top;
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

    .w3-content {
        max-width: 1400px;
    }
</style>
<script type="text/javascript" src="scripts/OpenLayers.js"></script>
<script type="text/javascript" src="Scripts/loader.js"></script>
<script src="Scripts/jquery-1.11.1.min.js"></script>
<script src="Scripts/jquery.canvasjs.min.js"></script>
<%-- coll script --%>
<link rel="stylesheet" href="Content/jquery-ui-1.10.css" />
<script type="text/javascript" src="Scripts/jquery-1.9.1.js"></script>
<script type="text/javascript" src="Scripts/jquery-ui.js">
</script>
<script type="text/javascript">
    $(function () {
        var icons = {
            header: "ui-icon-circle-arrow-e",
            activeHeader: "ui-icon-circle-arrow-s"
        };
        $("#accordion").accordion({
            icons: icons,
            heightStyle: "content"

        });
        $("#toggle").button().click(function () {
            if ($("#accordion").accordion("option", "icons")) {
                $("#accordion").accordion("option", "icons", null);
            } else {
                $("#accordion").accordion("option", "icons", icons);
            }

        });
    });

    var idleTime = 0;

    //Increment the idle time counter every minute.    
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
        //alert('timer increment' + idleTime);
        idleTime = idleTime + 1;
        if (idleTime > 14) { // 15 minutes
            //alert('reload');
            window.location.href = 'FECredit_Login.aspx';    //.reload();
        }
    }

</script>
<%--coll end--%>
<link href="Content/Site.css" rel="stylesheet" />
<style>
    html, body, h1, h2, h3, h4, h5, h6 {
        font-family: "Roboto", sans-serif;
    }

    .fe-col {
        background-color: #008848 !important;
        color: #ffffff;
    }

    #fe-col {
        background-color: #008848 !important;
        color: #ffffff;
    }

    .fe-bk-col {
        background-color: #008848 !important;
        color: #ffffff !important;
    }

    .w3-text-fe-col {
        color: #008848 !important;
    }

    #mynetwork {
        width: 50em;
        height: 50em;
    }

    #onclick-red:hover {
        color: #f44336;
        font-size: 13px;
        padding: 2px;
    }

    .btn {
        border: 0;
        padding: 1%;
        border-radius: 5px;
        height: 50px;
    }

    #txtSearch {
        float: left;
        width: 80%;
        background: #ffffff;
        background-image: url(/css/searchicon.png);
        background-position: 10px 12px;
        background-repeat: no-repeat;
        font-size: 16px;
        padding: 11px 20px 11px 20px;
        border: 1px solid #ddd;
    }

    #btnSearch {
        float: left;
        width: 100%;
        padding: 10px;
        color: white;
        font-size: 17px;
        border: 1px solid grey;
        border-left: none; /* Prevent double borders */
        cursor: pointer;
        min-height: 48px;
    }       

    #btnSearch {
        background-color: #008848;
        /*background: url(images/search1.png) no-repeat top left;*/
        border: 0;
        background-size: 100%;
    }

    #srchspan {
        width: 20%;
        float: left;
        height: 50px;
        position: relative;
    }

    .searchimg {
        position: absolute;
        width: 100%;
        left: 0;
        padding: 18%;
    }

    .modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        padding-top: 100px; /* Location of the box */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    .modalProgress {
        z-index: 999;
        top: 0;
        background-color: Black;
        filter: alpha(opacity=60);
        opacity: 0.6;
        -moz-opacity: 0.8;
    }

    .centerProgress {
        z-index: 1000;
        background-color: White;
        filter: alpha(opacity=100);
        opacity: 1;
        -moz-opacity: 1;
    }

        .centerProgress img {
            height: 30px;
            width: 30px;
        }

    /* Modal Content */
    .modal-content {
        background-color: #fefefe;
        margin: auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
    }

    /* The Close Button */
    .close {
        color: #aaaaaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

        .close:hover,
        .close:focus {
            color: #000;
            text-decoration: none;
            cursor: pointer;
        }

    .fegridheader {
        background-color: green;
        border: solid 1px #525252;
        font-weight: bold;
    }

    .fegridtable {
        border: solid 1px #525252;
    }

    .mGrid {
        width: 100%;
        background-color: #fff;
        margin: 5px 0 10px 0;
        border: solid 1px #525252;
        border-collapse: collapse;
    }

        .mGrid td {
            padding: 2px;
            border: solid 1px #c1c1c1;
            color: #717171;
        }

        .mGrid th {
            padding: 4px 2px;
            color: #fff;
            background: #424242 url(images/grid-head.png) repeat-x top;
            border-left: solid 1px #525252;
            font-size: 0.9em;
        }

        .mGrid .alt {
            background: #fcfcfc url(images/grid-alt.png) repeat-x top;
        }

        .mGrid .pgr {
            background: #424242 url(images/grid-pgr.png) repeat-x top;
        }

            .mGrid .pgr table {
                margin: 5px 0;
            }

            .mGrid .pgr td {
                border-width: 0;
                padding: 0 6px;
                border-left: solid 1px #666;
                font-weight: bold;
                color: #fff;
                line-height: 12px;
            }

            .mGrid .pgr a {
                color: #666;
                text-decoration: none;
            }

                .mGrid .pgr a:hover {
                    color: #000;
                    text-decoration: none;
                }
</style>
<body class="w3-white">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <!-- Page Container -->
        <div class="w3-content w3-margin-top" style="max-width: 1400px; min-height: 50em">

            <!--header-->
            <div class="w3-display-container w3-white w3-padding">
                <div class="w3-content w3-third w3-padding" style="width: 25%!important">
                    <a href="https://fecredit.com.vn" target="_blank">
                        <img src="images/logo-vn.png" style="width: 40%; padding: 3% 0% 1% 0%;" alt="FE CREDIT"></a>
                </div>
                <div class="w3-content w3-third" style="width: 25%!important">
                    <h3 class="w3-center w3-padding" style="font-family: 'Volkhov', serif;">Contact Revival Engine</h3>
                </div>
                <div class="w3-content w3-third" style="padding: 1%; float: right;">
                    <span class="w3-right w3-padding w3-hide-small">
                        <asp:Label ID="lblUser" runat="server" Text="Welcome!"></asp:Label>
                        &nbsp;|&nbsp;
                        <a href="FECredit_ChangePass.aspx" style="color: black">Change Password</a> &nbsp;|&nbsp;
                        <asp:LinkButton ID="lnkLogout" runat="server" Text="Logout" OnClick="lnkLogout_Click"></asp:LinkButton>
                    </span><%--<a href="FECredit_Login.aspx"><i class="fa fa-sign-out  fa-fw w3-margin-right w3-text-fe-col"></i>Logout</a>--%>
                </div>
            </div>
            <asp:Label ID="catch_error" runat="server" Text="catch_error" ForeColor="Red"></asp:Label>
            <!-- The Grid -->
            <div class="w3-row-padding w3-margin">

                <!--left-->
                <%--<div class="w3-third w3-card-2 w3-padding" style="width: 25%">--%>
                <div class="w3-card-2 w3-padding" style="float: left; width: 100%; padding-bottom: 10px;">
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
                        <div id="divCustName" runat="server" style="display: none;">
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
                <div style="padding-left: 350px;">
                    <asp:Label ID="lbl_error" runat="server" Visible="false" ForeColor="red" />
                </div>
                <!-- The Grid -->
                <%--<div class="w3-twothird" style="width: 75%;">--%>
                <div class="w3-card-2 w3-twothird" style="width: 100%;">
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
                        <div class="w3-content w3-border fe-col" id=".fe-col" style="max-width: 1400px;">
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

        <script>
            var isFirstLoad = true;
            function openCity(evt, cityName, trg) {
                if (evt)
                    evt.preventDefault();
                var i, x, tablinks, cN, urlTag, authTab = 0;
                urlTag = 'FECreditAPI.aspx';
                var screenname = '<%= Session["AccessMatrix"] %>';
                if (cityName == 'API') {
                    cN = 'API';
                    if (screenname.includes('CIC') || screenname.includes('VMG') || screenname.includes('PCB,')) {
                        authTab = 1;
                        urlTag = 'FECreditAPIs.aspx';
                    }
                }
                if (cityName == 'CG') {
                    cN = 'Contactability Grid';
                    if (screenname.includes(cN)) {
                        authTab = 1;
                        urlTag = 'FECreditCG.aspx';
                    }
                }
                if (cityName == 'CIN') {
                    cN = 'Customer Interact';
                    if (screenname.includes(cN)) {
                        authTab = 1;
                        urlTag = 'FECreditCIN.aspx';
                    }
                }
                if (cityName == 'CI') {
                    cN = 'Contact Info';
                    if (screenname.includes(cN)) {
                        authTab = 1;
                        urlTag = 'FECreditContactInfo.aspx';
                    }
                }
                if (cityName == 'CD') {
                    cN = 'Case Details';
                    if (screenname.includes(cN)) {
                        authTab = 1;
                        urlTag = 'FECreditCaseDetails.aspx';
                    }
                }
                if (cityName == 'NG') {
                    cN = 'Network Graph';
                    if (screenname.includes(cN)) {
                        authTab = 1;
                        urlTag = 'FECreditNetwork.aspx';
                    }
                }
                if (cityName == 'GM') {
                    cN = 'Geo Location';
                    if (screenname.includes(cN)) {
                        authTab = 1;
                        urlTag = 'FECreditGeoLocation.aspx';
                    }
                }
                if (cityName == 'TR') {
                    cN = 'PCB Skip Tracing';
                    if (screenname.includes(cN)) {
                        authTab = 1;
                        urlTag = 'FECreditPCB.aspx';
                    }
                }
                if (cityName == 'Summary') {
                    cN = 'Summary';
                    if (screenname.includes(cN)) {
                        authTab = 1;
                        urlTag = '<%= Session["cusInfoURL"] %>';
                    }
                }
                if (authTab == 0)
                    alert('Not Authorised to view this.');
                else
                    window.location.href = urlTag;
            }

        </script>
        <script>
            $(document).ready(function () {
                //SearchText();
                ifCust();
            });
            function ifCust() {
                $("input[type='radio']").click(function () {
                    if ($(this).val() == "Customer name") {

                        $("div[id$='divCustName']").show();
                    } else {
                        $("div[id$='divCustName']").hide();
                    }
                });
            };
            ifCust();
        </script>
        <script>
            ////function onpageload() {
            ////    document.getElementById('NG').style.display = 'none';
            ////    isFirstLoad = false;
            ////    init();
            ////}
            ////jQuery(document).ready(function () {
            ////    setTimeout(updatemap, 2000);
            ////    function updatemap() {
            ////        document.getElementById('GM').style.display = 'none';
            ////    }
            ////});

        </script>
    </form>
</body>
</html>
