/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bbrassar <bbrassar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/06 13:13:04 by bbrassar          #+#    #+#             */
/*   Updated: 2023/02/06 13:32:08 by bbrassar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "bonus/libasm_bonus.h"
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>

static void	__test_push_front(void);
static void	__test_size(void);

int	main(void)
{
	__test_push_front();
	__test_size();
}

static void	__test_push_front(void)
{
	t_list	*begin_ptr;
	t_list	*it;
	t_list	*fast;

	begin_ptr = NULL;
	ft_list_push_front(&begin_ptr, "a");
	ft_list_push_front(&begin_ptr, "b");
	ft_list_push_front(&begin_ptr, "c");
	ft_list_push_front(&begin_ptr, "d");
	ft_list_push_front(&begin_ptr, "e");
	ft_list_push_front(&begin_ptr, "f");
	it = begin_ptr;
	while (it != NULL)
	{
		fast = it->next;
		printf("'%s'\n", (char const *)it->data);
		free(it);
		it = fast;
	}
}

static void __test_size(void)
{
	t_list	*list = NULL;
	t_list	*it;
	t_list	*fast;

	printf("size: %d\n", ft_list_size(list));

	ft_list_push_front(&list, "a");
	printf("size: %d\n", ft_list_size(list));
	ft_list_push_front(&list, "b");
	printf("size: %d\n", ft_list_size(list));
	ft_list_push_front(&list, "c");
	printf("size: %d\n", ft_list_size(list));
	ft_list_push_front(&list, "d");
	printf("size: %d\n", ft_list_size(list));
	ft_list_push_front(&list, "e");
	printf("size: %d\n", ft_list_size(list));
	ft_list_push_front(&list, "f");
	printf("size: %d\n", ft_list_size(list));

	it = list;
	while (it != NULL)
	{
		fast = it->next;
		free(it);
		it = fast;
	}
}
