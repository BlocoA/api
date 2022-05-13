#! /bin/bash
set -e

bundle install

[ -e tmp/pids/server.pid ] && rm tmp/pids/server.pid

bundle exec rails db:prepare
bundle exec rails server -p 3000 -b 0.0.0.0
