################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Each subdirectory must supply rules for building sources it contributes
FreeRTOS_Source/portable/MemMang/heap_4.obj: /home/rtos/Downloads/FreeRTOS/FreeRTOS/Source/portable/MemMang/heap_4.c $(GEN_OPTS) | $(GEN_FILES) $(GEN_MISC_FILES)
	@echo 'Building file: "$<"'
	@echo 'Invoking: MSP430 Compiler'
	"/home/rtos/ti/ccs1010/ccs/tools/compiler/ti-cgt-msp430_20.2.1.LTS/bin/cl430" -vmspx --data_model=large -O0 --use_hw_mpy=F5 --include_path="/home/rtos/ti/ccs1010/ccs/ccs_base/msp430/include" --include_path="/home/rtos/workspace/RTOSDemo" --include_path="/home/rtos/Downloads/FreeRTOS/FreeRTOS/Source/include" --include_path="/home/rtos/Downloads/FreeRTOS/FreeRTOS/Source/portable/CCS/MSP430X" --include_path="/home/rtos/Downloads/FreeRTOS/FreeRTOS-Plus/Source/FreeRTOS-Plus-CLI" --include_path="/home/rtos/Downloads/FreeRTOS/FreeRTOS/Demo/Common/include" --include_path="/home/rtos/ti/ccs1010/ccs/tools/compiler/ti-cgt-msp430_20.2.1.LTS/include" --include_path="/home/rtos/workspace/RTOSDemo/driverlib/MSP430FR5xx_6xx" --define=__MSP430FR5994__ -g --printf_support=minimal --diag_warning=225 --diag_wrap=off --display_error_number --abi=eabi --silicon_errata=CPU21 --silicon_errata=CPU22 --silicon_errata=CPU40 --preproc_with_compile --preproc_dependency="FreeRTOS_Source/portable/MemMang/$(basename $(<F)).d_raw" --obj_directory="FreeRTOS_Source/portable/MemMang" $(GEN_OPTS__FLAG) "$(shell echo $<)"
	@echo 'Finished building: "$<"'
	@echo ' '


