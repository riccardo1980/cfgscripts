#!/bin/sh

TAG=mp-6
DESTDIR=/opt/local/gcc/${TAG}/bin
mkdir -p ${DESTDIR} 
if [ $? -ne 0 ]; then
echo "can't create $DESTDIR"
exit 
fi

for ii in $( ls /opt/local/bin/*-${TAG} )
do 
temp=$(basename $ii)
ln -s $ii ${DESTDIR}/${temp%-${TAG}}
done
