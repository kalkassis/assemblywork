;// Khalil Alkassis
;// CSIS-118B-3888
;// 03/03/2019
;// Lab 5A

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
		call Print2Char ;// calls procedure


	invoke ExitProcess,0
main endp
Print2Char PROC
        push edx ;// save in stack
		push ebx ;// save in stack
		push ecx ;//save to stack
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
		pop edx ;// restore
		pop ebx ;// restore
		pop ecx ;// restore
		ret ;// return statement to go back to main proc
Print2Char ENDP
end main