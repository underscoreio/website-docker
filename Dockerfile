FROM ruby:2.3.1

ENV JEKYLL_VER     3.2.1
ENV S3_WEBSITE_VER 2.15.1

# s3_website needs a JRE, as it is partially written in Scala
RUN apt-get update && \
    apt-get install -y --no-install-recommends default-jre && \
    rm -rf /var/lib/apt/lists/*

# Install gems for jeykll and s3_website
RUN gem install jekyll:${JEKYLL_VER} kramdown typogruby blankslate pygments.rb jekyll-paginate s3_website:${S3_WEBSITE_VER} dotenv

# Install node
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y --no-install-recommends nodejs && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g grunt-cli

# To save this from this running during grunt deploy (a.k.a. s3_website push)
RUN curl -sL https://github.com/laurilehmijoki/s3_website/releases/download/v${S3_WEBSITE_VER}/s3_website.jar -o /usr/local/bundle/gems/s3_website-${S3_WEBSITE_VER}/s3_website-${S3_WEBSITE_VER}.jar

WORKDIR /source
