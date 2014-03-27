# Overview
This is a simple Vagrant project that sets up a single MongoDB headless instance. I decided to spin this up while taking a free MongoDB course online, which required a running mongo server. Note that MongoDB is downloaded and unpacked, but not started. The course I'm taking requires various replica set configurations, multiple mongod instances, etc. so it did not make sense to start mongo as a service.

## Installation
1. enable virtualization in the bios, if supported
2. install [VirtualBox](https://www.virtualbox.org/)
3. install [Vagrant](http://www.vagrantup.com/)
4. clone this project via Git
5. open a command shell and cd into the project directory
6. type *vagrant status* to verify your installation
7. type *vagrant up* to begin building your Mongo VM
8. once Vagrant has completed, log into your machine via ssh: *ssh vagrant@192.168.33.15* - The default password is *vagrant*
