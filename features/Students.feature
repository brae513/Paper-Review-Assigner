# Cucumber test for Students page
# tests adding and deleting students

Feature: Add/remove students from list
  As an admin
  I want to add/remove students
  So that I can manage the groups size

# Assumes in each step that the admin is logged in
Background: 
  Given I am on the Log in page
  When I fill in "Email" with "cucumber@test.edu"
  And I fill in "Password" with "testPassword"
  And I press "Log in"
  Then I should be on the homepage

Scenario: Navigating to Students tab
  Given I am on the homepage
  When I follow "Students"
  Then I should be on the Students page
  
Scenario: Adding a student to the list
  Given I am on the Students page
  When I follow "Add new student"
  And I fill in "Name" with "Cucumber"
  And I fill in "Email" with "cucumber@test.edu"
  And I choose "Senior"
  And I press "Add student"
  Then I should see "Cucumber was successfully created."
  
# Scenario: Deleting a student from the list
#   Given I am on the Students page
#   --step identifying which student to delete
#   --choose delete

Scenario: Navigate back to homepage
  Given I am on the Students page
  When I follow "Home"
  Then I should be on the homepage