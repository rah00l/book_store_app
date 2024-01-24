Feature: Search Books by Publisher

  Scenario: User searches for books by publisher
    Given there are publisher books with titles "Ruby Basics" and "Python Essentials"
    When I visit the search by publisher page
    And I fill in the "Publisher Name" field with "Example Publisher"
    And I press the "Search" button in the publisher search form
    Then I should see search results for books by publisher "Example Publisher"
    And I should see details for the books with titles "Ruby Basics" and "Python Essentials"
