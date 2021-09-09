;// Khalil Alkassis
;// CSIS-118B-3888
;// 03/03/2019
;// Lab 5B

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	prompt BYTE "Enter two Numbers: ", 0dh, 0ah, 0

.code  		;// write your program here
main proc
	mov edx, OFFSET prompt ;// moves prompt to edx
	call WriteString ;// writes string
	call ReadInt ;// reads input, stores in eax
	mov ebx, eax ;// moves to ebx the first number to hold
	call ReadInt ;// reads second to eax
	sub eax, ebx ;// subtracts first number from second
	;dec eax ;// eax down 1
	mov ecx, eax ;// moves difference to counter ecx
	
	call SumOfNNumbers ;//calls proc
	call WriteDec;// write decimal
	call Crlf;//return


	invoke ExitProcess,0
main endp
SumOfNNumbers PROC
push ebx ;// to stack
push ecx ;// to stack
mov eax, ebx ;// clears eax
L1:
inc ebx ;// ebx up one
add eax, ebx ;// adds eax and ebx and stores in eax
loop L1 ;// loops back to l1, ecx down by 1
pop ecx ;//back
pop ebx ;// back
ret ;// return statement
SumOfNNumbers ENDP
end main