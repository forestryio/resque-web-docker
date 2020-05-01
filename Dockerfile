FROM ruby:2.6.6-buster

WORKDIR /app
COPY Gemfile Gemfile
COPY Gemfile.lock Gemfile.lock
RUN gem install bundler
RUN bundle install

COPY config.ru config.ru

EXPOSE 9292
ENTRYPOINT ["bundle", "exec", "rackup", "-o", "0.0.0.0"]