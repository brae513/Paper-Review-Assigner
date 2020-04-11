# Cucumber test for admin access to the site
# this includes registering and logging in

Feature: Admin can access the website

Scenario: Register
  Given I am on the Paper Review homepage
  When I follow "Register"
  Then I should be on the Sign up page
  When I fill in "Email" with "cucumber@test.edu"
  And I fill in "Password" with "testPassword"
  And I fill in "Password confirmation" with "testPassword"
  And I press "Sign up"
  Then I should be on the users homepage
    
Scenario: Login
  Given I am on the Paper Review homepage
  When I follow "Log In"
  Then I should be on the Log in page
  When I fill in "Email" with "cucumber@test.edu"
  And I fill in "Password" with "testPassword"
  And I press "Log in"
  Then I should be on the homepage