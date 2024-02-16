Given('there is a book with title {string}') do |title|
  publisher = FactoryBot.create(:publisher)
  FactoryBot.create(:book, title: title, publisher: publisher)
end

When('I visit the book details page for {string}') do |title|
  book = Book.find_by(title: title)
  visit book_path(book)
end

# Then('I should see the details of the book:') do |table|
# 	byebug
#   book_details = table.hashes.first
#   expect(page).to have_content("Title: #{book_details['Title']}")
#   # expect(page).to have_content("Author: #{book_details['Author']}")
#   # expect(page).to have_content("Description: #{book_details['Description']}")
#   # expect(page).to have_content("Price: #{book_details['Price']}")
#   # expect(page).to have_content("Publisher: #{book_details['Publisher']}")
#   # expect(page).to have_content("Availability: #{book_details['Availability']}")
# end

And('I should see a link to go back to the books list') do
  expect(page).to have_link('Back to Books', href: books_path)
end
