
clock.elf:     file format elf32-avr


Disassembly of section .text:

00000000 <__vectors>:
   0:	0c 94 34 00 	jmp	0x68	; 0x68 <__ctors_end>
   4:	0c 94 53 00 	jmp	0xa6	; 0xa6 <__vector_1>
   8:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
   c:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  10:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  14:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  18:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  1c:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  20:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  24:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  28:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  2c:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  30:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  34:	0c 94 8b 00 	jmp	0x116	; 0x116 <__vector_13>
  38:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  3c:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  40:	0c 94 a2 00 	jmp	0x144	; 0x144 <__vector_16>
  44:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  48:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  4c:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  50:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  54:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  58:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  5c:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  60:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>
  64:	0c 94 51 00 	jmp	0xa2	; 0xa2 <__bad_interrupt>

00000068 <__ctors_end>:
  68:	11 24       	eor	r1, r1
  6a:	1f be       	out	0x3f, r1	; 63
  6c:	cf ef       	ldi	r28, 0xFF	; 255
  6e:	d8 e0       	ldi	r29, 0x08	; 8
  70:	de bf       	out	0x3e, r29	; 62
  72:	cd bf       	out	0x3d, r28	; 61

00000074 <__do_copy_data>:
  74:	12 e0       	ldi	r17, 0x02	; 2
  76:	a0 e0       	ldi	r26, 0x00	; 0
  78:	b1 e0       	ldi	r27, 0x01	; 1
  7a:	e8 e5       	ldi	r30, 0x58	; 88
  7c:	f2 e0       	ldi	r31, 0x02	; 2
  7e:	02 c0       	rjmp	.+4      	; 0x84 <__do_copy_data+0x10>
  80:	05 90       	lpm	r0, Z+
  82:	0d 92       	st	X+, r0
  84:	aa 36       	cpi	r26, 0x6A	; 106
  86:	b1 07       	cpc	r27, r17
  88:	d9 f7       	brne	.-10     	; 0x80 <__do_copy_data+0xc>

0000008a <__do_clear_bss>:
  8a:	22 e0       	ldi	r18, 0x02	; 2
  8c:	aa e6       	ldi	r26, 0x6A	; 106
  8e:	b2 e0       	ldi	r27, 0x02	; 2
  90:	01 c0       	rjmp	.+2      	; 0x94 <.do_clear_bss_start>

00000092 <.do_clear_bss_loop>:
  92:	1d 92       	st	X+, r1

00000094 <.do_clear_bss_start>:
  94:	a1 37       	cpi	r26, 0x71	; 113
  96:	b2 07       	cpc	r27, r18
  98:	e1 f7       	brne	.-8      	; 0x92 <.do_clear_bss_loop>
  9a:	0e 94 f5 00 	call	0x1ea	; 0x1ea <main>
  9e:	0c 94 2a 01 	jmp	0x254	; 0x254 <_exit>

000000a2 <__bad_interrupt>:
  a2:	0c 94 00 00 	jmp	0	; 0x0 <__vectors>

000000a6 <__vector_1>:
  a6:	1f 92       	push	r1
  a8:	0f 92       	push	r0
  aa:	0f b6       	in	r0, 0x3f	; 63
  ac:	0f 92       	push	r0
  ae:	11 24       	eor	r1, r1
  b0:	5f 93       	push	r21
  b2:	6f 93       	push	r22
  b4:	7f 93       	push	r23
  b6:	8f 93       	push	r24
  b8:	9f 93       	push	r25
  ba:	af 93       	push	r26
  bc:	bf 93       	push	r27
  be:	ef 93       	push	r30
  c0:	ff 93       	push	r31
  c2:	f8 94       	cli
  c4:	8f ec       	ldi	r24, 0xCF	; 207
  c6:	97 e0       	ldi	r25, 0x07	; 7
  c8:	01 97       	sbiw	r24, 0x01	; 1
  ca:	f1 f7       	brne	.-4      	; 0xc8 <__vector_1+0x22>
  cc:	00 c0       	rjmp	.+0      	; 0xce <__vector_1+0x28>
  ce:	00 00       	nop
  d0:	e4 e8       	ldi	r30, 0x84	; 132
  d2:	f0 e0       	ldi	r31, 0x00	; 0
  d4:	80 81       	ld	r24, Z
  d6:	91 81       	ldd	r25, Z+1	; 0x01
  d8:	90 93 6d 02 	sts	0x026D, r25
  dc:	80 93 6c 02 	sts	0x026C, r24
  e0:	10 92 70 02 	sts	0x0270, r1
  e4:	10 92 6f 02 	sts	0x026F, r1
  e8:	68 e6       	ldi	r22, 0x68	; 104
  ea:	71 e0       	ldi	r23, 0x01	; 1
  ec:	0e 94 16 01 	call	0x22c	; 0x22c <__udivmodhi4>
  f0:	60 93 6e 02 	sts	0x026E, r22
  f4:	11 82       	std	Z+1, r1	; 0x01
  f6:	10 82       	st	Z, r1
  f8:	78 94       	sei
  fa:	ff 91       	pop	r31
  fc:	ef 91       	pop	r30
  fe:	bf 91       	pop	r27
 100:	af 91       	pop	r26
 102:	9f 91       	pop	r25
 104:	8f 91       	pop	r24
 106:	7f 91       	pop	r23
 108:	6f 91       	pop	r22
 10a:	5f 91       	pop	r21
 10c:	0f 90       	pop	r0
 10e:	0f be       	out	0x3f, r0	; 63
 110:	0f 90       	pop	r0
 112:	1f 90       	pop	r1
 114:	18 95       	reti

