@echo off
cls
if not exist build (
    mkdir build
)
cd build || exit
del "./*" --recurse
cmake -G "MinGW Makefiles" -DCMAKE_TOOLCHAIN_FILE="../tools/scripts/armclang.cmake" -D_USE_GCC=OFF -DCMAKE_C_COMPILER_FORCED=ON -DCMAKE_CXX_COMPILER_FORCED=ON -DCMAKE_BUILD_TYPE=%1 ..
cmake --build . -j --target=all