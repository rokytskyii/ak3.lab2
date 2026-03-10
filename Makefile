SDK_PREFIX = arm-none-eabi-
CC = $(SDK_PREFIX)gcc
OBJCOPY = $(SDK_PREFIX)objcopy
QEMU = qemu-system-gnuarmeclipse

CFLAGS = -x assembler-with-cpp -c -g3 -mcpu=cortex-m4 -mthumb -Wall
LDFLAGS = -mcpu=cortex-m4 -mthumb -Wall --specs=nosys.specs -nostdlib -lgcc -T./lscript.ld

all:
	$(CC) $(CFLAGS) start.S -o start.o
	$(CC) $(CFLAGS) lab1.S -o lab1.o
	$(CC) start.o lab1.o $(LDFLAGS) -o firmware.elf
	$(OBJCOPY) -O binary firmware.elf firmware.bin

qemu:
	$(QEMU) --board STM32F4-Discovery --mcu STM32F407VG -d unimp,guest_errors --image firmware.bin -s -S

clean:
	rm -rf *.o *.elf *.bin
