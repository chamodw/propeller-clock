avr-gcc -mmcu=atmega328p -Wall -Os -o clock.elf clock.c
avr-objcopy -j .text -j .data -O ihex clock.elf clock.hex




