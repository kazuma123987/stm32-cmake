SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_SYSTEM_PROCESSOR cortex-m4)

SET(THREADX_ARCH "cortex_m4")
SET(THREADX_TOOLCHAIN "gnu")

ADD_DEFINITIONS(-DARM_MATH_CM4 -DARM_MATH_MATRIX_CHECK -DARM_MATH_ROUNDING -D__FPU_PRESENT=1)

SET(MCPU_FLAGS "-mthumb -mcpu=cortex-m4 -mthumb-interwork")
SET(VFP_FLAGS "-mfloat-abi=hard -mfpu=fpv4-sp-d16")
INCLUDE(${CMAKE_CURRENT_LIST_DIR}/arm-none-eabi.cmake)
MESSAGE(STATUS "${ColorCyan}**** Platform: ${MCPU_FLAGS} ${VFP_FLAGS} ****${ColorReset}")
