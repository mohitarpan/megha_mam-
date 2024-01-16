$(function () {
    $("#Sdatepicker").datepicker();
    $("#Edatepicker").datepicker();
  });

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
    if (idleTime > 14) {
      // 15 minutes
      //alert('reload');
      window.location.href = "FECredit_Login.aspx"; //.reload();
    }
  }
  $(function () {
    BlockUI("dvGrid");
    $.blockUI.defaults.css = {};
  });
  function BlockUI(elementID) {
    var prm = Sys.WebForms.PageRequestManager.getInstance();
    prm.add_beginRequest(function () {
      $("#" + elementID).block({
        message:
          '<div align = "center">' +
          '<img src="images/loadingAnim.gif"/></div>',
        css: {},
        overlayCSS: {
          backgroundColor: "#000000",
          opacity: 0.6,
          border: "3px solid #63B2EB",
        },
      });
    });
    prm.add_endRequest(function () {
      $("#" + elementID).unblock();
    });
  }
  var picker = new Pikaday({
    field: document.getElementById("txtStartDate"),
    firstDay: 1,
    format: "MM/DD/YYYY",
    minDate: new Date("2019-01-01"),
    maxDate: new Date("2039-12-31"),
    yearRange: [2019, 2039],
    numberOfMonths: 1,
    theme: "dark-theme",
  });
  var picker1 = new Pikaday({
    field: document.getElementById("txtEndDate"),
    firstDay: 1,
    format: "MM/DD/YYYY",
    minDate: new Date("2019-01-01"),
    maxDate: new Date("2039-12-31"),
    yearRange: [2019, 2039],
    numberOfMonths: 1,
    theme: "dark-theme",
  });