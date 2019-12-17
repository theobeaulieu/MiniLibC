##
## EPITECH PROJECT, 2019
## makefile
## File description:
## makefile
##

SRCS	= 	source/strlen.asm 	\
			source/strchr.asm 	\
			source/memset.asm 	\
			source/memcpy.asm 	\
			source/strcmp.asm 	\
			source/memmove.asm 	\
			source/strncmp.asm 	\
			source/strcasecmp.asm 	\
			source/rindex.asm 	\
			source/strstr.asm 	\
			source/strpbrk.asm 	\
			source/strcspn.asm 	\

OBJS	= $(SRCS:.asm=.o)

CFLAGS	= -fPIC -shared

NAME	= libasm.so

all: $(NAME)

$(NAME):	$(OBJS)
		ld $(CFLAGS) -o $(NAME) $(OBJS)

%.o: %.asm
	nasm -f elf64 $< -o $@

clean:
	rm -f $(OBJS)

fclean: clean
	rm -f $(NAME)

re:	fclean all

.PHONY: all clean fclean re
