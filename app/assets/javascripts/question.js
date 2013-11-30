function addAnswerAjaxListener() {
	$('#add-answer-form').bind("ajax:beforeSend", function(evt, xhr, settings){
		$('#add-answer-form').hide();
		$('#ajax-loading-answer').show();
	}).bind("ajax:success", function(evt, data, status, xhr) {
		$('.answers-wrapper').append(xhr.responseText);
		$('.add-answer-wrapper').hide();
		$('#answer_answer').val("");
		$('#ajax-loading-answer').hide();
	});
}

function addDetailsAjaxListener() {
	$('#add-details-form').bind("ajax:beforeSend", function(evt, xhr, settings) {
		$('#add-details-form').hide();
		$('#ajax-loading').show();
	}).bind("ajax:success",function(evt, data, status, xhr) {
		$('#ajax-loading').hide();
		$('.show-question-wrapper article').text(data.details);
	});
}

function initializeAddDetailsForm() {
	$('#add-details').click(function() {
		$('#add-details-form').fadeIn();
		$('#add-details').hide();
		return false;
	});

	$('#add-details-form').hide();
	$('#ajax-loading-question').hide();
	$('#ajax-loading-answer').hide();

	$('#add-details-cancel').click(function() {
		$('#add-details-form').hide();
		$('#add-details').show();
		return false;
	});
}