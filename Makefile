# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bbrassar <bbrassar@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/30 09:01:16 by bbrassar          #+#    #+#              #
#    Updated: 2023/01/30 14:17:40 by bbrassar         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME := libasm.a
NAME_BONUS := libasm_bonus.a

MAIN := a.out
MAIN_BONUS := bonus.out

AS := nasm
ASFLAGS := -felf64 -Fdwarf -g

AR := ar
ARFLAGS := rs

CC := cc
CFLAGS := -Wall -Werror -Wextra -c -g3

LD := cc
LDLIBS := -lasm
LDLIBS_BONUS := -lasm_bonus
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

SRC_BONUS := bonus/ft_atoi_base.s

OBJ := $(SRC:%.s=$(DIR_OBJ)/%.o)
OBJ_BONUS := $(SRC_BONUS:%.s=$(DIR_OBJ)/%.o)

$(NAME): $(OBJ)
	$(AR) $(ARFLAGS) $@ $?

$(NAME_BONUS): $(OBJ) $(OBJ_BONUS)
	$(AR) $(ARFLAGS) $@ $?

$(OBJ) $(OBJ_BONUS): $(DIR_OBJ)/%.o: $(DIR_SRC)/%.s
	@$(MKDIR) $(@D)
	$(AS) $(ASFLAGS) $< -o $@

$(DIR_OBJ)/main.o: $(DIR_SRC)/main.c
	$(CC) $(CFLAGS) $< -o $@

$(DIR_OBJ)/bonus/main.o: $(DIR_SRC)/bonus/main.c
	$(CC) $(CFLAGS) $< -o $@

$(MAIN): $(NAME) $(DIR_OBJ)/main.o
	$(LD) $(filter %.o,$^) -o $@ $(LDFLAGS) $(LDLIBS)

$(MAIN_BONUS): $(NAME_BONUS) $(DIR_OBJ)/bonus/main.o
	$(LD) $(filter %.o,$^) -o $@ $(LDFLAGS) $(LDLIBS_BONUS)

.PHONY: all clean fclean re bonus

all: $(MAIN)

clean:
	@$(RM) -r $(DIR_OBJ)

fclean: clean
	@$(RM) $(NAME) $(MAIN) $(NAME_BONUS) $(MAIN_BONUS)

re: fclean all

bonus: $(MAIN_BONUS)
