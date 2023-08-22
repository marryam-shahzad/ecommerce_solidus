# Use the official Ruby image
FROM ruby:3.0.0

# Set the working directory inside the container
WORKDIR /app

# Copy the Gemfile and Gemfile.lock to the container
COPY Gemfile Gemfile.lock ./

# Install gems using Bundler
RUN bundle install

# Copy the rest of your Rails app's files to the container
COPY . .

# Expose the port your Rails app runs on (default is 3000)
EXPOSE 3000

# Start the Rails server when the container runs
CMD ["rails", "server", "-b", "0.0.0.0"]
