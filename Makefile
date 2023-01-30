# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bbrassar <bbrassar@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/30 09:01:16 by bbrassar          #+#    #+#              #
#    Updated: 2023/01/30 09:06:45 by bbrassar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME := libasm.a

AS := nasm
ASFLAGS := -felf64

AR := ar
ARFLAGS := rs

LD := cc
LDLIBS := -lasm
LDFLAGS := -L.

RM := rm -vf
MKDIR := mkdir -vp

DIR_SRC := .
DIR_OBJ := obj

SRC := ft_strlen.s
OBJ := $(SRC:%.s=$(DIR_OBJ)/%.o)

$(NAME): $(OBJ)
	$(AR) $(ARFLAGS) $@ $?

$(OBJ): $(DIR_OBJ)/%.o: $(DIR_SRC)/%.s
	@$(MKDIR) $(@D)
	$(AS) $(ASFLAGS) $< -o $@

.PHONY: all clean fclean re

all: $(NAME)

clean:
	@$(RM) -r $(DIR_OBJ)

fclean: clean
	@$(RM) $(NAME)

re: fclean all
