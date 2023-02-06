/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm_bonus.h                                     :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bbrassar <bbrassar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/02/05 19:44:11 by bbrassar          #+#    #+#             */
/*   Updated: 2023/02/05 19:45:25 by bbrassar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_BONUS_H
# define LIBASM_BONUS_H

typedef struct s_list	t_list;

struct s_list
{
	void	*data;
	t_list	*next;
};

int		ft_atoi_base(char const *str, char const *base);
void	ft_list_push_front(t_list **begin, void *data);
int		ft_list_size(t_list *begin);
void	ft_list_sort(t_list **begin, int (*cmp)());
void	ft_list_remove_if(t_list **begin, void *data_ref, int (*cmp)(),
			void (*free_fn)(void *));

#endif // LIBASM_BONUS_H
