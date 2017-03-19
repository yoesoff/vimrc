#!/bin/bash

export GOROOT=/usr/local/go
export GOBIN=$GOROOT/bin
export GOSRC=$GOROOT/src
export GOPKG=$GOROOT/pkg
export PATH=$PATH:$GOBIN
export GOPATH=$HOME/go-learn2

echo "GOROOT : " $GOROOT
echo "GOBIN  : " $GOBIN
echo "GOSRC  : " $GOSRC
echo "GOPKG  : " $GOPKG
echo "GOPATH : " $GOPATH

echo "GO Version : " go version

cd $GOPATH
