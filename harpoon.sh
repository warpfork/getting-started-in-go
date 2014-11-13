#!/bin/bash
#
#  Land a complete go toolchain and development environment on this computer.
#
#  Works for:
#   - linux,
#   - mac,
#   - and windows (presuming a sane bash environment; msysgit recommended).
#
set -e

if [ ! -d go ]; then
	# detect system
	go_Version="1.4beta1"
	os="$(uname -s | tr 'A-Z' 'a-z')"
	arch="$(uname -m | awk '/^x86_64$$/{print "amd64"}/^x86$$/{print "386"}')"
	xtra="$(sw_vers 2>/dev/null | awk '/^ProductVersion/{print $$2}' | sed 's/^10\.\([0-9]\+\)\..\+$$/\1/' | awk '/6|7/{print "-osx10.6"}/8|9/{print "-osx10.8"}')"

	# fetch go toolchain
	echo "fetching go toolchain..." >&2
	curl -o go.tar.gz "https://storage.googleapis.com/golang/go${go_Version}.${os}-${arch}${xtra}.tar.gz" || \
	wget -O go.tar.gz "https://storage.googleapis.com/golang/go${go_Version}.${os}-${arch}${xtra}.tar.gz"

	# unpack
	echo "unpacking..." >&2
	tar xzf go.tar.gz
fi

# become as a gopher
echo "spawning a new shell..." >&2
exec bash --init-file <(
cat << EOF
. ~/.bashrc
export GOPATH="$PWD/.gopath"
export GOROOT="$PWD/go"
export PATH="$PWD/go/bin:$PATH"
echo "everything is ready!"
EOF
)
