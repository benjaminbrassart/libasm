/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bbrassar <bbrassar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/30 09:10:36 by bbrassar          #+#    #+#             */
/*   Updated: 2023/01/30 11:40:11 by bbrassar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define TEST_FUNCTION(Name) {#Name, __test_ ## Name}

typedef void (*t_test_func)(char const *);

static void __test_ft_strlen(char const *str);
static void __test_ft_strcpy(char const *str);
static void __test_ft_strdup(char const *str);
static void __test_ft_strcmp(char const *str);

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
	TEST_FUNCTION(ft_strcmp),
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
	printf("(ft)  \"%s\" -> %lu\n", str, ft_strlen(str));
	printf("(std) \"%s\" -> %lu\n\n", str, strlen(str));
}

static void __test_ft_strcpy(char const *str)
{
	char buffer[2048] = "this is the original buffer";
	char* res = ft_strcpy(buffer, str);

	printf("(ft)  \"%s\" (addr match: %s)\n", res, (buffer == res) ? "true" : "false");
	memset(buffer, 0, sizeof (buffer));
	res = strcpy(buffer, str);
	printf("(std) \"%s\" (addr match: %s)\n\n", res, (buffer == res) ? "true" : "false");
}

static void __test_ft_strdup(char const *str)
{
	char* buffer = ft_strdup(str);

	printf("(ft)  ft_strdup(\"%s\") = \"%s\" (addr match: %s)\n", str, buffer, (str == buffer) ? "true" : "false");
	free(buffer);
}

static void __test_ft_strcmp(char const *str)
{
	int	res;

	for (size_t j = 0; j < (sizeof TEST_VALUES / sizeof (*TEST_VALUES)); ++j)
	{
		res = ft_strcmp(str, TEST_VALUES[j]);
		printf("(ft)  \"%s\" == \"%s\": %s (%d)\n", str, TEST_VALUES[j], (res == 0) ? "true" : "false", res);
		res = strcmp(str, TEST_VALUES[j]);
		printf("(std) \"%s\" == \"%s\": %s (%d)\n\n", str, TEST_VALUES[j], (res == 0) ? "true" : "false", res);
	}
}
