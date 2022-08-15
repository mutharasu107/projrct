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
# 4 "C:\Users\r_m_a\Desktop\PWM\5-8-22PWM\sample.c"
	psect config,class=CONFIG,delta=2 ;#
# 4 "C:\Users\r_m_a\Desktop\PWM\5-8-22PWM\sample.c"
	dw 0x1F7A ;#
	FNCALL	_main,_delay
	FNROOT	_main
	global	_CCP1CON
psect	text60,local,class=CODE,delta=2
global __ptext60
__ptext60:
_CCP1CON	set	23
	global	_CCPR1L
_CCPR1L	set	21
	global	_T1CON
_T1CON	set	16
	global	_T2CON
_T2CON	set	18
	global	_TMR1H
_TMR1H	set	15
	global	_TMR1L
_TMR1L	set	14
	global	_TMR1IF
_TMR1IF	set	96
	global	_TMR1ON
_TMR1ON	set	128
	global	_PR2
_PR2	set	146
	global	_TRISC2
_TRISC2	set	1082
	file	"SAMPLE.as"
	line	#
psect cinit,class=CODE,delta=2
global start_initialization
start_initialization:

psect cinit,class=CODE,delta=2
global end_of_initialization

;End of C runtime variable initialization code

end_of_initialization:
clrf status
ljmp _main	;jump to C main() function
psect	cstackCOMMON,class=COMMON,space=1
global __pcstackCOMMON
__pcstackCOMMON:
	global	?_delay
?_delay:	; 0 bytes @ 0x0
	global	??_delay
??_delay:	; 0 bytes @ 0x0
	global	??_main
??_main:	; 0 bytes @ 0x0
	global	?_main
?_main:	; 2 bytes @ 0x0
	ds	1
	global	main@i
main@i:	; 1 bytes @ 0x1
	ds	1
;;Data sizes: Strings 0, constant 0, data 0, bss 0, persistent 0 stack 0
;;Auto spaces:   Size  Autos    Used
;; COMMON          14      2       2
;; BANK0           80      0       0
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
;;Main: autosize = 0, tempsize = 1, incstack = 0, save=0
;;

;;
;;Call Graph Tables:
;;
;; ---------------------------------------------------------------------------------
;; (Depth) Function   	        Calls       Base Space   Used Autos Params    Refs
;; ---------------------------------------------------------------------------------
;; (0) _main                                                 2     2      0      30
;;                                              0 COMMON     2     2      0
;;                              _delay
;; ---------------------------------------------------------------------------------
;; (1) _delay                                                0     0      0       0
;; ---------------------------------------------------------------------------------
;; Estimated maximum stack depth 1
;; ---------------------------------------------------------------------------------

;; Call Graph Graphs:

;; _main (ROOT)
;;   _delay
;;

;; Address spaces:

;;Name               Size   Autos  Total    Cost      Usage
;;BITCOMMON            E      0       0       0        0.0%
;;EEDATA             100      0       0       0        0.0%
;;NULL                 0      0       0       0        0.0%
;;CODE                 0      0       0       0        0.0%
;;COMMON               E      2       2       1       14.3%
;;BITSFR0              0      0       0       1        0.0%
;;SFR0                 0      0       0       1        0.0%
;;BITSFR1              0      0       0       2        0.0%
;;SFR1                 0      0       0       2        0.0%
;;STACK                0      0       1       2        0.0%
;;ABS                  0      0       0       3        0.0%
;;BITBANK0            50      0       0       4        0.0%
;;BITSFR3              0      0       0       4        0.0%
;;SFR3                 0      0       0       4        0.0%
;;BANK0               50      0       0       5        0.0%
;;BITSFR2              0      0       0       5        0.0%
;;SFR2                 0      0       0       5        0.0%
;;BITBANK1            50      0       0       6        0.0%
;;BANK1               50      0       0       7        0.0%
;;BITBANK3            60      0       0       8        0.0%
;;BANK3               60      0       0       9        0.0%
;;BITBANK2            60      0       0      10        0.0%
;;BANK2               60      0       0      11        0.0%
;;DATA                 0      0       0      12        0.0%

	global	_main
psect	maintext,global,class=CODE,delta=2
global __pmaintext
__pmaintext:

;; *************** function _main *****************
;; Defined at:
;;		line 19 in file "C:\Users\r_m_a\Desktop\PWM\5-8-22PWM\sample.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;  i               1    1[COMMON] unsigned char 
;; Return value:  Size  Location     Type
;;                  2  690[COMMON] int 
;; Registers used:
;;		wreg, status,2, status,0, pclath, cstack
;; Tracked objects:
;;		On entry : 17F/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         1       0       0       0       0
;;      Temps:          1       0       0       0       0
;;      Totals:         2       0       0       0       0
;;Total ram usage:        2 bytes
;; Hardware stack levels required when called:    1
;; This function calls:
;;		_delay
;; This function is called by:
;;		Startup code after reset
;; This function uses a non-reentrant model
;;
psect	maintext
	file	"C:\Users\r_m_a\Desktop\PWM\5-8-22PWM\sample.c"
	line	19
	global	__size_of_main
	__size_of_main	equ	__end_of_main-_main
	
_main:	
	opt	stack 7
; Regs used in _main: [wreg+status,2+status,0+pclath+cstack]
	line	20
	
l1832:	
;sample.c: 20: unsigned char i = 0;
	clrf	(main@i)
	line	21
;sample.c: 21: TRISC2 = 0;
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	bcf	(1082/8)^080h,(1082)&7
	line	22
	
