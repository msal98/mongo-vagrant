#!/usr/bin/env bash

DONEFILE=/var/vagrant-mongodb-replica-set

# make sure we are idempotent
if [ -f "${DONEFILE}" ]; then
    exit 0
fi

# Actual shell commands here.

echo "Configuring MongoDB replica set..."
mongo /vagrant/mongodb-replica-setup.js

# signal a successful provision
touch ${DONEFILE}
