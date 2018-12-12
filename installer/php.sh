# assume we are at the proj_root
echo "[php] Preparing environment..."
cd $prog_root
mkdir -p chroot
pwd
cd build
rm -rf php
mkdir -p php
cd php
echo "[php] Downloading php..."
wget http://am1.php.net/distributions/php-7.2.13.tar.gz  1>$1 2>&1
tar -zxvf php-7.2.13.tar.gz  1>$1 2>&1
cd php-7.2.13
#install libxml
yum install libxml2-devel   1>$1 2>&1
echo "[php] Configuring php..."
./configure --prefix=$proj_root/chroot --with-openssl=shared --enable-bcmath --enable-mbstring --enable-pcntl --with-pdo-mysql --enable-sockets --enable-zip   1>$1 2>&1
echo "[php] Compiling php..."
make -j 4   1>$1 2>&1
echo "[php] Installing php..."
make install   1>$1 2>&1
echo "export PATH=\$PATH:$prog_root/chroot/bin/" >> $prog_root/env.sh

