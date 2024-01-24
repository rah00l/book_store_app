# spec/features/search_books_spec.rb

require 'rails_helper'

RSpec.feature 'Search Books' do
  scenario 'User searches for books by title' do
    book = FactoryBot.create(:book, title: 'Ruby Basics')

    visit books_path

    # Fill in the search field and submit the form
    within('.book-search-form') do
      fill_in 'query', with: 'Ruby Basics'
      click_button 'Search'
    end


    # Expectations based on the search results
    expect(page).to have_content(book.title)
    expect(page).to have_content(book.author)
  end

  scenario 'User searches for books by title' do
    book = FactoryBot.create(:book, title: 'Ruby Basics')

    visit books_path

    # Fill in the search field and submit the form
    within('.book-search-form') do
      fill_in 'query', with: 'Ruby Basics'
      click_button 'Search'
    end


    # Expectations based on the search results
    expect(page).to have_content(book.title)
    expect(page).to have_content(book.author)
  end
end

