# postgres-server-dev
Servidor Postgres para ambiente de desarrollo

Dependencies
------------
* [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
* [Vagrant](https://www.vagrantup.com)

Setup
-----
* Download and install Virtual Box

* Download and install Vagrant

* Clone this repo

* Start virtual machine
```sh
cd postgres-server-dev
vagrant up
```
* Stop virtual machine
```sh
vagrant halt
```
* Delete virtual machine
```
vagrant destroy
```

* Connection to Postgres 

| user | pass |  ip |  port |
| ------ | ------ |  ------ | ------ |
| postgres | postgres | 192.168.75.76 | 5432 |

Create database and Restore your backup
---------------------------------------------------

* In Host:  Copy your backup file  to folder backup

* In Host : Login ssh
```
vagrant ssh
```
* In Guest :Create database
```
createdb mydb 
```
* In Guest : Restore database
```
sudo -u postgres psql mydb <  backup / <backup_file>
```




