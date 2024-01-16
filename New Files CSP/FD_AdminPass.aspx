<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FD_AdminPass.aspx.cs" Inherits="FD_Admin"  %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />
    <link type="text/css" rel="stylesheet" href="all_css.css"><!-- here is external css file-->
    <Script type="text/javascript" src="newjs.js" ></script> <!-- here is external js file-->
    <title>Admin</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css" />
    <link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Roboto' />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://fonts.googleapis.com/css?family=Volkhov" rel="stylesheet" />
    
<body>

    <form id="form1" runat="server">
        <div class="w3-content w3-margin-top">

            <!--header-->
            <div class="w3-display-container w3-white w3-padding">
                <div class="w3-content w3-third w3-padding">
                    <a href="https://fecredit.com.vn" target="_blank">
                        <img class="im" src="images/logo-vn.png" alt="FE CREDIT"></a>
                </div>
                <div class="w3-content w3-third">
                    <h3 class="w3-center w3-padding" >Welcome Admin</h3>
                </div>
                <div class="w3-content w3-third">
                    <span class="w3-right w3-padding w3-hide-small">
                        <asp:Label ID="lblUser" runat="server" Text="Welcome!"></asp:Label>
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
                        <a href="FECredit_Reset.aspx">Reset Password</a>                        &nbsp;|&nbsp;
                        <asp:LinkButton ID="lnkLogout" runat="server" Text="Logout" OnClick="lnkLogout_Click"></asp:LinkButton>


                    </span><%--<a href="FECredit_Login.aspx"><i class="fa fa-sign-out  fa-fw w3-margin-right w3-text-fe-col"></i>Logout</a>--%>
                </div>
            </div>
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
        </div>
        <div id="updateUserDiv" runat="server">
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
            <table class="tave" border="3" align="center">
                <tr>
                    <th id="Update">Update\Delete Existing User</th>
                    <th class="Add_new"><a href="FECredit_NewUser.aspx" class="Add_new_user">Add New User</a>
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
                            <asp:TemplateField HeaderText="Password" ItemStyle-Width="150" Visible="true" >
                                <ItemTemplate>
                                    <asp:Label ID="lblpass" runat="server" Visible="true" Text='<%# Eval("FECREDIT_PASSWORD") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtpass" runat="server" Visible="true" MaxLength="15" Text='<%# Eval("FECREDIT_PASSWORD") %>' Width="140"></asp:TextBox>
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
                         <asp:CommandField ShowDeleteButton="true"  ButtonType="Image" DeleteImageUrl="images/Delete.png" HeaderText="Delete" /> 
                       
                        </Columns>
                    </asp:GridView>
                   
                </contenttemplate>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblStatus" runat="server" ForeColor="Green" Visible="false"  Text=""></asp:Label>
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
    
</body>
</html>
