export prog_root=`pwd`

mkdir -p build
mkdir -p chroot
echo "Installing PHP 7.2..."
bash installer/php.sh $prog_root/install.log

#install/mysql.sh
#install
