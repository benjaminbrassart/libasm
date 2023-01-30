/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bbrassar <bbrassar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/30 09:10:36 by bbrassar          #+#    #+#             */
/*   Updated: 2023/01/30 09:22:29 by bbrassar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"
#include <stdio.h>

static void __test_ft_strlen(char const *str);

int main(void)
{
	__test_ft_strlen("hello world!");
	__test_ft_strlen("!");
	__test_ft_strlen("");
	__test_ft_strlen("%s");
	__test_ft_strlen("123" "\0" "456");
}

static void __test_ft_strlen(char const *str)
{
	printf("ft_strlen(\"%s\") = %lu\n", str, ft_strlen(str));
}
