Feature: View Book Details

  Scenario: User views the details of a book
    Given there is a book with title "Ruby Basics"
    When I visit the book details page for "Ruby Basics"	
    And I should see a link to go back to the books list
