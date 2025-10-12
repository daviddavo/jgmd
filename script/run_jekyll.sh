#!/usr/bin/env bash
set -e # halt script on error

# Build site, validate HTML
bundle exec jekyll build
bundle exec htmlproofer ./_site --disable-external --allow-hash-href --url-ignore "/./#google/"
