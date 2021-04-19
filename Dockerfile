FROM ruby:latest
LABEL org.opencontainers.image.source https://github.com/adrubesh/rails-test
RUN curl -fsSL https://deb.nodesource.com/setup_15.x | bash -
 
RUN apt-get update; \
    apt-get install --no-install-recommends \
    build-essential \
    sqlite3 \
    nodejs

RUN npm install --global yarn

RUN gem install rails

WORKDIR /app

COPY Gemfile .
COPY Gemfile.lock  .

RUN bundle install 
RUN rails assets:precompile

COPY . .

CMD ["rails", "server", "-b", "0.0.0.0"]




