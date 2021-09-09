;// Khalil Alkassis
;// CSIS-118B-3888
;// 04/12/2019
;// Lab 7A

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	myArray BYTE 25 DUP(?)
	divisor WORD 10 ;// we divide by 10
	multiplier WORD 0
	count BYTE 0 ;// counter
	prompt BYTE "Int to String", 0ah,0dh,0
	prompt1 BYTE "string back to int", 0ah,0dh,0

.code  		;// write your program here
main proc
    mov edx,offset prompt ;// preps to write
    call writestring ;// writes
	mov eax, 0 ;// 0 to eax
	mov ax, 59021 ;// num to ax
	mov esi, OFFSET myArray ;// sets first point of myArray as esi
	call ToString ;// calls proc
	mov edx, OFFSET myArray ;// sets up to write
	call WriteString ;// writes
	call Crlf ;// return spacing
	mov edx, offset prompt1 ;// preps to write
	call writestring ;// writes
	mov esi, OFFSET myArray ;// sets first point of myArray as esi
	call ToInt ;// calls proc
	call Writedec ;// writes
	call Crlf ;// return spacing


	invoke ExitProcess,0
main endp
ToString PROC
push edx ;// saves
push ebx;// saves
push ecx;// saves
mov ebx,0 ;// 0 to ebx
mov edx, 0 ;// 0 to edx
mov ecx, 0 ;// 0 to ecx
L1:
mov edx, 0 ;// clears remainder
cmp ax, 10 ;// if less than 10, we are done, if not it needs more breaking
JC DONE ;// jumps to DONE label
div divisor ;// divides eax by 10
or dx, 3030h ;// adds 48 to the resultant
mov dh, 0 ;// clears upper 8 of dx
push dx ;// saves character onto stack
inc cx ;// keeps count of pushed characters
inc count ;// count up by 1
jmp L1 ;// back to L1
DONE:
mov ah, 0 ;// clears eax upper 8
or al, 30h ;// adds 48 to character
mov [esi], al ;// adds to front of array, esi currently contains myArray
mov bx, 1 ;// setup index into array
inc esi ;// move to next item in array
L2:
mov dx, 0 ;// clear the upper 8 of edx
pop dx ;// restores dx
mov [esi], dl ;// move character to array
inc esi ;// moves to next value in array
loop L2 ;// loops back 
mov dl,0 ;// clears edx lower 8, we are done null term string
mov [esi] , dl ;// adds null to end of array
pop ecx;// restores
pop ebx;// restores
pop edx;// restores
ret ;// back to main
ToString Endp
ToInt PROC
;// string to int, get first number, 1 for example,  and multiply by 10 each following, so 1 10 100 1000 etc
push edx ;// saves
push ebx;// saves
push ecx;// saves
    mov eax, 0 ;// zeros out registry
	mov edx, 0;// zeros out registry
	mov ecx, 0;// zeros out registry
	mov ebx, 0;// zeros out registry
	mov cl, count ;// moves count to ecx lower 8
	dec cl ;// down by one to account for extra digit
	mov eax, 10 ;// moves 10 into eax to prep for multiplying
	L1: 
	mov multiplier, 10 ;// moves 10 to multiplier
	mul multiplier ;// multiplies eax by multiplier and stores in eax
	loop L1 ;// loops back
	mov multiplier, ax ;// moves the resulting number to ax of eax, this will hold the highest placing digit, for example if num is 500 then ax here is 100
	mov cl, count ;// moves to ecx lower the value of count
	inc cl ;// up by one to account for extra digit
	L2:
	mov eax, 0 ;// clears eax
	mov edx, 48 ;// 48 to edx, accounts for the ASCII difference between char and digit
	mov al, [esi] ;// moves to eax lower 8 the char in esi, esi is myArray[x * SIZEOF BYTE]
	sub eax, edx ;// subtracts 48 from the char ascii value
	mul multiplier ;// multiplies by multiplier to get correct placement
	mov [esi], al ;// moves to point in myarray
	inc esi ;// 'x' up by one
	add eax, ebx ;// adds eax and storage ebx
	mov ebx, eax ;// back to storage
	mov ax, multiplier ;// moves multiplier value to ax
	div divisor ;// divides by 10, to go down 1 number placement
	mov multiplier, ax ;// moves back to storage
	Loop L2 ;// loops back
	mov eax,ebx ;// moves storage to eax to be written
pop ecx;// restores
pop ebx;// restores
pop edx;// restores
ret ;//  back to main
ToInt ENDP
end main