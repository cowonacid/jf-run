#!/bin/bash

docker build -t chadmoon/jf-run:latest .

#Jenkinsfile is at /Jenkinsfile

docker run --rm -v $PWD/Jenkinsfile:/Jenkinsfile chadmoon/jf-run:latest /groovy.sh > jf.groovy; groovy jf.groovy; rm jf.groovy