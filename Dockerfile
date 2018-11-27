FROM ruby:2.5.3-alpine

RUN apk update && apk add build-base nodejs postgresql-dev

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --binstubs
RUN bundle exec rake assets:precompile
RUN rails db:migrate

COPY . .

CMD puma -C config/puma.rb
