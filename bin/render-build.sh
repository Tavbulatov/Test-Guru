#!/usr/bin/env bash
# exit on error
set -o errexit

bundle install
yarn install
yarn add @rails/webpacker
bundle exec rake assets:precompile
bundle exec rake assets:clean