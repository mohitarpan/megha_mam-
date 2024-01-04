<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FECreditCusInfo.aspx.cs" Inherits="FECreditCusInfo" MaintainScrollPositionOnPostback="true" %>

<html lang="en">
<title>FE Credit</title>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="APIs.css"> <!-- here is external css file -->
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
<script type="text/javascript" src="APIs.js"></script><!--here is external js -->
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
                        <img class="im" src="images/logo-vn.png" alt="FE CREDIT"></a>
                </div>
                <div class="w3-content w3-third">
                    <h3 class="w3-center w3-padding">Contact Revival Engine</h3>
                </div>
                <div class="w3-content w3-third">
                    <span class="w3-right w3-padding w3-hide-small">
                        <asp:Label ID="lblUser" runat="server" Text="Welcome!"></asp:Label>
                        &nbsp;|&nbsp;
                        <a href="FECredit_ChangePass.aspx">Change Password</a> &nbsp;|&nbsp;
                        <asp:LinkButton ID="lnkLogout" runat="server" Text="Logout" OnClick="lnkLogout_Click"></asp:LinkButton>
                    </span><%--<a href="FECredit_Login.aspx"><i class="fa fa-sign-out  fa-fw w3-margin-right w3-text-fe-col"></i>Logout</a>--%>
                </div>
            </div>
            <asp:Label ID="catch_error" runat="server" Text="catch_error" ForeColor="Red"></asp:Label>
            <!-- The Grid -->
            <div class="w3-row-padding w3-margin">
                <!--left-->
                <%--<div class="w3-third w3-card-2 w3-padding" >--%>
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
                            <%--<center></center>--%>
                                
                            <asp:DropDownList ID="ddlType" runat="server">
                                <asp:ListItem>National Id</asp:ListItem>
                                <asp:ListItem>Mobile No</asp:ListItem>
                                <asp:ListItem>Application Id</asp:ListItem>
                                <asp:ListItem>Contract Number</asp:ListItem>
                            </asp:DropDownList>
                            <asp:TextBox ID="txtOther" runat="server" placeholder="For search by customer name, please select one of the following as well.."></asp:TextBox>
                        </div>



                        <%--</form>--%>
                    
                </div>
                <div class="lbl_div">
                    <asp:Label ID="lbl_error" runat="server" Visible="false" ForeColor="red" />
                </div>
                <!-- The Grid -->
                <%--<div class="w3-twothird">--%>
                <div class="w3-card-2 w3-twothird">
                    <div runat="server" id="divMobileSearch" visible="false">
                        <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-user fa-fw w3-margin-right w3-xxlarge w3-text-fe-col"></i>
                                        <asp:Label ID="lblSearchedMobile" runat="server"></asp:Label></h2>
                       <div runat="server" id="divPrimaryMobile" visible="false">
                        <span>Primary Mobile No</span>
                        <asp:GridView ID="gridPrimaryMobile" runat="server" CssClass="w3-table-all" PagerStyle-CssClass="pgr"
                            AlternatingRowStyle-CssClass="alt" OnRowDataBound="gridPrimaryMobile_RowDataBound">
                            <AlternatingRowStyle CssClass="alt" BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                            <PagerStyle CssClass="pgr" BackColor="#585858" ForeColor="#ffffff" HorizontalAlign="Center"></PagerStyle>
                        </asp:GridView></div>
                        <br />
                         <div runat="server" id="divRefMobile" visible="false">
                        <span>Reference Mobile No</span>
                        <asp:GridView ID="gridRefMobile" runat="server" CssClass="w3-table-all" PagerStyle-CssClass="pgr"
                            AlternatingRowStyle-CssClass="alt" OnRowDataBound="gridRefMobile_RowDataBound">
                            <AlternatingRowStyle CssClass="alt" BackColor="White" ForeColor="#284775"></AlternatingRowStyle>
                            <PagerStyle CssClass="pgr" BackColor="#585858" ForeColor="#ffffff" HorizontalAlign="Center"></PagerStyle>
                        </asp:GridView></div>
                    </div>
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
                            <button id="btnSummary" runat="server" class="w3-bar-item w3-button tablink w3-red" onclick="openCity(event, 'Summary')">Summary</button>
                            <button id="btnCI" runat="server" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'CI')">Contact Info</button>
                            <button id="btnCD" runat="server" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'CD')">Case Details</button>
                            <button id="btnNG" runat="server" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'NG')">Network Graph</button>
                            <button id="btnGM" runat="server" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'GM')">Geo Location</button>
                            <button id="btnTR" runat="server" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'TR')">PCB Skip TR</button>
                            <button id="btnCIN" runat="server" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'CIN')">Customer Interaction</button>
                            <button id="btnCG" runat="server" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'CG')">Contactability Grid</button>
                            <button id="btnApi" runat="server" class="w3-bar-item w3-button tablink" onclick="openCity(event, 'API')">3rd Party APIs</button>
                        </div>

                        <div id="Summary" class="w3-content city">
                            <div class="w3-content">
                                <div class="w3-container w3-card w3-white w3-margin-bottom">
                                    <h2 class="w3-text-grey w3-padding-16"><i class="fa fa-user fa-fw w3-margin-right w3-xxlarge w3-text-fe-col"></i>
                                        <asp:Label ID="lblName" runat="server"></asp:Label></h2>
                                    <div class="w3-container w3-margin-bottom">
                                        <p class="w3-opacity">
                                            <b>National ID :  
                                            <asp:Label ID="lblNid" runat="server"></asp:Label></b>
                                            <%--</p>
                                        <p class="w3-opacity">--%>
                                            , &nbsp;<b>No. of Products:  
                                            <asp:Label ID="lblCounter" runat="server">0</asp:Label></b>
                                            <%--</p>
                                        <p class="w3-opacity">--%>
                                            , &nbsp;
                                            <b>Total O/S :   VND
                                            <asp:Label ID="lblTotalOutStanding" runat="server">0</asp:Label></b>
                                        </p>
                                        <h6 class="w3-text-teal"><i class="fa fa-list-alt fa-fw w3-margin-right"></i>Product Summary - <span class="w3-tag w3-teal w3-round">Till today</span></h6>
                                        <div class="w3-content w3-white w3-padding">
                                            <asp:GridView ID="grdSummary" runat="server" AllowPaging="true" PageSize="5" OnPageIndexChanging="OnPaging_Summary"
                                                AutoGenerateColumns="true" CssClass="w3-table-all" PagerStyle-CssClass="pgr" OnRowCommand="OnRowCommand"
                                                AlternatingRowStyle-CssClass="alt" EmptyDataText="No records has been added." Width="100%" OnRowDataBound="grdSummary_RowDataBound">
                                                <AlternatingRowStyle CssClass="alt" />
                                                <HeaderStyle BackColor="#585858" ForeColor="White" />
                                                <PagerStyle CssClass="pgr" />
                                            </asp:GridView>
                                        </div>
                                        <h6 class="w3-text-teal"><i class="fa far fa-cog fa-fw w3-margin-right"></i>Applications - <span class="w3-tag w3-teal w3-round">In-Process/Cancelled/Rejected</span></h6>
                                        <div class="w3-content w3-white w3-padding">
                                            <asp:GridView ID="grdApplication" runat="server" AllowPaging="true" PageSize="5" OnPageIndexChanging="OnPaging_Application"
                                                AutoGenerateColumns="true" CssClass="w3-table-all" PagerStyle-CssClass="pgr"
                                                AlternatingRowStyle-CssClass="alt" EmptyDataText="No records has been added." Width="100%">
                                                <AlternatingRowStyle CssClass="alt" />
                                                <HeaderStyle BackColor="#585858" ForeColor="White" />
                                                <PagerStyle CssClass="pgr" />
                                            </asp:GridView>
                                        </div>
                                    </div>
                                    <div id="divDocList" class="w3-container w3-white w3-padding">
                                        <p>
                                            <i class="fa fa-list fa-fw w3-margin-right w3-text-teal"></i>The Following Customer Docs are available in Omni Docs for quick reference:
                                        </p>
                                        <p>
                                            <table>
                                                <tr>
                                                    <td>
                                                        <%--<asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                                <ContentTemplate>--%>
                                                        <asp:LinkButton runat="server" ID="btnShowDocuments" Text="Show documents"
                                                            OnClick="btnShowDocuments_Click" Width="118px" />
                                                        <asp:GridView ID="GridViewdoc" runat="server" OnPageIndexChanging="OnPaging_Doc" AllowPaging="true"
                                                            AutoGenerateColumns="False" CssClass="w3-table-all" PagerStyle-CssClass="pgr" OnRowCommand="OnRowCommand"
                                                            AlternatingRowStyle-CssClass="alt" EmptyDataText="No records has been added." Width="100%">
                                                            <AlternatingRowStyle CssClass="alt" />
                                                            <Columns>                                                                
                                                                <asp:TemplateField HeaderText="National ID" ItemStyle-Width="160" HeaderStyle-BackColor="#585858" HeaderStyle-ForeColor="#ffffff">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="nidno" runat="server" Text='<%# Eval("nid_no") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="160px" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Application ID" ItemStyle-Width="160" HeaderStyle-BackColor="#585858" HeaderStyle-ForeColor="#ffffff">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="appid" runat="server" Text='<%# Eval("appid") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="160px" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Contract Number" ItemStyle-Width="160" HeaderStyle-BackColor="#585858" HeaderStyle-ForeColor="#ffffff">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="docname" runat="server" Text='<%# Eval("contract_no") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="160px" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Sequence ID" ItemStyle-Width="150" Visible="false" HeaderStyle-BackColor="#585858" HeaderStyle-ForeColor="#ffffff">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="seqid" runat="server" Text='<%# Eval("seqid") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="160px" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Document ID" ItemStyle-Width="160" HeaderStyle-BackColor="#585858" HeaderStyle-ForeColor="#ffffff">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="docids" runat="server" Text='<%# Eval("docid") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="160px" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Document Description" ItemStyle-Width="160" HeaderStyle-BackColor="#585858" HeaderStyle-ForeColor="#ffffff">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="docdescname" runat="server" Text='<%# Eval("docdesc") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="160px" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="FinnOne Document ID" ItemStyle-Width="160" HeaderStyle-BackColor="#585858" HeaderStyle-ForeColor="#ffffff">
                                                                    <ItemTemplate>
                                                                        <asp:Label ID="findocid" runat="server" Text='<%# Eval("finndocid") %>'></asp:Label>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="160px" />
                                                                </asp:TemplateField>
                                                                <asp:TemplateField HeaderText="Download" ItemStyle-Width="150" Visible="false">
                                                                    <ItemTemplate>
                                                                        <asp:ImageButton ID="downloadDoc" runat="server" AlternateText="Download" ImageUrl="~/images/download.png"
                                                                            CommandName="DocID" CommandArgument='<%# Eval("docid") %>'></asp:ImageButton>
                                                                    </ItemTemplate>
                                                                    <ItemStyle Width="100%" />
                                                                </asp:TemplateField>
                                                            </Columns>
                                                            <PagerStyle CssClass="pgr" />
                                                        </asp:GridView>
                                                        <iframe id="docFrame" runat="server" src="" scrolling="no" frameborder="0" visible="false"
                                                            style="border: none; overflow: hidden; width: 1px; height: 1px;" allowtransparency="true"></iframe>

                                                    </td>
                                                    <td></td>
                                                </tr>
                                            </table>
                                        </p>
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
        <!-- <script>
            ////function onpageload() {
                ////document.getElementById('NG').style.display = 'none';
                ////isFirstLoad = false;
                ////init();
            ////}
            ////jQuery(document).ready(function () {
                ////setTimeout(updatemap, 2000);
                ////function updatemap() {
                    ////document.getElementById('GM').style.display = 'none';
                ////}
           //// });

        </script> -->
    </form>
</body>
</html>
