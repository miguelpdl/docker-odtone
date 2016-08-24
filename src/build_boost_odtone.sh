#!/bin/bash

wget https://sourceforge.net/projects/boost/files/boost/1.61.0/boost_1_61_0.tar.gz

tar -xzvf boost_1_61_0.tar.gz

cd boost_1_61_0/tools/build/
./bootstrap.sh
./b2 install

cd ../../../odtone
b2
