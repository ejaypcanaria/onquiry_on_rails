function initWelcomePage() {
	$('.sign-up-panel').hide();
}

function showSignUpPanel() {
	$('.login-panel').hide();
	$('.sign-up-panel').fadeIn();
}

function showLoginPanel() {
	$('.login-panel').fadeIn();
	$('.sign-up-panel').hide();
}