;// Khalil Alkassis
;// CSIS-118B-3888
;// 02/09/2019
;// Lab 4a

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	myArray WORD 5 DUP(?)
	prompt BYTE "Enter a Number", 0dh, 0ah, 0
	prompt2 BYTE "The number at position 1 is ", 0dh, 0ah, 0
	prompt3 BYTE "The number at position 4 is ", 0dh, 0ah, 0

.code  		;// write your program here
main proc
	mov edx, OFFSET prompt ;// gets prompt ready to write
	call WriteString ;// writes string
	call ReadInt ;// reads entered int
	mov myArray[0],ax ;// ax not eax because words not dwords

	call WriteString ;// writes string
	call ReadInt ;// reads entered int stores in ax
	mov [myArray + 1 * SIZEOF WORD],ax ;// ax not eax because words not dwords, this string also shows another way you can call myArray by placing all in brackets and using + sign

	call WriteString ;// writes string
	call ReadInt ;// reads entered int stores in ax
	mov myArray[2 * SIZEOF WORD],ax ;// ax not eax because words not dwords

	call WriteString ;// writes string
	call ReadInt ;// reads entered int stores in ax
	mov myArray[3 * SIZEOF WORD],ax ;// ax not eax because words not dwords

		call WriteString ;// writes string
	call ReadInt ;// reads entered int, stores in ax
	mov myArray[4 * SIZEOF WORD],ax ;// ax not eax because words not dwords

	mov ax, myArray[4 * SIZEOF WORD] ;// moves to ax the given array pos
	xchg myArray[1 * SIZEOF WORD], ax ;// exchanges two values as long as one of the values is in the register like ax or eax, in this case it will switch what is in pos 3 from previous line stored in ax with zero
   mov myArray[4 * SIZEOF WORD], ax ;// moves the now exchanged value held in ax, which should be 2, to the array pos of 4
   movzx eax, myArray[1 * SIZEOF WORD] ;// extends all to zero
	
	mov edx, OFFSET prompt2 ;// gets prompt ready to write
		call WriteString ;// writes string
	call WriteDec;// writes decimal 
	call Crlf ;// acts as return

		mov edx, OFFSET prompt3 ;// gets prompt ready to write
		call WriteString ;// writes string	
        movzx eax, myArray[4 * SIZEOF WORD] ;// extends copied value to 16 or 32 bits by filling the remaining with zeros
	    call WriteDec;// writes decimal 


	invoke ExitProcess,0
main endp
end main