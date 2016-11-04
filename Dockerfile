FROM ubuntu:16.04
MAINTAINER Matt von Rohr <matthias.vonrohr at gmail dot com>

ARG PYTHON_VERSION=3.5
ARG OPENCV_VERSION=3.1.0

RUN apt-get update && apt-get install -y build-essential cmake pkg-config \
		libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev \
		libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
		libxvidcore-dev libx264-dev \
		libgtk-3-dev \
		libatlas-base-dev gfortran \
		python${PYTHON_VERSION} python${PYTHON_VERSION}-numpy python${PYTHON_VERSION}-dev wget unzip

RUN wget -O opencv.zip https://github.com/Itseez/opencv/archive/${OPENCV_VERSION}.zip  && unzip opencv.zip && rm opencv.zip \
    && wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/${OPENCV_VERSION}.zip && unzip opencv_contrib.zip && rm opencv_contrib.zip \
    && mkdir -p /opencv-${OPENCV_VERSION}/build && cd /opencv-${OPENCV_VERSION}/build \
	&& cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D INSTALL_C_EXAMPLES=OFF \
    -D OPENCV_EXTRA_MODULES_PATH=/opencv_contrib-${OPENCV_VERSION}/modules \
    -D PYTHON_EXECUTABLE=/usr/bin/python${PYHTON_VERSION} \
    -D BUILD_EXAMPLES=ON .. \
	&& make && make install \
	&& ldconfig \
	&& cd / && rm -rf opencv-${OPENCV_VERSION} opencv_contrib-${OPENCV_VERSION}