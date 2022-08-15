opt subtitle "HI-TECH Software Omniscient Code Generator (Lite mode) build 7503"

opt pagewidth 120

	opt lm

	processor	16F877A
clrc	macro
	bcf	3,0
	endm
clrz	macro
	bcf	3,2
	endm
setc	macro
	bsf	3,0
	endm
setz	macro
	bsf	3,2
	endm
skipc	macro
	btfss	3,0
	endm
skipz	macro
	btfss	3,2
	endm
skipnc	macro
	btfsc	3,0
	endm
skipnz	macro
	btfsc	3,2
	endm
indf	equ	0
indf0	equ	0
pc	equ	2
pcl	equ	2
status	equ	3
fsr	equ	4
fsr0	equ	4
c	equ	1
z	equ	0
pclath	equ	10
# 6 "C:\Users\r_m_a\Desktop\stepper motor\step by step\step.c"
	psect config,class=CONFIG,delta=2 ;#
# 6 "C:\Users\r_m_a\Desktop\stepper motor\step by step\step.c"
	dw 0x1F7A ;#
	FNROOT	_main
	global	_motor_steps
psect	idataBANK0,class=CODE,space=0,delta=2
global __pidataBANK0
__pidataBANK0:
	file	"C:\Users\r_m_a\Desktop\stepper motor\step by step\step.c"
	line	8

;initializer for _motor_steps
	retlw	07h
	retlw	03h
	retlw	0Bh
	retlw	09h
	retlw	0Dh
	retlw	0Ch
	retlw	0Eh
	retlw	06h
	global	_PORTB
_PORTB	set	6
	global	_RA0
_RA0	set	40
	global	_RA1
_RA1	set	41
	global	_RA2
_RA2	set	42
	global	_RA3
_RA3	set	43
	global	_TRISA
_TRISA	set	133
	global	_TRISB
_TRISB	set	134
	file	"step.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect	dataBANK0,class=BANK0,space=1
global __pdataBANK0
__pdataBANK0:
	file	"C:\Users\r_m_a\Desktop\stepper motor\step by step\step.c"
_motor_steps:
       ds      8

global btemp
psect inittext,class=CODE,delta=2
global init_fetch,btemp
;	Called with low address in FSR and high address in W
init_fetch:
	movf btemp,w
	movwf pclath
	movf btemp+1,w
	movwf pc
global init_ram
;Called with:
;	high address of idata address in btemp 
;	low address of idata address in btemp+1 
;	low address of data in FSR
;	high address + 1 of data in btemp-1
init_ram:
	fcall init_fetch
	movwf indf,f
	incf fsr,f
	movf fsr,w
	xorwf btemp-1,w
	btfsc status,2
	retlw 0
	incf btemp+1,f
	btfsc status,2
	incf btemp,f
	goto init_ram
; Initialize objects allocated to BANK0
psect cinit,class=CODE,delta=2
global init_ram, __pidataBANK0
	bcf	status, 7	;select IRP bank0
	movlw low(__pdataBANK0+8)
	movwf btemp-1,f
	movlw high(__pidataBANK0)
	movwf btemp,f
	movlw low(__pidataBANK0)
	movwf btemp+1,f
	movlw low(__pdataBANK0)
	movwf fsr,f
	fcall init_ram
psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	??_main
??_main:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	ds	3
	global	main@i
main@i:	; 2 bytes @ 0x3
	ds	2
	global	main@j
main@j:	; 2 bytes @ 0x5
	ds	2
;;Data sizes: Strings 0, constant 0, data 8, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      7       7
;; BANK0           80      0       8
;; BANK1           80      0       0
;; BANK3           96      0       0
;; BANK2           96      0       0

;;
;; Pointer list with targets:



;;
;; Critical Paths under _main in COMMON
;;
;;   None.
;;
;; Critical Paths under _main in BANK0
;;
;;   None.
;;
;; Critical Paths under _main in BANK1
;;
;;   None.
;;
;; Critical Paths under _main in BANK3
;;
;;   None.
;;
;; Critical Paths under _main in BANK2
;;
;;   None.

