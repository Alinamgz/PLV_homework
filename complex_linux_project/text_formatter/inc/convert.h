#pragma once

#define IS_LOWER(c) (c >= 'a' && c <= 'z')
#define IS_UPPER(c) (c >= 'A' && c <= 'Z')

// 
char *to_lower(char *buf, int max_len);
char *to_upper(char *buf, int max_len);
