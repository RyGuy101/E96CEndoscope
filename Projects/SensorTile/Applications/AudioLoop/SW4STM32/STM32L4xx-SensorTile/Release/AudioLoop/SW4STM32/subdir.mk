################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
S_SRCS += \
/Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Projects/SensorTile/Applications/AudioLoop/SW4STM32/startup_stm32l476xx.s 

OBJS += \
./AudioLoop/SW4STM32/startup_stm32l476xx.o 


# Each subdirectory must supply rules for building sources it contributes
AudioLoop/SW4STM32/startup_stm32l476xx.o: /Users/ryannemiroff/Documents/workspaceE96/v1.2.0/Projects/SensorTile/Applications/AudioLoop/SW4STM32/startup_stm32l476xx.s
	@echo 'Building file: $<'
	@echo 'Invoking: MCU GCC Assembler'
	@echo $(PWD)
	arm-none-eabi-as -mcpu=cortex-m4 -mthumb -mfloat-abi=hard -mfpu=fpv4-sp-d16 -I../../../Inc -I../../../../../../../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../../../../../../../Drivers/STM32L4xx_HAL_Driver/Inc -I../../../../../../../Drivers/CMSIS/Include -I../../../../../../../Drivers/BSP/Components/Common -I../../../../../../../Drivers/BSP/SensorTile -I../../../../../../../Drivers/BSP/Components/pcm1774 -g -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


