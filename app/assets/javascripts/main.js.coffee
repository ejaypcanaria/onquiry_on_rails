# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/



@loadMoreFeed = ->
	 $('#load-more-feed').click() if ($(window).scrollTop() == $(document).height() - $(window).height())


@addBackToTopListener = ->
	$('.back-to-top').hide()
	$('.back-to-top').click  ->
   		$("html, body").animate({scrollTop: 0}, 800)
   		return false
   		
	$(window).scroll ->
		if ($(this).scrollTop() > 700)
			$('.back-to-top').fadeIn()
		else
   			$('.back-to-top').fadeOut()