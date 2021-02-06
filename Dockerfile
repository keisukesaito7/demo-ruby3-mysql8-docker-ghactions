FROM ruby:3.0.0

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update -qq && \
    apt-get install -y nodejs yarn && \
    mkdir /demo-ruby3-mysql8-ghactions
    
WORKDIR /demo-ruby3-mysql8-ghactions
COPY Gemfile /demo-ruby3-mysql8-ghactions/Gemfile
COPY Gemfile.lock /demo-ruby3-mysql8-ghactions/Gemfile.lock
RUN gem install bundler:2.1.4 && \
    bundle install
COPY . /demo-ruby3-mysql8-ghactions

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT [ "entrypoint.sh" ]
EXPOSE 3000

CMD [ "rails", "server", "-b", "0.0.0.0" ]