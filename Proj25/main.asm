;// Khalil Alkassis
;// CSIS-118B-3888
;// 02/23/2019
;// Test 2

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	prompt BYTE "Please enter 16 numbers:",0dh,0ah,0
	prompt2 BYTE "The array after the second half was reversed is:",0dh,0ah,0
	array DWORD 17 DUP(?) ;// holds 16 nums but its 17 to hold a null at the end

.code  		;// write your program here
main proc
	mov edx, OFFSET prompt ;// moves prompt to edx
	call WriteString;// writes string stored in edx
	mov edx, OFFSET array ;// moves array to edx
	mov ecx, LENGTHOF array ;// max numbers to read, ecx is the count register
	dec ecx ;// ecx down by 1
	mov ebx, 0 ;// sets up in ebx the number that i want to output starting at 0
	L1:
	call ReadDec ;// reads input without pos or neg signs
	mov array[ebx * SIZEOF TYPE array], eax ;// moves to point in array at ebx, the value stored at eax
	inc ebx ;// moves ebx up by one thus pointing to the next int
	loop L1 ;// loops back to L1 and runs again, decrements ecx by 1 until it is zero to stop

	mov edx,0 ;// clearing edx to prepare for division, holds remainders 
	mov eax, ebx ;// moving length of array in ebx to eax, so 16
	mov ecx, 4  ;//prepping to divide the length of the array, held in ebx and now eax, by two
	div ecx ;// dividing eax by ecx, so 4
	mov ecx, eax ;// moves to ecx the length of the array divided by 4 so 4
	add eax,ecx ;// adds ecx to eax and result is stored in eax, essentially multiplying by two, this result is half of the size of the array
	mov edx, eax ;// moving eax to edx to be manipulated later, dont want ecx to be decremented and mess up the loop
	dec ebx ;// to account for arrays starting at zero

	L2:
	mov eax, array[ebx * SIZEOF TYPE array] ;// moves to eax number in array at position ebx
    xchg eax, array[edx * SIZEOF TYPE array] ;// exchanges value in eax with value in array at position edx
	mov array[ebx * SIZEOF TYPE array], eax ;// moves to array at ebx the value in eax
	inc edx ;// edx up by one
	dec ebx ;// takes ebx down one
	loop L2 ;// loops back to l2

	mov edx, OFFSET prompt2 ;// moves prompt to edx
	call WriteString;// writes string stored in edx
	mov ecx, LENGTHOF array ;// max numbers to read, ecx is the count register
	dec ecx ;// ecx down by 1
	mov ebx, 0 ;// sets up in ebx the number that i want to output starting at 0

	L3:
	mov eax, array [ebx * SIZEOF TYPE array] ;// moves to eax value at ebx
	call WriteDec ;// writes value
	call Crlf ;// return
	inc ebx ;// ebx up by one
	loop L3 ;// loops at l3 for ecx amount of times 



	invoke ExitProcess,0
main endp
end main