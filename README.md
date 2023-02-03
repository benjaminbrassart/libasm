# libasm
## An introduction to x64 assembly

### Mandatory part

For the mandatory part of this project, we had to rewrite some function of our libft in ASM:
- ft_strlen
- ft_strcpy
- ft_strcmp
- ft_strdup

We also had to rewrite these system call wrappers:
- ft_write
- ft_read

The wrappers must check errors and set `errno` using `___error` or `errno_location`.

### Bonus part

The bonus part mainly focuses on linked lists and simple algorithms. The linked list uses the following structure:

```c
typedef struct s_list   t_list;

struct s_list
{
    void    *data;
    t_list  *next;
};
```

We had to rewrite these functions from the piscine:
- ft_atoi_base
- ft_list_push_front
- ft_list_size
- ft_list_sort
- ft_list_remove_if

---

### Prototypes:
```c
// mandatory part
size_t  ft_strlen(char const *str);
char    *ft_strcpy(char *dst, char const *src);
int     ft_strcmp(char const *s1, char const *s2);
int     ft_write(int fd, void const *buffer, size_t count);
int     ft_read(int fd, void *buffer, size_t count);
char    *ft_strdup(char const *str);

// bonus part
int     ft_atoi_base(char const *str, char const *base);
void    ft_list_push_front(t_list **begin, void *data);
int     ft_list_size(t_list *begin);
void    ft_list_sort(t_list **begin, int (*cmp)());
void    ft_list_remove_if(t_list **begin, void *data_ref, int (*cmp)(), void (*free_fn)(void *));
```

---

### TODO:

Mandatory:
- ~~ft_strlen~~ &mdash; **DONE**
- ~~ft_strcpy~~ &mdash; **DONE**
- ~~ft_strcmp~~ &mdash; **DONE**
- ~~ft_write~~ &mdash; **DONE**
- ~~ft_read~~ &mdash; **DONE**
- ~~ft_strdup~~ &mdash; **DONE**

Bonus:
- ft_atoi_base
- ft_list_push_front
- ft_list_size
- ft_list_sort
- ft_list_remove_if
