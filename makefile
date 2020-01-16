NAME=libfts.a
CC=gcc
CFLAGS=-c -Wall -Wextra -Werror -Ofast
ASMC=nasm
ASMFLAGS=-fMACHO64
ASMDIR=src
ASMFILES=	ft_isalpha.s	ft_isdigit.s	ft_isalnum.s	ft_isascii.s	\
			ft_isprint.s	ft_toupper.s	ft_tolower.s	ft_bzero.s		\
			ft_strcat.s		ft_puts.s		ft_strlen.s		ft_memset.s		\
			ft_memcpy.s		ft_strdup.s		ft_cat.s		ft_abs.s
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
