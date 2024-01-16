<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FECreditContactInfo.aspx.cs" Inherits="FECreditContactInfo" MaintainScrollPositionOnPostback="true" %>


<html lang="en">
<title>FE Credit</title>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="APIs.css"><!-- Here external css -->
<link rel="stylesheet" href="Content/w3.css">
<link rel='stylesheet' href='Content/googleapis.css'>
<link rel="stylesheet" href="Content/font-awesome.min.css">
<%--<link href="../root/vis-4.21.0/dist/vis.css" rel="stylesheet" type="text/css" />--%>
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
<script type="text/javascript" src="APIs.js"></script>
<%--coll end--%>
<link href="Content/Site.css" rel="stylesheet" />
<body class="w3-white">
    <form runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
        <!-- Page Container -->
        <div class="w3-content w3-margin-top" style="max-width: 1400px; min-height: 50em">

            <!--header-->
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
                        <a href="FECredit_ChangePass.aspx" >Change Password</a> &nbsp;|&nbsp;
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
                <div class="lbl_div">
                    <asp:Label ID="lbl_error" runat="server" Visible="false" ForeColor="red" />
                </div>
                <!-- The Grid -->
                <%--<div class="w3-twothird">
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
                            <button id="btnCI" runat="server" class="w3-bar-item w3-button tablink w3-red" onclick="openCity(event, 'CI')">Contact Info</button>
                            <button id="btnCD" runat="server" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'CD')">Case Details</button>
                            <button id="btnNG" runat="server" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'NG')">Network Graph</button>
                            <button id="btnGM" runat="server" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'GM')">Geo Location</button>
                            <button id="btnTR" runat="server" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'TR')">PCB Skip TR</button>
                            <button id="btnCIN" runat="server" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'CIN')">Customer Interaction</button>
                            <button id="btnCG" runat="server" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'CG')">Contactability Grid</button>
                            <button id="btnApi" runat="server" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'API')">3rd Party APIs</button>
                        </div>

                        <div id="CI" class="w3-content city">
                            <div class="w3-content">

                                <div class="w3-container w3-card w3-white w3-margin-bottom">
                                    <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-user fa-fw w3-margin-right w3-xxlarge w3-text-fe-col"></i>
                                        <asp:Label ID="lblName2" runat="server">Nguyễn Huong</asp:Label></h2>
                                    <div class="w3-container w3-margin-bottom">
                                        <p class="w3-opacity">
                                            <b>National ID :  
                                            <asp:Label ID="lblNid2" runat="server">234455557</asp:Label></b>
                                        </p>
                                        <%--<asp:TableHeaderCell>S. No.</asp:TableHeaderCell>--%>
                                        <div class="w3-container w3-white">
                                            <div class="w3-modal-content w3-animate-zoom w3-border">

                                                <div class="w3-section w3-container" id="dvComments" runat="server">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <label><b>Action Code*</b></label>
                                                                <asp:DropDownList runat="server" ID="ddlCommentsActionCode" CssClass="w3-input w3-border w3-margin-bottom"></asp:DropDownList></td>
                                                            <td>
                                                                <label><b>Person Contacted*</b></label>
                                                                <asp:DropDownList runat="server" ID="ddlCommentsRelation" CssClass="w3-input w3-border w3-margin-bottom"></asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <label><b>Contact No*</b></label>
                                                                <asp:TextBox ID="txtCommentsContactNo" runat="server" Height="38" MaxLength="15" Text="" CssClass="w3-input w3-border w3-margin-bottom"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="3">
                                                                <label><b>Remarks*</b></label>
                                                                <asp:TextBox MaxLength="4000" ID="txtCommentsRemarks" runat="server" TextMode="MultiLine" Columns="20" Wrap="true"
                                                                    CssClass="w3-input w3-border w3-margin-bottom"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <div>
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <asp:Button Text="Add" runat="server" ID="btnSave" ValidationGroup="submitClick" CssClass="fe-col w3-button w3-block w3-green w3-section w3-padding"
                                                                        OnClick="btnSave_Click" />

                                                                </td>
                                                                <td>
                                                                    <asp:Button Text="Clear" runat="server" ID="btnClear" OnClick="btnClear_Click" CssClass="fe-col w3-button w3-block w3-green w3-section w3-padding" />
                                                                </td>
                                                            </tr>

                                                        </table>
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="lbl_Msg" runat="server" ForeColor="Green" Visible="False" Text=""></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                    <!-- End Right Column -->
                                                </div>
                                            </div>
                                        </div>
                                        <div id="accordion" style="width: 100%;">
                                            <asp:Repeater ID="repAccordian" runat="server">
                                                <ItemTemplate>
                                                    <h3>
                                                        <%#Eval("Name") %>
                                                        <br></br>
                                                    </h3>
                                                    <div class="Div_tab">
                                                        <table>
                                                            <tr>
                                                                <td></td>
                                                                <td>
                                                                    <%#Eval("Details") %>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>                                        
                                        <%#Eval("Details") %>
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
