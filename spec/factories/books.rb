# spec/factories/books.rb

FactoryBot.define do
  factory :book do
    author { 'John Doe' }
    title { 'Sample Title' }
    # Add other attributes as needed
  end
end
