function executeCheckboxChecked(checkBox) {

    var gridView = document.getElementById('gdvModules');
    var index = checkBox.parentElement.parentElement.rowIndex;
    if (checkBox.checked == true) {
        gridView.rows[index].cells[1].getElementsByTagName("INPUT")[0].checked = true;
    }
}

function viewCheckboxUnChecked(checkBox) {
    var gridView = document.getElementById('gdvModules');
    var index = checkBox.parentElement.parentElement.rowIndex;

    if (checkBox.checked == false) {
        if (gridView.rows[index].cells[2].getElementsByTagName("INPUT")) {
            gridView.rows[index].cells[2].getElementsByTagName("INPUT")[0].checked = false;
        }
    }
}