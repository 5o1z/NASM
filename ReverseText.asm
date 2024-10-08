section .data
    prompt db "Nhap chuoi: ", 0
    prompt_len equ $ - prompt
    output db "Chuoi dao nguoc: ", 0
    output_len equ $ - output
    newline db 10

section .bss
    input resb 100
    reversed resb 100
    input_len resb 4

section .text
    global _start

_start:
    ; In prompt
    mov eax, 4
    mov ebx, 1
    mov ecx, prompt
    mov edx, prompt_len
    int 0x80

    ; Đọc input từ người dùng
    mov eax, 3
    mov ebx, 0
    mov ecx, input
    mov edx, 100
    int 0x80

    ; Lưu độ dài input
    dec eax  ; Bỏ ký tự newline
    mov [input_len], eax

    ; Đảo ngược chuỗi
    mov ecx, [input_len]
    mov esi, input
    mov edi, reversed
    add esi, ecx ; Trỏ esi đến sau ký tự cuối của input
    dec esi ; Giảm 1 để trỏ vào kí tự cuối

reverse_loop:
    mov al, [esi]
    mov [edi], al
    dec esi ; Chuyển đến kí tự đảo ngược tiếp theo
    inc edi ; Chuyển đến vị trí tiếp theo
    loop reverse_loop

    ; In thông báo output
    mov eax, 4
    mov ebx, 1
    mov ecx, output
    mov edx, output_len
    int 0x80

    ; In chuỗi đã đảo ngược
    mov eax, 4
    mov ebx, 1
    mov ecx, reversed
    mov edx, [input_len]
    int 0x80

    ; In newline
    mov eax, 4
    mov ebx, 1
    mov ecx, newline
    mov edx, 1
    int 0x80

    ; Kết thúc chương trình
    mov eax, 1
    xor ebx, ebx
    int 0x80
