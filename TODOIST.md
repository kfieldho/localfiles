# Installing Todoist CLI

The [Todoist](http://www.todoist.com) [CLI](https://github.com/sachaos/todoist) by [@sachaos](https://github.com/sachaos) is written in [Go](https://golang.org/) and thus
requires some setup.

## Go Development Environment

The CLI requires the use of [dep](https://github.com/golang/dep) and experimental dependency manager for Go, which requires Go Version 1.8 or newer to compile.

On Ubuntu 16.04, the easiest way to get an updated Go is through a PPA:

	$ sudo add-apt-repository ppa:longsleep/golang-backports
	$ sudo apt-get install golang-go

## Installing Dep

You'll need to create a GOPATH workspace:

	$ mkidr ~/GO
	$ export GOPATH=~/GO

Then, you can install dep with `go get`:

	$ go get -u github.com/golang/dep/cmd/dep

## Installing TODOIST CLI

Now, clone the Todoist Repository into `${GOPATH}/src`:

	$ mkdir ~/GO/src
	$ cd ~/GO/src
	$ git clone https://github.com/sachaos/todoist.git 
	$ cd todoist
	$ make install

This will install the TODOIST CLI tool `todoist`, into `${GOPATH}/bin`

The first time you run it you will be asked for the API Token for your account.  It can be found on `Settings/Integrations` in the web app.