;;
;;Main: autosize = 0, tempsize = 3, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 7     7      0    1256
;;                                              0 COMMON     7     7      0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 0
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BANK3               60      0       0       9        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;BANK2               60      0       0      11        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR1                 0      0       0       2        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;CODE                 0      0       0       0        0.0%
;;DATA                 0      0       F      12        0.0%
;;ABS                  0      0       F       3        0.0%
;;NULL                 0      0       0       0        0.0%
;;STACK                0      0       0       2        0.0%
;;BANK0               50      0       8       5       10.0%
;;BITBANK0            50      0       0       4        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR0              0      0       0       1        0.0%
;;COMMON               E      7       7       1       50.0%
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 10 in file "C:\Users\r_m_a\Desktop\stepper motor\step by step\step.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  j               2    5[COMMON] int 
;;  i               2    3[COMMON] int 
;; Return value:  Size  Location     Type
;;                  2  688[COMMON] int 
;; Registers used:
;;		wreg, fsr0l, fsr0h, status,2, status,0, btemp+1
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         4       0       0       0       0
;;      Temps:          3       0       0       0       0
;;      Totals:         7       0       0       0       0
;;Total ram usage:        7 bytes
;; This function calls:
;;		Nothing
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\r_m_a\Desktop\stepper motor\step by step\step.c"
	line	10
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 8
; Regs used in _main: [wreg-fsr0h+status,2+status,0+btemp+1]
	line	11
	
l2160:	
;step.c: 11: int i=0,j=0;
	clrf	(main@i)
	clrf	(main@i+1)
	clrf	(main@j)
	clrf	(main@j+1)
	line	12
;step.c: 12: TRISB = 0X00;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	clrf	(134)^080h	;volatile
	line	13
;step.c: 13: TRISA = 0X00;
	clrf	(133)^080h	;volatile
	line	14
;step.c: 14: while(1){
	
l689:	
	line	15
;step.c: 15: for(i=0; i<13; i++)
	clrf	(main@i)
	clrf	(main@i+1)
	
l2162:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Dh))^80h
	subwf	btemp+1,w
	skipz
	goto	u2585
	movlw	low(0Dh)
	subwf	(main@i),w
u2585:

	skipc
	goto	u2581
	goto	u2580
u2581:
	goto	l690
u2580:
	goto	l2184
	
l2164:	
	goto	l2184
	line	16
	
l690:	
	line	17
;step.c: 16: {
;step.c: 17: RA0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(40/8),(40)&7
	line	18
	
l2166:	
;step.c: 18: for(j=0;j<8;j++)
	clrf	(main@j)
	clrf	(main@j+1)
	
l2168:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2595
	movlw	low(08h)
	subwf	(main@j),w
u2595:

	skipc
	goto	u2591
	goto	u2590
u2591:
	goto	l2172
u2590:
	goto	l2180
	
l2170:	
	goto	l2180
	line	19
	
l692:	
	line	20
	
l2172:	
;step.c: 19: {
;step.c: 20: PORTB = motor_steps[j];
	movf	(main@j),w
	addlw	_motor_steps&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	21
	
l2174:	
;step.c: 21: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
movwf	((??_main+0)+0+1),f
	movlw	118
movwf	((??_main+0)+0),f
u3027:
	decfsz	((??_main+0)+0),f
	goto	u3027
	decfsz	((??_main+0)+0+1),f
	goto	u3027
	clrwdt
opt asmopt_on

	line	18
	
l2176:	
	movlw	low(01h)
	addwf	(main@j),f
	skipnc
	incf	(main@j+1),f
	movlw	high(01h)
	addwf	(main@j+1),f
	
l2178:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2605
	movlw	low(08h)
	subwf	(main@j),w
u2605:

	skipc
	goto	u2601
	goto	u2600
u2601:
	goto	l2172
u2600:
	goto	l2180
	
l693:	
	line	15
	
l2180:	
	movlw	low(01h)
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l2182:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Dh))^80h
	subwf	btemp+1,w
	skipz
	goto	u2615
	movlw	low(0Dh)
	subwf	(main@i),w
u2615:

	skipc
	goto	u2611
	goto	u2610
u2611:
	goto	l690
u2610:
	goto	l2184
	
l691:	
	line	25
	
l2184:	
;step.c: 22: }
;step.c: 24: }
;step.c: 25: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
movwf	((??_main+0)+0+2),f
movlw	69
movwf	((??_main+0)+0+1),f
	movlw	126
movwf	((??_main+0)+0),f
u3037:
	decfsz	((??_main+0)+0),f
	goto	u3037
	decfsz	((??_main+0)+0+1),f
	goto	u3037
	decfsz	((??_main+0)+0+2),f
	goto	u3037
opt asmopt_on

	line	27
	
l2186:	
;step.c: 27: for(i=0; i<13; i++)
	clrf	(main@i)
	clrf	(main@i+1)
	
l2188:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Dh))^80h
	subwf	btemp+1,w
	skipz
	goto	u2625
	movlw	low(0Dh)
	subwf	(main@i),w
u2625:

	skipc
	goto	u2621
	goto	u2620
u2621:
	goto	l694
u2620:
	goto	l2210
	
l2190:	
	goto	l2210
	line	28
	
l694:	
	line	29
