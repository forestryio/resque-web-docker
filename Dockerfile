FROM ruby:2.6.6-buster

ENV RAILS_SERVE_STATIC_FILES=true
ENV RAILS_LOG_TO_STDOUT=true

WORKDIR /app
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundle install

COPY . /app

RUN bundle exec rails assets:precompile

EXPOSE 9292
ENTRYPOINT ["bundle", "exec", "rails", "s"]