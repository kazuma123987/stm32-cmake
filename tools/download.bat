@echo off
setlocal

for /f "delims== tokens=1,*" %%i in (tools/project.env) do set %%i=%%j

if "%1"=="openocd" (
    openocd -f tools/openocd.cfg -c "adapter speed %SPEED%" ^
    -c "program ./build/%BIN_NAME%.bin %ADDRESS% exit reset"
) else if "%1"=="jlink" (
    echo loadfile ./build/%BIN_NAME%.bin, %ADDRESS% > ./tools/download.jlink
    echo r >> ./tools/download.jlink
    echo g >> ./tools/download.jlink
    echo exit >> ./tools/download.jlink
    JLink -autoconnect 1 -device %DEVICE% -if %PORT% -speed %SPEED% -CommanderScript ./tools/download.jlink
) else (
    echo Unknown argument: %1
    echo Usage: %0 ^<openocd|jlink^>
)

endlocal
