SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_SYSTEM_PROCESSOR cortex-m7)

SET(THREADX_ARCH "cortex_m7")

if(__GNUC__)
    SET(CPU_FLAGS "-mthumb -mcpu=cortex-m7")
    SET(FPU_FLAGS "-mfloat-abi=hard -mfpu=fpv5-sp-d16")
    include(${CMAKE_SOURCE_DIR}/tools/cmake_scripts/arm-none-eabi.cmake)
elseif(__ARMCC_VERSION)
    if(__ARMCC_VERSION LESS 6010050)
        # 设置CPU和FPU的编译选项
        set(CPU_FLAGS "--apcs=interwork --cpu Cortex-M7.fp.sp")
        set(FPU_FLAGS "")
        include(${CMAKE_SOURCE_DIR}/tools/cmake_scripts/armcc.cmake)
    else()
        # 设置CPU和FPU的编译选项
        set(CPU_FLAGS " --target=arm-arm-none-eabi -mcpu=cortex-m7 -mlittle-endian")
        set(CPU_FLAGS_ASM "--cpu Cortex-M7.fp.sp")
        set(FPU_FLAGS "-mfloat-abi=hard -mfpu=fpv5-sp-d16")
        set(FPU_FLAGS_ASM "")
        include(${CMAKE_SOURCE_DIR}/tools/cmake_scripts/armclang.cmake)
    endif()
else()
    message(FATAL_ERROR "ERROR:: unknown compiler or you should choose a xxx_define.cmake file")
endif()

MESSAGE(STATUS "${ColorCyan}**** Platform: ${CPU_FLAGS} ${FPU_FLAGS} ${FLOAT_ABI} ****${ColorReset}")
