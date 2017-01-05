function toggleTooltips() {
  $('td').mouseenter(function(){
    $(this).children().children().children().show();
  });
  
  $('td').mouseleave(function(){
    $(this).children().children().children().hide();
  });
}

$(document).ready(setTimeout(toggleTooltips,1000));