# This single-line shell script encapsulates trimming options for
# OpenCV library when built for xilinx-zync processopr
#
# Do the following in this directory.
# (1) Download eigen-3.2.5 from http://eigen.tuxfamily.org/
#     Unzip and rename accordingly -> eigen-3.x.x
#     Make sure it is the same directory name used for EIGEN_INCLUDE_PATH
#
# (2) Load Xilinx SDK environment:
#    $ source /opt/Xilinx/SDK/2014.4/settings64.sh
#
# (3) Create builld directory, cd into it and do
#    $ mkdir build-zynq
#    $ cd build-zynq
#    $ sh ../build-zync.sh
#    $ make -j4

SDK_ENV=/opt/Xilinx/SDK/2015.2/settings64.sh
TOOLCHAIN_CMAKE=../arm-xilinx-eabi.toolchain.cmake
INSTALL_PATH=./install
BUILD_DIR=build
EIGEN_VER=3.2.5
EIGEN_DOWNLOAD=http://bitbucket.org/eigen/eigen/get/${EIGEN_VER}.tar.bz2

# Get eigen library if not available
if [ ! -d ./eigen-$EIGEN_VER ]; then
    echo "Didn't find ./eigen-$EIGEN_VER ..."
    if [ ! -f ${EIGEN_VER}.tar.bz2 ]; then
        echo "Didn't find ${EIGEN_VER}.tar.bz2. Downloading..."
        wget $EIGEN_DOWNLOAD
    fi
    echo "Uncompressing ${EIGEN_VER}.tar.bz2, and rename..."
    tar -xjvf ${EIGEN_VER}.tar.bz2
    mv eigen-eigen-* eigen-${EIGEN_VER}
fi

# Create directory or clean it out
if [ ! -d ./$BUILD_DIR ]; then
    echo "New build directory: '$BUILD_DIR'"
    mkdir ./$BUILD_DIR
else
    echo "Clean build directory: '$BUILD_DIR'"
    rm -rf ./$BUILD_DIR/*
fi

if [ "$SDK_ENV" != "" ] && [ -f $SDK_ENV ]; then
    echo "Loading SDK environment: $SDK_ENV"
    # sdk-gcc environment (if any)
    source $SDK_ENV
fi

# cmake and build
cd $BUILD_DIR
cmake -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_TOOLCHAIN_FILE=$TOOLCHAIN_CMAKE \
	-D CMAKE_INSTALL_PREFIX=$INSTALL_PATH \
        -D EIGEN_INCLUDE_PATH=../eigen-${EIGEN_VER} \
        -D WITH_PARALLEL_PF=OFF \
        -D ENABLE_PRECOMPILED_HEADERS=OFF \
	-D INSTALL_C_EXAMPLES=OFF \
	-D INSTALL_PYTHON_EXAMPLES=OFF \
        -D BUILD_PYTHON_SUPPORT=OFF \
	-D BUILD_EXAMPLES=OFF \
        -D BUILD_CUDA_STUBS=OFF \
        -D BUILD_DOCS=OFF \
        -D BUILD_EXAMPLES=OFF \
        -D BUILD_JASPER=OFF \
        -D BUILD_JPEG=OFF \
        -D BUILD_OPENEXR=OFF \
        -D BUILD_PERF_TESTS=OFF \
        -D BUILD_PNG=OFF \
        -D BUILD_SHARED_LIBS=OFF \
        -D BUILD_TBB=OFF \
        -D BUILD_TESTS=OFF \
        -D BUILD_TIFF=OFF \
        -D BUILD_WITH_DYNAMIC_IPP=OFF \
        -D BUILD_ZLIB=OFF \
        -D BUILD_opencv_apps=OFF \
        -D BUILD_opencv_calib3d=OFF \
        -D BUILD_opencv_features2d=OFF \
        -D BUILD_opencv_flann=OFF \
        -D BUILD_opencv_highgui=OFF \
        -D BUILD_opencv_ml=OFF \
        -D BUILD_opencv_nonfree=OFF \
        -D BUILD_opencv_objdetect=OFF \
        -D BUILD_opencv_photo=OFF \
        -D BUILD_opencv_shape=OFF \
        -D BUILD_opencv_stitching=OFF \
        -D BUILD_opencv_superres=OFF \
        -D BUILD_opencv_ts=OFF \
        -D BUILD_opencv_video=OFF \
        -D BUILD_opencv_videoio=OFF \
        -D BUILD_opencv_videostab=OFF \
        -D BUILD_opencv_world=OFF \
        -D WITH_CLP=OFF         \
        -D WITH_CUBLAS=OFF \
        -D WITH_CUDA=OFF \
        -D WITH_CUFFT=OFF \
        -D WITH_FFMPEG=OFF \
        -D WITH_GDAL=OFF \
        -D WITH_GIGEAPI=OFF \
        -D WITH_GSTREAMER_0_10=OFF \
        -D WITH_JASPER=OFF \
        -D WITH_JPEG=OFF \
        -D WITH_NVCUVID=OFF \
        -D WITH_OPENCL=OFF \
        -D WITH_OPENCLAMDBLAS=OFF \
        -D WITH_OPENCLAMDFFT=OFF \
        -D WITH_OPENCL_SVM=OFF \
        -D WITH_OPENEXR=OFF \
        -D WITH_OPENGL=OFF \
        -D WITH_OPENMP=OFF \
        -D WITH_OPENNI=OFF \
        -D WITH_OPENNI2=OFF \
        -D WITH_PNG=OFF \
        -D WITH_PTHREADS_PF=OFF \
        -D WITH_PVAPI=OFF \
        -D WITH_QT=OFF \
        -D WITH_TBB=OFF \
        -D WITH_TIFF=OFF \
        -D WITH_VTK=OFF \
        -D WITH_WEBP=OFF \
        -D WITH_XIMEA=OFF \
        -D WITH_IPP=OFF \
        ../../../
make -j4 VERBOSE=1
