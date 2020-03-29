# Cucumber test for admin access to the site
# this includes registering and logging in

Feature: Admin can access the website

Scenario: Register
  Given I am on the Paper Review homepage
  When I follow "Professor Access"
  Then I should be on the Professor Access page
  When I follow "Register"
  Then I should be on the Sign up page
    
Scenario: Login
  Given I am on the Paper Review homepage
  When I follow "Professor Access"
  Then I should be on the Professor Access page
  When I follow "Log In"
  Then I should be on the Login page
  
Scenario: Navigate homepage
  Given I am on the Professor Access page
  When I follow "Home"
  Then I should be on the Paper Review homepage