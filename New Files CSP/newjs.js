var idleTime = 0;
//$(document).ready(function () {
    //Increment the idle time counter every minute.
    //alert('ready');
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
function ConfirmSave()
{       
var Ok = confirm('Are you sure want to delete?');
    if (Ok) {
        return true;
    }
    else {
        alert('cancel');
        return false;
    }
}
// 
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
// here is js function of forgotPass

function notify(myMessage) {
    alert('An email has been sent to your registered mailID : ' + myMessage);
}