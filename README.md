# Overview
This is a simple Vagrant project that sets up a single MongoDB headless instance. I decided to spin this up while taking a free MongoDB course online, which required a running mongo server.

## Installation
1. Enable virtualization in the bios, if supported
2. Install VirtualBox
3. Install Vagrant
4. Clone this project via Git
5. Open a command shell and cd into project directory
6. Type *vagrant status* to verify your installation
7. Type *vagrant up* to begin building your Mongo VM
8. Once Vagrant has completed, log into your machine using *vagrant*/*vagrant as credentials, via ssh: *ssh vagrant@192.168.33.15*
