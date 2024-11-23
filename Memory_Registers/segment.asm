segment .text ; Code segment
  global _start

_start:
  ; eax (4) --> sys_write
  ; eax (1) ---> sys_exit
  ; ebx (1) ---> stdout
  mov eax, 4 ; sys_write
  mov ebx, 1 ; stdout
  mov ecx, msg ; ecx is a second argument
  mov edx, len ; edx is a third argument
  int 0x80 ; Call kernel

  mov eax, 1 ; sys_exit
  int 0x80 ; Call kernel

segment .data ; data segment
msg db "Hello world with segment!!", 0xa
len equ $ - msg
