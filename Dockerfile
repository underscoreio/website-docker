FROM ruby:2.3.1

# Install random stuff
RUN apt-get update && \
    apt-get install -y --no-install-recommends php5-common php5-cli php5-curl rsync default-jre && \
    rm -rf /var/lib/apt/lists/*

# Install gems
RUN gem install jekyll kramdown typogruby blankslate pygments.rb jekyll-paginate s3_website

# Install node
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y --no-install-recommends nodejs && \
    rm -rf /var/lib/apt/lists/*

RUN npm install -g grunt-cli

WORKDIR /source
