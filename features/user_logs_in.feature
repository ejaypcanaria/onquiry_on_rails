Feature: User logs in

	As a valid User
	I want to login
	So that I can access the home page
	
	Scenario: User inputted valid account
		Given I am on the welcome page
		When I fill in "login_email" with "admin@onquiry.com"
		And I fill in "login_password" with "adminadmin123"
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
		
	Scenario: User sign out
		Given I am already signed in
		When I click "Log out"
		Then I should be redirected to "/"
		And if I access "/home" I should be redirected to "/"