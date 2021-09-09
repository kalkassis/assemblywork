;// Khalil Alkassis
;// CSIS-118B-3888
;// 05/02/2019
;// Lab 9A

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword
strRemove PROTO, pStart: PTR BYTE, nChars:DWORD ;// prototype, preps for INVOKE
strNextWord PROTO, pStart: PTR BYTE, fChar: BYTE ;// prototype, preps for INVOKE
.data 		;// write your data in this section
	target BYTE "Now is the time for all good men", 0

.code  		;// write your program here
main proc
	;INVOKE strRemove, ADDR [target + 4], 3 ;// invokes proc while passing the address of target plus 4 (to go past 'Now ' withg the space ) and removes next 3 chars so 'is ' with space
	;mov edx, OFFSET target ;// preps to write
	;call WriteString ;// writes
	;call Crlf ;// spacing
	INVOKE strNextWord, ADDR target, 'f' ;// invokes proc while passing the address of target plus 4 (to go past 'Now ' withg the space ) and removes next 3 chars so 'is ' with space
	mov edx, OFFSET target ;// preps to write
	call WriteString ;// writes
	invoke ExitProcess,0
main endp
strNextWord PROC, pStart: PTR BYTE, fChar: BYTE
INVOKE Str_length, pStart ;// gets length of string stores in eax
mov ecx, eax ;// moves to ecx whats in eax, which is length of string
mov esi, pStart ;// moves to esi register pStart, so points to the string
mov edi, pStart ;// moves to edi (destination register) pStart
mov al,fChar ;// moves ascii if char to look for into al
cld ;// clear direction flag, which direction to copy in
repne scasb ;// scans for byte, byte to search for goes in al register, repne repeats while the zero flag is clear and ECX > 0
jnz NOTFOUND ;// jumps if zero flag isnt set (it will be if ecx reaches zero because of rep)
mov edx, OFFSET target ;// moves into edx the offset of target
call StrLength ;// gets string length and stores in eax
sub eax, ecx ;// subs ecx (position of desired char from the right) from eax (length of string) to result in position of desired char from the left
mov BYTE PTR[edi - 1], 0 ;// using instead of stosb to account for edi - 1 ((desired position + 1) - 1)
ret ;// back to main
NOTFOUND:
mov ebx, 1 ;// moves 1 to ebx
cmp ebx, 0 ;// compares 1 to 0, so the zero flag will be cleared
ret ;// back to main
strNextWord ENDP

strRemove PROC, pStart: PTR BYTE, nChars : DWORD ;// have to do this to catch vars passed by INVOKE, its name of var : type of var
INVOKE Str_length, pStart ;// gets length of string stores in eax
mov ecx, eax ;// moves to ecx whats in eax, which is length of string
.IF nChars <= ecx ;// checks if nChars is less than or equal to ecx
sub ecx, nChars ;// if it is, we subtract nChars from ecx
.ENDIF ;// ends if statement
mov esi, pStart ;// moves to esi register pStart, so points to the string
add esi, nChars ;// points to first character to remove
mov edi, pStart ;// moves to edi (destination register) pStart
cld ;// clear direction flag, which direction to copy in
rep movsb ;// copies a byte from source to a destination (byte to copy in esi, destination in edi), rep means it will repeat this ecx number of times
mov BYTE PTR[edi], 0 ;// moves zero to end of string to signal the end of it
ret ;// back to main
strRemove ENDP
end main