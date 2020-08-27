FROM jekyll/jekyll:4.0
LABEL maintainer="Pedro Rodrigues <pir.pedro@gmail.com"

RUN apk add --no-cache --virtual .build-deps \
        autoconf \
        libtool \
        nasm \
        automake \
        graphicsmagick

ARG ALGOLIA_API_KEY
WORKDIR /srv/jekyll
COPY Gemfile Gemfile.lock ./
COPY . .
RUN bundle install --jobs 20 --retry 5

#RUN pip3 install awscli \
#         awscli-plugin-endpoint

CMD bundle exec jekyll build