# spec/features/search_publishers_spec.rb

require 'rails_helper'

RSpec.feature 'Search publishers' do
  scenario 'User searches for books by title' do
    publisher = FactoryBot.create(:publisher) # Create a publisher
    book = FactoryBot.create(:book, title: 'Ruby Basics', publisher: publisher)

    visit books_path

    # Fill in the search field and submit the form
    within('.publisher-search-form') do
      fill_in 'publisher_name', with: 'publisher'
      click_button 'Search'
    end

    # Expectations based on the search results
    expect(page).to have_content(book.title)
    expect(page).to have_content(book.author)
    expect(page).to have_content(book.publisher.name)
  end
end

