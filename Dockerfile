# Use the official Ruby image as a base image
FROM ruby:3.1.0

# Install dependencies
RUN apt-get update -qq && apt-get install -y nodejs

# Set the working directory
WORKDIR /myapp

# Copy the Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the application code
COPY . ./

# Precompile assets for production (optional)
# RUN bundle exec rake assets:precompile

# Expose the port the app runs on
EXPOSE 3000

# Specify the command to run the application
CMD ["rails", "server", "-b", "0.0.0.0"]
