#!/usr/bin/env bash


cp -r ../node_modules/.pnpm node_modules/
links=$(find node_modules/ -path node_modules/.pnpm -prune -o -type l -print)
for link in $links
do
    reltarget=$(readlink "$link")
    newtarget=$(echo $reltarget | sed -e 's/..\/..\/node_modules\///g')

    rm -fv "$link"
    ln -s $newtarget $link
done
