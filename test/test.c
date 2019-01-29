#include "../libfts.h"
#include <printf.h>

void	print_test(char *test, char *sys, char *mine)
{
	printf(
		"Test with '%s':\tsys:%s\tmine:%s\n", test, sys, mine
	);
}


int main() {
	puts("LibftASM test:\n");
	puts("ft_isalpha:");
	print_test("\0", isalpha(0), ft_isalpha(0));
	print_test("@", isalpha('@'), ft_isalpha('@'));
	print_test("a", isalpha('a'), ft_isalpha('a'));
	print_test("Z", isalpha('Z'), ft_isalpha('Z'));
	print_test("[", isalpha('['), ft_isalpha('['));
	print_test("`", isalpha('`'), ft_isalpha('`'));
	print_test("a", isalpha('a'), ft_isalpha('a'));
	print_test("z", isalpha('z'), ft_isalpha('z'));
	print_test("{", isalpha('{'), ft_isalpha('{'));
	print_test("5", isalpha('5'), ft_isalpha('5'));

	return 0;
}
