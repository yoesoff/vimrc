#!/bin/bash

gvm use go1.6

export GOROOT=/usr/local/go
export GOPATH=$HOME/go-learn2
export GOBIN=$GOPATH/bin
export GOSRC=$GOPATH/src
export GOPKG=$GOPATH/pkg


echo "GOROOT : " $GOROOT
echo "GOBIN  : " $GOBIN
echo "GOSRC  : " $GOSRC
echo "GOPKG  : " $GOPKG
echo "GOPATH : " $GOPATH

cd $GOPATH

PATH=$GOBIN:$PATH
