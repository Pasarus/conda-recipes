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
  -DHDF5_ROOT=$PREFIX \
  -DCMAKE_FIND_FRAMEWORK=LAST \
  -DENABLE_DOCS=OFF \
  -DWORKBENCH_SITE_PACKAGES=$SP_DIR \
  -DENABLE_PRECOMMIT=OFF \
  -DCONDA_BUILD=True \
  -DCONDA_ENV=True \
  -DUSE_PYTHON_DYNAMIC_LIB=OFF \
  -DMANTID_FRAMEWORK_LIB=BUILD \
  -DMANTID_QT_LIB=OFF \
  -DCPACK_PACKAGE_SUFFIX="" \
  -DENABLE_WORKBENCH=OFF \
  -GNinja \
  ../

ninja
ninja install
