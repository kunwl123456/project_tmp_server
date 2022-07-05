rm -f CMakeCache.txt
rm -rf bin
cmake -DCMAKE_BUILD_TYPE=Debug ..
make

