;// Khalil Alkassis
;// CSIS-118B-3888
;// 02/09/2019
;// Test 1

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	prompt BYTE "Enter numbers you'd like to fill num1, num2, num3, and num4",0ah,0dh,0
	prompt1 BYTE "num3 + num4 - num1 - num2 equals",0ah,0dh,0
	prompt2 BYTE "Your numbers in reverse are",0ah,0dh,0


			num1 BYTE ?
			num2 BYTE ?
			num3 DWORD ?
			num4 DWORD ?


.code  		;// write your program here
main proc
    mov edx, OFFSET prompt ;// moves to edx value of prompt
    call WriteString ;// writes the string prompt
	call ReadInt ;// reads value as an int
	mov num1, al ;// moves to num1 the value stored in al, which is first 8 bits in eax
	call ReadInt ;// reads value as an int
	mov num2, al ;// moves to num2 the value stored in al, which is first 8 bits in eax
    call ReadInt ;// reads value as an int
	mov num3, eax ;// DWORD is 32 bits, moves to num3 the value stored in the 32 bits in eax
	call ReadInt ;// reads value as an int
	mov num4, eax ;// DWORD is 32 bits, moves to num4 the value stored in the 32 bits in eax

	add eax, num3 ;// adds num3 to value stored in eax, currently num4
	movzx ebx, num1 ;// moves 8 bit num1 to 32 bit ebx, filling the rest with zeros
	add bl, num2 ;// adds num2 to lower 8 bits of ebx
	sub eax,ebx ;// subtracts ebx from eax, I did it this way to retain the result if it is negative
				;//otherwise, the result would not be correct since lower 8 does not carry negative sign
				;// thats why I couldnt do it all with only eax and subtracting num1 and num2 from al 

	 mov edx, OFFSET prompt1 ;// moves to edx value of prompt1
    call WriteString ;// writes the string prompt
	call WriteInt ;// writes int
	call Crlf ;// acts as return
	mov edx, OFFSET prompt2 ;// moves to edx value of prompt2
    call WriteString ;// writes the string prompt
	mov eax, num4 ;// moves num4 to eax
	call WriteInt;// writes int
	mov eax, num3;// moves num3 to eax
	call WriteInt;// writes int
	mov al, num2;// moves num2 to al
	call WriteInt;// writes int
	mov al, num1;// moves num1 to al
	call WriteInt;// writes int

	invoke ExitProcess,0
main endp
end main