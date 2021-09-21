FROM golang:latest

WORKDIR /

RUN apt update

RUN apt install -y protobuf-compiler

RUN go install google.golang.org/protobuf/cmd/protoc-gen-go@latest
RUN go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@latest

# RUN mkdir /bin
RUN mkdir /app
RUN mkdir /protos-go

COPY ./generate.sh /bin/generate.sh

RUN chmod +x /bin/generate.sh

ENTRYPOINT [ "generate.sh" ]
