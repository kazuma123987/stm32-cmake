SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_SYSTEM_PROCESSOR cortex-m4)

SET(THREADX_ARCH "cortex_m4")

ADD_DEFINITIONS(-DARM_MATH_CM4 -DARM_MATH_MATRIX_CHECK -DARM_MATH_ROUNDING -D__FPU_PRESENT=1)

if(__GNUC__)
    SET(CPU_FLAGS "-mthumb -mcpu=cortex-m4 -mthumb-interwork")
    SET(FPU_FLAGS "-mfloat-abi=hard")
    include(${CMAKE_SOURCE_DIR}/tools/cmake_scripts/arm-none-eabi.cmake)
elseif(__ARMCC_VERSION)
    if(__ARMCC_VERSION LESS 6010050)
        # 设置CPU和FPU的编译选项
        set(CPU_FLAGS "--apcs=interwork --cpu Cortex-M4.fp.sp")
        set(FPU_FLAGS "")
        include(${CMAKE_SOURCE_DIR}/tools/cmake_scripts/armcc.cmake)
    else()
        # 设置CPU和FPU的编译选项
        set(CPU_FLAGS "--target=arm-arm-none-eabi -mcpu=cortex-m4 -mlittle-endian")
        set(CPU_FLAGS_ASM "--cpu Cortex-M4.fp.sp")
        set(FPU_FLAGS "-mfpu=fpv4-sp-d16 -mfloat-abi=hard")
        set(FPU_FLAGS_ASM "")
        include(${CMAKE_SOURCE_DIR}/tools/cmake_scripts/armclang.cmake)
    endif()
else()
    message(FATAL_ERROR "ERROR:: unknown compiler or you should choose a xxx_define.cmake file")
endif()

MESSAGE(STATUS "${ColorCyan}**** Platform: ${CPU_FLAGS} ${FPU_FLAGS} ****${ColorReset}")

