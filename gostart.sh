#!/bin/bash

export GOROOT=/usr/local/go
export GOBIN=$GOROOT/bin
export PATH=$PATH:$GOBIN
export GOPATH=$HOME/go-learn2

echo "GOROOT:" $GOROOT
echo "GOBIN:" $GOBIN
echo "GOPATH:" $GOPATH

go version

cd $GOPATH
