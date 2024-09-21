SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_SYSTEM_PROCESSOR cortex-m0)

SET(THREADX_ARCH "cortex_m0")

if(__GNUC__)
    SET(CPU_FLAGS "-mcpu=cortex-m0 -mthumb")
    SET(FPU_FLAGS "")
    include(${CMAKE_SOURCE_DIR}/tools/cmake_scripts/arm-none-eabi.cmake)
elseif(__ARMCC_VERSION)
    if(__ARMCC_VERSION LESS 6010050)
        # 设置CPU和FPU的编译选项
        set(CPU_FLAGS "--apcs=interwork --cpu Cortex-M0")
        set(FPU_FLAGS "")
        include(${CMAKE_SOURCE_DIR}/tools/cmake_scripts/armcc.cmake)
    else()
        # 设置CPU和FPU的编译选项
        set(CPU_FLAGS "--target=arm-arm-none-eabi -mcpu=cortex-m0 -mlittle-endian")
        set(CPU_FLAGS_ASM "--cpu=Cortex-M0")
        set(FPU_FLAGS "")
        set(FPU_FLAGS_ASM "")
        include(${CMAKE_SOURCE_DIR}/tools/cmake_scripts/armclang.cmake)
    endif()
else()
    message(FATAL_ERROR "ERROR:: unknown compiler or you should choose a xxx_define.cmake file")
endif()

MESSAGE(STATUS "${ColorCyan}**** Platform: ${CPU_FLAGS} ${FPU_FLAGS} ${FLOAT_ABI} ****${ColorReset}")
