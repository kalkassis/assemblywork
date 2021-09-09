;// Khalil Alkassis
;// CSIS-118B-3888
;// 04/14/2019
;// Lab 7B

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	prompt BYTE "Enter three numbers: ", 0dh, 0ah, 0
	result BYTE "The sum of the first two is: ", 0dh,  0ah, 0
	result2 BYTE "The sum of all three is: ", 0dh,  0ah, 0
	strNum1 BYTE 100 DUP(0) ;// assures that last number in string is zero
	strNum2 BYTE 100 DUP(0)
	strNum3 BYTE 100 DUP(0)
	strResult BYTE 100 DUP(0)
	sLength DWORD ?

.code  		;// write your program here
main proc
	mov edx, OFFSET prompt ;// preps to write
	call WriteString ;// writes
	mov edx, OFFSET strNum1 ;// fills edx with content of strNum1
	mov ecx, SIZEOF strNum1 ;// sets counter register ecx with size of strNum1
	call ReadString ;// get user input
	mov edx, OFFSET strNum2 ;// fills edx with content of strNum2
	mov ecx, SIZEOF strNum2 ;// sets counter register ecx with size of strNum2
	call ReadString ;// get user input
	mov edx, OFFSET strNum3 ;// fills edx with content of strNum3
	mov ecx, SIZEOF strNum3 ;// sets counter register ecx with size of strNum3
	call ReadString ;// get user input
	call StrLength ;// stores length of string in eax
	mov ecx, eax ;// moves length of string into ecx
	mov sLength, ecx ;// sets sLength as ecx
	call AddNums ;// calls procedure
	mov edx, OFFSET result ;// preps to write
	call WriteString ;// writes
	mov edx, OFFSET strResult ;// preps to write
	call WriteString ;// writes
	call crlf ;// spacing
    
	push ecx ;//saves
	L3:
	mov al, strresult[ecx -1] ;// moves to al the result of the first sum at position ecx -1
	mov strnum1[ecx -1],al ;// moves that to the cooresponding position in strnum1
	mov al, strnum3[ecx -1];// moves to al the third number to be added at position ecx -1
	mov strnum2[ecx -1],al ;// moves that to the cooresponding position in strnum2
	loop L3;// loops
	pop ecx;// restores

	call AddNums ;// calls proc
	mov edx, OFFSET result2 ;// preps to write
	call WriteString ;// writes
	mov edx, OFFSET strResult ;// preps to write
	call WriteString ;// writes
	invoke ExitProcess,0
main endp
AddNums PROC
push ecx ;//saves
push eax ;//saves
push edx ;//saves
clc ;// clears carry flag
	L1:
	mov ax, 0 ;// clears ax
	mov al, strNum1[ecx - 1] ;// sets lower 8 bits of eax as the last char of strNum1 in case carry over is needed
	adc al, strNum2[ecx - 1] ;// adc = add with carry (basically if the carry flag is set, an extra 1 is added) which makes sense because without it, for example 19 + 19 would be 28
	aaa ;// Ascii Adjust after Addition
	push ax ;// saves
	loop L1 ;// loops back, ecx - 1
	jnc createString ;// checks if last two didnt have carry, if not it jumps to label
	mov ax, '1';// adds the carry number over if there was one final one
	push ax ;// saves
	inc sLength ;// sLength up by 1
	createString:
	mov ecx, 0 ;// clears counter
	L2:
	pop ax ;//restores
	or ax, 3030h ;// converts from string to num by 48 for ascii difference
	mov strResult[ecx], al ;// moves to  strResult the value in al
	inc ecx ;// up by one
	cmp ecx, sLength ;// check if same val
	jne L2 ;// loops back if comparison was true
	pop edx ;//restores
	pop eax ;// restores
	pop ecx ;// restores
ret ;// back to main
AddNums ENDP
end main