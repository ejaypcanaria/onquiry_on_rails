Feature: User logs in

	As a valid User
	I want to login
	So that I can access the home page
	
	Scenario: User inputted valid account
		Given I am on the welcome page
		When I fill in "login_email" with "ejay@onquiry.com"
		And I fill in "login_password" with "12345678"
		And I click "Login"
		Then I should be redirected to "/home"
		
	Scenario: User inputted invalid account
		Given I am on the welcome page
		When I fill in "login_email" with "ejay@onquiry.com"
		And I fill in "login_password" with "1234567x"
		And I click "Login"
		Then I should be redirected to "/login"
		
	Scenario: User is trying to access protected page
		Given I am not yet logged in
		When I access "/home"
		Then I should be redirected to "/"