#!/bin/bash

help(){
    echo "clouduploader {from: -f path/file} {to: -t bucketname/path}" 1>&2;
    exit 1;
}

while getopts "f:t:" arg; do
    case $arg in
        f)
        if [ -f "$OPTARG" ]; then
            multi+=("$OPTARG")
        else
            echo "$OPTARG file not found"
        fi
        ;;
        t)
        to=$OPTARG;;
        ?)
        help;;
    esac
done

for val in "${multi[@]}"; do
    aws s3 cp $val s3://$to
done




