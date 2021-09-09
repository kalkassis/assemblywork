;// Khalil Alkassis
;// CSIS-118B-3888
;// 02/03/2019
;// Lab 3c

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	myarray WORD 5 DUP(?) ;// gives five items, undefined (?)
	prompt BYTE "Enter a Number",0ah,0dh,0
	prompt2 BYTE "The sum of the first two array numbers is: ",0ah,0dh,0

.code  		;// write your program here
main proc
mov eax, 0 ;// clears eax
mov edx, OFFSET prompt ;// moves to edx value of prompt
call WriteString ;// writes the string prompt
call ReadInt ;// writes value as an int
mov myarray[0 * SIZEOF WORD], ax ;// moves to myarray at position 1 [0] the value stored in ax

call WriteString;// writes the string prompt
call ReadInt;// writes value as an int
mov myarray[1 * SIZEOF WORD], ax ;// moves to myarray at position 2 [1] the value stored in ax

call WriteString;// writes the string prompt
call ReadInt;// writes value as an int
mov myarray[2 * SIZEOF WORD], ax ;// moves to myarray at position 3 [2] the value stored in ax
call WriteString;// writes the string prompt
call ReadInt;// writes value as an int
mov myarray[3 * SIZEOF WORD], ax ;// moves to myarray at position 4 [3] the value stored in ax
mov  ax,myarray[0 * SIZEOF WORD] ;// moves to ax the value stored in position 1 [0] of my array
mov myarray[4 * SIZEOF WORD],ax ;// moves to myarray at position 5 [4] the value stored in ax
add ax, myarray[1 * SIZEOF WORD] ;// adds ax which is val at pos 0 and val at pos 1
mov myarray[4 * SIZEOF WORD],ax ;// sets last value to sum in ax
mov edx, OFFSET prompt2 ;// moves to edx value of prompt
call WriteString ;// writes the string prompt
call WriteDec ;// writes as decimal, no sign
call Crlf ;// acts as return

	invoke ExitProcess,0
main endp
end main