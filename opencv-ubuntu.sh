#!/bin/bash

# OpenCV/build dependencies
sudo apt install cmake build-essential pkg-config libgtk3-dev libavcodec-dev libavformat-dev libswscale-dev libv4l-dev libxvidcore-dev libx264-dev libtbb2 libtbb-dev libjpeg-dev libpng-dev libtiff-dev libdc1394-dev gfortran openexr libatlas-base-dev python3-dev python3-numpy

# GStreamer install
sudo apt install libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgstreamer-plugins-bad1.0-dev gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio libcanberra-gtk-module

# Python dependencies
pip3 install numpy

# Download OpenCV source
git clone 'https://github.com/opencv/opencv'
git checkout 4.7.0
mkdir build
cd build

# Run CMake build
cmake -D PYTHON_EXECUTABLE=/usr/bin/python3 
      -D BUILD_NEW_PYTHON_SUPPORT=ON 
      -D BUILD_opencv_python3=ON 
      -D HAVE_opencv_python3=ON 
      -D WITH_TBB=ON
      -D WITH_OPENMP=ON
      -D ENABLE_LTO=ON ..
make -j8
sudo make install
