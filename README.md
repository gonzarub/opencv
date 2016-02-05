### OpenCV: Baremetal implementation

This branch (3.0.0/arm-baremetal) attempts to trim vanilla OpenCV
implementation for builds on so called *bare metal* environments,
where a fully featured Operating System is not available.

This is experimental code, with no formal study of the impact on
performance or accuracy. Use it at your own risk.

#### Build instructions

Two new platform files are added:

- platforms/arm-xilinx-eabi/arm-xilinx-eabi.toolchain.cmake
  - build-arm-xilinx-eabi.sh
- platforms/linaro-arm-eabi/linaro-arm-eabi.toolchain.cmake
  - build-linaro-arm-eabi.sh

There is also a shell script aimed to automate selection of features
from cmake options. Look for more intructions in the shell script's
coments.This has only been tested on Linux environment.

#### Changes

The platform cmake files define a special preprocessor macro
`__OPENCV_BAREMETAL__` that allows the build to skip any feature not
compatible with *bare metal* environment.

Standard OpenCV shoudl compile as normal when `__OPENCV_BAREMETAL__`
is not defined.

Use of `__OPENCV_BAREMETAL__` along the code may not be elegant at
some parts, but served to prove the possibility of using OpenCV in ARM
based, *bare metal* environments, with out changing the API.

### OpenCV: Open Source Computer Vision Library

[![Gittip](http://img.shields.io/gittip/OpenCV.png)](https://www.gittip.com/OpenCV/)

#### Resources

* Homepage: <http://opencv.org>
* Docs: <http://docs.opencv.org>
* Q&A forum: <http://answers.opencv.org>
* Issue tracking: <http://code.opencv.org>

#### Contributing

Please read before starting work on a pull request: <http://code.opencv.org/projects/opencv/wiki/How_to_contribute>

Summary of guidelines:

* One pull request per issue;
* Choose the right base branch;
* Include tests and documentation;
* Clean up "oops" commits before submitting;
* Follow the coding style guide.
