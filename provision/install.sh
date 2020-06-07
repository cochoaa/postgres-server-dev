#!/bin/bash
function print_out {
  echo "--------------------------------------------------"
  echo ""
  echo "$1"
  echo ""
  echo "--------------------------------------------------"
}
export DEBIAN_FRONTEND=noninteractive

export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
print_out "Instalacion de locale"
sudo locale-gen en_US.UTF-8
#sudo dpkg-reconfigure locales


print_out "Instalacion de Update"
sudo apt-get update  -y > /dev/null

print_out "Instalacion de dos2unix"
sudo apt-get install -y  dos2unix  > /dev/null
print_out "Instalacion de Postgres"
sudo apt-get install postgresql -y
#sudo apt-get install -y postgresql-server-dev-10 > /dev/null
#sudo apt-get install -y  postgresql > /dev/null

#sudo apt-get install postgresql-9.6 postgresql-contrib -y > /dev/null
#sudo  initdb > /dev/null
sudo systemctl start postgresql > /dev/null
sudo systemctl enable postgresql > /dev/null

sudo -u postgres psql -c "ALTER USER postgres WITH PASSWORD 'postgres';" > /dev/null
sudo su - postgres -c "createuser -s $(whoami)" > /dev/null
#createdb mydb > /dev/null

print_out "Creacion de Base de datos"



print_out "Configure postgresql to listen in all interfaces"
sudo sed -i "s/^#listen_addresses.*/listen_addresses = '*'/" /etc/postgresql/10/main/postgresql.conf 
sudo sh -c 'echo "host  all   all   all     password" >> /etc/postgresql/10/main/pg_hba.conf'
sudo service  postgresql restart

print_out "Fin"


