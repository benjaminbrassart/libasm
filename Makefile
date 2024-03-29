# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bbrassar <bbrassar@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/30 09:01:16 by bbrassar          #+#    #+#              #
#    Updated: 2023/05/22 17:57:40 by bbrassar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME := libasm.a
MAIN := a.out

AS := nasm
ASFLAGS := -felf64 -Fdwarf -g

AR := ar
ARFLAGS := rs

CC := cc
CFLAGS := -Wall -Werror -Wextra -c -g3

LD := cc
LDLIBS := -lasm
LDFLAGS := -L.

RM := rm -vf
MKDIR := mkdir -vp

DIR_SRC := .
DIR_OBJ := obj

SRC := ft_strlen.s
SRC += ft_strcpy.s
SRC += ft_strdup.s
SRC += ft_strcmp.s
SRC += ft_write.s
SRC += ft_read.s
SRC += set_errno.s
OBJ := $(SRC:%.s=$(DIR_OBJ)/%.o)

$(MAIN): $(NAME) $(DIR_OBJ)/main.o
	$(LD) $(filter %.o,$^) -o $@ $(LDFLAGS) $(LDLIBS)

$(NAME): $(OBJ)
	$(AR) $(ARFLAGS) $@ $?

$(OBJ): $(DIR_OBJ)/%.o: $(DIR_SRC)/%.s
	@$(MKDIR) $(@D)
	$(AS) $(ASFLAGS) $< -o $@

$(DIR_OBJ)/main.o: main.c
	$(CC) $(CFLAGS) $< -o $@ -D_GNU_SOURCE

.PHONY: all clean fclean re

all: $(MAIN)

clean:
	@$(RM) -r $(DIR_OBJ)

fclean: clean
	@$(RM) $(NAME) $(MAIN)

re: fclean all
