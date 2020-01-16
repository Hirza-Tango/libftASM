#include "../libfts.h"
#include <printf.h>
#include <string.h>
#include <stdlib.h>
#include <sys/syscall.h>
#include <fcntl.h>

static void	print_test(char *test, int sys, int mine)
{
	printf(
		"Test with '%s':\tsys:%x\tmine:%x\n", test, sys, mine
	);
}

int main() {
	puts("LibftASM test:\n");
	puts("ft_isalpha:");
	print_test("-1", isalpha(-1), ft_isalpha(-1));
	print_test("\\0", isalpha(0), ft_isalpha(0));
	print_test("@", isalpha('@'), ft_isalpha('@'));
	print_test("A", isalpha('A'), ft_isalpha('A'));
	print_test("Z", isalpha('Z'), ft_isalpha('Z'));
	print_test("[", isalpha('['), ft_isalpha('['));
	print_test("`", isalpha('`'), ft_isalpha('`'));
	print_test("a", isalpha('a'), ft_isalpha('a'));
	print_test("z", isalpha('z'), ft_isalpha('z'));
	print_test("{", isalpha('{'), ft_isalpha('{'));
	print_test("5", isalpha('5'), ft_isalpha('5'));
	puts("");
	puts("ft_isdigit:");
	print_test("\\0", isdigit(0), ft_isdigit(0));
	print_test("-0x1", isdigit(-1), ft_isdigit(-1));
	print_test("0", isdigit('0'), ft_isdigit('0'));
	print_test("/", isdigit('/'), ft_isdigit('/'));
	print_test("9", isdigit('9'), ft_isdigit('9'));
	print_test(":", isdigit(':'), ft_isdigit(':'));
	print_test("g", isdigit('g'), ft_isdigit('g'));
	puts("");
	puts("ft_isalnum:");
	print_test("\\0", isalnum(0), ft_isalnum(0));
	print_test("-0x1", isalnum(-1), ft_isalnum(-1));
	print_test("0", isalnum('0'), ft_isalnum('0'));
	print_test("/", isalnum('/'), ft_isalnum('/'));
	print_test("9", isalnum('9'), ft_isalnum('9'));
	print_test(":", isalnum(':'), ft_isalnum(':'));
	print_test("g", isalnum('g'), ft_isalnum('g'));
	print_test("@", isalnum('@'), ft_isalnum('@'));
	print_test("A", isalnum('A'), ft_isalnum('A'));
	print_test("Z", isalnum('Z'), ft_isalnum('Z'));
	print_test("[", isalnum('['), ft_isalnum('['));
	print_test("`", isalnum('`'), ft_isalnum('`'));
	print_test("a", isalnum('a'), ft_isalnum('a'));
	print_test("z", isalnum('z'), ft_isalnum('z'));
	print_test("{", isalnum('{'), ft_isalnum('{'));
	print_test("5", isalnum('5'), ft_isalnum('5'));
	puts("");
	puts("ft_isascii:");
	print_test("\\0", isascii(0), ft_isascii(0));
	print_test("-0x1", isascii(-1), ft_isascii(-1));
	print_test("0x1", isascii(1), ft_isascii(1));
	print_test("0x7f", isascii(0x7f), ft_isascii(0x7f));
	print_test("0x80", isascii(0x80), ft_isascii(0x80));
	print_test("g", isascii('g'), ft_isascii('g'));
	puts("");
	puts("ft_isprint:");
	print_test("\\0", isprint(0), ft_isprint(0));
	print_test("-0x1", isprint(-1), ft_isprint(-1));
	print_test("0x1f", isprint(0x1f), ft_isprint(0x1f));
	print_test("space", isprint(' '), ft_isprint(' '));
	print_test("0x7e", isprint(0x7e), ft_isprint(0x7e));
	print_test("0x7f", isprint(0x7f), ft_isprint(0x7f));
	print_test("0x80", isprint(0x80), ft_isprint(0x80));
	print_test("g", isprint('g'), ft_isprint('g'));
	puts("");
	puts("ft_toupper:");
	print_test("\\0", toupper(0), ft_toupper(0));
	print_test("-0x1", toupper(-1), ft_toupper(-1));
	print_test("0", toupper('0'), ft_toupper('0'));
	print_test("@", toupper('@'), ft_toupper('@'));
	print_test("a", toupper('a'), ft_toupper('a'));
	print_test("z", toupper('z'), ft_toupper('z'));
	print_test("A", toupper('A'), ft_toupper('A'));
	print_test("Z", toupper('Z'), ft_toupper('Z'));
	print_test("~", toupper('~'), ft_toupper('~'));
	puts("");
	puts("ft_tolower:");
	print_test("\\0", tolower(0), ft_tolower(0));
	print_test("-0x1", tolower(-1), ft_tolower(-1));
	print_test("0", tolower('0'), ft_tolower('0'));
	print_test("@", tolower('@'), ft_tolower('@'));
	print_test("a", tolower('a'), ft_tolower('a'));
	print_test("z", tolower('z'), ft_tolower('z'));
	print_test("A", tolower('A'), ft_tolower('A'));
	print_test("Z", tolower('Z'), ft_tolower('Z'));
	print_test("~", tolower('~'), ft_tolower('~'));
	puts("\nft_bzero:");
	char	*buffer = (char *)malloc(10);
	buffer[9] = 0;
	memset(buffer, ' ', 10);
	ft_bzero(buffer, 0);
	puts("Buffer filled with spaces (32), with ft_bzero n = 0");
	for (int i = 0; i < 10; i++)
		printf("%i ", buffer[i]);
	ft_bzero(buffer, 10);
	puts("\nSame buffer, with ft_bzero n = 10");
	for (int i = 0; i < 10; i++)
		printf("%i ", buffer[i]);
	puts("\n\nft_strcat:");
	memcpy(buffer, "hi", 3);
	printf("Buffer: %s\n", buffer);
	buffer = ft_strcat(buffer, " there");
	printf("Buffer after copy: %s\n", buffer);
	puts("\nft_puts:");
	ft_puts("I'm putting a string!");
	puts("Testing null string...");
	ft_puts(0);
	puts("\nft_strlen:");
	puts("string: Hello there");
	print_test("Hello there", strlen("Hello there"), ft_strlen("Hello there"));
	print_test("a", strlen("a"), ft_strlen("a"));
	print_test("\\0", strlen(""), ft_strlen(""));
	puts("\nft_memset:");
	memset(buffer, ' ', 10);
	ft_memset(buffer, 'a', 0);
	puts("Buffer filled with spaces (32), with ft_memset n = 0, c = 'a'");
	for (int i = 0; i < 10; i++)
		printf("%i ", buffer[i]);
	ft_memset(buffer, 'a', 10);
	puts("\nSame buffer, with ft_memset n = 10, c = 'b'");
	for (int i = 0; i < 10; i++)
		printf("%i ", buffer[i]);
	puts("\n\nft_memcpy:");
	bzero(buffer, 10);
	ft_memcpy(buffer, "Success !", 10);
	puts(buffer);
	ft_memcpy(buffer, "hello", 0);
	puts(buffer);
	puts("\nft_strdup:");
	char *dup = ft_strdup(buffer);
	if (dup == buffer)
		puts("new area not allocated!");
	else
		puts("Regions are different");
	puts(buffer);
	puts(dup);
	puts("\nft_cat:");
	int fd = open("test.txt", O_RDONLY);
	ft_cat(fd);
	puts("\nft_abs:");
	print_test("0", abs(0), ft_abs(0));
	print_test("1", abs(1), ft_abs(1));
	print_test("-42", abs(-42), abs(-42));
	return 0;
}
