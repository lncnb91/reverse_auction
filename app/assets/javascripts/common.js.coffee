$ ->
  $(".datepicker").datepicker
    dateFormat: "yy-mm-dd"
    changeMonth: true
    changeYear: true
  $(".datetimepicker").datetimepicker
    lang:"ja"
  $("#month-picker").datepicker
    changeMonth: true
    changeYear: true
    showButtonPanel: true
    dateFormat: "yy-MM"
    monthNames: ["01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"]
    onClose: (dateText, inst) ->
      month = $("#ui-datepicker-div .ui-datepicker-month :selected").val()
      year = $("#ui-datepicker-div .ui-datepicker-year :selected").val()
      $(this).datepicker "setDate", new Date(year, month, 1)
      return