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

// 
var isFirstLoad = true;
function openCity(evt, cityName, trg) {
    if (evt)
        evt.preventDefault();
    var i, x, tablinks, cN, urlTag, authTab = 0;
    urlTag = 'FECreditCIN.aspx';
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
var isFirstLoad = true;
function openCity(evt, cityName) { 
    if (evt) evt.preventDefault();
    
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


//
// here "trg" parameter for opencity function but it doest not take any value so i removed from line no:47
 // As of trg here i,x,tablinks are also not used here so removed "i","x""tablinks"

}