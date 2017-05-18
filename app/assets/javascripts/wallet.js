$(document).on('turbolinks:load', function() {
  $('#datetimepicker1').datetimepicker({
    format: 'YYYY-MM-DD HH:mm'
  });

  $('#datetimepicker2').datetimepicker({
    format: 'YYYY-MM-DD HH:mm'
  });
})
