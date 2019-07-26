#!/bin/bash
#set -m
# if start for the first time, initialize the db
if [ ! -f "/db/already-init-db" ] ; then
    touch /db/already-init-db
    mongorestore -h localhost -d leanote --dir /leanote/mongodb_backup/leanote_install_data/
fi

# if user-customized leanote's app.conf isn't mounted externally, use backup (the original config)
if [ ! -f "/leanote/conf/app.conf" ] ; then
    cp /leanote_app_backup.conf /leanote/conf/app.conf
fi
