Given('there are publisher books with titles {string} and {string}') do |title1, title2|
  publisher = FactoryBot.create(:publisher) # Create a publisher
  FactoryBot.create(:book, title: title1, publisher: publisher)
  FactoryBot.create(:book, title: title2, publisher: publisher)
end

When('I visit the search by publisher page') do
  visit search_by_publisher_books_path
end


And('I fill in the "Publisher Name" field with "Example Publisher"') do
  fill_in 'Search by Publisher', with: 'Example Publisher'
end

When('I press the "Search" button in the publisher search form') do
  within('.publisher-search-form') do
    click_button 'Search'
  end
end

Then /^I should see search results for books by publisher "(.*?)"$/ do |publisher_name|

  # Check for the presence of specific book details
  books = Book.fetch_books_by_publisher(publisher_name)
  books.each do |book|
    expect(page).to have_content(book.title)
    expect(page).to have_content(book.author)
    # Add more expectations based on your book details
  end
end

Then /^I should see details for the books with titles "(.*?)" and "(.*?)"$/ do |title1, title2|
  # Implement the step logic here to check for details of the specified books on the page
  expect(page).to have_content(title1)
  expect(page).to have_content(title2)
  # Add more expectations based on your book details
end

