# Cucumber test for Student Access page

Feature: Students can login to access website

Scenario: Student access
  Given I am on the Paper Review homepage
  When I follow "Student Access"
  Then I should be on the Student Access page
    
Scenario: Navigate homepage
  Given I am on the Student Access page
  When I follow "Home"
  Then I should be on the Paper Review homepage