#!/bin/sh

CHROOT=$PWD
CP="cp -i"

# make dir structure
mkdir -p $CHROOT/etc	
mkdir -p $CHROOT/lib64	
mkdir -p $CHROOT/usr/lib64	
mkdir -p $CHROOT/usr/bin	
mkdir -p $CHROOT/usr/local	
mkdir -p $CHROOT/usr/libexec/openssh	
mkdir -p $CHROOT/dev	


# copy executables
$CP /usr/bin/scp $CHROOT/usr/bin/scp
$CP /usr/libexec/openssh/sftp-server $CHROOT/usr/libexec/openssh/sftp-server
$CP /usr/libexec/rssh_chroot_helper $CHROOT/usr/libexec/rssh_chroot_helper

# copy group passwd
$CP /etc/passwd $CHROOT/etc/passwd
$CP /etc/group $CHROOT/etc/group


# copy required libraries  
$CP /lib64/libcrypto.so.6 /lib64/libutil.so.1 /lib64/libz.so.1 /lib64/libnsl.so.1 \
	/lib64/libcrypt.so.1 /lib64/libresolv.so.2 /lib64/libcom_err.so.2 /lib64/libc.so.6 \
        /lib64/libdl.so.2 /lib64/libkeyutils.so.1 /lib64/libpthread.so.0 /lib64/ld-linux-x86-64.so.2 \
        /lib64/libselinux.so.1 /lib64/libsepol.so.1  /lib64/libnss_compat.so.2 $CHROOT/lib64

$CP /usr/lib64/libgssapi_krb5.so.2 /usr/lib64/libkrb5.so.3 /usr/lib64/libk5crypto.so.3 \
        /usr/lib64/libnss3.so /usr/lib64/libkrb5support.so.0 /usr/lib64/libnssutil3.so \
        /usr/lib64/libplc4.so /usr/lib64/libplds4.so /usr/lib64/libnspr4.so $CHROOT/usr/lib64
 
# ld-related config files
$CP -r /etc/ld.so* $CHROOT/etc 

# /dev/null
mknod -m 666 /sftp/dev/null c 1 3
