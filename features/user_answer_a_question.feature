Feature: User answers a question

	As a User
	I should be able to put answer to a question
	So that asker can find my answer
	
	Scenario: View add answer button
		Given I am on a question "Seed question number 1"
		Then I should see "Add answer"