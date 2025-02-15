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
  -DENABLE_DOCS=ON \
  -DPACKAGE_DOCS=ON \
  -DWORKBENCH_SITE_PACKAGES=$SP_DIR \
  -DWORKBENCH_BIN_DIR=$PREFIX/bin \
  -DENABLE_PRECOMMIT=OFF \
  -DCONDA_BUILD=True \
  -DCONDA_ENV=True \
  -DUSE_PYTHON_DYNAMIC_LIB=OFF \
  -DMANTID_FRAMEWORK_LIB=SYSTEM \
  -DMANTID_QT_LIB=SYSTEM \
  -DENABLE_WORKBENCH=ON \
  -DQt5_DIR=$PREFIX/lib/cmake/qt5 \
  -DCPACK_PACKAGE_SUFFIX="" \
  -GNinja \
  ../

ninja
ninja docs-qthelp
ninja install
