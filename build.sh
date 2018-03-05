#!/usr/bin/env bash

# Build Steps
# 1. update version number in `gotop.go` and `install.sh`
# 2. run this script
# 3. publish binaries on GitHub
# 4. delete `builds` folder
# 5. push changes to GitHub

VERSION=$(go run gotop.go -v)

mkdir builds
cd builds

env GOOS=darwin GOARCH=amd64 go build ../
tar czf gotop-$VERSION-darwin_amd64.tgz gotop
rm gotop

env GOOS=linux GOARCH=386 go build ../
tar czf gotop-$VERSION-linux_386.tgz gotop
rm gotop

env GOOS=linux GOARCH=amd64 go build ../
tar czf gotop-$VERSION-linux_amd64.tgz gotop
rm gotop