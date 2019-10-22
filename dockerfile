FROM debian:latest

RUN apt-get update \
    && apt-get install -y gnat-8 \
                          wget \
                          unzip 

RUN wget http://archives.nd.edu/whitaker/wordsall.zip \
    && unzip -x wordsall.zip -d /words

WORKDIR /words

# these commands are from https://aur.archlinux.org/packages/latin-words/
RUN gnatmake -O3 words \
    && gnatmake makedict && echo "g" | ./makedict \
    && gnatmake makestem && echo "g" | ./makestem \
    && gnatmake makeefil && ./makeefil \
    && gnatmake makeinfl && ./makeinfl

ENTRYPOINT /words/words

