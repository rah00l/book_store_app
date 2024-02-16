# spec/features/view_book_details_spec.rb

require 'rails_helper'

RSpec.feature 'View Book Details', type: :feature do
  let!(:book) { FactoryBot.create(:book, title: 'Ruby Basics', author: 'John Doe', description: 'A guide to Ruby programming', price: 29.99, publisher: FactoryBot.create(:publisher, name: 'Publisher1'), availability: false) }

  scenario 'User views the details of a book' do
    visit book_path(book)

    expect(page).to have_content('Ruby Basics')
    expect(page).to have_content('Author: John Doe')
    expect(page).to have_content('Description: A guide to Ruby programming')
    expect(page).to have_content('Price: $29.99')
    expect(page).to have_content('Publisher: Publisher1')
    expect(page).to have_link('Back to Books', href: books_path)
  end
end
