all:
	nasm -f elf64 Colleen.s -o ASM.o; gcc ASM.o -no-pie -o ASM
