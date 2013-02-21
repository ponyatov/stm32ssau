.syntax unified

.section .vectors
.global vectors
vectors:
@	.long sec_stack_end
@	.word Reset_Handler+1
	B Reset_Handler+1 /* Reset */
	B . /* Undefined */
	B . /* SWI */
	B . /* Prefetch Abort */
	B . /* Data Abort */
	B . /* reserved */
	B . /* IRQ */
	B . /* FIQ */

.text
.global Reset_Handler
Reset_Handler:
	nop
set_stack:
	ldr r0,=sec_stack_end
	mov sp,r0
move_to_ram:
	ldr r0,=sec_data_b
	ldr r1,=sec_data_e
	ldr r2,=sec_data_f
1:
	ldrb r3,[r2]
	add r2,r2,#1
	strb r3,[r0]
	add r0,r0,#1
	cmp r0,r1
	bne 1b
go_c_code:
	bl init
1:
	bl loop
	b 1b

.data
x1: .int 1
y2: .word 2
z3: .long 3
