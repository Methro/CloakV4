<<<<<<< HEAD
#! /bin/bash -eu

cd /tmp
git clone --recursive https://github.com/jupp0r/prometheus-cpp
=======
#!/bin/bash -eu
cd /tmp
git clone --recursive --depth 1 --shallow-submodules \
	https://github.com/jupp0r/prometheus-cpp
>>>>>>> 5.10.0
mkdir prometheus-cpp/build
cd prometheus-cpp/build
cmake .. \
	-DCMAKE_INSTALL_PREFIX=/usr/local \
	-DCMAKE_BUILD_TYPE=Release \
	-DENABLE_TESTING=0
make -j$(nproc)
sudo make install

