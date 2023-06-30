COLLEEN	=	Colleen
GRACE	=	Grace
SULLY	=	Sully

COMPILE	=	gcc
CFLAGS	=	-Wall -Wextra -Werror

TEST_FOLD	=	test_sully
TEST_FILE	=	test_Collen

all: $(COLLEEN) $(GRACE) $(SULLY)

$(COLLEEN): $(COLLEEN).c
	$(COMPILE) $(CFLAGS) Colleen.c -o $(COLLEEN)

$(GRACE): $(GRACE).c
	$(COMPILE) $(CFLAGS)  Grace.c -o $(GRACE)

$(SULLY): $(SULLY).c
	$(COMPILE) $(CFLAGS) Sully.c -o $(SULLY)

test1:
	./$(COLLEEN) > $(TEST_FILE)
	diff $(COLLEEN).c $(TEST_FILE)

test2:
	./$(GRACE)
	diff $(GRACE).c Grace_kid.c

test3:
	mkdir -p $(TEST_FOLD)
	cp $(SULLY) $(TEST_FOLD) ; cd $(TEST_FOLD) ; ./$(SULLY)

clean:
	rm -rf $(COLLEEN)
	rm -rf $(GRACE)
	rm -rf $(SULLY)

fclean: clean
	rm -rf $(TEST_FOLD)
	rm -rf $(TEST_FILE)
	rm -rf Grace_kid.c

re: fclean all

.PHONY: all clean fclean re test1 test2 test3