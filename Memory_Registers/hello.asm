section .text
  global _start ; Phải khai báo đầu tiên

_start: ; Nơi trương trình bắt đầu
  ; ebx trong syscall chứa file descriptor (Đối tượng mà dữ liệu sẽ được in ra)
  mov ebx, 1 ; Màn hình hiển thị (stdout)
  ; eax chứa số của hệ thống syscall
  ; eax luôn được dùng để lưu số của syscall
  mov eax, 4 ; Ghi dữ liệu ra màn hình (sys_write)
  mov edx, len ; Message length
  mov ecx, msg ; Message to write
  int 0x80 ; Call kernel

  mov eax, 1 ; (sys_exit)
  int 0x80 ; Call kernel

section .data
msg db 'Hello, world', 0xa ; String to print
len equ $ - msg ; Length of the string