l1834:	
;sample.c: 22: CCP1CON = 0X0F;
	movlw	(0Fh)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(23)	;volatile
	line	23
;sample.c: 23: PR2 = 0XFF;
	movlw	(0FFh)
	bsf	status, 5	;RP0=1, select bank1
	bcf	status, 6	;RP1=0, select bank1
	movwf	(146)^080h	;volatile
	line	24
;sample.c: 24: CCPR1L = 0X10;
	movlw	(010h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(21)	;volatile
	line	25
;sample.c: 25: T2CON = 0X07;
	movlw	(07h)
	movwf	(18)	;volatile
	line	26
	
l1836:	
;sample.c: 26: delay();
	fcall	_delay
	line	28
	
l1838:	
;sample.c: 28: for(i=0;i<16;i++)
	clrf	(main@i)
	
l1840:	
	movlw	(010h)
	subwf	(main@i),w
	skipc
	goto	u2151
	goto	u2150
u2151:
	goto	l1844
u2150:
	goto	l693
	
l1842:	
	goto	l693
	line	29
	
l691:	
	line	30
	
l1844:	
;sample.c: 29: {
;sample.c: 30: CCPR1L=CCPR1L+0X10;
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movf	(21),w	;volatile
	addlw	010h
	movwf	(21)	;volatile
	line	31
	
l1846:	
;sample.c: 31: delay();
	fcall	_delay
	line	32
	
l1848:	
;sample.c: 32: delay();
	fcall	_delay
	line	33
	
l1850:	
;sample.c: 33: delay();
	fcall	_delay
	line	34
	
l1852:	
;sample.c: 34: delay();
	fcall	_delay
	line	35
	
l1854:	
;sample.c: 35: delay();
	fcall	_delay
	line	36
	
l1856:	
;sample.c: 36: delay();
	fcall	_delay
	line	37
	
l1858:	
;sample.c: 37: delay();
	fcall	_delay
	line	38
	
l1860:	
;sample.c: 38: delay();
	fcall	_delay
	line	39
	
l1862:	
;sample.c: 39: delay();
	fcall	_delay
	line	40
	
l1864:	
;sample.c: 40: delay();
	fcall	_delay
	line	28
	movlw	(01h)
	movwf	(??_main+0)+0
	movf	(??_main+0)+0,w
	addwf	(main@i),f
	
l1866:	
	movlw	(010h)
	subwf	(main@i),w
	skipc
	goto	u2161
	goto	u2160
u2161:
	goto	l1844
u2160:
	goto	l693
	
l692:	
	line	42
	
l693:	
	global	start
	ljmp	start
	opt stack 0
GLOBAL	__end_of_main
	__end_of_main:
;; =============== function _main ends ============

	signat	_main,90
	global	_delay
psect	text61,local,class=CODE,delta=2
global __ptext61
__ptext61:

;; *************** function _delay *****************
;; Defined at:
;;		line 9 in file "C:\Users\r_m_a\Desktop\PWM\5-8-22PWM\sample.c"
;; Parameters:    Size  Location     Type
;;		None
;; Auto vars:     Size  Location     Type
;;		None
;; Return value:  Size  Location     Type
;;		None               void
;; Registers used:
;;		wreg
;; Tracked objects:
;;		On entry : 0/0
;;		On exit  : 0/0
;;		Unchanged: 0/0
;; Data sizes:     COMMON   BANK0   BANK1   BANK3   BANK2
;;      Params:         0       0       0       0       0
;;      Locals:         0       0       0       0       0
;;      Temps:          0       0       0       0       0
;;      Totals:         0       0       0       0       0
;;Total ram usage:        0 bytes
;; Hardware stack levels used:    1
;; This function calls:
;;		Nothing
;; This function is called by:
;;		_main
;; This function uses a non-reentrant model
;;
psect	text61
	file	"C:\Users\r_m_a\Desktop\PWM\5-8-22PWM\sample.c"
	line	9
	global	__size_of_delay
	__size_of_delay	equ	__end_of_delay-_delay
	
_delay:	
	opt	stack 7
; Regs used in _delay: [wreg]
	line	10
	
l1062:	
;sample.c: 10: T1CON = 0X30;
	movlw	(030h)
	bcf	status, 5	;RP0=0, select bank0
	bcf	status, 6	;RP1=0, select bank0
	movwf	(16)	;volatile
	line	11
;sample.c: 11: TMR1H = 0X0B;
	movlw	(0Bh)
	movwf	(15)	;volatile
	line	12
;sample.c: 12: TMR1L = 0XDC;
	movlw	(0DCh)
	movwf	(14)	;volatile
	line	13
	
l1064:	
;sample.c: 13: TMR1ON=1;
	bsf	(128/8),(128)&7
	line	14
;sample.c: 14: while(TMR1IF==0);
	goto	l685
	
l686:	
	
l685:	
	btfss	(96/8),(96)&7
	goto	u11
	goto	u10
u11:
	goto	l685
u10:
	
l687:	
	line	15
;sample.c: 15: TMR1IF = 0;
	bcf	(96/8),(96)&7
	line	16
	
l688:	
	return
	opt stack 0
GLOBAL	__end_of_delay
	__end_of_delay:
;; =============== function _delay ends ============

	signat	_delay,88
psect	text62,local,class=CODE,delta=2
global __ptext62
__ptext62:
	global	btemp
	btemp set 07Eh

	DABS	1,126,2	;btemp
	global	wtemp0
	wtemp0 set btemp
	end
