;// Khalil Alkassis
;// CSIS-118B-3888
;// 04/26/2019
;// Test 4

INCLUDE c:\Irvine\Irvine32.inc
strCat PROTO
;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	prompt BYTE "Enter two strings:",0ah,0dh,0
	holder BYTE ?
.code  		;// write your program here
main proc
	mov edx, OFFSET prompt ;// preps to write, also used to set a memory address to be passed to strCat parameter
	call WriteString ;// writes
	mov ecx, 100 ;// max chars to read
	call ReadString ;// reads input and stores in edx
	push offset prompt ;// pushes to stack the offset 
	mov edx, offset holder ;// preps to write, allows for a unique memory address to be passed to the strCat parameter
	mov ecx, 100 ;// max chars to read
	call ReadString ;// reads input and stores in edx
	push offset holder ;// pushes to stack
	call strCat
	
	invoke ExitProcess,0
main endp
end main