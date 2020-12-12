#!/bin/bash
set -e
cd ~

# 1. Getting and compiling c11tester
git clone git://plrg.eecs.uci.edu/c11tester.git
cd ~/c11tester
git checkout vagrant
make clean
make
cd ..

# 2. Benchmarks
git clone git://plrg.eecs.uci.edu/c11concurrency-benchmarks.git c11tester-benchmarks
cd c11tester-benchmarks
git checkout vagrant
cp /vagrant/data/scripts/build.sh .
sh build.sh
cd ..

## Firefox
cp /vagrant/data/scripts/build_firefox_jsshell.sh .
sh build_firefox_jsshell.sh
echo >&2 "Setup is now complete. To run the benchmarks, please look at our READE.md"
