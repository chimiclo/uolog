FROM ruby:3.2

# Node.js / npm / yarn
RUN apt-get update -qq && \
    apt-get install -y curl build-essential nodejs npm postgresql-client && \
    npm install --global yarn

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bin/rails server -b 0.0.0.0"]