;step.c: 28: {
;step.c: 29: RA0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(40/8),(40)&7
	line	30
	
l2192:	
;step.c: 30: for(j=7;j>=0;j--)
	movlw	low(07h)
	movwf	(main@j)
	movlw	high(07h)
	movwf	((main@j))+1
	
l2194:	
	btfss	(main@j+1),7
	goto	u2631
	goto	u2630
u2631:
	goto	l2198
u2630:
	goto	l2206
	
l2196:	
	goto	l2206
	line	31
	
l696:	
	line	32
	
l2198:	
;step.c: 31: {
;step.c: 32: PORTB = motor_steps[j];
	movf	(main@j),w
	addlw	_motor_steps&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	33
	
l2200:	
;step.c: 33: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
movwf	((??_main+0)+0+1),f
	movlw	118
movwf	((??_main+0)+0),f
u3047:
	decfsz	((??_main+0)+0),f
	goto	u3047
	decfsz	((??_main+0)+0+1),f
	goto	u3047
	clrwdt
opt asmopt_on

	line	30
	
l2202:	
	movlw	low(-1)
	addwf	(main@j),f
	skipnc
	incf	(main@j+1),f
	movlw	high(-1)
	addwf	(main@j+1),f
	
l2204:	
	btfss	(main@j+1),7
	goto	u2641
	goto	u2640
u2641:
	goto	l2198
u2640:
	goto	l2206
	
l697:	
	line	27
	
l2206:	
	movlw	low(01h)
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l2208:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(0Dh))^80h
	subwf	btemp+1,w
	skipz
	goto	u2655
	movlw	low(0Dh)
	subwf	(main@i),w
u2655:

	skipc
	goto	u2651
	goto	u2650
u2651:
	goto	l694
u2650:
	goto	l2210
	
l695:	
	line	38
	
l2210:	
;step.c: 34: }
;step.c: 36: }
;step.c: 38: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
movwf	((??_main+0)+0+2),f
movlw	69
movwf	((??_main+0)+0+1),f
	movlw	126
movwf	((??_main+0)+0),f
u3057:
	decfsz	((??_main+0)+0),f
	goto	u3057
	decfsz	((??_main+0)+0+1),f
	goto	u3057
	decfsz	((??_main+0)+0+2),f
	goto	u3057
opt asmopt_on

	line	40
	
l2212:	
;step.c: 40: for(i=0; i<50; i++)
	clrf	(main@i)
	clrf	(main@i+1)
	
