FROM ubuntu:16.04

RUN apt-get update && apt-get install -y build-essential cmake pkg-config \
		libjpeg8-dev libtiff5-dev libjasper-dev libpng12-dev \
		libavcodec-dev libavformat-dev libswscale-dev libv4l-dev \
		libxvidcore-dev libx264-dev \
		libgtk-3-dev \
		libatlas-base-dev gfortran \
		python3 python3-numpy python3-dev wget unzip

RUN wget -O opencv.zip https://github.com/Itseez/opencv/archive/3.1.0.zip  && unzip opencv.zip && rm opencv.zip \
    && wget -O opencv_contrib.zip https://github.com/Itseez/opencv_contrib/archive/3.1.0.zip && unzip opencv_contrib.zip && rm opencv_contrib.zip \
    && mkdir -p /opencv-3.1.0/build && cd /opencv-3.1.0/build \
	&& cmake -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D INSTALL_PYTHON_EXAMPLES=ON \
    -D INSTALL_C_EXAMPLES=OFF \
    -D OPENCV_EXTRA_MODULES_PATH=/opencv_contrib-3.1.0/modules \
    -D PYTHON_EXECUTABLE=/usr/bin/python3 \
    -D BUILD_EXAMPLES=ON .. \
	&& make && make install \
	&& ldconfig \
	&& cd / && rm -rf opencv-3.1.0 opencv_contrib-3.1.0