#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install

bundle exec rails db: drop
bundle exec rails db: create
bundle exec rails db: migrate



bundle exec rails assets:precompile
bundle exec rails assets:clean