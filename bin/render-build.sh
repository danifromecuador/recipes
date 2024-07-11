#!/usr/bin/env bash
# exit on error
set -o errexit

# Install dependencies
bundle install

# Precompile assets
bundle exec rake assets:precompile

# Clean up assets
bundle exec rake assets:clean

# Drop, create, and migrate the database
bundle exec rails db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1
bundle exec rails db:create
bundle exec rails db:schema:load
bundle exec rails db:migrate