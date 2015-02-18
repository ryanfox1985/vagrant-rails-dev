Sets up a basic Rails development box using vagrant based on Ubuntu with RVM, Ruby 2.1.0, MySQL 5.5.

Set up a Rails development box
==============================


Enable Forwarding ssh keys
--------------------------

Setting this up is fairly straightforward. On the host machine, you need to add the following to ```~/.ssh/config``` (which you should create if it doesn’t exist):

```
host 10.0.2.15
    ForwardAgent yes
```

Once you’ve done that, just run ssh-add to ensure you ensure your identities are added to the SSH agent.

```
$ ssh-add
```

That’s all it takes. You can make sure it worked by comparing the output of ssh-add -L on both the host machine and the guest box.

```
$ ssh-add -L
```

Installation
------------

* Install vagrant using the installation instructions in the [Getting Started document](http://vagrantup.com/v1/docs/getting-started/index.html)
* Install chef-dk [Chef Development Kit](https://downloads.chef.io/chef-dk)
* Install berkshelf: ```$ vagrant plugin install vagrant-berkshelf``` [Berkshelf main web](http://berkshelf.com/)
* Install vagrant triggers: ```$ vagrant plugin install vagrant-triggers```
* Clone this repository*
* ```$ vagrant up```

Installed components
--------------------

* [RVM](https://rvm.io)
* [MySQL](http://dev.mysql.com/downloads/mysql)
* [Ruby 2.1.0](https://www.ruby-lang.org/en/news/2013/12/25/ruby-2-1-0-is-released)
