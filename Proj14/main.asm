;// Khalil Alkassis
;// CSIS-118B-3888
;// 03/31/2019
;// Lab 6A

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	prompt BYTE "Enter a number",0ah,0dh,0
	oddMsg BYTE "Odd Number",0ah,0dh,0
	evenMsg BYTE "Even Number", 0ah,0dh,0

.code  		;// write your program here
main proc
	mov edx, OFFSET prompt ;// gets prompt ready to be read
	call WriteString ;// writes
	call ReadInt;// gets input stores in eax
	call CheckEven ;// calls proc
	cmp eax, 1 ;// checks if eax is one, which it would be if number was even
	jz EVENLABEL ;// if it was, jump to EVENLABEL
	mov edx, OFFSET oddMsg ;// if not, prep to write odd
	call WriteString ;// write odd
	JMP EXITOUT;// jump to exit label

	EVENLABEL:
	mov edx, OFFSET evenMsg ;// preps to write
	call Writestring ;// writes
	EXITOUT:
	exit ;// ends program

	invoke ExitProcess,0
main endp

CheckEven PROC
push ebx ;// saves
push edx ;// saves
    mov edx, 0 ;// preps for division, this will hold remainder
	mov ebx, 2 ;// want to divide by 2
	div ebx ;// divides eax by ebx
	cmp edx, 0 ;// tests to see if number was even, because if it was the remainder would be zero
	jz EVENLABEL ;// even numberjump, if zero flag is set jz = jump if zero
	mov eax, 0 ;// if it wasnt set then the program moves on to the next instruction here
	JMP EXITPROC ;// jumps over to exit label, that way it wont go through evenlabel regardless of result
	EVENLABEL:
	mov eax, 1 ;// 1 into eax
	EXITPROC:
	pop edx ;// restores
	pop ebx ;// restores
	ret ;// back to main
CheckEven endp

end main