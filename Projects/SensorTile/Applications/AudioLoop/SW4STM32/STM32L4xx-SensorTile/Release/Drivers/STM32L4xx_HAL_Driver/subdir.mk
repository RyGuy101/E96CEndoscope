################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal.c \
/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_cortex.c \
/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_dfsdm.c \
/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_dma.c \
/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_gpio.c \
/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_i2c.c \
/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_i2c_ex.c \
/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_pwr.c \
/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_pwr_ex.c \
/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_rcc.c \
/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_rcc_ex.c \
/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_sai.c \
/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_tim.c \
/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_tim_ex.c 

OBJS += \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal.o \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_cortex.o \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_dfsdm.o \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_dma.o \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_gpio.o \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_i2c.o \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_i2c_ex.o \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_pwr.o \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_pwr_ex.o \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_rcc.o \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_rcc_ex.o \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_sai.o \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_tim.o \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_tim_ex.o 

C_DEPS += \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal.d \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_cortex.d \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_dfsdm.d \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_dma.d \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_gpio.d \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_i2c.d \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_i2c_ex.d \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_pwr.d \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_pwr_ex.d \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_rcc.d \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_rcc_ex.d \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_sai.d \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_tim.d \
./Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_tim_ex.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal.o: /Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Projects/SensorTile/Applications/AudioLoop/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/Common" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/pcm1774"  -Os -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_cortex.o: /Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_cortex.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Projects/SensorTile/Applications/AudioLoop/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/Common" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/pcm1774"  -Os -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_dfsdm.o: /Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_dfsdm.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Projects/SensorTile/Applications/AudioLoop/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/Common" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/pcm1774"  -Os -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_dma.o: /Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_dma.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Projects/SensorTile/Applications/AudioLoop/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/Common" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/pcm1774"  -Os -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_gpio.o: /Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_gpio.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Projects/SensorTile/Applications/AudioLoop/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/Common" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/pcm1774"  -Os -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_i2c.o: /Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_i2c.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Projects/SensorTile/Applications/AudioLoop/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/Common" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/pcm1774"  -Os -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_i2c_ex.o: /Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_i2c_ex.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Projects/SensorTile/Applications/AudioLoop/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/Common" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/pcm1774"  -Os -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_pwr.o: /Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_pwr.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Projects/SensorTile/Applications/AudioLoop/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/Common" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/pcm1774"  -Os -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_pwr_ex.o: /Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_pwr_ex.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Projects/SensorTile/Applications/AudioLoop/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/Common" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/pcm1774"  -Os -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_rcc.o: /Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_rcc.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Projects/SensorTile/Applications/AudioLoop/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/Common" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/pcm1774"  -Os -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_rcc_ex.o: /Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_rcc_ex.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Projects/SensorTile/Applications/AudioLoop/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/Common" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/pcm1774"  -Os -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_sai.o: /Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_sai.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Projects/SensorTile/Applications/AudioLoop/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/Common" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/pcm1774"  -Os -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_tim.o: /Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_tim.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Projects/SensorTile/Applications/AudioLoop/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/Common" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/pcm1774"  -Os -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/STM32L4xx_HAL_Driver/stm32l4xx_hal_tim_ex.o: /Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Src/stm32l4xx_hal_tim_ex.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Projects/SensorTile/Applications/AudioLoop/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/Common" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/pcm1774"  -Os -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


