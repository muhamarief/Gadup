$(document).on('turbolinks:load', function() {
  $('.datepicker1').datepicker();

  $('.datepicker2').datepicker();


  $('#timepicker1').timepicker({
    use24hours: true,
    format: 'HH:mm'
  });

  $('#timepicker2').timepicker({
    use24hours: true,
    format: 'HH:mm'
  });

  $('#datetimepicker1').datetimepicker();

})
