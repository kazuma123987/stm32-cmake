# ##############################################################################
# 0、硬件平台信息与编译器信息；
# ##############################################################################

set(PATH_WORKSPACE_ROOT ${CMAKE_SOURCE_DIR})

# INCLUDE("${PATH_WORKSPACE_ROOT}/components/toolchain/cmake/cortex_m4f.cmake")

# ##############################################################################
# 1、工程信息
# ##############################################################################

# 设置CMAKE最低版本
cmake_minimum_required(VERSION 3.20)

# 设置当前的工程名称
project(
  demo
  VERSION 0.0.1
  LANGUAGES C CXX ASM)
# 输出带有颜色的消息
message(
  STATUS
    "${ColorCyan}**** Building project: ${CMAKE_PROJECT_NAME}, Version: ${CMAKE_PROJECT_VERSION} ****${ColorReset}"
)
# 指定链接文件；
set(LINKER_SCRIPT ${CMAKE_SOURCE_DIR}/STM32F103ZETx_FLASH.ld)

# 指定启动文件；
set(STARTUP_ASM
    ${PATH_WORKSPACE_ROOT}/Drivers/CMSIS/Device/ST/STM32F1xx/Source/Templates/gcc/startup_stm32f103xe.s
)

# 项目底层公共头文件；
include_directories(${PATH_WORKSPACE_ROOT}/include)

# ##############################################################################
# 2、编译控制；
# ##############################################################################

# 是否开启更详细的编译过程信息显示
set(CMAKE_VERBOSE_MAKEFILE OFF)

# ##############################################################################
# 3、预定义宏；
# ##############################################################################

# 平台相关宏定义
add_definitions(-DUSE_HAL_DRIVER -DSTM32 -DSTM32F103xE -DSTM32F10X_HD)

# ##############################################################################
# 4、差异化构建配置；
# ##############################################################################

option(OPEN_LOG_OMN_DEBUG "Open log output for debug" OFF)

# 修改该变量的值，可以修改输出文件的名称；
set(OUTPUT_EXE_NAME "demo")

# 优化级别的差异配置
# ##############################################################################
if("${CMAKE_BUILD_TYPE}" STREQUAL "Release")
  add_definitions()
elseif("${CMAKE_BUILD_TYPE}" STREQUAL "RelWithDebInfo")
  add_definitions()
elseif("${CMAKE_BUILD_TYPE}" STREQUAL "MinSizeRel")
  add_definitions()
else()
  if(OPEN_LOG_OMN_DEBUG)
    add_definitions(-DLOG_BACKEND=LOG_BACKEND_NONE)
  else()
    add_definitions(-DLOG_BACKEND=LOG_BACKEND_NONE)
  endif()
endif()

message(
  STATUS "${ColorYellow}**** Build for ${CMAKE_BUILD_TYPE} ****${ColorReset}")

# ##############################################################################
# 5、设置文件输出路径；
# ##############################################################################

# 设置库输出路径
set(LIBRARY_OUTPUT_PATH ${PROJECT_BINARY_DIR}/lib_obj)

set(ELF_FILE ${PROJECT_BINARY_DIR}/${OUTPUT_EXE_NAME}.elf)
set(HEX_FILE ${PROJECT_BINARY_DIR}/${OUTPUT_EXE_NAME}.hex)
set(BIN_FILE ${PROJECT_BINARY_DIR}/${OUTPUT_EXE_NAME}.bin)

# ##############################################################################
# 6、组织公共库源文件；
# ##############################################################################

# ##############################################################################
# 7、组织用户源文件；
# ##############################################################################

