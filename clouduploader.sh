#!/bin/bash

help(){
    echo "clouduploader {from: path/file} {to: bucketname/path}"
    exit 0
}

if [ "$1" == "help" ]; then
    help
fi

aws s3 mv $1 s3://$2