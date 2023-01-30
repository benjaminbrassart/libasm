/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bbrassar <bbrassar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/30 09:10:36 by bbrassar          #+#    #+#             */
/*   Updated: 2023/01/30 10:43:58 by bbrassar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>
#include <stdlib.h>

#define TEST_FUNCTION(Name) {#Name, __test_ ## Name}

typedef void (*t_test_func)(char const *);

static void __test_ft_strlen(char const *str);
static void __test_ft_strcpy(char const *str);
static void __test_ft_strdup(char const *str);

typedef struct
{
	char const* name;
	t_test_func func;
} t_test_decl;

static char const* TEST_VALUES[] = {
	"hello world!",
	"!",
	"",
	"%s",
	"123" "\0" "456",
};

static t_test_decl const TEST_FUNCTIONS[] = {
	TEST_FUNCTION(ft_strlen),
	TEST_FUNCTION(ft_strcpy),
	TEST_FUNCTION(ft_strdup),
};

int main(void)
{
	for (size_t i = 0; i < (sizeof TEST_FUNCTIONS / sizeof (*TEST_FUNCTIONS)); ++i)
	{
		printf("\n-- Testing %s --\n\n", TEST_FUNCTIONS[i].name);
		for (size_t j = 0; j < (sizeof TEST_VALUES / sizeof (*TEST_VALUES)); ++j)
			TEST_FUNCTIONS[i].func(TEST_VALUES[j]);
	}
}

static void __test_ft_strlen(char const *str)
{
	printf("ft_strlen(\"%s\") = %lu\n", str, ft_strlen(str));
}

static void __test_ft_strcpy(char const *str)
{
	char buffer[2048] = "this is the original buffer";
	char* res = ft_strcpy(buffer, str);

	printf("'%s' (addr match: %s)\n", res, (buffer == res) ? "true" : "false");
}

static void __test_ft_strdup(char const *str)
{
	char* buffer = ft_strdup(str);

	printf("ft_strdup(\"%s\") = \"%s\" (addr match: %s)\n", str, buffer, (str == buffer) ? "true" : "false");
	free(buffer);
}
