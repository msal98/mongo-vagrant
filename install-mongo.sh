#!/usr/bin/env bash

ACCOUNT=$1
DONEFILE=/var/vagrant-mongo
CACHE=/vagrant/file-cache
ARCHIVE=mongo.tar.gz
ACCOUNTDIR=/home/${ACCOUNT}
MONGODIR=${ACCOUNTDIR}/Software/Mongo

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.
echo "Downloading and unpacking mongo..."
mkdir -p ${CACHE}
if [ -f "${CACHE}/${ARCHIVE}" ]; then
  echo "Mongo already cached.  Not downloading." 
else
  echo "Downloading mongo..."
  wget --quiet --output-document=${CACHE}/${ARCHIVE} http://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.4.9.tgz
fi
mkdir -p ${MONGODIR}
tar --gzip --extract --file=${CACHE}/${ARCHIVE} --directory=${MONGODIR}
cd ${MONGODIR} ; ln -s mongodb-linux-x86_64-2.4.9 mongo ; ls -lh
chown -R ${ACCOUNT}:${ACCOUNT} ${ACCOUNTDIR}

# signal a successful provision
touch ${DONEFILE} 
