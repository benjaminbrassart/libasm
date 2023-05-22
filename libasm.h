/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   libasm.h                                           :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: bbrassar <bbrassar@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/01/30 09:13:01 by bbrassar          #+#    #+#             */
/*   Updated: 2023/05/22 15:36:31 by bbrassar         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef LIBASM_H
# define LIBASM_H

# include <stddef.h>

size_t
ft_strlen(char const *str);

char*
ft_strcpy(char *dst, char const *src);

char*
ft_strdup(char const *str);

int
ft_strcmp(char const* s1, char const* s2);

int
ft_write(int fd, void const* buffer, size_t len);

int
ft_read(int fd, void* buffer, size_t len);

#endif
