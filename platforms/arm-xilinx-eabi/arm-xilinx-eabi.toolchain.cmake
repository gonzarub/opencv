set( CMAKE_SYSTEM_NAME Generic )
set( CMAKE_SYSTEM_PROCESSOR arm )

set( CMAKE_CXX_FLAGS "-fpermissive -mcpu=cortex-a9 -mfpu=neon-fp16 -mfloat-abi=softfp -fsigned-char -O3" CACHE STRING "c++ flags")
set( CMAKE_C_FLAGS   "-fpermissive -mcpu=cortex-a9 -mfpu=neon-fp16 -mfloat-abi=softfp -fsigned-char -O3" CACHE STRING "c flags")

# Playing with software acceleration.
# set( CMAKE_CXX_FLAGS "-fpermissive -mcpu=cortex-a9 -mfpu=neon -mfpu=vfpv3 -mfloat-abi=softfp -mvectorize-with-neon-quad -ftree-vectorize -fsigned-char -Ofast" CACHE STRING "c++ flags")
# set( CMAKE_C_FLAGS   "-fpermissive -std=c99 -mcpu=cortex-a9 -mfpu=neon -mfpu=vfpv3 -mfloat-abi=softfp -mvectorize-with-neon-quad -ftree-vectorize -fsigned-char -Ofast" CACHE STRING "c flags")

add_definitions(-D__OPENCV_BAREMETAL__)

set( CMAKE_C_COMPILER arm-xilinx-eabi-gcc )
set( CMAKE_CXX_COMPILER arm-xilinx-eabi-g++ )

set( CMAKE_INSTALL_PREFIX ./install )
