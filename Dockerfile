FROM ruby:buster

ENV LUV_HEADERS_FILE /headers/southwest-headers.json
ENV LUV_DOTENV /.autoluv.env

WORKDIR /app

ADD ./.git /app/.git
ADD ./.gitignore /app/.gitignore
ADD ./LICENSE.txt /app/LICENSE.txt
ADD ./README.md /app/README.md
ADD ./bin /app/bin
ADD ./data /app/data
ADD ./lib /app/lib
ADD ./autoluv.gemspec /app/autoluv.gemspec
ADD ./Gemfile /app/Gemfile
ADD ./Rakefile /app/Rakefile
ADD ./autoluv.sh /app/autoluv.sh

RUN chmod +x /app/autoluv.sh

RUN apt-get update && apt-get install at -y

RUN ls -al

RUN gem build
RUN gem install autoluv-0.3.1.gem

ENTRYPOINT ["./autoluv.sh"]
CMD ["schedule", "ABCDEF", "John", "Doe"]