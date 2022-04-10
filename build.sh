git pull
cd src/
nasm -fbin -o ../os boot16.asm
cd ..
qemu-system-i386 -fda os -rtc base=localtime -curses
