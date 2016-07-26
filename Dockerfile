FROM ruby:2.3.1

# s3_website needs a JRE, as it is partially written in Scala
RUN apt-get update && \
    apt-get install -y --no-install-recommends default-jre && \
    rm -rf /var/lib/apt/lists/*

# Install gems for jeykll and s3_website
RUN gem install jekyll kramdown typogruby blankslate pygments.rb jekyll-paginate s3_website dotenv

# To save this from having to happen each time we run grunt deploy (a.k.a. s3_website push)
RUN curl -sL https://github.com/laurilehmijoki/s3_website/releases/download/v2.14.0/s3_website.jar -o /usr/local/bundle/gems/s3_website-2.14.0/s3_website-2.14.0.jar

# Install node
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y --no-install-recommends nodejs && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g grunt-cli

WORKDIR /source
