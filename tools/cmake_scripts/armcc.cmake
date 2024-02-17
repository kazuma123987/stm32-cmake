# 目标平台名称；
set(CMAKE_SYSTEM_NAME Generic)

# 编译工具链； 请确保已经添加到环境变量； 如果使用的是 linux 环境，需要将后面的 '.exe' 移除；
set(CMAKE_C_COMPILER armcc.exe)
set(CMAKE_CXX_COMPILER armcc.exe)
set(CMAKE_ASM_COMPILER armasm.exe)
set(CMAKE_LINKER armlink.exe)
set(AR armar.exe)
set(OBJCOPY fromelf.exe)

# 生成 compile_commands.json，可配合 clangd 实现精准的代码关联与跳转；
set(CMAKE_EXPORT_COMPILE_COMMANDS TRUE)
# 彩色日志输出；
set(CMAKE_COLOR_DIAGNOSTICS TRUE)

# 路径查找；
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)

#设置CPU和FPU的编译选项
set(CPU_FLAGS "--apcs=interwork --cpu Cortex-M3")
set(FPU_FLAGS "")
# 设置编译选项一般XXX_FLAGS代表全局的,XXX_FLAGS_DEBUG表示额外新增的
# 设置armcc编译选项
set(CMAKE_C_FLAGS "${CPU_FLAGS} ${FPU_FLAGS} --c99 --split_sections")
set(CMAKE_C_FLAGS_DEBUG "-O0 -g")
set(CMAKE_C_FLAGS_RELEASE "-O3")
# 设置armcc的c++编译选项
set(CMAKE_CXX_FLAGS "${CPU_FLAGS} ${FPU_FLAGS} --apcs=interwork --cpu Cortex-M3 --cpp11 --split_sections")
set(CMAKE_CXX_FLAGS_DEBUG "-O0 -g")
set(CMAKE_CXX_FLAGS_RELEASE "-O3")
# 设置armasm编译选项
set(CMAKE_ASM_FLAGS "${MCPU_FLAGS} ${FPU_FLAGS} --apcs=interwork --cpu Cortex-M3 --list=demo.lst")
set(CMAKE_ASM_FLAGS_DEBUG "-g")
set(CMAKE_ASM_FLAGS_RELEASE "")
# 设置链接选项
set(LINKER_FILE_FLAGS "--scatter")
set(LINKER_FLAGS "${MCPU_FLAGS} --entry=Reset_Handler --strict --summary_stderr \
--info=summarysizes,sizes,totals,unused,veneers --map --xref --callgraph --symbols \
--ro-base=0x08000000 --rw-base=0x20000000 --first=__Vectors")
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

################ armcc、armasm与armlink的编译选项 ################
####1.armcc:####

####2.armasm:####

####3.armlink:####
# armlink [option1] [option2] ... 
# 详见https://www.cnblogs.com/bigworld/archive/2011/11/26/2264093.html
# 一般 --option value可以写成 --option=value
# options介绍: 
#   a.运行内存区域和加载内存区域设置:
#       --scatter xxx.sct 同ld -T xxx.ld,
#       --entry=Reset_Handler:设置入口函数
#       --first=RESET:设置RESET段(.s文件中声明的中断向量表)为区域的第一个段
#       --last=xxx:与--first相反 
#       --ro-base=0x08000000 --rw-base=0x20000000 :设置rom或ram基址
#   b.命令行信息显示:
#       --info=summarysizes:编译完成后在终端输出程序的大小
#       --summary_stderr:如果--info=summarysizes,则把summarysizes传到stderr缓冲区(立即刷新)
#       --no_summary_stderr:与上述相反
#   c.生成相关调试文件:
#       --map:生成.map文件,与map文件相关的参数如下:
#           1)--info=sizes:为每一个使用到.o文件和库文件列出了代码和数据(RO、RW、ZI、Debug)的大小,包含了--info=totals的所有内容
#           2)--info=totals:列出大致的.o文件和库文件大小,以及总的elf文件大小和RO、RW、ZI总大小
#           3)--info=unused:显示因为链接器的-remove选项被移除的所有段,-remove选项默认开启,-noremove可以禁用
#           4)--info=veneers:显示armlink生成的veneers信息
#           5)--load_addr_map_info:在map文件中显示运行域的加载地址
#           6)--xref:在map文件中生成不同文件的相互引用信息(引用变量、函数等)
#           7)--symbols:列出本地和全局段的大小、地址、文件信息
#       --callgraph:生成.htm文件,这是一个html文件,打开后可以显示函数调用关系和函数的栈大小
#   d.代码错误检查:
#       --strict:对目标文件进行严格检查,严格选项与错误严重程度无直接关联.通常添加严格选项是因为标准链接器检查不够精确,
#       或者在处理旧对象时可能会产生噪音。
#           
#   
#
