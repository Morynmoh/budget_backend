# Use the official Ruby image with your desired version
FROM ruby:3.4.3

# Set working directory inside the container
WORKDIR /rails

# Install system dependencies needed by Rails
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  nodejs \
  yarn \
  && rm -rf /var/lib/apt/lists/*

# Install bundler
RUN gem install bundler

# Copy Gemfile and Gemfile.lock first to install gems
COPY Gemfile Gemfile.lock ./
RUN bundle install

# Copy the rest of your app
COPY . .

# 🔧 Fix Windows binstubs: normalize line endings and shebangs
RUN sed -i 's/\r$//' bin/* && \
    sed -i '1 s/ruby\.exe/ruby/' bin/* && \
    chmod +x bin/*

# Expose Rails development server port
EXPOSE 3012

# Start the Rails server in development mode, binding to all interfaces
CMD ["bin/rails", "server", "-b", "0.0.0.0"]
