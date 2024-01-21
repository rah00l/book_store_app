# Book Store App

[![Build Status](https://travis-ci.org/yourusername/yourproject.svg?branch=master)](https://travis-ci.org/yourusername/yourproject)
[![Coverage Status](https://coveralls.io/repos/github/yourusername/yourproject/badge.svg?branch=master)](https://coveralls.io/github/yourusername/yourproject?branch=master)


## Description:

   The Book Store App simplifies book discovery for customers. It enables searches by author, title, or publisher, providing comprehensive details, even for out-of-stock items. The app seamlessly integrates a local database with online catalogs for a complete search experience.

## Table of Contents:
   - [Usage](#usage)
   - [Documentation](#documentation)

## Installation:
   Make sure you have Ruby (ruby-3.0.0) installed. Then run the following commands:

   ```bash
   git clone https://github.com/rah00l/book_store_app.git
   cd book_store_app
   bundle install

   ruby src/book_store_app.rb
   ```

## Usage:
   #### 1. Search for Books by Title or Author:

   To search for books based on title or author, follow these steps:

   ```bash
   ruby src/book_store_app.rb
   ```

   You will be presented with the Book Store App menu:

   ```bash
   :::::::::: Book Store App :::::::::::
   1. Search for Books by Title or Author:
   2. Display Book Details:
   3. Buy a Book:
   4. Place an Order for Out-of-Stock Book:
   5. Search by Publisher:
   6. Exit
   ```

   Choose option `1` to initiate a search. Enter the title or author of the book you are searching for, e.g., "ruby."

   ```bash
   1
   Enter the *title or author* of the book you are **searching** for: 
   ruby
   ```

   Matching books will be displayed:

   ```bash
   Matching books:
   - Ruby Basics by John Doe
   ```

   #### 2. Display Book Details:

   To view details of a specific book, select option `2` from the main menu. Enter the title of the book you want to view, e.g., "ruby."

   ```bash
   2
   Enter the *title* of the book you want to **view**: 
   ruby
   ```

   The app will show the details of the selected book:

   ```bash
   Book Details:
   - Title: Ruby Basics
   - Author: John Doe
   - Description: A guide to Ruby programming
   - Price: $29.99
   - Availability: Available
   ```

   Repeat these steps for other actions like buying a book, placing an order for an out-of-stock book, searching by publisher, or exiting the application.

## Documentation:
   - Links to external documents (Architecture doc, SSD, CRC, UML PDFs).
   - Architecture: [Architecture Document](https://github.com/rah00l/book_store_app/blob/af28cc7cdbb268d23f3bf30e567fdfc34a181903/docs/BSA%20-%20Architecture.pdf)
   - Usecases: [Usecases Document](https://github.com/rah00l/book_store_app/blob/af28cc7cdbb268d23f3bf30e567fdfc34a181903/docs/BSA%20-%20Use%20Cases.pdf)
   - SSD/CRC: [SSD/CRC Document](https://github.com/rah00l/book_store_app/blob/af28cc7cdbb268d23f3bf30e567fdfc34a181903/docs/BSA%20-%20SSD%20diagrams.pdf)
   - UML: [UML Document](https://github.com/rah00l/book_store_app/blob/af28cc7cdbb268d23f3bf30e567fdfc34a181903/docs/BSA%20-%20UML%20Diagram.pdf)
   - Execution and Test cases output: [Execution and Test cases output](https://github.com/rah00l/book_store_app/blob/af28cc7cdbb268d23f3bf30e567fdfc34a181903/docs/BSA%20-%20App%20Exec%20and%20Test%20case%20Output.pdf)
