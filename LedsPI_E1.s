.global _start
_start:

movia r2, 0x10000000


INI: ldw r3, ROJOPAR(r0)
stwio r3, 0(r2)
movia r4, 500000

DELAY1:
subi r4, r4, 1 
bne r4, r0, DELAY1

ldw r3, ROJOIMPAR(r0)

stwio r3, 0(r2)
movia r4, 500000
DELAY2:
subi r4, r4, 1
bne r4, r0, DELAY2
br INI


.org 0x200 
ROJOIMPAR: .word 0x15555 
ROJOPAR: .word 0x2AAAA
.end