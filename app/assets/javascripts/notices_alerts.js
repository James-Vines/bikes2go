// to fade out notices/alerts.

$(function() {
	$('.alert').delay(500).fadeIn('normal', function(){
	  $(this).delay(1500).fadeOut();
    });
});