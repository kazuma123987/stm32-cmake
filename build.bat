@echo off
cls
if not exist build (
    mkdir build
)
cd build || exit
del "./*" --recurse
cmake -G "MinGW Makefiles" -DCMAKE_TOOLCHAIN_FILE="../scripts/armclang.cmake" -DCMAKE_C_COMPILER_FORCED=ON -DCMAKE_CXX_COMPILER_FORCED=ON -DCMAKE_BUILD_TYPE=%1 ..
cmake --build . -j --target=all