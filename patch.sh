#!/bin/bash
PATCH_DIR=`pwd`
PROJECT=null

echo "****************************************************************"
echo "List of all patches"
echo "****************************************************************"

find . -name *.patch

echo

for i in `find . -name *.patch | sed 's|./||'`;
do
    PROJECT=`dirname $i`
    cd ../$PROJECT
    cp -r $PATCH_DIR/$PROJECT/patch01.patch .
    patch -p1 < patch01.patch $1
    rm -f patch01.patch
    cd $PATCH_DIR
done

