################################################################################
# Automatically-generated file. Do not edit!
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../src/AudioNotchFilter.c \
../src/ISR.c \
../src/Initialize.c \
../src/Process_data.c 

SRC_OBJS += \
./src/AudioNotchFilter.doj \
./src/ISR.doj \
./src/Initialize.doj \
./src/Process_data.doj 

C_DEPS += \
./src/AudioNotchFilter.d \
./src/ISR.d \
./src/Initialize.d \
./src/Process_data.d 


# Each subdirectory must supply rules for building sources it contributes
src/AudioNotchFilter.doj: ../src/AudioNotchFilter.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore Blackfin C/C++ Compiler'
	ccblkfn.exe -c -file-attr ProjectName="AudioNotch" -proc ADSP-BF533 -flags-compiler --no_wrap_diagnostics -si-revision 0.6 -g -DCORE0 -D_DEBUG -I"C:\Test\AudioNotch\system" -structs-do-not-overlap -no-const-strings -no-multiline -warn-protos -double-size-32 -decls-strong -cplbs -gnu-style-dependencies -MD -Mo "src/AudioNotchFilter.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/ISR.doj: ../src/ISR.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore Blackfin C/C++ Compiler'
	ccblkfn.exe -c -file-attr ProjectName="AudioNotch" -proc ADSP-BF533 -flags-compiler --no_wrap_diagnostics -si-revision 0.6 -g -DCORE0 -D_DEBUG -I"C:\Test\AudioNotch\system" -structs-do-not-overlap -no-const-strings -no-multiline -warn-protos -double-size-32 -decls-strong -cplbs -gnu-style-dependencies -MD -Mo "src/ISR.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/Initialize.doj: ../src/Initialize.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore Blackfin C/C++ Compiler'
	ccblkfn.exe -c -file-attr ProjectName="AudioNotch" -proc ADSP-BF533 -flags-compiler --no_wrap_diagnostics -si-revision 0.6 -g -DCORE0 -D_DEBUG -I"C:\Test\AudioNotch\system" -structs-do-not-overlap -no-const-strings -no-multiline -warn-protos -double-size-32 -decls-strong -cplbs -gnu-style-dependencies -MD -Mo "src/Initialize.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '

src/Process_data.doj: ../src/Process_data.c
	@echo 'Building file: $<'
	@echo 'Invoking: CrossCore Blackfin C/C++ Compiler'
	ccblkfn.exe -c -file-attr ProjectName="AudioNotch" -proc ADSP-BF533 -flags-compiler --no_wrap_diagnostics -si-revision 0.6 -g -DCORE0 -D_DEBUG -I"C:\Test\AudioNotch\system" -structs-do-not-overlap -no-const-strings -no-multiline -warn-protos -double-size-32 -decls-strong -cplbs -gnu-style-dependencies -MD -Mo "src/Process_data.d" -o "$@" "$<"
	@echo 'Finished building: $<'
	@echo ' '


