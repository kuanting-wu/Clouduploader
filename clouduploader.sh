#!/bin/bash

help(){
    echo "clouduploader {from: path/file} {to: bucketname/path}"
    exit 0
}

if [ -f "$1" ]; then
    aws s3 cp $1 s3://$2

elif [ "$1" == "help" ]; then
    help

else
    echo "file not found"
fi


