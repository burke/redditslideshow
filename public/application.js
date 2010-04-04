
$(function() {

  $.fn.supersized.options = {
  	startwidth: 640,
  	startheight: 480,
  	vertical_center: 1,
  	slideshow: 1,
  	navigation: 0,
  	transition: 2, //0-None, 1-Fade, 2-slide top, 3-slide right, 4-slide bottom, 5-slide left
  	pause_hover: 0,
  	slide_counter: 1,
  	slide_captions: 1,
  	slide_interval: 3000
  };

  $.getJSON("/data.json", {}, function(data) {
    $.each(data, function(i, x) {
      $("#supersize").append("<a href='"+x.permalink+"'><img src='"+x.url+"' title='"+x.title+"'/></a>");
    });
    $("#supersize").supersized();
  });

});