$(document).ready(function(){
  $('a.load-more').click(function(e){
    e.preventDefault();
    $('.load-more').hide();
    $('.loading-gif').show();

    var last_id = $('.each-entry').last().attr('news-id');

    $.ajax({
      type: "GET",
      url: $(this).attr('href'),
      data: {
        id: last_id
      },
      dataType: "script",
      success: function(){
        $('.loading-gif').hide();
        $('.load-more').show();
      }
    })
  })
})
