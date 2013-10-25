Feature: A user creates an account

	As a new user
	I want to create an account
	So that I will be registered
	
	Scenario: User registration page
		Given I am on the welcome page
		Then I should see a "Create an Account" page
		
	Scenario: Fill out registration form
		Given I am on the welcome page again
		When I fill in "user_name" with "Ejay Canaria"
		And I fill in "user_email" with "ejay@onquiry.com"
		And I fill in "user_password" with "ejay1234"
		And I click "Create Account"
		Then I should see "Your account was successfully created!"
		
	Scenario: Password is less than 8
		Given I am on the welcome page for registration
		When I fill in "user_name" with "Juan Dela Cruz"
		And I fill in "user_email" with "juan@pinoy.ph"
		And I fill in "user_password" with "123"
		And I click "Create Account"
		Then I should see an error "Password is too short (minimum is 8 characters)"
		And I should see "1 validation failed"