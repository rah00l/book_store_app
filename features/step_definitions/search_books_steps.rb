# features/step_definitions/search_books_steps.rb

Given('there are books with authors {string} and {string}') do |author1, author2|
  publisher = FactoryBot.create(:publisher) # Create a publisher
  FactoryBot.create(:book, author: author1, publisher: publisher)
  FactoryBot.create(:book, author: author2, publisher: publisher)
end

When('I visit the search page') do
  visit '/books?query='
end

When('I fill in "Author" with "John Doe"') do
  fill_in 'Search by Author or Title', with: 'John Doe'
end

When('I press the "Search" button in the main search form') do
  within('.book-search-form') do
    click_button 'Search'
  end
end

# Then /^I should see "(.*?)"$/ do |text|
#   expect(page).to have_text(text, wait: 10)
# end

# Then('I should not see "{string}"') do |content|
#   expect(page).not_to have_content(content)
# end

Given('there are books with titles {string} and {string}') do |title1, title2|
  publisher = FactoryBot.create(:publisher) # Create a publisher
  FactoryBot.create(:book, title: title1, publisher: publisher)
  FactoryBot.create(:book, title: title2, publisher: publisher)
end


When('I fill in "Title" with {string}') do |title|
  fill_in 'query', with: title
end

Then /^I should see "(.*?)"$/ do |text|
  expect(page).to have_content(text)
end
