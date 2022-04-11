git pull
cd src/
nasm -fbin -o ../bin/boot16 boot16.asm
nasm -fbin -o ../bin/boot32 boot32.asm
cd ..

qemu-system-i386 -fda os -rtc base=localtime -curses
