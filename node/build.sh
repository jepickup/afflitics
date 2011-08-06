#!/bin/bash

clear

coffee -o app/ -c src/

cd app

nodeunit test

cd ..