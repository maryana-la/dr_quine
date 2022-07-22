all:
	nasm -f elf64 Grace.s -o ASM.o; gcc ASM.o -no-pie -o ASM

clean:
	rm -rf ASM
	rm -rf ASM.o
	rm -rf Grace_kid.s

