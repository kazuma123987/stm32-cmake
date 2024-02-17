@echo off
setlocal
for /f "delims== tokens=1,*" %%i in (tools/project.env) do set %%i=%%j
cls
if not exist build (
    mkdir build
)
cd build || exit
del "./*" --recurse
cmake -G "MinGW Makefiles" -DCMAKE_TOOLCHAIN_FILE="../tools/scripts/armclang.cmake" -D_USE_GCC=OFF ^
-DCMAKE_C_COMPILER_FORCED=ON -DCMAKE_CXX_COMPILER_FORCED=ON -DCMAKE_BUILD_TYPE=%1 -DOUTPUT_EXE_NAME=%BIN_NAME% ..
cmake --build . -j --target=all
endlocal