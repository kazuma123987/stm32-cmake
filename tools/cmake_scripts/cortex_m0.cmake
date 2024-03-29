SET(CMAKE_SYSTEM_NAME Generic)
SET(CMAKE_SYSTEM_PROCESSOR cortex-m0)

SET(THREADX_ARCH "cortex_m0")
SET(THREADX_TOOLCHAIN "gnu")

SET(MCPU_FLAGS "-mcpu=cortex-m0 -mthumb")
SET(VFP_FLAGS "")
INCLUDE(${CMAKE_CURRENT_LIST_DIR}/arm-none-eabi.cmake)
MESSAGE(STATUS "${ColorCyan}**** Platform: ${MCPU_FLAGS} ${VFP_FLAGS} ${FLOAT_ABI} ****${ColorReset}")

