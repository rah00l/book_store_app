# features/search_books.feature

Feature: Search Books by Author or Title

  Scenario: User searches for books by author
    Given there are books with authors "John Doe" and "Jane Smith"
    When I visit the search page
    And I fill in "Author" with "John Doe"
    And I press the "Search" button in the main search form
    # Then I should see "John Doe's Books"
    # And I should not see "Jane Smith's Books"

Scenario: User searches for books by title
  Given there are books with titles "Ruby Basics" and "Python Essentials"
  When I visit the search page
  And I fill in "Title" with "Ruby Basics"
  And I press the "Search" button in the main search form
  Then I should see "Ruby Basics"
	# And I should not see "Python Essentials"



