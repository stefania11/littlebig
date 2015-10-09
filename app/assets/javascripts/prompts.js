$(function() {
  $('.attachinary-input').attachinary();

  $("#accordion").on("hide.bs.collapse", function(){
    $(".toggle").html('Close image <span class="fa fa-camera-retro"></span>');
  });

  $("#accordion").on("show.bs.collapse", function(){
    $(".toggle").html('Open image <span class="fa fa-camera-retro"></span>');
  });

});
