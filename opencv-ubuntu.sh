#!/bin/bash

# OpenCV/build dependencies
sudo apt install cmake build-essential pkg-config libgtk3-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-dev gfortran openexr libatlas-base-dev python3-dev python3-numpy

# GStreamer install
sudo apt install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio libcanberra-gtk-module

# Python dependencies
pip3 install numpy

# Download OpenCV source
git clone 'https://github.com/opencv/opencv'
cd opencv
git checkout 4.7.0

# Run CMake build
cmake -S . -B build -DPYTHON_EXECUTABLE=/usr/bin/python3 -DBUILD_NEW_PYTHON_SUPPORT=ON -DBUILD_opencv_python3=ON -DHAVE_opencv_python3=ON -DWITH_TBB=ON -DWITH_OPENMP=ON -DENABLE_LTO=ON -DCMAKE_INSTALL_PREFIX=./installdir
sudo cmake --build build --target install
