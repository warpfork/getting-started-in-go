Getting Started In Go
=====================

1. Install [git](http://www.git-scm.com)
1. Open a terminal 
	* (Windows users: open mysis-git bash shell!)
1. Run the following:

```text
git clone https://github.com/heavenlyhash/getting-started-in-go.git
cd getting-started-in-go
./harpoon.sh
```

**YOU HAVE BEEN HARPOONED!**

Try running `go version`.



Building & Running the Hello World
----------------------------------

We've included an example snippet that runs a tiny webserver!

To build it, run:

`go build hello.go`

To run it, just...

`./hello`

That "hello" file is a statically-linked fully self-contained webserver!
You can bring it anywhere.  There's no runtime; nothing else to install; just that file.

Here are some other interesting commands you can run:

`go fmt` <- formats all your go code in this directory.

`go test` <- runs your tests

`go test -v` <- runs your tests, and outputs progress and log statements



Resources
---------

http://golang.org/pkg/      <-   API documentation for the standard library

http://golang.org/cmd/go/   <-   `go` tool command documentation

http://golang.org/ref/spec  <-   The full syntax specification (very readable)