# 用户源码；
# ##############################################################################
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
  # ${PATH_WORKSPACE_ROOT}/Drivers/BSP/NORFLASH/norflash.c
  # ${PATH_WORKSPACE_ROOT}/Drivers/BSP/SDIO/sdio_sdcard.c
  # ${PATH_WORKSPACE_ROOT}/Drivers/BSP/SPI/spi.c
  ${PATH_WORKSPACE_ROOT}/Drivers/BSP/TOUCH/*.c
  ${PATH_WORKSPACE_ROOT}/Drivers/CMSIS/Device/ST/STM32F1xx/Source/Templates/system_stm32f1xx.c
  ${PATH_WORKSPACE_ROOT}/Drivers/STM32F1xx_HAL_Driver/Src/*.c
  ${PATH_WORKSPACE_ROOT}/Drivers/SYSTEM/delay/delay.c
  ${PATH_WORKSPACE_ROOT}/Drivers/SYSTEM/sys/sys.c
  ${PATH_WORKSPACE_ROOT}/Drivers/SYSTEM/usart/usart.c)
list(
  REMOVE_ITEM
  DRIVER_SOURCE
  ${PATH_WORKSPACE_ROOT}/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_timebase_tim_template.c
  ${PATH_WORKSPACE_ROOT}/Drivers/STM32F1xx_HAL_Driver/Src/stm32f1xx_hal_timebase_rtc_alarm_template.c
)
# 中间层源文件
file(
  GLOB
  MIDDLE_SOURCE
  # ${PATH_WORKSPACE_ROOT}/Middlewares/ATKNCR/atk_ncr.c
  # ${PATH_WORKSPACE_ROOT}/Middlewares/FATFS/source/*.c
  # ${PATH_WORKSPACE_ROOT}/Middlewares/FATFS/exfuns/exfuns.c
  # ${PATH_WORKSPACE_ROOT}/Middlewares/FATFS/exfuns/fattester.c
  # ${PATH_WORKSPACE_ROOT}/Middlewares/PICTURE/*.c
  # ${PATH_WORKSPACE_ROOT}/Middlewares/TEXT/*.c
  ${PATH_WORKSPACE_ROOT}/Middlewares/USMART/usmart.c)
# ${PATH_WORKSPACE_ROOT}/Middlewares/MALLOC/malloc.c)
# 用户源文件
file(GLOB USER_SOURCE ${PATH_WORKSPACE_ROOT}/User/*.c ${PATH_WORKSPACE_ROOT}/User/*.cpp)
# ${PATH_WORKSPACE_ROOT}/User/APP/*.c)

# ##############################################################################
# 8、编译、连接，生成可执行文件
# ##############################################################################

# 定义连接器参数； --gc-sections：指示链接器去掉不用的 section
set(CMAKE_EXE_LINKER_FLAGS
    "${CMAKE_EXE_LINKER_FLAGS} -T ${LINKER_SCRIPT} -Wl,-Map=${PROJECT_BINARY_DIR}/${OUTPUT_EXE_NAME}.map -Wl,--gc-sections,--print-memory-usage"
)

# 生成可执行文件
add_executable(
  ${PROJECT_NAME}.elf ${DRIVER_SOURCE} ${MIDDLE_SOURCE} ${USER_SOURCE}
                      ${LINKER_SCRIPT} ${STARTUP_ASM})
# ##############################################################################
# 9、生成 hex 和 bin 文件
# ##############################################################################

add_custom_command(
  TARGET "${PROJECT_NAME}.elf"
  POST_BUILD
  # 1.这里COMMAND ${CMAKE_COMMAND} -E echo "text"是不加颜色的，而把cmake_echo_color
  # --cyan可以输出颜色 2.COMMENT "text"在一个custom自定义命令中只能使用一次，且最后的一个生效，多个命令建议使用COMMAND
  # ${CMAKE_COMMAND} -E echo "text"
  COMMAND ${CMAKE_COMMAND} -E cmake_echo_color --cyan
          "Building ${OUTPUT_EXE_NAME}.bin and ${OUTPUT_EXE_NAME}.hex"
  COMMAND ${OBJCOPY} -Obinary "${PROJECT_NAME}.elf" "${OUTPUT_EXE_NAME}.bin"
  COMMAND ${OBJCOPY} -Oihex "${PROJECT_NAME}.elf" "${OUTPUT_EXE_NAME}.hex"
  COMMAND
    ${CMAKE_COMMAND} -E cmake_echo_color --blue
    "Build ${OUTPUT_EXE_NAME}.bin and ${OUTPUT_EXE_NAME}.hex successfully!"
  COMMAND ${CMAKE_COMMAND} -E cmake_echo_color --yellow
          "Invoking: Cross ARM GNU Print Size"
  COMMAND ${CMAKE_SIZE} --format=berkeley ${PROJECT_NAME}.elf)
