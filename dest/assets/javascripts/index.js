$(function() {
  $("html").removeClass("preload");
  $('header').on({
    click: function(event) {
      return $(this).toggleClass("open");
    }
  });
  $('.twitter').find('a').on({
    mouseover: function(e) {
      return $('html').css({
        'background-color': 'rgba(2, 172, 237, 1.0)'
      });
    }
  });
  $('.pinterest').find('a').on({
    mouseover: function(e) {
      return $('html').css({
        'background-color': 'rgba(204, 32, 39, 1.0)'
      });
    }
  });
  $('.dribbble').find('a').on({
    mouseover: function(e) {
      return $('html').css({
        'background-color': 'rgba(234, 72, 137, 1.0)'
      });
    }
  });
  $('.facebook').find('a').on({
    mouseover: function(e) {
      return $('html').css({
        'background-color': 'rgba(59, 87, 154, 1.0)'
      });
    }
  });
  return $('.mail').find('a').on({
    mouseover: function(e) {
      return $('html').css({
        'background-color': 'white'
      });
    }
  });
});
