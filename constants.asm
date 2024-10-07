sys_exit equ 1
sys_write equ 4
sys_read equ 3
stdin equ 0
stdout equ 1

section .data
  msg1 db 'Hello, programmers', 0xA, 0xD
  len1 equ $ - msg1

  msg2 db 'Welcome to the world of', 0xA, 0xD
  len2 equ $ - msg2

  msg3 db 'Linux assembly programming!'
  len3 equ $ - msg3

section .text
  global _start

_start:
  ; Display the first message
  mov eax, sys_write
  mov ebx, stdout
  mov ecx, msg1
  mov edx, len1
  int 0x80

  ; Display a second message
  mov eax, sys_write
  mov ebx, stdout
  mov ecx, msg2
  mov edx, len2
  int 0x80

  ; Display the third message
  mov eax, sys_write
  mov ebx, stdout
  mov ecx, msg3
  mov edx, len3
  int 0x80

  ; Exit the program
  mov eax, sys_exit
  xor ebx, ebx ; Return 0
  int 0x80
