Feature: Question Feed

	As a User
	I want to see all the questions
	So that I can add answer
	
	Scenario: All questions in the feed
		Given I am already signed in
		Then I should see the last 10 seed questions
	
	Scenario: Load more click
		Given I am already signed in
		When I click "Load More"
		Then I should see next 10 seed questions