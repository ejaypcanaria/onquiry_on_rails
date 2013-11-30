Feature: User answers a question

	As a User
	I should be able to put answer to a question
	So that asker can find my answer
	
	Scenario: View add answer button
		Given I am on a question "Seed question number 1"
		Then I should see a link or button "Add Answer"
		
	Scenario: Add answer
		Given I am on a question "Seed question number 1"
		When I fill in "answer_answer" with "This is a sample answer"
		And I click "Add Answer"
		Then I should see "This is a sample answer"
		And I should not see a link or button "Add Answer"