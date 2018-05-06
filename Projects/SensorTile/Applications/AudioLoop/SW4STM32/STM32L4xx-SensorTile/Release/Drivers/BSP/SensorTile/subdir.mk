################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile/SensorTile.c \
/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile/SensorTile_audio_in.c \
/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile/SensorTile_audio_out.c 

OBJS += \
./Drivers/BSP/SensorTile/SensorTile.o \
./Drivers/BSP/SensorTile/SensorTile_audio_in.o \
./Drivers/BSP/SensorTile/SensorTile_audio_out.o 

C_DEPS += \
./Drivers/BSP/SensorTile/SensorTile.d \
./Drivers/BSP/SensorTile/SensorTile_audio_in.d \
./Drivers/BSP/SensorTile/SensorTile_audio_out.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/SensorTile/SensorTile.o: /Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile/SensorTile.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Projects/SensorTile/Applications/AudioLoop/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/Common" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/pcm1774"  -Os -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/SensorTile/SensorTile_audio_in.o: /Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile/SensorTile_audio_in.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Projects/SensorTile/Applications/AudioLoop/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/Common" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/pcm1774"  -Os -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

Drivers/BSP/SensorTile/SensorTile_audio_out.o: /Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile/SensorTile_audio_out.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Projects/SensorTile/Applications/AudioLoop/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/Common" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/pcm1774"  -Os -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


