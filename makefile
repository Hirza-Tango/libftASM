NAME=libfts.a
CC=gcc
CFLAGS=-c -Wall -Wextra -Werror -Ofast
ASMC=nasm
ASMFLAGS=-fMACHO64
ASMDIR=src
ASMFILES=ft_isalpha.s
OBJ=$(ASMFILES:%.s=build/%.o)

$(NAME): $(OBJ)
	@ar rcs $(NAME) $(OBJ)

build/%.o: $(ASMDIR)/%.s
	@mkdir -p build
	$(ASMC) $(ASMFLAGS) $< -o $@

all: $(NAME);

clean:
	@rm -rf build/

fclean: clean
	@rm -rf $(NAME)

re: fclean all

.PHONY: clean fclean re all
