COLLEEN	=	Colleen
GRACE	=	Grace
SULLY	=	Sully

SCOMPILE	=	nasm
SFLAGS	=	-f elf64
COMP	=	gcc -Wall -Wextra -Werror

TEST_FOLD	=	test_sully

all: $(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN): $(COLLEEN).s
	$(SCOMPILE) $(SFLAGS) $(COLLEEN).s -o $(COLLEEN).o;
	$(COMP) $(COLLEEN).o -no-pie -o $(COLLEEN)


$(GRACE): $(GRACE).s
	$(SCOMPILE) $(SFLAGS) $(GRACE).s -o $(GRACE).o;
	$(COMP) $(GRACE).o -no-pie -o $(GRACE)

$(SULLY): $(SULLY).s
	$(SCOMPILE) $(SFLAGS) $(SULLY).s -o $(SULLY).o;
	$(COMP) $(SULLY).o -no-pie -o $(SULLY)

test3:
	make all
	mkdir -p $(TEST_FOLD)
	cp $(SULLY) $(TEST_FOLD); cd $(TEST_FOLD); ./$(SULLY)

clean:
	rm -rf $(COLLEEN).o
	rm -rf $(GRACE).o
	rm -rf $(SULLY).o

fclean: clean
	rm -rf $(COLLEEN)
	rm -rf $(GRACE)
	rm -rf $(SULLY)
	rm -rf $(TEST_FOLD)
	rm -rf Grace_kid.s

re: fclean all

.PHONY: all clean fclean re test3
