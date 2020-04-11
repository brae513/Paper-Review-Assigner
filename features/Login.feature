# Cucumber test for admin access to the site
# this includes registering and logging in

Feature: Admin can access the website

Scenario: Register (Navigation and filling form)
  Given I am on the landing page
  When I follow "Register"
  Then I should be on the Sign up page
  When I fill in "Email" with "cucumber@test.edu"
  And I fill in "Password" with "testPassword"
  And I fill in "Password confirmation" with "testPassword"
  And I press "Sign up"
  Then I should be on the users homepage
    
Scenario: Login (Navigation and filling form)
  Given I am on the landing page
  When I follow "Log In"
  Then I should be on the Log in page
  When I fill in "Email" with "cucumber@test.edu"
  And I fill in "Password" with "testPassword"
  And I press "Log in"
  Then I should be on the Overview page