#!/bin/bash
set -e
set -x

# Configuration
GEXF_BASE_DIR=$(pwd)

PACKAGEPATH=$(realpath $1)
TARGETDIR=$(realpath $2)
ORIG_DIR=$(pwd)
TEMPDIR=/tmp
PACKAGE_BASENAME=$(basename $PACKAGEPATH)
PACKAGE_NAME=${PACKAGE_BASENAME%%.*}
INSTALLED_PATH=$TARGETDIR/$PACKAGE_NAME

cd $TARGETDIR
tar -xzf $PACKAGEPATH

ln -s $GEXF_BASE_DIR/config.js $INSTALLED_PATH
ln -s $GEXF_BASE_DIR/img $INSTALLED_PATH
ln -s $GEXF_BASE_DIR/index.html $INSTALLED_PATH
ln -s $GEXF_BASE_DIR/js $INSTALLED_PATH
ln -s $GEXF_BASE_DIR/styles $INSTALLED_PATH

cd $INSTALLED_PATH
ln -s $(find . -maxdepth 1 -name "*.gexf") index.gexf
ln -s $(find . -maxdepth 1 -name "*.json") index.json

cd $ORIG_DIR
