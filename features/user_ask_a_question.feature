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
		
	Scenario: User add details to a question
		Given I ask a question "This is a sample question"
		When I click "Add Details"
		Then I should see a link or button "Add"
		And I should see a link or button "Cancel"
		When I fill in "question_details" with "This is a details"
		Then I should see "This is a details"
		
	Scenario: User should not see add details for question asked by other user
		Given I ask a question "This is a question 1 without details"
		Then I should not see "Add Details"
		
		