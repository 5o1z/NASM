# Syscall (System Calls)

System calls (syscalls) are the primary interface used by user-level programs to request services from the operating system kernel. Syscalls allow a program to interact with the OS to perform operations like input/output, process control, memory management, and file operations. In assembly language, syscalls are the mechanism that enables low-level programs to perform tasks that are managed by the OS kernel while the program runs in user mode.

## Overview

In computing, system calls provide an interface between user-level applications and the operating system. When a program executes a syscall, it essentially asks the OS to perform some operation on its behalf, such as reading from or writing to the disk, allocating memory, or performing input/output operations. Syscalls are implemented in the operating system kernel and are usually optimized for performance and security.

### How Syscalls Work

Syscalls are invoked in assembly language through a specific interrupt (e.g., `int 0x80` for 32-bit x86 systems or `syscall` instruction for 64-bit x86-64 systems). The syscall number and the arguments to the syscall are passed through CPU registers. The syscall's return value is usually stored in a specific register (e.g., `RAX` on x86-64).

## Registers Used in Syscalls

### 32-bit Syscalls (x86)

For 32-bit Linux, syscalls are invoked using `int 0x80`, and arguments are passed through general-purpose registers:

- **EAX**: Contains the syscall number.
- **EBX**: First argument.
- **ECX**: Second argument.
- **EDX**: Third argument.
- **ESI**: Fourth argument.
- **EDI**: Fifth argument.
- **EBP**: Used as a base pointer (stack pointer for the syscall).
  
**Example syscall in 32-bit assembly:**
```assembly
section .text
   global _start

_start:
   mov eax, 4       ; syscall number for 'write'
   mov ebx, 1       ; file descriptor (1 = stdout)
   mov ecx, message  ; pointer to string
   mov edx, 13       ; length of string
   int 0x80          ; make syscall
```

### 64-bit Syscalls (x86-64)

For 64-bit Linux, syscalls use the `syscall` instruction, and arguments are passed through different registers:

- **RAX**: Contains the syscall number.
- **RDI**: First argument.
- **RSI**: Second argument.
- **RDX**: Third argument.
- **R10**: Fourth argument.
- **R8**: Fifth argument.
- **R9**: Sixth argument.
  
**Example syscall in 64-bit assembly:**
```assembly
section .text
   global _start

_start:
   mov rax, 1        ; syscall number for 'write'
   mov rdi, 1         ; file descriptor (1 = stdout)
   mov rsi, message   ; pointer to string
   mov rdx, 13         ; length of string
   syscall             ; make syscall
```

## Common Syscalls

### 1. **`write` (syscall number: 1)**

- **Description**: Writes data to a file descriptor.
- **Usage**:
  - `RDI` = file descriptor (e.g., `1` for standard output)
  - `RSI` = pointer to buffer (string)
  - `RDX` = size of buffer
- **Example**:
  ```assembly
  mov rax, 1          ; syscall number (1 = write)
  mov rdi, 1          ; file descriptor (1 = stdout)
  mov rsi, message    ; pointer to string
  mov rdx, 13         ; length of string
  syscall             ; make syscall
  ```
  This will print the string `"Hello, World!"` to the standard output.

### 2. **`exit` (syscall number: 60)**

- **Description**: Exits the program with a given status.
- **Usage**:
  - `RDI` = exit status (e.g., `0` for success, `1` for failure)
- **Example**:
  ```assembly
  mov rax, 60         ; syscall number (60 = exit)
  xor rdi, rdi        ; exit status (0)
  syscall             ; make syscall
  ```

### 3. **`fork` (syscall number: 57)**

- **Description**: Creates a new process.
- **Usage**:
  - `RDI` = `0`
- **Returns**: In the child process, `fork` returns `0`, and in the parent process, it returns the PID of the child process.
- **Example**:
  ```assembly
  mov rax, 57         ; syscall number (57 = fork)
  syscall             ; make syscall
  ```

### 4. **`open` (syscall number: 2)**

- **Description**: Opens a file.
- **Usage**:
  - `RDI` = filename (string)
  - `RSI` = flags (e.g., `O_RDONLY`, `O_WRONLY`)
  - `RDX` = file permissions (e.g., `0666`)
- **Example**:
  ```assembly
  mov rax, 2          ; syscall number (2 = open)
  mov rdi, file_path  ; pointer to file
  mov rsi, O_RDONLY    ; read-only
  mov rdx, 0           ; file permissions
  syscall             ; make syscall
  ```

### 5. **`read` (syscall number: 0)**

- **Description**: Reads data from a file descriptor.
- **Usage**:
  - `RDI` = file descriptor
  - `RSI` = buffer (pointer)
  - `RDX` = size to read
- **Example**:
  ```assembly
  mov rax, 0          ; syscall number (0 = read)
  mov rdi, 0          ; file descriptor (0 = stdin)
  mov rsi, buffer     ; pointer to buffer
  mov rdx, buffer_size; size of buffer
  syscall             ; make syscall
  ```

### 6. **`mmap` (syscall number: 9)**

- **Description**: Maps files or devices into memory.
- **Usage**:
  - `RDI` = starting address (0 for kernel-managed)
  - `RSI` = size (e.g., `4K`, `8K`)
  - `RDX` = protection flags (e.g., `PROT_READ | PROT_WRITE`)
  - `R10` = file descriptor (e.g., `-1` for no file)
- **Example**:
  ```assembly
  mov rax, 9         ; syscall number (9 = mmap)
  mov rdi, 0          ; starting address
  mov rsi, 4096       ; size (4 KB)
  mov rdx, 3          ; protection flags (readable and writable)
  syscall             ; make syscall
  ```

## Conclusion

Syscalls are the primary mechanism for interacting with the operating system kernel in low-level programming, such as in assembly language. Understanding syscalls, their arguments, and how to use them is crucial for writing efficient system-level applications. Syscalls provide direct access to OS features, enabling applications to perform operations like reading/writing data, managing processes, and interacting with hardware.

By understanding and using syscalls in your assembly programs, you can create more complex applications that interact directly with the system, perform memory management, and perform I/O operations efficiently.

For more detailed information about syscall behavior, consult the relevant system call documentation using `man` pages, e.g., `man 2 write`, `man 2 exit`, `man 2 open`, etc.
