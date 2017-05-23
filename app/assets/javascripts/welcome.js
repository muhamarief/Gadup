$(document).on('turbolinks:load', function (){

    $(window).scroll(function() {
      var scroll =  $(window).scrollTop();

      if (scroll >= 500) {
          $(".clearNav").addClass("")
      }
    })

});




$(window).scroll(function() {
    var scroll = $(window).scrollTop();

    if (scroll >= 1) {
        $(".clearNav").addClass('darkNav');
    } else {
        $(".clearNav").removeClass("darkNav");
    }
});