00000116 <__vector_13>:
 116:	1f 92       	push	r1
 118:	0f 92       	push	r0
 11a:	0f b6       	in	r0, 0x3f	; 63
 11c:	0f 92       	push	r0
 11e:	11 24       	eor	r1, r1
 120:	8f 93       	push	r24
 122:	9f 93       	push	r25
 124:	80 91 6a 02 	lds	r24, 0x026A
 128:	90 91 6b 02 	lds	r25, 0x026B
 12c:	01 96       	adiw	r24, 0x01	; 1
 12e:	90 93 6b 02 	sts	0x026B, r25
 132:	80 93 6a 02 	sts	0x026A, r24
 136:	9f 91       	pop	r25
 138:	8f 91       	pop	r24
 13a:	0f 90       	pop	r0
 13c:	0f be       	out	0x3f, r0	; 63
 13e:	0f 90       	pop	r0
 140:	1f 90       	pop	r1
 142:	18 95       	reti

00000144 <__vector_16>:
 144:	1f 92       	push	r1
 146:	0f 92       	push	r0
 148:	0f b6       	in	r0, 0x3f	; 63
 14a:	0f 92       	push	r0
 14c:	11 24       	eor	r1, r1
 14e:	2f 93       	push	r18
 150:	8f 93       	push	r24
 152:	9f 93       	push	r25
 154:	f8 94       	cli
 156:	80 91 6f 02 	lds	r24, 0x026F
 15a:	90 91 70 02 	lds	r25, 0x0270
 15e:	01 96       	adiw	r24, 0x01	; 1
 160:	90 93 70 02 	sts	0x0270, r25
 164:	80 93 6f 02 	sts	0x026F, r24
 168:	80 91 6e 02 	lds	r24, 0x026E
 16c:	81 95       	neg	r24
 16e:	86 bd       	out	0x26, r24	; 38
 170:	80 91 6f 02 	lds	r24, 0x026F
 174:	90 91 70 02 	lds	r25, 0x0270
 178:	88 36       	cpi	r24, 0x68	; 104
 17a:	91 40       	sbci	r25, 0x01	; 1
 17c:	21 f4       	brne	.+8      	; 0x186 <__vector_16+0x42>
 17e:	10 92 70 02 	sts	0x0270, r1
 182:	10 92 6f 02 	sts	0x026F, r1
 186:	78 94       	sei
 188:	9f 91       	pop	r25
 18a:	8f 91       	pop	r24
 18c:	2f 91       	pop	r18
 18e:	0f 90       	pop	r0
 190:	0f be       	out	0x3f, r0	; 63
 192:	0f 90       	pop	r0
 194:	1f 90       	pop	r1
 196:	18 95       	reti

