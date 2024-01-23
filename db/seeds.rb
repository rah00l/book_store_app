# db/seeds.rb

# Seed data for publishers
Publisher.create([
  { name: 'Publisher1', catalog_home: 'http://publisher1.com', catalog_search: 'http://publisher1.com/search?q=' },
  { name: 'Publisher2', catalog_home: 'http://publisher2.com', catalog_search: 'http://publisher2.com/search?q=' },
  { name: 'Publisher3', catalog_home: 'http://publisher3.com', catalog_search: 'http://publisher3.com/search?q=' },
  { name: 'Publisher4', catalog_home: 'http://publisher4.com', catalog_search: 'http://publisher4.com/search?q=' },
  { name: 'Publisher5', catalog_home: 'http://publisher5.com', catalog_search: 'http://publisher5.com/search?q=' }
])

# Seed data for books
Book.create([
  { title: 'Ruby Basics', author: 'John Doe', description: 'A guide to Ruby programming', price: 29.99, publisher_id: 1, availability: true },
  { title: 'Web Development', author: 'Jane Smith', description: 'Building web applications with Ruby on Rails', price: 39.99, publisher_id: 2, availability: false },
  { title: 'Rails in Practice', author: 'Alice Johnson', description: 'Practical examples of using Ruby on Rails', price: 34.99, publisher_id: 3, availability: true },
  { title: 'JavaScript Mastery', author: 'Bob Brown', description: 'Mastering JavaScript for web development', price: 49.99, publisher_id: 4, availability: true },
  { title: 'Python for Beginners', author: 'Eva White', description: 'Learn Python programming from scratch', price: 27.99, publisher_id: 5, availability: true },
  { title: 'Data Science Essentials', author: 'David Miller', description: 'An essential guide to data science concepts', price: 45.99, publisher_id: 1, availability: false }
])
