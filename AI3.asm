; multiplies 3 with 2, and displays the result
; Trong phép nhân không xảy ra overflow vì các thanh ghi có độ dài gấp đôi được sử dụng để lưu kết quả
section .text
  global _start

_start:
  mov al, '3'
  sub al, '0'

  mov bl, '2'
  sub bl, '0'
  mul bl ; al x bl --> kết quả lưu vào ax (0 -> 255 là phạm vi của 8bit)
  add al, '0' ; Kết quả sẽ được lưu vào thanh ghi AX do nhân 2 số 8 bit (1 bytes)

  mov [res], al
  mov ecx, msg
  mov edx, len
  mov eax, 4
  mov ebx, 1
  int 80h

  mov ecx, res
  mov edx, len
  mov eax, 4
  mov ebx, 1
  int 80h

  mov eax, 1
  xor ebx, ebx
  int 80h

section .data
  msg db 'Result is:  ', 0xA, 0xD
  len equ $ - msg
  segment .bss
  res resb 1
