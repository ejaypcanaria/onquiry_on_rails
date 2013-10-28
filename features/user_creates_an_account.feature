Feature: A user creates an account

	As a new user
	I want to create an account
	So that I will be registered
	
	Scenario: User registration page
		Given I am on the welcome page
		Then I should see a "Create an Account" page
		
	Scenario: Fill out registration form
		Given I am on the welcome page again
		When I fill in "user_first_name" with "Ejay"
		And I fill in "user_last_name" with "Canaria"
		And I fill in "user_email" with "ejayc@onquiry.com"
		And I fill in "user_password" with "ejay1234"
		And I click "Create Account"
		Then I should see "Your account was successfully created!"
		
	Scenario: Password is less than 8
		Given I am on the welcome page for registration
		When I fill in "user_first_name" with "Juan"
		And I fill in "user_last_name" with "Dela Cruz"
		And I fill in "user_email" with "juan@pinoy.ph"
		And I fill in "user_password" with "123"
		And I click "Create Account"
		Then I should see "1 Validation Failed"
		And I should see an error "Password is too short (minimum is 8 characters)"
		
	Scenario: Email address already exists
		Given "ejayc@onquiry.com" email already exists
		When I fill in "user_first_name" with "Ejay"
		And I fill in "user_last_name" with "Canaria"
		And I fill in "user_email" with "ejayc@onquiry.com"
		And I fill in "user_password" with "12345678"
		And I click "Create Account"
		Then I should see "1 Validation Failed"
		Then I should see an error "Email has already been taken"
		
	Scenario: Email address already exists and password length is less than 8
		Given "ejayc@onquiry.com" email already exists
		When I fill in "user_first_name" with "Ejay"
		And I fill in "user_last_name" with "Canaria"
		And I fill in "user_email" with "ejayc@onquiry.com"
		And I fill in "user_password" with "1234567"
		And I click "Create Account"
		Then I should see "2 Validations Failed"
		Then I should see an error "Email has already been taken"
		And I should see an error "Password is too short (minimum is 8 characters)"