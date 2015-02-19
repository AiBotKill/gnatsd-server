FROM ubuntu

RUN apt-get update -q

RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy build-essential curl git

RUN curl -s https://storage.googleapis.com/golang/go1.3.src.tar.gz | tar -v -C /usr/local -xz

RUN cd /usr/local/go/src && ./make.bash --no-clean 2>&1

RUN mkdir -p /go

ENV PATH /usr/local/go/bin:/go/bin:$PATH

ENV GOPATH /go

WORKDIR /go

ADD gnatsd.conf /go/

RUN go get  github.com/apcera/gnatsd

EXPOSE 4223

CMD ./bin/gnatsd -D -c /go/gnatsd.conf
