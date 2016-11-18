from ubuntu:trusty

run echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

run apt-get update && apt-get upgrade -y && apt-get install -y apt-utils
run apt-get install -y \
	virtualenvwrapper python2.7-dev \
	build-essential libxml2-dev libxslt1-dev git libffi-dev \
	cmake libreadline-dev libtool debootstrap debian-archive-keyring \
	libglib2.0-dev libpixman-1-dev qt4-default qt4-qmake qtchooser \
	libcgraph6 libgraphviz-dev vim mc

run useradd -s /bin/bash -m angr
run su -l angr -c "git clone https://github.com/angr/angr-dev && cd angr-dev && ./setup.sh -E angr"
run su -l angr -c "echo 'workon angr' >> /home/angr/.bashrc"
cmd su -l angr