l2214:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(032h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2665
	movlw	low(032h)
	subwf	(main@i),w
u2665:

	skipc
	goto	u2661
	goto	u2660
u2661:
	goto	l698
u2660:
	goto	l2236
	
l2216:	
	goto	l2236
	line	41
	
l698:	
	line	42
;step.c: 41: {
;step.c: 42: RA0 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(40/8),(40)&7
	line	43
	
l2218:	
;step.c: 43: for(j=0;j<8;j++)
	clrf	(main@j)
	clrf	(main@j+1)
	
l2220:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2675
	movlw	low(08h)
	subwf	(main@j),w
u2675:

	skipc
	goto	u2671
	goto	u2670
u2671:
	goto	l2224
u2670:
	goto	l2232
	
l2222:	
	goto	l2232
	line	44
	
l700:	
	line	45
	
l2224:	
;step.c: 44: {
;step.c: 45: PORTB = motor_steps[j];
	movf	(main@j),w
	addlw	_motor_steps&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	46
	
l2226:	
;step.c: 46: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
movwf	((??_main+0)+0+1),f
	movlw	118
movwf	((??_main+0)+0),f
u3067:
	decfsz	((??_main+0)+0),f
	goto	u3067
	decfsz	((??_main+0)+0+1),f
	goto	u3067
	clrwdt
opt asmopt_on

	line	43
	
l2228:	
	movlw	low(01h)
	addwf	(main@j),f
	skipnc
	incf	(main@j+1),f
	movlw	high(01h)
	addwf	(main@j+1),f
	
l2230:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2685
	movlw	low(08h)
	subwf	(main@j),w
u2685:

	skipc
	goto	u2681
	goto	u2680
u2681:
	goto	l2224
u2680:
	goto	l2232
	
l701:	
	line	40
	
l2232:	
	movlw	low(01h)
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l2234:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(032h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2695
	movlw	low(032h)
	subwf	(main@i),w
u2695:

	skipc
	goto	u2691
	goto	u2690
u2691:
	goto	l698
u2690:
	goto	l2236
	
l699:	
	line	50
	
l2236:	
;step.c: 47: }
;step.c: 49: }
;step.c: 50: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
movwf	((??_main+0)+0+2),f
movlw	69
movwf	((??_main+0)+0+1),f
	movlw	126
movwf	((??_main+0)+0),f
u3077:
	decfsz	((??_main+0)+0),f
	goto	u3077
	decfsz	((??_main+0)+0+1),f
	goto	u3077
	decfsz	((??_main+0)+0+2),f
	goto	u3077
opt asmopt_on

	line	52
	
l2238:	
;step.c: 52: for(i=0; i<25; i++)
	clrf	(main@i)
	clrf	(main@i+1)
	
l2240:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(019h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2705
	movlw	low(019h)
	subwf	(main@i),w
u2705:

	skipc
	goto	u2701
	goto	u2700
u2701:
	goto	l702
u2700:
	goto	l2262
	
l2242:	
	goto	l2262
	line	53
	
l702:	
	line	54
;step.c: 53: {
;step.c: 54: RA1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(41/8),(41)&7
	line	55
	
l2244:	
;step.c: 55: for(j=0;j<8;j++)
	clrf	(main@j)
	clrf	(main@j+1)
	
l2246:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2715
	movlw	low(08h)
	subwf	(main@j),w
u2715:

	skipc
	goto	u2711
	goto	u2710
u2711:
	goto	l2250
u2710:
	goto	l2258
	
l2248:	
	goto	l2258
	line	56
	
l704:	
	line	57
	
l2250:	
;step.c: 56: {
;step.c: 57: PORTB = motor_steps[j];
	movf	(main@j),w
	addlw	_motor_steps&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	58
	
l2252:	
;step.c: 58: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
movwf	((??_main+0)+0+1),f
	movlw	118
movwf	((??_main+0)+0),f
u3087:
	decfsz	((??_main+0)+0),f
	goto	u3087
	decfsz	((??_main+0)+0+1),f
	goto	u3087
	clrwdt
opt asmopt_on

	line	55
	
l2254:	
	movlw	low(01h)
	addwf	(main@j),f
	skipnc
	incf	(main@j+1),f
	movlw	high(01h)
	addwf	(main@j+1),f
	
l2256:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2725
	movlw	low(08h)
	subwf	(main@j),w
u2725:

	skipc
	goto	u2721
	goto	u2720
u2721:
	goto	l2250
u2720:
	goto	l2258
	
l705:	
	line	52
	
l2258:	
	movlw	low(01h)
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l2260:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(019h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2735
	movlw	low(019h)
	subwf	(main@i),w
u2735:

	skipc
	goto	u2731
	goto	u2730
u2731:
	goto	l702
u2730:
	goto	l2262
	
l703:	
	line	62
	
l2262:	
;step.c: 59: }
;step.c: 61: }
;step.c: 62: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
movwf	((??_main+0)+0+2),f
movlw	69
movwf	((??_main+0)+0+1),f
	movlw	126
movwf	((??_main+0)+0),f
u3097:
	decfsz	((??_main+0)+0),f
	goto	u3097
	decfsz	((??_main+0)+0+1),f
	goto	u3097
	decfsz	((??_main+0)+0+2),f
	goto	u3097
opt asmopt_on

	line	65
	
l2264:	
;step.c: 65: for(i=0; i<25; i++)
	clrf	(main@i)
	clrf	(main@i+1)
	
l2266:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(019h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2745
	movlw	low(019h)
	subwf	(main@i),w
u2745:

	skipc
	goto	u2741
	goto	u2740
u2741:
	goto	l706
u2740:
	goto	l2288
	
l2268:	
	goto	l2288
	line	66
	
l706:	
	line	67
;step.c: 66: {
;step.c: 67: RA1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(41/8),(41)&7
	line	68
	
l2270:	
;step.c: 68: for(j=8;j>=0;j--)
	movlw	low(08h)
	movwf	(main@j)
	movlw	high(08h)
	movwf	((main@j))+1
	
l2272:	
	btfss	(main@j+1),7
	goto	u2751
	goto	u2750
u2751:
	goto	l2276
u2750:
	goto	l2284
	
l2274:	
	goto	l2284
	line	69
	
l708:	
	line	70
	
l2276:	
;step.c: 69: {
;step.c: 70: PORTB = motor_steps[j];
	movf	(main@j),w
	addlw	_motor_steps&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	71
	
l2278:	
;step.c: 71: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
movwf	((??_main+0)+0+1),f
	movlw	118
movwf	((??_main+0)+0),f
u3107:
	decfsz	((??_main+0)+0),f
	goto	u3107
	decfsz	((??_main+0)+0+1),f
	goto	u3107
	clrwdt
opt asmopt_on

	line	68
	
l2280:	
	movlw	low(-1)
	addwf	(main@j),f
	skipnc
	incf	(main@j+1),f
	movlw	high(-1)
	addwf	(main@j+1),f
	
l2282:	
	btfss	(main@j+1),7
	goto	u2761
	goto	u2760
u2761:
	goto	l2276
u2760:
	goto	l2284
	
l709:	
	line	65
	
l2284:	
	movlw	low(01h)
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l2286:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(019h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2775
	movlw	low(019h)
	subwf	(main@i),w
u2775:

	skipc
	goto	u2771
	goto	u2770
u2771:
	goto	l706
u2770:
	goto	l2288
	
l707:	
	line	75
	
l2288:	
;step.c: 72: }
;step.c: 74: }
;step.c: 75: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
movwf	((??_main+0)+0+2),f
movlw	69
movwf	((??_main+0)+0+1),f
	movlw	126
movwf	((??_main+0)+0),f
u3117:
	decfsz	((??_main+0)+0),f
	goto	u3117
	decfsz	((??_main+0)+0+1),f
	goto	u3117
	decfsz	((??_main+0)+0+2),f
	goto	u3117
opt asmopt_on

	line	78
	
l2290:	
;step.c: 78: for(i=0; i<50; i++)
	clrf	(main@i)
	clrf	(main@i+1)
	
l2292:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(032h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2785
	movlw	low(032h)
	subwf	(main@i),w
u2785:

	skipc
	goto	u2781
	goto	u2780
u2781:
	goto	l710
u2780:
	goto	l2314
	
l2294:	
	goto	l2314
	line	79
	
l710:	
	line	80
;step.c: 79: {
;step.c: 80: RA1 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(41/8),(41)&7
	line	81
	
l2296:	
;step.c: 81: for(j=0;j<8;j++)
	clrf	(main@j)
	clrf	(main@j+1)
	
l2298:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2795
	movlw	low(08h)
	subwf	(main@j),w
u2795:

	skipc
	goto	u2791
	goto	u2790
u2791:
	goto	l2302
u2790:
	goto	l2310
	
l2300:	
	goto	l2310
	line	82
	
l712:	
	line	83
	
l2302:	
;step.c: 82: {
;step.c: 83: PORTB = motor_steps[j];
	movf	(main@j),w
	addlw	_motor_steps&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	84
	
l2304:	
;step.c: 84: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
movwf	((??_main+0)+0+1),f
	movlw	118
movwf	((??_main+0)+0),f
u3127:
	decfsz	((??_main+0)+0),f
	goto	u3127
	decfsz	((??_main+0)+0+1),f
	goto	u3127
	clrwdt
opt asmopt_on

	line	81
	
l2306:	
	movlw	low(01h)
	addwf	(main@j),f
	skipnc
	incf	(main@j+1),f
	movlw	high(01h)
	addwf	(main@j+1),f
	
l2308:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2805
	movlw	low(08h)
	subwf	(main@j),w
u2805:

	skipc
	goto	u2801
	goto	u2800
u2801:
	goto	l2302
u2800:
	goto	l2310
	
l713:	
	line	78
	
l2310:	
	movlw	low(01h)
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l2312:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(032h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2815
	movlw	low(032h)
	subwf	(main@i),w
u2815:

	skipc
	goto	u2811
	goto	u2810
u2811:
	goto	l710
u2810:
	goto	l2314
	
l711:	
	line	89
	
l2314:	
;step.c: 85: }
;step.c: 87: }
;step.c: 89: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
movwf	((??_main+0)+0+2),f
movlw	69
movwf	((??_main+0)+0+1),f
	movlw	126
movwf	((??_main+0)+0),f
u3137:
	decfsz	((??_main+0)+0),f
	goto	u3137
	decfsz	((??_main+0)+0+1),f
	goto	u3137
	decfsz	((??_main+0)+0+2),f
	goto	u3137
opt asmopt_on

	line	91
	
l2316:	
;step.c: 91: for(i=0; i<37; i++)
	clrf	(main@i)
	clrf	(main@i+1)
	
l2318:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(025h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2825
	movlw	low(025h)
	subwf	(main@i),w
u2825:

	skipc
	goto	u2821
	goto	u2820
u2821:
	goto	l714
u2820:
	goto	l2340
	
l2320:	
	goto	l2340
	line	92
	
l714:	
	line	93
;step.c: 92: {
;step.c: 93: RA2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(42/8),(42)&7
	line	94
	
l2322:	
;step.c: 94: for(j=0;j<8;j++)
	clrf	(main@j)
	clrf	(main@j+1)
	
l2324:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2835
	movlw	low(08h)
	subwf	(main@j),w
u2835:

	skipc
	goto	u2831
	goto	u2830
u2831:
	goto	l2328
u2830:
	goto	l2336
	
l2326:	
	goto	l2336
	line	95
	
l716:	
	line	96
	
l2328:	
;step.c: 95: {
;step.c: 96: PORTB = motor_steps[j];
	movf	(main@j),w
	addlw	_motor_steps&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	97
	
l2330:	
;step.c: 97: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
movwf	((??_main+0)+0+1),f
	movlw	118
movwf	((??_main+0)+0),f
u3147:
	decfsz	((??_main+0)+0),f
	goto	u3147
	decfsz	((??_main+0)+0+1),f
	goto	u3147
	clrwdt
opt asmopt_on

	line	94
	
l2332:	
	movlw	low(01h)
	addwf	(main@j),f
	skipnc
	incf	(main@j+1),f
	movlw	high(01h)
	addwf	(main@j+1),f
	
l2334:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2845
	movlw	low(08h)
	subwf	(main@j),w
u2845:

	skipc
	goto	u2841
	goto	u2840
u2841:
	goto	l2328
u2840:
	goto	l2336
	
l717:	
	line	91
	
l2336:	
	movlw	low(01h)
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l2338:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(025h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2855
	movlw	low(025h)
	subwf	(main@i),w
u2855:

	skipc
	goto	u2851
	goto	u2850
u2851:
	goto	l714
u2850:
	goto	l2340
	
l715:	
	line	101
	
l2340:	
;step.c: 98: }
;step.c: 100: }
;step.c: 101: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
movwf	((??_main+0)+0+2),f
movlw	69
movwf	((??_main+0)+0+1),f
	movlw	126
movwf	((??_main+0)+0),f
u3157:
	decfsz	((??_main+0)+0),f
	goto	u3157
	decfsz	((??_main+0)+0+1),f
	goto	u3157
	decfsz	((??_main+0)+0+2),f
	goto	u3157
opt asmopt_on

	line	103
	
l2342:	
;step.c: 103: for(i=0; i<37; i++)
	clrf	(main@i)
	clrf	(main@i+1)
	
l2344:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(025h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2865
	movlw	low(025h)
	subwf	(main@i),w
u2865:

	skipc
	goto	u2861
	goto	u2860
u2861:
	goto	l718
u2860:
	goto	l2366
	
l2346:	
	goto	l2366
	line	104
	
l718:	
	line	105
;step.c: 104: {
;step.c: 105: RA2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(42/8),(42)&7
	line	106
	
l2348:	
;step.c: 106: for(j=7;j>=0;j--)
	movlw	low(07h)
	movwf	(main@j)
	movlw	high(07h)
	movwf	((main@j))+1
	
l2350:	
	btfss	(main@j+1),7
	goto	u2871
	goto	u2870
u2871:
	goto	l2354
u2870:
	goto	l2362
	
l2352:	
	goto	l2362
	line	107
	
l720:	
	line	108
	
l2354:	
;step.c: 107: {
;step.c: 108: PORTB = motor_steps[j];
	movf	(main@j),w
	addlw	_motor_steps&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	109
	
l2356:	
;step.c: 109: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
movwf	((??_main+0)+0+1),f
	movlw	118
movwf	((??_main+0)+0),f
u3167:
	decfsz	((??_main+0)+0),f
	goto	u3167
	decfsz	((??_main+0)+0+1),f
	goto	u3167
	clrwdt
opt asmopt_on

	line	106
	
l2358:	
	movlw	low(-1)
	addwf	(main@j),f
	skipnc
	incf	(main@j+1),f
	movlw	high(-1)
	addwf	(main@j+1),f
	
l2360:	
	btfss	(main@j+1),7
	goto	u2881
	goto	u2880
u2881:
	goto	l2354
u2880:
	goto	l2362
	
l721:	
	line	103
	
l2362:	
	movlw	low(01h)
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l2364:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(025h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2895
	movlw	low(025h)
	subwf	(main@i),w
u2895:

	skipc
	goto	u2891
	goto	u2890
u2891:
	goto	l718
u2890:
	goto	l2366
	
l719:	
	line	114
	
l2366:	
;step.c: 110: }
;step.c: 112: }
;step.c: 114: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
movwf	((??_main+0)+0+2),f
movlw	69
movwf	((??_main+0)+0+1),f
	movlw	126
movwf	((??_main+0)+0),f
u3177:
	decfsz	((??_main+0)+0),f
	goto	u3177
	decfsz	((??_main+0)+0+1),f
	goto	u3177
	decfsz	((??_main+0)+0+2),f
	goto	u3177
opt asmopt_on

	line	116
	
l2368:	
;step.c: 116: for(i=0; i<50; i++)
	clrf	(main@i)
	clrf	(main@i+1)
	
l2370:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(032h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2905
	movlw	low(032h)
	subwf	(main@i),w
u2905:

	skipc
	goto	u2901
	goto	u2900
u2901:
	goto	l722
u2900:
	goto	l2392
	
l2372:	
	goto	l2392
	line	117
	
l722:	
	line	118
;step.c: 117: {
;step.c: 118: RA2 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(42/8),(42)&7
	line	119
	
l2374:	
;step.c: 119: for(j=0;j<8;j++)
	clrf	(main@j)
	clrf	(main@j+1)
	
l2376:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2915
	movlw	low(08h)
	subwf	(main@j),w
u2915:

	skipc
	goto	u2911
	goto	u2910
u2911:
	goto	l2380
u2910:
	goto	l2388
	
l2378:	
	goto	l2388
	line	120
	
l724:	
	line	121
	
l2380:	
;step.c: 120: {
;step.c: 121: PORTB = motor_steps[j];
	movf	(main@j),w
	addlw	_motor_steps&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	122
	
l2382:	
;step.c: 122: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
movwf	((??_main+0)+0+1),f
	movlw	118
movwf	((??_main+0)+0),f
u3187:
	decfsz	((??_main+0)+0),f
	goto	u3187
	decfsz	((??_main+0)+0+1),f
	goto	u3187
	clrwdt
opt asmopt_on

	line	119
	
l2384:	
	movlw	low(01h)
	addwf	(main@j),f
	skipnc
	incf	(main@j+1),f
	movlw	high(01h)
	addwf	(main@j+1),f
	
l2386:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2925
	movlw	low(08h)
	subwf	(main@j),w
u2925:

	skipc
	goto	u2921
	goto	u2920
u2921:
	goto	l2380
u2920:
	goto	l2388
	
l725:	
	line	116
	
l2388:	
	movlw	low(01h)
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l2390:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(032h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2935
	movlw	low(032h)
	subwf	(main@i),w
u2935:

	skipc
	goto	u2931
	goto	u2930
u2931:
	goto	l722
u2930:
	goto	l2392
	
l723:	
	line	126
	
l2392:	
;step.c: 123: }
;step.c: 125: }
;step.c: 126: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
movwf	((??_main+0)+0+2),f
movlw	69
movwf	((??_main+0)+0+1),f
	movlw	126
movwf	((??_main+0)+0),f
u3197:
	decfsz	((??_main+0)+0),f
	goto	u3197
	decfsz	((??_main+0)+0+1),f
	goto	u3197
	decfsz	((??_main+0)+0+2),f
	goto	u3197
opt asmopt_on

	line	128
	
l2394:	
;step.c: 128: for(i=0; i<50; i++)
	clrf	(main@i)
	clrf	(main@i+1)
	
l2396:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(032h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2945
	movlw	low(032h)
	subwf	(main@i),w
u2945:

	skipc
	goto	u2941
	goto	u2940
u2941:
	goto	l726
u2940:
	goto	l2418
	
l2398:	
	goto	l2418
	line	129
	
l726:	
	line	130
;step.c: 129: {
;step.c: 130: RA3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(43/8),(43)&7
	line	131
	
l2400:	
;step.c: 131: for(j=7;j>=0;j--)
	movlw	low(07h)
	movwf	(main@j)
	movlw	high(07h)
	movwf	((main@j))+1
	
l2402:	
	btfss	(main@j+1),7
	goto	u2951
	goto	u2950
u2951:
	goto	l2406
u2950:
	goto	l2414
	
l2404:	
	goto	l2414
	line	132
	
l728:	
	line	133
	
l2406:	
;step.c: 132: {
;step.c: 133: PORTB = motor_steps[j];
	movf	(main@j),w
	addlw	_motor_steps&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	134
	
l2408:	
;step.c: 134: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
movwf	((??_main+0)+0+1),f
	movlw	118
movwf	((??_main+0)+0),f
u3207:
	decfsz	((??_main+0)+0),f
	goto	u3207
	decfsz	((??_main+0)+0+1),f
	goto	u3207
	clrwdt
opt asmopt_on

	line	131
	
l2410:	
	movlw	low(-1)
	addwf	(main@j),f
	skipnc
	incf	(main@j+1),f
	movlw	high(-1)
	addwf	(main@j+1),f
	
l2412:	
	btfss	(main@j+1),7
	goto	u2961
	goto	u2960
u2961:
	goto	l2406
u2960:
	goto	l2414
	
l729:	
	line	128
	
l2414:	
	movlw	low(01h)
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l2416:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(032h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2975
	movlw	low(032h)
	subwf	(main@i),w
u2975:

	skipc
	goto	u2971
	goto	u2970
u2971:
	goto	l726
u2970:
	goto	l2418
	
l727:	
	line	139
	
l2418:	
;step.c: 135: }
;step.c: 137: }
;step.c: 139: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
movwf	((??_main+0)+0+2),f
movlw	69
movwf	((??_main+0)+0+1),f
	movlw	126
movwf	((??_main+0)+0),f
u3217:
	decfsz	((??_main+0)+0),f
	goto	u3217
	decfsz	((??_main+0)+0+1),f
	goto	u3217
	decfsz	((??_main+0)+0+2),f
	goto	u3217
opt asmopt_on

	line	142
	
l2420:	
;step.c: 142: for(i=0; i<50; i++)
	clrf	(main@i)
	clrf	(main@i+1)
	
l2422:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(032h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2985
	movlw	low(032h)
	subwf	(main@i),w
u2985:

	skipc
	goto	u2981
	goto	u2980
u2981:
	goto	l730
u2980:
	goto	l2444
	
l2424:	
	goto	l2444
	line	143
	
l730:	
	line	144
;step.c: 143: {
;step.c: 144: RA3 = 1;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	bsf	(43/8),(43)&7
	line	145
	
l2426:	
;step.c: 145: for(j=0;j<8;j++)
	clrf	(main@j)
	clrf	(main@j+1)
	
l2428:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u2995
	movlw	low(08h)
	subwf	(main@j),w
u2995:

	skipc
	goto	u2991
	goto	u2990
u2991:
	goto	l2432
u2990:
	goto	l2440
	
l2430:	
	goto	l2440
	line	146
	
l732:	
	line	147
	
l2432:	
;step.c: 146: {
;step.c: 147: PORTB = motor_steps[j];
	movf	(main@j),w
	addlw	_motor_steps&0ffh
	movwf	fsr0
	bcf	status, 7	;select IRP bank0
	movf	indf,w
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	148
	
l2434:	
;step.c: 148: _delay((unsigned long)((5)*(20000000/4000.0)));
	opt asmopt_off
movlw	33
movwf	((??_main+0)+0+1),f
	movlw	118
movwf	((??_main+0)+0),f
u3227:
	decfsz	((??_main+0)+0),f
	goto	u3227
	decfsz	((??_main+0)+0+1),f
	goto	u3227
	clrwdt
opt asmopt_on

	line	145
	
l2436:	
	movlw	low(01h)
	addwf	(main@j),f
	skipnc
	incf	(main@j+1),f
	movlw	high(01h)
	addwf	(main@j+1),f
	
l2438:	
	movf	(main@j+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(08h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3005
	movlw	low(08h)
	subwf	(main@j),w
u3005:

	skipc
	goto	u3001
	goto	u3000
u3001:
	goto	l2432
u3000:
	goto	l2440
	
l733:	
	line	142
	
l2440:	
	movlw	low(01h)
	addwf	(main@i),f
	skipnc
	incf	(main@i+1),f
	movlw	high(01h)
	addwf	(main@i+1),f
	
l2442:	
	movf	(main@i+1),w
	xorlw	80h
	movwf	btemp+1
	movlw	(high(032h))^80h
	subwf	btemp+1,w
	skipz
	goto	u3015
	movlw	low(032h)
	subwf	(main@i),w
u3015:

	skipc
	goto	u3011
	goto	u3010
u3011:
	goto	l730
u3010:
	goto	l2444
	
l731:	
	line	152
	
l2444:	
;step.c: 149: }
;step.c: 151: }
;step.c: 152: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
movwf	((??_main+0)+0+2),f
movlw	69
movwf	((??_main+0)+0+1),f
	movlw	126
movwf	((??_main+0)+0),f
u3237:
	decfsz	((??_main+0)+0),f
	goto	u3237
	decfsz	((??_main+0)+0+1),f
	goto	u3237
	decfsz	((??_main+0)+0+2),f
	goto	u3237
opt asmopt_on

	line	153
;step.c: 153: PORTB = 0XFF;
	movlw	(0FFh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(6)	;volatile
	line	154
;step.c: 154: _delay((unsigned long)((1000)*(20000000/4000.0)));
	opt asmopt_off
movlw  26
movwf	((??_main+0)+0+2),f
movlw	69
movwf	((??_main+0)+0+1),f
	movlw	126
movwf	((??_main+0)+0),f
u3247:
	decfsz	((??_main+0)+0),f
	goto	u3247
	decfsz	((??_main+0)+0+1),f
	goto	u3247
	decfsz	((??_main+0)+0+2),f
	goto	u3247
opt asmopt_on

	goto	l689
	line	155
	
l734:	
	line	14
	goto	l689
	
l735:	
	goto	l737
	line	156
;step.c: 155: }
;step.c: 156: while(1);
	
l736:	
	
l737:	
	goto	l737
	
l738:	
	line	157
	
l739:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
psect	maintext
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
