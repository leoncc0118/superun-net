$(document).ready(function () { 
 var cssObj = {
      'background-image' : 'url(images/main_hover_08.gif)'   
    }
$("#menu-list li a").css(cssObj).animate({
    opacity: 0,
  }, 1 );
  $("#menu-list li a").mouseover(function () {
    $(this).css(cssObj).animate({
    opacity: 1.0,
  }, 250 );
  });
    $("#menu-list li a").mouseout(function () {
    $(this).css(cssObj).animate({
    opacity: 0,
  }, 120 );
     });  

    });
	



	
