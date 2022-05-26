ARG RUBY_VERSION=3.1.2

FROM ruby:$RUBY_VERSION-alpine

RUN apk add --update --no-cache \
  bash \
  build-base \
  sudo \
  libpq-dev \
  tzdata \
  vips-dev

RUN mkdir -p /app
WORKDIR /app

RUN gem install bundler
