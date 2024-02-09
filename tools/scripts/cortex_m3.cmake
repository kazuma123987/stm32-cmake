# 目标平台名称；
SET(CMAKE_SYSTEM_NAME Generic)
# SET(CMAKE_SYSTEM_PROCESSOR cortex-m3)

# SET(THREADX_ARCH "cortex_m3")
# SET(THREADX_TOOLCHAIN "gnu")

SET(MCPU_FLAGS "-mthumb -mcpu=cortex-m3")
SET(VFP_FLAGS "")
INCLUDE(${CMAKE_CURRENT_LIST_DIR}/arm-none-eabi.cmake)
MESSAGE(STATUS "${ColorCyan}**** platform: ${MCPU_FLAGS} ${VFP_FLAGS} ${FLOAT_ABI} ****${ColorReset}")

