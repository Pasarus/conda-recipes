rmdir /S /Q build 2> nul

mkdir build && cd build

cmake ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_LIBDIR=%LIBRARY_LIB% ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCONDA_BUILD=True ^
    -DCONDA_ENV=True ^
    -DENABLE_PRECOMMIT=OFF ^
    -DENABLE_DOCS=ON ^
    -DPACKAGE_DOCS=ON ^
    -DMANTID_FRAMEWORK_LIB=SYSTEM ^
    -DMANTID_QT_LIB=SYSTEM ^
    -DENABLE_WORKBENCH=ON ^
    -DCPACK_PACKAGE_SUFFIX="" ^
    -DWORKBENCH_SITE_PACKAGES=%SP_DIR% ^
    ..

if errorlevel 1 exit 1
cmake --build . --config Release
cmake --build . --config Release --target docs-qthelp
cmake --build . --config Release --target install
if errorlevel 1 exit 1