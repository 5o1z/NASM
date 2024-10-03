section .data
  userMsg db 'Please enter a number: '
  lenUserMsg equ $ - userMsg
  disMsg db 'You have entered: '
  lenDisMsg equ $ - disMsg

section .bss
  num resb 5 ; Unitialized data

section .text
  global _start

_start:
  ; Display user prompt
  mov eax, 4 ; sys_write
  mov ebx, 1 ; stdout
  mov ecx, userMsg
  mov edx, lenUserMsg
  int 0x80

; Read and store the user input
  mov eax, 3 ; sys_read
  mov ebx, 2 ; stdin
  mov ecx, num
  mov edx, 5 ; Size of the user input (5 bytes)
  int 0x80

; Output the message
  mov eax, 4 ; sys_write
  mov ebx, 1 ; stdout
  mov ecx, disMsg
  mov edx, lenDisMsg
  int 0x80

; Output the number have enter
  mov eax, 4 ; sys_write
  mov ebx, 1 ; stdout
  mov ecx, num
  mov edx, 5 ; Size of the number (5 bytes)
  int 0x80
; Exit the program

  mov eax, 1
  mov ebx, 0
  int 0x80
