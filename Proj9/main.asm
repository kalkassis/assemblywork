;// Khalil Alkassis
;// CSIS-118B-3888
;// 02/17/2019
;// Lab 4b

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	prompt BYTE "Enter a string",0dh,0ah,0
	text BYTE 101 DUP(?) ;// holds 100 chars but its 101 to hold a null at the end

.code  		;// write your program here
main proc
	mov edx, OFFSET prompt ;// moves prompt to edx
	call WriteString ;// writes string in edx
		mov edx, OFFSET text ;// moves text to edx
		mov ecx, 100 ;// max chars to read, ecx is the count register
		call ReadString ;// reads string
		mov ebx, 0 ;// sets up in ebx the char that i want to output starting at 0
		mov edx, OFFSET text ;// sets up again
		call StrLength ;// puts in eax the length of string
		mov ecx, eax ;// moves eax to ecx
		L1:
		mov al, text[ebx] ;// to loop
		call WriteChar;// writes char from al
		inc ebx ;// moves ebx up by one thus pointing to the next char
		mov al, text[ebx] ;// to loop
		call WriteChar;// writes char from al
		call Crlf ;// return
		inc ebx ;// moves ebx up by one thus pointing to the next char
		loop L1 ;// loops back to L1 and runs again, decrements ecx by 1 until it is zero to stop


	invoke ExitProcess,0
main endp
end main