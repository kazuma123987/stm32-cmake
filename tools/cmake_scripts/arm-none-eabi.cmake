# 编译工具链； 请确保已经添加到环境变量； 如果使用的是 linux 环境，需要将后面的 '.exe' 移除；
set(CMAKE_C_COMPILER "arm-none-eabi-gcc.exe")
set(CMAKE_CXX_COMPILER "arm-none-eabi-g++.exe")
set(CMAKE_LINKER "arm-none-eabi-ld.exe")
set(AS "arm-none-eabi-as.exe")
set(AR "arm-none-eabi-ar.exe")
set(OBJCOPY "arm-none-eabi-objcopy.exe")
set(OBJDUMP "arm-none-eabi-objdump.exe")
set(CMAKE_SIZE "arm-none-eabi-size.exe")

# 生成 compile_commands.json，可配合 clangd 实现精准的代码关联与跳转；
set(CMAKE_EXPORT_COMPILE_COMMANDS True)

# 彩色日志输出；
set(CMAKE_COLOR_DIAGNOSTICS True)

# 路径查找；
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

# 设置cmake测试时的生成目标为静态库(cmake在指定编译器后会进行测试)
set(CMAKE_TRY_COMPILE_TARGET_TYPE STATIC_LIBRARY)

# 包含gcc头文件路径
# set(SYSTEM_PATH "-isystem D:/ARM_GCC/arm-none-eabi/include")
set(COMMON_FLAGS "--specs=nano.specs --specs=nosys.specs -Wall \
-fmessage-length=0 -ffunction-sections -fdata-sections")

# 定义C语言编译参数(${CPU_FLAGS}:处理器内核信息 ${FPU_FLAGS}:浮点运算单元类型):
# arm-none-eabi-gcc命令行千万不要加-x c或-xc,否则会报错上万个
set(CMAKE_C_FLAGS "-std=c99 ${CPU_FLAGS} ${FPU_FLAGS} ${COMMON_FLAGS}")
set(CMAKE_C_FLAGS_RELEASE "-Os")
set(CMAKE_C_FLAGS_RELWITHDEBINFO "-Os -g")
set(CMAKE_C_FLAGS_MINSIZEREL "-Os")
set(CMAKE_C_FLAGS_DEBUG "-O0 -g")

# 定义C++编译参数
set(CMAKE_CXX_FLAGS "-std=c++11 ${CPU_FLAGS} ${FPU_FLAGS} ${COMMON_FLAGS}")
set(CMAKE_CXX_FLAGS_RELEASE "-Os -fno-exceptions")
set(CMAKE_CXX_FLAGS_RELWITHDEBINFO "-Os -g  -fno-exceptions")
set(CMAKE_CXX_FLAGS_MINSIZEREL "-Os -fno-exceptions")
set(CMAKE_CXX_FLAGS_DEBUG "-O0 -g -fno-exceptions")

# 设置汇编语言(ASM)编译参数
set(CMAKE_ASM_FLAGS "${CPU_FLAGS} ${FPU_FLAGS} -x assembler-with-cpp")
set(CMAKE_ASM_FLAGS_RELEASE "")
set(CMAKE_ASM_FLAGS_RELWITHDEBINFO "-g")
set(CMAKE_ASM_FLAGS_MINSIZEREL "")
set(CMAKE_ASM_FLAGS_DEBUG "-g")

# 设置链接参数
set(LINKER_FILE_FLAGS "-T")
set(LINKER_FLAGS "${CPU_FLAGS} ${FPU_FLAGS} -Wl,-Map=${PROJECT_NAME}.map,--gc-sections,--print-memory-usage")

# 设置elf转换工具的选项(这里是自定义的变量,用于在CMakeLists自定义构建命令中生成hex和bin文件)
set(OBJCOPY_BIN "-Obinary")
set(OBJCOPY_HEX "-Oihex")
set(OBJCOPY_OUT "")

# 定义颜色代码变量
string(ASCII 27 Esc)
set(ColorReset "${Esc}[0m") # 默认颜色
set(ColorRed "${Esc}[0;31m") # 红色
set(ColorGreen "${Esc}[0;32m") # 绿色
set(ColorYellow "${Esc}[1;33m") # 亮黄色
set(ColorBlue "${Esc}[0;34m") # 蓝色
set(ColorCyan "${Esc}[0;36m") # 青色
set(ColorMagenta "${Esc}[0;35m") # 品红色
