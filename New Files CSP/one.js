protected void Page_Load(object sender, EventArgs e)
{
    if (String.IsNullOrEmpty(Session["UserName"]?.ToString()))
        Response.Redirect("FECredit_Login.aspx");
    else
    {
        lblUser.Text = "Welcome " + Session["UserName"].ToString();
    }
    if (!Page.IsPostBack)
    {
        Session["ScreenName"] = "Search";
        Session["ScreenUrl"] = "FECreditSearch.aspx";
        //Set Configuration parameter values
        string query = "Select Fecredit_Name,Fecredit_Value from DW_BICC_CRE.FECREDIT_CPARAMETERS";
        System.Data.OracleClient.OracleConnection con = DB_Context.GetConnection();
        System.Data.OracleClient.OracleCommand cmd = new System.Data.OracleClient.OracleCommand(query, con);
        con.Open();
        System.Data.OracleClient.OracleDataReader; odr = cmd.ExecuteReader();
        if (odr.HasRows)
        {
            while (odr.Read())
            {
                Session.Add(odr[0].ToString(), odr[1].ToString());
            }
        }

        // Check what type of searches user is allowed to do
        if (Session["AccessMatrix"] != null)
        {
            bool sel = true;
            for (int i = 0; i < rbtnSearch.Items.Count; i++)
            {
                if (!Session["AccessMatrix"].ToString().Contains(rbtnSearch.Items[i].ToString() + ","))
                {
                    //rbtnSearch.Items.Remove(rbtnSearch.Items[i]);
                    //i--;
                    rbtnSearch.Items[i].Enabled = false;
                    ////rbtnSearch.Items[i].Selected = false;
                }
                else
                {
                    if (sel)
                    {
                        //rbtnSearch.Items[i].Enabled = true;
                        rbtnSearch.Items[0].Selected = false;
                        rbtnSearch.Items[i].Selected = true;
                        //rbtnSearch.SelectedIndex = i;
                        sel = false;
                        if (rbtnSearch.Items[i].Text == "Customer name")
                        {
                            divCustName.Style.Add("display", "block");
                        }
                    }
                }
            }
            ListItemCollection lsttemp = new ListItemCollection();
            for (int i = 0; i < ddlType.Items.Count; i++)
            {
                if (Session["AccessMatrix"].ToString().Contains(ddlType.Items[i].ToString() + ","))
                {
                    ListItem lstIt = new ListItem(ddlType.Items[i].ToString());
                    lsttemp.Add(lstIt);
                }
            }
            ddlType.Items.Clear();
            ddlType.DataSource = lsttemp;
            ddlType.DataBind();
        }
    }
}
protected void lnkLogout_Click(object sender, EventArgs e)
{
    Helper.Logout(Session["UserName"].ToString());
    Response.Redirect("FECredit_Login.aspx");
}

protected void btnSearch_Click(object sender, EventArgs e)
{
    lbl_error.Visible = false;
    // log4net.ILog logger = log4net.LogManager.GetLogger("LogFileAppender");
    var logger = log4net.LogManager.GetLogger("LogFileAppender");
    int userSearchCount = 0;

    try
    {
        try
        {
            userSearchCount = Helper.IsUserSearchLimitReached(Session["UserName"].ToString(), Convert.ToInt32(Session[Constants.MaxSearchLimit].ToString()));
            if (userSearchCount == -1)
            {
                try
                {
                    //throw new Exception();
                    ClientScript.RegisterClientScriptBlock(GetType(), "displayMessage", "alert('" + Constants.SearchLimitReached + "');", true);
                }
                catch (Exception em)
                {
                    lbl_error.Visible = true;
                    lbl_error.Text = Constants.SearchLimitReached;
                    logger.Info("Display max search count message Error!!");
                    logger.Error(em);
                }
                return;
            }
        }
        catch (Exception ex)
        {
            logger.Info("UserSearchCount Fetch Error!!");
            logger.Error(ex);
        }
        var search = txtSearch.Text.Trim();
        var searchOther = txtOther.Text.Trim();
        string activitytextQuery = Session["UserName"].ToString() + " searched for ";
        Session["Search"] = "True";
        string cusInfoURL = "";
        if (rbtnSearch.SelectedValue == "Customer name" && ddlType.SelectedValue != "")
        {
            activitytextQuery += rbtnSearch.SelectedValue + "=" + search + " and " + ddlType.SelectedValue + "=" + searchOther;
            Session["SearchAction"] = rbtnSearch.SelectedValue + " : " + ddlType.SelectedValue;
            Session["SearchValue"] = search + " : " + searchOther;
            Session["SearchRemarks"] = activitytextQuery;
            //Helper.addActivity("Search", " ", " ", " ", rbtnSearch.SelectedValue + " : " + ddlType.SelectedValue, search + " : " + searchOther, Session["UserName"].ToString(), activitytextQuery, Session["UserRole"].ToString());
            cusInfoURL = "FECreditCusInfo.aspx?Type=" + rbtnSearch.SelectedValue + "&Text=" + search + "&SecondType=" + ddlType.SelectedValue + "&=" + "&SecondText=" + searchOther;
            Session["cusInfoURL"] = cusInfoURL;
            Response.Redirect(cusInfoURL, false);
        }
        else
        {
            activitytextQuery += rbtnSearch.SelectedValue + "=" + search;
            Session["SearchAction"] = rbtnSearch.SelectedValue;
            Session["SearchValue"] = search;
            Session["SearchRemarks"] = activitytextQuery;
            //Helper.addActivity("Search", " ", " ", " ", rbtnSearch.SelectedValue, search, Session["UserName"].ToString(), activitytextQuery, Session["UserRole"].ToString());
            cusInfoURL = "FECreditCusInfo.aspx?Type=" + rbtnSearch.SelectedValue + "&Text=" + search;
            Session["cusInfoURL"] = cusInfoURL;
            Response.Redirect(cusInfoURL, false);
        }
    }
    catch (Exception ex)
    {
        logger.Info("Search Error!!");
        logger.Error(ex);
    }
}
// ///////////////////////////////////////////////////
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

function timerIncrement() {
    idleTime = idleTime + 1;
    if (idleTime > 14) { // 15 minutes
        window.location.href = 'FECredit_Login.aspx';
    }
}
        //function SearchText() {
        //    $(".autosuggest").autocomplete({
        //        source: function (request, response) {
        //            $.ajax({
        //                type: "POST",
        //                contentType: "application/json; charset=utf-8",
        //                url: "fecreditsearch.aspx/GetAutoCompleteData",
        //                data: "{'username':'" + document.getElementById('txtSearch').value + "'}",
        //                dataType: "json",
        //                success: function (data) {
        //                    response(data.d);
        //                },
        //                error: function (result) {
        //                    alert("Error");
        //                }
        //            });
        //        }
        //    });
        //}