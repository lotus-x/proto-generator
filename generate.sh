#!/bin/bash

if [[ $1 = go ]]; then
    cd /protos-go
    go mod init github.com/lotus-x/docme/protos-go
    protoc --go_out=. --go_opt=paths=source_relative --go-grpc_out=. --go-grpc_opt=paths=source_relative -I /app $(find /app -iname "*.proto")
    go mod tidy
else
    echo No language provided
fi
