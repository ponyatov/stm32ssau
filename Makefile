TARGET = arm-none-eabi

#FLAGS = -mcpu=arm926ej-s -g 
FLAGS = -mthumb -mcpu=cortex-m3 -g 

AS = $(TARGET)-as
LD = $(TARGET)-ld
CC = $(TARGET)-gcc
DB = $(TARGET)-gdb

all: 
	$(AS) $(FLAGS) s.s -o s.o
	$(CC) $(FLAGS) -O1 -c -o c.o c.c
	$(LD) -T ld.ld s.o c.o -o elf.elf
	$(TARGET)-objdump -d elf.elf
	$(TARGET)-objcopy -O binary elf.elf bin.bin

clean:
	rm *.o *.elf *.bin

#debug:
#	qemu-arm -cpu cortex-m3 -B 0x08000000 -g 1234 CMSIS_example.out