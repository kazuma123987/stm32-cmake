# 目标平台名称；
set(CMAKE_SYSTEM_NAME Generic)
# 编译工具链； 请确保已经添加到环境变量； 如果使用的是 linux 环境，需要将后面的 '.exe' 移除；
set(CMAKE_C_COMPILER armclang.exe)
set(CMAKE_CXX_COMPILER armclang.exe)
set(CMAKE_ASM_COMPILER armasm.exe)
set(CMAKE_LINKER armlink.exe)
set(AR armar.exe)
set(OBJCOPY fromelf.exe)

# 生成 compile_commands.json，可配合 clangd 实现精准的代码关联与跳转；
set(CMAKE_EXPORT_COMPILE_COMMANDS True)
# 彩色日志输出；
set(CMAKE_COLOR_DIAGNOSTICS True)

# 路径查找；
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

#设置CPU和FPU的编译选项
set(CPU_FLAGS "--target=arm-arm-none-eabi -mcpu=cortex-m3")
set(CPU_FLAGS_ASM "--apcs=interwork --cpu=Cortex-M3")
set(FPU_FLAGS "")
# 设置编译选项一般XXX_FLAGS代表全局的,XXX_FLAGS_DEBUG表示额外新增的
# 设置armcc编译选项
set(CMAKE_C_FLAGS "${CPU_FLAGS} ${FPU_FLAGS} -xc -std=c99  -fno-rtti -flto -funsigned-char \
-fshort-enums -fshort-wchar -gdwarf-4 -ffunction-sections -Wno-packed -Wno-missing-variable-declarations \
-Wno-missing-prototypes -Wno-missing-noreturn -Wno-sign-conversion -Wno-nonportable-include-path -Wno-reserved-id-macro \
-Wno-unused-macros -Wno-documentation-unknown-command -Wno-documentation -Wno-license-management -Wno-parentheses-equality")
set(CMAKE_C_FLAGS_DEBUG "-O0 -g")
set(CMAKE_C_FLAGS_RELEASE "-O3")
# 设置armcc的c++编译选项
set(CMAKE_CXX_FLAGS "${CPU_FLAGS} ${FPU_FLAGS} -xc++ -std=c++11 -fno-rtti -flto -funsigned-char \
-fshort-enums -fshort-wchar -gdwarf-4 -ffunction-sections -Wno-packed -Wno-missing-variable-declarations \
-Wno-missing-prototypes -Wno-missing-noreturn -Wno-sign-conversion -Wno-nonportable-include-path -Wno-reserved-id-macro \
-Wno-unused-macros -Wno-documentation-unknown-command -Wno-documentation -Wno-license-management -Wno-parentheses-equality")
set(CMAKE_CXX_FLAGS_DEBUG "-O0 -g")
set(CMAKE_CXX_FLAGS_RELEASE "-O3")
# 设置armasm编译选项
set(CMAKE_ASM_FLAGS "${CPU_FLAGS_ASM} --list=demo.lst --xref")
set(CMAKE_ASM_FLAGS_DEBUG "-g")
set(CMAKE_ASM_FLAGS_RELEASE "")
# 设置链接选项
set(LINKER_FILE_FLAGS "--scatter")
set(LINKER_FLAGS "--cpu=Cortex-M3 --lto --strict \
--summary_stderr --info summarysizes --map --load_addr_map_info --xref --callgraph --symbols \
--info sizes --info totals --info unused --info veneers --output=${PROJECT_NAME}.axf --ro-base=0x08000000 \
--rw-base=0x20000000 --first=__Vectors")
# 设置elf转换工具的选项
set(OBJCOPY_BIN "--bincombined")
set(OBJCOPY_HEX "--i32combined")
set(OBJCOPY_OUT -o)

# 定义颜色代码变量
string(ASCII 27 Esc)
set(ColorReset "${Esc}[0m") # 默认颜色
set(ColorRed "${Esc}[0;31m") # 红色
set(ColorGreen "${Esc}[0;32m") # 绿色
set(ColorYellow "${Esc}[1;33m") # 亮黄色
set(ColorBlue "${Esc}[0;34m") # 蓝色
set(ColorCyan "${Esc}[0;36m") # 青色
set(ColorMagenta "${Esc}[0;35m") # 品红色

################ armclang的编译选项 ################
