FROM debian:buster

RUN apt-get update \
    && apt-get install -y gprbuild \
                          gnat \
                          wget \
                          unzip \
                          make

RUN wget https://github.com/mk270/whitakers-words/archive/master.zip \
    && unzip master.zip -d /words

WORKDIR /words/whitakers-words-master

RUN make 

ENTRYPOINT /words/whitakers-words-master/bin/words

