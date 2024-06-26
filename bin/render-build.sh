#!/usr/bin/env bash
# Exit on error
set -o errexit

# Install dependencies
bundle install

# Prepare the database (create and migrate)
bundle exec rails db:prepare

# Precompile assets
bundle exec rails assets:precompile
bundle exec rails assets:clean
