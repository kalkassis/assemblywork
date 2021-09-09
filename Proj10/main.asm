;// Khalil Alkassis
;// CSIS-118B-3888
;// 02/17/2019
;// Lab 4c

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	myArray BYTE 21 DUP (?)
	count DWORD ?
	prompt BYTE "Enter 20 characters for the array"

.code  		;// write your program here
main proc
mov edx, OFFSET prompt ;// moves contents of prompt to edx
call WriteString ;// writes edx
call Crlf ;// return 
mov edx, OFFSET myArray ;// moves content of myArray to edx
mov ecx, LENGTHOF myArray ;// sets counter ecx to length of myarray
call ReadString ;// reads user input and stores in edx
mov ebx, 0 ;// clears ebx
mov ecx, 4 ;// because it is 4 rows 
L1:
mov count, ecx ;// sets up count as storage of row amount 4
mov ecx, 5 ;// moves 5 to ecx
L2:
mov al, myArray[ebx] ;// moves to al myarray at ebx
call WriteChar ;// writes char
mov al, ',';// spacing
call WriteChar ;// writes char
inc ebx ;// ebx up by 1
loop L2 ;// loops at L2
call Crlf ;// return
mov ecx, count ;// moves count to ecx
loop L1 ;// loops at L1


	invoke ExitProcess,0
main endp
end main