00000198 <show>:
 198:	4b b1       	in	r20, 0x0b	; 11
 19a:	47 70       	andi	r20, 0x07	; 7
 19c:	4b b9       	out	0x0b, r20	; 11
 19e:	4b b1       	in	r20, 0x0b	; 11
 1a0:	fc 01       	movw	r30, r24
 1a2:	ef 5f       	subi	r30, 0xFF	; 255
 1a4:	fe 4f       	sbci	r31, 0xFE	; 254
 1a6:	80 81       	ld	r24, Z
 1a8:	8e 73       	andi	r24, 0x3E	; 62
 1aa:	24 e0       	ldi	r18, 0x04	; 4
 1ac:	82 9f       	mul	r24, r18
 1ae:	c0 01       	movw	r24, r0
 1b0:	11 24       	eor	r1, r1
 1b2:	48 2b       	or	r20, r24
 1b4:	4b b9       	out	0x0b, r20	; 11
 1b6:	15 b8       	out	0x05, r1	; 5
 1b8:	85 b1       	in	r24, 0x05	; 5
 1ba:	90 81       	ld	r25, Z
 1bc:	29 2f       	mov	r18, r25
 1be:	21 70       	andi	r18, 0x01	; 1
 1c0:	30 e0       	ldi	r19, 0x00	; 0
 1c2:	22 0f       	add	r18, r18
 1c4:	33 1f       	adc	r19, r19
 1c6:	82 2b       	or	r24, r18
 1c8:	85 b9       	out	0x05, r24	; 5
 1ca:	85 b1       	in	r24, 0x05	; 5
 1cc:	90 81       	ld	r25, Z
 1ce:	96 fb       	bst	r25, 6
 1d0:	99 27       	eor	r25, r25
 1d2:	90 f9       	bld	r25, 0
 1d4:	89 2b       	or	r24, r25
 1d6:	85 b9       	out	0x05, r24	; 5
 1d8:	08 95       	ret

000001da <init>:
 1da:	e9 e6       	ldi	r30, 0x69	; 105
 1dc:	f0 e0       	ldi	r31, 0x00	; 0
 1de:	80 81       	ld	r24, Z
 1e0:	83 60       	ori	r24, 0x03	; 3
 1e2:	80 83       	st	Z, r24
 1e4:	81 e0       	ldi	r24, 0x01	; 1
 1e6:	8d bb       	out	0x1d, r24	; 29
 1e8:	08 95       	ret

000001ea <main>:
 1ea:	8f ef       	ldi	r24, 0xFF	; 255
 1ec:	84 b9       	out	0x04, r24	; 4
 1ee:	8a b9       	out	0x0a, r24	; 10
 1f0:	8f e3       	ldi	r24, 0x3F	; 63
 1f2:	87 b9       	out	0x07, r24	; 7
 1f4:	52 98       	cbi	0x0a, 2	; 10
 1f6:	0e 94 ed 00 	call	0x1da	; 0x1da <init>
 1fa:	85 b5       	in	r24, 0x25	; 37
 1fc:	83 60       	ori	r24, 0x03	; 3
 1fe:	85 bd       	out	0x25, r24	; 37
 200:	80 91 6e 00 	lds	r24, 0x006E
 204:	81 60       	ori	r24, 0x01	; 1
 206:	80 93 6e 00 	sts	0x006E, r24
 20a:	80 91 81 00 	lds	r24, 0x0081
 20e:	83 60       	ori	r24, 0x03	; 3
 210:	80 93 81 00 	sts	0x0081, r24
 214:	78 94       	sei
 216:	80 91 00 01 	lds	r24, 0x0100
 21a:	80 93 01 01 	sts	0x0101, r24
 21e:	80 91 6f 02 	lds	r24, 0x026F
 222:	90 91 70 02 	lds	r25, 0x0270
 226:	0e 94 cc 00 	call	0x198	; 0x198 <show>
 22a:	f5 cf       	rjmp	.-22     	; 0x216 <main+0x2c>

0000022c <__udivmodhi4>:
 22c:	aa 1b       	sub	r26, r26
 22e:	bb 1b       	sub	r27, r27
 230:	51 e1       	ldi	r21, 0x11	; 17
 232:	07 c0       	rjmp	.+14     	; 0x242 <__udivmodhi4_ep>

00000234 <__udivmodhi4_loop>:
 234:	aa 1f       	adc	r26, r26
 236:	bb 1f       	adc	r27, r27
 238:	a6 17       	cp	r26, r22
 23a:	b7 07       	cpc	r27, r23
 23c:	10 f0       	brcs	.+4      	; 0x242 <__udivmodhi4_ep>
 23e:	a6 1b       	sub	r26, r22
 240:	b7 0b       	sbc	r27, r23

00000242 <__udivmodhi4_ep>:
 242:	88 1f       	adc	r24, r24
 244:	99 1f       	adc	r25, r25
 246:	5a 95       	dec	r21
 248:	a9 f7       	brne	.-22     	; 0x234 <__udivmodhi4_loop>
 24a:	80 95       	com	r24
 24c:	90 95       	com	r25
 24e:	bc 01       	movw	r22, r24
 250:	cd 01       	movw	r24, r26
 252:	08 95       	ret

00000254 <_exit>:
 254:	f8 94       	cli

00000256 <__stop_program>:
 256:	ff cf       	rjmp	.-2      	; 0x256 <__stop_program>
