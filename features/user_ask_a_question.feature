Feature: User ask a question

	As a user
	I want to ask question
	So that other user can see my question
	
	Scenario: User ask a question
		Given I am already signed in
		When I fill in "question_question" with "This is a test question"
		And I click "Ask"
		Then I should be redirected to "/question/this-is-a-test-question"
		And I should see "This is a test question"
		And I should see "Admin" in question
		
	Scenario: User ask an existing question
		Given I am already signed in
		When I fill in "question_question" with "Seed question number 1"
		And I click "Ask"
		Then I should be redirected to "Seed question number 1" page
		