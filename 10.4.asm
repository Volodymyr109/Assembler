.macro push (%reg)
	sw %reg, 0(sp)
	addi sp, sp, -4
.end_macro

.macro pop (%reg)
	addi sp, sp, 4
	lw %reg, 0(sp)
.end_macro

    lw x0 0
    lw x1 1
    lw x2 0
    lw t1 0

section .data
    array: .word 0, 1, 0
    array_len: .word 32
section .text
    global _start
_start:
    mv x0, 0     
    mv x1, 1      
    mv x2, 0      
main:
    call x1, 10      #check 
    jal done         
    mv [.word+x1*2], x2
    add x2, x3   
    mv t1, x2    #MEM
    mv x2, x3    
    mv x3, t1    
    call x1         #LOOP
    jal main         

return_1:
    mov x1, 1
    mov x2, t1
    pop t1
    ret
    
end:
    j end

