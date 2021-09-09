;// Khalil Alkassis
;// CSIS-118B-3888
;// 05/16/2019
;// Lab 10a

INCLUDE c:\Irvine\Irvine32.inc

;// .386
;// .model flat,stdcall
;// .stack 4096
ExitProcess proto,dwExitCode:dword

.data 		;// write your data in this section
	valA REAL8 1.5 ;// 64-bit (8 byte) IEEE long real
	valB REAL8 2.5
	valC REAL8 3.0
	valD REAL8 ?; +6.0
	myInteger DWORD 1.33
	prompt BYTE "valD is: ", 0ah, 0dh, 0
.code  		;// write your program here
main proc
;// computing valD = -valA + (valB * valC)
	;fld valA ;// load variable valA into top of FPU stack (aka ST(0))
	;fchs ;// change sign of value contained in ST(0), so valA in ST(0) is now -valA
	;fld valB ;// load variable valB into top of FPU stack (aka ST(0)), valA shifted to ST(1)
	;fmul valC ;//multiply source by destination (valB in ST(0) * ValC = ValC)
	;fadd ;// add source to destination (ST(0) + ST(1) = ST(1)) or at this point (valB + valA = valA)
	;fstp valD ;// copies value in ST(0) to ValD and pops ST(0) off the stack

;// computing valD = valA * (valA - valB - valC) + 1.33 * valA * valB
	fld valA ;// load variable valA into top of FPU stack (aka ST(0))
	fsub valB ;// subtract valB from valA in ST(0)     (valA - valB)
	fsub valC ;// subtract valC from valA in ST(0)     (valA - valB - valC)
	fmul valA ;// (ST(0) * valA = ST(0))               valA * (valA - valB - valC)
	fld valB ;// load variable valB into top of FPU stack (aka ST(0)), valA shifted to ST(1)
	fmul valA ;// (ST(0) * valA = ST(0))               valA * valB
	fmul myInteger ;// ST(0) * 1.33 = ST(0)            1.33 * valA * valB
	fadd ;// no operands so ST(0) + ST(1) = ST(0)      valA * (valA - valB - valC) + 1.33 * valA * valB
	fstp valD ;// copies value in ST(0) to ValD and pops ST(0) off the stack, valD = valA * (valA - valB - valC) + 1.33 * valA * valB
	fld valD ;// back to ST(0) to write
	mov edx, OFFSET prompt  ;// preps to write
	call WriteString ;// writes
	call writefloat ;// writes ST(0)
	invoke ExitProcess,0
main endp
end main