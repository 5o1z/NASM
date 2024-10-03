section .text
  global _start

_start:
  mov eax, 4 ; syscall (sys_write)
  mov ebx, 1 ; file descriptor (stdout)
  mov ecx, msg ; message to write
  mov edx, len ; length of message
  int 80h

  mov edx, 9 ; msg length of message is 9
  mov ecx, s2
  mov eax, 4
  mov ebx, 1
  int 80h

  mov eax, 1 ; syscall (sys_exit)
  int 80h

section .data
msg db 'Display 9 stars', 0xa ; A message
len equ $ - msg ; msg length 
s2 times 9 db "*"
