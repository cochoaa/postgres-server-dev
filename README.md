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
---------------------------------------

* Install  plugin scp

```
vagrant plugin install vagrant-scp
```

* Copy your backup file  to vagrant home
```
vagrant scp <backup_file>  :~/
```

* Login ssh

```
vagrant ssh
```

* If you use windows

```
dos2unix  <backup_file>
```

* Create database

```
createdb mydb 
```
* Restore database

```
sudo -u postgres psql mydb < <backup_file>
```




