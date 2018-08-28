#!/bin/bash

echo "installing open cobol dependencies ..."

yum -y install gmp gmp-devel libtool ncurses ncurses-devel ncurses-libs libdbi libdbi-devel libtool-ltdl libtool-ltdl-devel db4 db4-devel gcc-c++ make wget

echo "downloading and expanding open cobol ..."
cd /opt 
wget http://ftp.gnu.org/gnu/gnucobol/gnucobol-2.2.tar.gz
tar -xzvf gnucobol-2.2.tar.gz 
cd gnucobol-2.2

echo "building and installing open cobol ..."
./configure  --without-db
make 
make install 

echo "building hello.cbl ... "
echo "/usr/local/lib" > /etc/ld.so.conf.d/gnu-cobol-1.1.conf
ldconfig

cd $UPLOADS_DIR
/opt/gnucobol-2.2/cobc/cobc -x hello.cbl 

mv hello /
