section .data
  name db 'Zara Ali'

section .text
  global _start

_start:
  ; Print 'Zara Ali'
  mov eax, 4 ; (sys_write)
  mov ebx, 1 ; (stdout)
  mov ecx, name
  mov edx, 9 ; msg length
  int 80h

  mov [name], dword 'Nuha' ; Đổi tên thành Nuha Ali
 ; 1 byte = 8 bits và 1 ký tự bằng 1 byte
 ; Nuha có 4 ký tự <=> 4 bytes = 1 dword
 ; Nuha sẽ ghi đè 4 bytes của Zara --> Nuha Ali

  ; In 'Nuha Ali'
  mov eax, 4 ; (sys_write)
  mov ebx, 1 ; (stdout)
  mov ecx, name
  mov edx, 8 ; msg length
  int 80h

  mov eax, 1 ; (sys_exit)
  xor ebx, ebx ; return 0
  int 80h
