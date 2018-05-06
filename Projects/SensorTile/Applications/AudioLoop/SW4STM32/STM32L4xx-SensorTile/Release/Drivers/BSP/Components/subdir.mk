################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/pcm1774/PCM1774_CODEC_Driver.c 

OBJS += \
./Drivers/BSP/Components/PCM1774_CODEC_Driver.o 

C_DEPS += \
./Drivers/BSP/Components/PCM1774_CODEC_Driver.d 


# Each subdirectory must supply rules for building sources it contributes
Drivers/BSP/Components/PCM1774_CODEC_Driver.o: /Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/pcm1774/PCM1774_CODEC_Driver.c
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Compiler'
	@echo $(PWD)
	arm-none-eabi-gcc -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -DUSE_HAL_DRIVER -DOSX_BMS_SENSORTILE -DSTM32L476xx -DUSE_STM32L4XX_NUCLEO -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Projects/SensorTile/Applications/AudioLoop/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Device/ST/STM32L4xx/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/STM32L4xx_HAL_Driver/Inc" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/CMSIS/Include" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/Common" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/SensorTile" -I"/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Drivers/BSP/Components/pcm1774"  -Os -Wall -fmessage-length=0 -ffunction-sections -c -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


