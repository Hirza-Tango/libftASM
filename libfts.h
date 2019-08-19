#ifndef LIBFTS_H
# define LIBFTS_H

#include <unistd.h>

int		ft_isalpha(int c);
int		ft_isdigit(int c);
int		ft_isalnum(int c);
int		ft_isascii(int c);
int		ft_isprint(int c);
int		ft_tolower(int c);
int		ft_toupper(int c);
void	ft_bzero(void *s, unsigned long long n);
char	*ft_strcat(char *dst, const char *src);
int		ft_puts(const char *s);

#endif
