# 设置工作根目录
set(PATH_WORKSPACE_ROOT ${CMAKE_SOURCE_DIR})
# 设置CMAKE最低版本
cmake_minimum_required(VERSION 3.22)
# 设置当前的工程名称
project(
  demo
  VERSION 0.0.1
  LANGUAGES C CXX ASM)

# 修改该变量的值，可以修改输出文件的名称；
set(OUTPUT_EXE_NAME "demo")
# 设置输出路径
set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib_obj)
set(ELF_FILE ${PROJECT_BINARY_DIR}/${OUTPUT_EXE_NAME}.elf)
set(HEX_FILE ${PROJECT_BINARY_DIR}/${OUTPUT_EXE_NAME}.hex)
set(BIN_FILE ${PROJECT_BINARY_DIR}/${OUTPUT_EXE_NAME}.bin)
# 是否开启更详细的编译过程信息显示
set(CMAKE_VERBOSE_MAKEFILE OFF)
# 平台相关宏定义
add_definitions(-DUSE_HAL_DRIVER -DSTM32F103xE -DSTM32F10X_HD)

# 指定链接文件；
# set(LINKER_SCRIPT ${CMAKE_SOURCE_DIR}/STM32F103ZETx_FLASH.ld)
set(LINKER_SCRIPT ${CMAKE_SOURCE_DIR}/demo.sct)
# 指定链接选项 
set(CMAKE_EXE_LINKER_FLAGS "${LINKER_FLAGS}")
# set(CMAKE_EXE_LINKER_FLAGS "${LINKER_FLAGS} ${LINKER_FILE_FLAGS} ${LINKER_SCRIPT}")

# 输出编译类型
if("${CMAKE_BUILD_TYPE}" STREQUAL "Release")
  set(USER_C_FLAGS ${CMAKE_C_FLAGS_RELEASE})
  set(USER_CXX_FLAGS ${CMAKE_CXX_FLAGS_RELEASE})
  set(USER_ASM_FLAGS ${CMAKE_ASM_FLAGS_RELEASE})
elseif("${CMAKE_BUILD_TYPE}" STREQUAL "RelWithDebInfo")
  set(USER_C_FLAGS ${CMAKE_C_FLAGS_RELWITHDEBINFO})
  set(USER_CXX_FLAGS ${CMAKE_CXX_FLAGS_RELWITHDEBINFO})
  set(USER_ASM_FLAGS ${CMAKE_ASM_FLAGS_RELWITHDEBINFO})
elseif("${CMAKE_BUILD_TYPE}" STREQUAL "MinSizeRel")
  set(USER_C_FLAGS ${CMAKE_C_FLAGS_MINSIZEREL})
  set(USER_CXX_FLAGS ${CMAKE_CXX_FLAGS_MINSIZEREL})
  set(USER_ASM_FLAGS ${CMAKE_CXX_ASM_MINSIZEREL})
else() # "Debug"
  set(USER_C_FLAGS ${CMAKE_C_FLAGS_DEBUG})
  set(USER_CXX_FLAGS ${CMAKE_CXX_FLAGS_DEBUG})
  set(USER_ASM_FLAGS ${CMAKE_ASM_FLAGS_DEBUG})
endif()
message(
  STATUS
    "${ColorYellow}**** Build for ${CMAKE_BUILD_TYPE} ****${ColorReset}\n"
    "${ColorCyan}**** C_FLAGS : ${USER_C_FLAGS}${CMAKE_C_FLAGS} ****${ColorReset}\n"
    "${ColorCyan}**** CXX_FLAGS : ${USER_CXX_FLAGS}${CMAKE_CXX_FLAGS} ****${ColorReset}\n"
    "${ColorCyan}**** ASM_FLAGS : ${USER_ASM_FLAGS}${CMAKE_ASM_FLAGS} ****${ColorReset}\n"
    "${ColorCyan}**** LINKER_FLAGS : ${CMAKE_EXE_LINKER_FLAGS} ****${ColorReset}"
)

