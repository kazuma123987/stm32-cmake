SET PATH=C:\Keil_v5\ARM\ARMCLANG\Bin;C:\Program Files\Eclipse Foundation\jdk-8.0.302.8-hotspot\bin;C:\Program Files\Common Files\Oracle\Java\javapath;C:\Program Files (x86)\Common Files\Oracle\Java\javapath;C:\Program Files\Microsoft\jdk-17.0.3.7-hotspot\bin;C:\Program Files (x86)\Common Files\Intel\Shared Libraries\redist\intel64_win\compiler;C:\Program Files (x86)\Common Files\Intel\Shared Libraries\redist\intel64\compiler;C:\Windows\system32;C:\Windows;C:\Windows\System32\Wbem;C:\Windows\System32\WindowsPowerShell\v1.0\;C:\Windows\System32\OpenSSH\;C:\Program Files\NVIDIA Corporation\NVIDIA NvDLISR;C:\Program Files (x86)\NVIDIA Corporation\PhysX\Common;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\OpenSSH\;C:\Program Files\dotnet\;C:\Program Files (x86)\QuickTime\QTSystem\;C:\Program Files\GoodbyeGreenscreen;C:\Program Files\Bandizip\;C:\WINDOWS\system32;C:\WINDOWS;C:\WINDOWS\System32\Wbem;C:\WINDOWS\System32\WindowsPowerShell\v1.0\;C:\WINDOWS\System32\OpenSSH\;C:\platform-tools;C:\Program Files\Microsoft VS Code\bin;C:\Program Files\CMake\bin;C:\Program Files (x86)\GnuWin32\bin;C:\Program Files\Microsoft SQL Server\130\Tools\Binn\;C:\Program Files\Microsoft SQL Server\Client SDK\ODBC\170\Tools\Binn\;C:\Program Files\usbipd-win\;C:\Visual Leak Detector\bin\Win32;C:\Visual Leak Detector\bin\Win64;C:\Program Files\Polyspace\R2019b\runtime\win64;C:\Program Files\Polyspace\R2019b\bin;C:\Program Files\Polyspace\R2019b\polyspace\bin;C:\Program Files\MATLAB\R2021b\runtime\win64;C:\Program Files\MATLAB\R2021b\bin;C:\Program Files\Git\cmd;C:\Program Files\CADSeePlus;C:\Program Files\nodejs\;C:\ProgramData\chocolatey\bin;C:\Program Files (x86)\STMicroelectronics\STM32 ST-LINK Utility\ST-LINK Utility;C:\Users\34181\AppData\Local\Programs\Python\Python312\Scripts\;C:\Users\34181\AppData\Local\Programs\Python\Python312\;C:\A_TOOLS\MinGW64\13.2.0\bin;C:\A_TOOLS\MinGW64\13.2.0_x86\bin;C:\A_TOOLS\ARM_GCC\bin;C:\Users\34181\AppData\Local\Microsoft\WindowsApps;C:\Users\34181\.dotnet\tools;C:\Program Files (x86)\Tencent\QQGameTempest\Hall.57773\;C:\A_TOOLS\ffmpeg\bin;C:\A_TOOLS\ninja_win;C:\A_TOOLS\openocd\bin;C:\Users\34181\AppData\Roaming\npm;C:\Keil_v5\ARM\ARMCC\bin;C:\Keil_v5\ARM\ARMCLANG\bin;C:\A_TOOLS\arm_gcc_none_linux\bin;C:\A_TOOLS\LLVM\bin
SET ARMCC6_ASMOPT=--diag_suppress=9931
SET ARMCC6_CCOPT=--diag_suppress=9931
SET ARMCC6_LINKOPT=--diag_suppress=9931
SET CPU_TYPE=STM32F103ZE
SET CPU_VENDOR=STMicroelectronics
SET UV2_TARGET=TOUCH
SET CPU_CLOCK=0x007A1200
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmAsm" --Via "..\..\output\startup_stm32f103xe._ia"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\main.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\system_stm32f1xx.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\stm32f1xx_it.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\delay.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\sys.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\usart.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\stm32f1xx_hal.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\stm32f1xx_hal_cortex.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\stm32f1xx_hal_dma.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\stm32f1xx_hal_gpio.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\stm32f1xx_hal_gpio_ex.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\stm32f1xx_hal_pwr.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\stm32f1xx_hal_rcc.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\stm32f1xx_hal_rcc_ex.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\stm32f1xx_hal_uart.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\stm32f1xx_hal_usart.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\stm32f1xx_hal_sram.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\stm32f1xx_ll_fsmc.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\stm32f1xx_hal_tim.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\stm32f1xx_hal_tim_ex.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\led.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\lcd.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\key.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\touch.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\ctiic.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\ft5206.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\gt9xxx.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\myiic.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmClang.exe" @"..\..\output\24cxx.__i"
"C:\Keil_v5\ARM\ARMCLANG\Bin\ArmLink" --Via "..\..\Output\atk_f103.lnp"
"C:\Keil_v5\ARM\ARMCLANG\Bin\fromelf.exe" "..\..\Output\atk_f103.elf" --i32combined --output "..\..\Output\atk_f103.hex"
