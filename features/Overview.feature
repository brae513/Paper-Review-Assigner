# Cucumber test for Overview page
# tests adding and deleting papers

Feature: Overview of assignments
  As an admin
  I want to see an overview of the assignments
  So that I can edit them based on outside information
  
# Assumes in each step that the admin is logged in
Background: 
  Given I am on the Log in page
  When I fill in "Email" with "cucumber@test.edu"
  And I fill in "Password" with "testPassword"
  And I press "Log in"
  Then I should be on the Overview page

Scenario: Navigating to Overview page
  Given I am on the homepage
  When I follow "Overview"
  Then I should be on the Overview page
  
## TODO: Scenarios for alerting students once functional ##
  
Scenario: Navigating from Overview page
  Given I am on the Overview page
  When I follow "Home"
  Then I should be on the homepage