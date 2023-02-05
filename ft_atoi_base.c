/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_atoi_base.c                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bbrassar <bbrassar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/05 19:34:56 by bbrassar          #+#    #+#             */
/*   Updated: 2023/02/05 19:42:59 by bbrassar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

static int	__check_base(char const *base);
static int	__index(char const *base, char c);

int	ft_atoi_base(char const *str, char const *base)
{
	size_t const	base_len = ft_strlen(base);
	int				value;
	int				index;
	int				sign;

	if (base_len < 2 || __check_base(base) == 0)
		return (0);
	value = 0;
	sign = 1;
	while (*str == ' ')
		++str;
	while (*str == '+' || *str == '-')
		if (*str == '-')
			sign = -sign;
	while (*str != '\0')
	{
		index = __index(base, *str++);
		if (index == -1)
			break ;
		value = value * 10 + index;
	}
	return (value * sign);
}

static int	__check_base(char const *base)
{
	char const	*ptr;

	while (*base != '\0')
	{
		if (*base == ' ' || *base == '-' || *base == '+')
			return (0);
		ptr = base + 1;
		while (*ptr != '\0' && *base != *ptr)
			++ptr;
		if (*ptr != '\0')
			return (0);
		++base;
	}
	return (1);
}
