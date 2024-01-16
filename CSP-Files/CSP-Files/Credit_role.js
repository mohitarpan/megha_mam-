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
        window.location.href = 'FECredit_Login.aspx';    //.reload();
    }
}
function clear() {
    alert('t');
}
function validateTxt() {
    //alert('validateTxt');
    $("textarea, input[type='text']").change(function () {
        html = $(this).val(); //get the value
        //.replace("a" , "b")  works only on first occurrence of "a"
        html = html.replace(/< /g, "<"); //before: if there's space after < remove
        html = html.replace(/</g, "< "); // add space after <
        $(this).val(html); //set new value
    });
}
function ConfirmDelete() {
    var Ok = confirm('Are you sure you want to delete?');
    if (Ok == false) {
        return false;
    }
    else {
        return true;
    }
}      
       
