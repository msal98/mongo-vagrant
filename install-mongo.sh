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
echo "Running MongoDB provisioning script..."
mkdir -p ${CACHE}
if [ -f "${CACHE}/${ARCHIVE}" ]; then
  echo "MongoDB is already cached. Skipping download." 
else
  echo "Downloading MongoDB..."
  wget --quiet --output-document=${CACHE}/${ARCHIVE} http://fastdl.mongodb.org/linux/mongodb-linux-x86_64-2.4.9.tgz
fi
mkdir -p ${MONGODIR}
tar --gzip --extract --file=${CACHE}/${ARCHIVE} --directory=${MONGODIR}
cd ${MONGODIR} ; ln -s mongodb-linux-x86_64-2.4.9 mongo ; ls -lh
chown -R ${ACCOUNT}:${ACCOUNT} ${ACCOUNTDIR}

# signal a successful provision
touch ${DONEFILE} 
