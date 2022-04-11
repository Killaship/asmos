git pull
cd src/
nasm -fbin -o ../bin/boot16 boot16.asm
nasm -fbin -o ../bin/boot32 boot32.asm
cd ..
cat bin/boot16 bin/boot32 > os
qemu-system-i386 -fda os -rtc base=localtime -curses
