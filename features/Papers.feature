# # Cucumber test for Papers page
# # tests adding and deleting papers

# Feature: Add/remove papers from list
#   As an admin
#   I want to add/remove papers
#   So that I can manage the papers per iteration

# # Assumes in each step that the admin is logged in
# Background: 
#   Given I am on the Log in page
#   When I fill in "Email" with "cucumber@test.edu"
#   And I fill in "Password" with "testPassword"
#   And I press "Log in"
#   Then I should be on the Log in page
  
# Scenario: Navigating to Papers page
#   Given I am on the homepage
#   When I follow "Papers"
#   Then I should be on the Papers page
  
# Scenario: Adding a paper
#   Given I am on the Papers page
#   When I follow "Add new paper"
#   And I fill in "Title" with "testPaper"
#   And I fill in "Paper ID" with "testID"
#   And I fill in "Description" with "testDescription"
#   And I press "Add Paper"
#   Then I should see "testPaper"
  
# Scenario: Deleting a paper
#   Given I am on the Papers page
#   And I see "Test: first edition"
#   When I press "Delete"
#   Then I should not see "Test: first edition"

# Scenario: Navigating from Papers page
#   Given I am on the Papers page
#   When I follow "Home"
#   Then I should be on the homepage