# 公共头文件目录；
include_directories(
  # 硬件驱动头文件路径；
  ${PATH_WORKSPACE_ROOT}/Drivers
  ${PATH_WORKSPACE_ROOT}/Drivers/STM32F1xx_HAL_Driver/Inc
  ${PATH_WORKSPACE_ROOT}/Drivers/STM32F1xx_HAL_Driver/Inc/Legacy
  ${PATH_WORKSPACE_ROOT}/Drivers/CMSIS/Device/ST/STM32F1xx/Include
  ${PATH_WORKSPACE_ROOT}/Drivers/CMSIS/Include
  # 中间件头文件路径:
  ${PATH_WORKSPACE_ROOT}/Middlewares
  # 应用层头文件包含路径；
  ${PATH_WORKSPACE_ROOT}/User)
# 驱动层源文件
file(
  GLOB
  DRIVER_SOURCE
  ${PATH_WORKSPACE_ROOT}/Drivers/BSP/24CXX/24cxx.c
  ${PATH_WORKSPACE_ROOT}/Drivers/BSP/IIC/myiic.c
  ${PATH_WORKSPACE_ROOT}/Drivers/BSP/KEY/key.c
  ${PATH_WORKSPACE_ROOT}/Drivers/BSP/LCD/lcd.c
  ${PATH_WORKSPACE_ROOT}/Drivers/BSP/LED/led.c
  ${PATH_WORKSPACE_ROOT}/Drivers/BSP/TOUCH/*.c
  ${PATH_WORKSPACE_ROOT}/Drivers/CMSIS/Device/ST/STM32F1xx/Source/Templates/system_stm32f1xx.c
  ${PATH_WORKSPACE_ROOT}/Drivers/STM32F1xx_HAL_Driver/Src/*.c
  ${PATH_WORKSPACE_ROOT}/Drivers/SYSTEM/delay/delay.c
  ${PATH_WORKSPACE_ROOT}/Drivers/SYSTEM/sys/sys.c
  ${PATH_WORKSPACE_ROOT}/Drivers/SYSTEM/usart/usart.c)

#过滤不要的文件
# list(
#   REMOVE_ITEM
#   DRIVER_SOURCE
#   ${PATH_WORKSPACE_ROOT}/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_timebase_tim_template.c
#   ${PATH_WORKSPACE_ROOT}/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_timebase_rtc_alarm_template.c
# )
list(FILTER DRIVER_SOURCE EXCLUDE REGEX ".*_template\\.c$")
# # 中间层源文件
# file(GLOB MIDDLE_SOURCE ${PATH_WORKSPACE_ROOT}/Middlewares/USMART/*.c)
# 用户源文件
file(GLOB USER_SOURCE ${PATH_WORKSPACE_ROOT}/User/*.c
     ${PATH_WORKSPACE_ROOT}/User/*.cpp)
# 启动文件
# set(STARTUP_FILE ${PATH_WORKSPACE_ROOT}/Drivers/CMSIS/Device/ST/STM32F1xx/Source/Templates/gcc/startup_stm32f103xe.s)
set(STARTUP_FILE ${PATH_WORKSPACE_ROOT}/Drivers/CMSIS/Device/ST/STM32F1xx/Source/Templates/arm/startup_stm32f103xe.s)
# 生成可执行文件
add_executable(
  ${PROJECT_NAME}
  ${DRIVER_SOURCE}
  ${MIDDLE_SOURCE}
  ${USER_SOURCE}
  ${STARTUP_FILE})
  
# 把elf转换为bin和hex
add_custom_command(
  TARGET ${PROJECT_NAME}
  POST_BUILD
  COMMAND ${CMAKE_COMMAND} -E cmake_echo_color --cyan "Building ${OUTPUT_EXE_NAME}.bin and ${OUTPUT_EXE_NAME}.hex"
  COMMAND ${OBJCOPY} ${PROJECT_NAME}.elf ${OBJCOPY_BIN} ${OBJCOPY_OUT} ${OUTPUT_EXE_NAME}.bin
  COMMAND ${OBJCOPY} ${PROJECT_NAME}.elf ${OBJCOPY_HEX} ${OBJCOPY_OUT} ${OUTPUT_EXE_NAME}.hex
  COMMAND axf2elf -d "C:\\Keil_v5\\ARM\\ARMCC" -b ".\\${PROJECT_NAME}.bin" -i ".\\${PROJECT_NAME}.elf" -o ".\\${PROJECT_NAME}.elf" > ".\\${PROJECT_NAME}.log"
  COMMAND
    ${CMAKE_COMMAND} -E cmake_echo_color --blue
    "Build ${OUTPUT_EXE_NAME}.bin and ${OUTPUT_EXE_NAME}.hex successfully!")