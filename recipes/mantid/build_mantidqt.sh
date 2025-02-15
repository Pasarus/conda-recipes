#!/usr/bin/env bash
set -ex

if [[ -d build ]]; then
  rm -rf build
fi

mkdir build
cd build

cmake \
  ${CMAKE_ARGS} \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_PREFIX_PATH=$PREFIX \
  -DCMAKE_FIND_FRAMEWORK=LAST \
  -DHDF5_ROOT=$PREFIX \
  -DENABLE_DOCS=OFF \
  -DWORKBENCH_SITE_PACKAGES=$SP_DIR \
  -DENABLE_PRECOMMIT=OFF \
  -DCONDA_BUILD=True \
  -DCONDA_ENV=True \
  -DUSE_PYTHON_DYNAMIC_LIB=OFF \
  -DMANTID_FRAMEWORK_LIB=SYSTEM \
  -DMANTID_QT_LIB=BUILD \
  -DENABLE_WORKBENCH=OFF \
  -DQt5_DIR=$PREFIX/lib/cmake/qt5 \
  -DCPACK_PACKAGE_SUFFIX="" \
  -GNinja \
  ../

ninja
ninja install