;SOURCED FROM TI83PLUS.INC, MODIFIED TO DOCUMENT IMPORTANT LOCATIONS
;FOR THE PARTIAL EMULATION ENVIRONMENT / VIRTUAL MACHINE TO USE

#DEFINE equ .equ
#DEFINE EQU .equ

rom0_base_adr	EQU	$D40000		;65536 bytes (64.0KB)
rom1_base_adr	EQU	$D50000		;65536 bytes (64.0KB)
rom2_base_adr	EQU	$D60000		;22528 bytes (22.0KB)

ramStart			EQU	rom0_base_adr+$8000
appData				EQU	rom0_base_adr+$8000
ramCode				EQU	rom0_base_adr+$8100
ramCodeEnd			EQU	rom0_base_adr+$822F
baseAppBrTab		EQU	rom0_base_adr+$8230
bootTemp			EQU	rom0_base_adr+$8251
appSearchPage		EQU	rom0_base_adr+$82A3
tempSwapArea		EQU	rom0_base_adr+$82A5
appID				EQU	rom0_base_adr+$838D
ramReturnData		EQU	rom0_base_adr+$83ED
arcInfo				EQU	rom0_base_adr+$83EE
savedArcInfo		EQU	rom0_base_adr+$8406
appInfo				EQU	rom0_base_adr+$8432
appBank_jump		EQU	rom0_base_adr+$843C
appPage				EQU	rom0_base_adr+$843E
kbdScanCode			EQU	rom0_base_adr+$843F
kbdKey				EQU	rom0_base_adr+$8444
kbdGetKy			EQU	rom0_base_adr+$8445
keyExtend			EQU	rom0_base_adr+$8446
contrast			EQU	rom0_base_adr+$8447
apdSubTimer			EQU	rom0_base_adr+$8448
apdTimer			EQU	rom0_base_adr+$8449
curTime				EQU	rom0_base_adr+$844A
curRow				EQU	rom0_base_adr+$844B	 ;0-16
curCol				EQU	rom0_base_adr+$844C	 ;0-8
curOffset			EQU	rom0_base_adr+$844D
curUnder			EQU	rom0_base_adr+$844E
curY				EQU	rom0_base_adr+$844F
curType				EQU	rom0_base_adr+$8450
curXRow				EQU	rom0_base_adr+$8451
prevDData			EQU	rom0_base_adr+$8452
lFont_record		EQU	rom0_base_adr+$845A
sFont_record		EQU	rom0_base_adr+$8462
tokVarPtr			EQU	rom0_base_adr+$846A
tokLen				EQU	rom0_base_adr+$846C
indicMem			EQU	rom0_base_adr+$846E
indicCounter		EQU	rom0_base_adr+$8476
indicBusy			EQU	rom0_base_adr+$8477
OP1					EQU	rom0_base_adr+$8478
OP1M				EQU	rom0_base_adr+$847A
OP2					EQU	rom0_base_adr+$8483
OP2M				EQU	rom0_base_adr+$8485
OP2EXT				EQU	rom0_base_adr+$848C
OP3					EQU	rom0_base_adr+$848E
OP3M				EQU	rom0_base_adr+$8490
OP4					EQU	rom0_base_adr+$8499
OP4M				EQU	rom0_base_adr+$849B
OP5					EQU	rom0_base_adr+$84A4
OP5M				EQU	rom0_base_adr+$84A6
OP6					EQU	rom0_base_adr+$84AF
OP6M				EQU	rom0_base_adr+$84B1
OP6EXT				EQU	rom0_base_adr+$84B8
progToEdit			EQU	rom0_base_adr+$84BF
nameBuff			EQU	rom0_base_adr+$84C7
equ_edit_save		EQU	rom0_base_adr+$84D2
iMathPtr1			EQU	rom0_base_adr+$84D3
iMathPtr2			EQU	rom0_base_adr+$84D5
iMathPtr3			EQU	rom0_base_adr+$84D7
iMathPtr4			EQU	rom0_base_adr+$84D9
iMathPtr5			EQU	rom0_base_adr+$84DB
chkDelPtr1			EQU	rom0_base_adr+$84DD
chkDelPtr2			EQU	rom0_base_adr+$84DF
insDelPtr			EQU	rom0_base_adr+$84E1
upDownPtr			EQU	rom0_base_adr+$84E3
fOutDat				EQU	rom0_base_adr+$84E5
asm_data_ptr1		EQU	rom0_base_adr+$84EB
asm_data_ptr2		EQU	rom0_base_adr+$84ED
asm_sym_ptr1		EQU	rom0_base_adr+$84EF
asm_sym_ptr2		EQU	rom0_base_adr+$84F1
asm_ram				EQU	rom0_base_adr+$84F3
asm_ind_call		EQU	rom0_base_adr+$8507
textShadow			EQU	rom0_base_adr+$8508
textShadCur			EQU	rom0_base_adr+$8588
textShadTop			EQU	rom0_base_adr+$858A
textShadAlph		EQU	rom0_base_adr+$858B
textShadIns			EQU	rom0_base_adr+$858C
cxMain				EQU	rom0_base_adr+$858D
cxPPutAway			EQU	rom0_base_adr+$858F
cxPutAway			EQU	rom0_base_adr+$8591
cxRedisp			EQU	rom0_base_adr+$8593
cxErrorEP			EQU	rom0_base_adr+$8595
cxSizeWind			EQU	rom0_base_adr+$8597
cxPage				EQU	rom0_base_adr+$8599
cxCurApp			EQU	rom0_base_adr+$859A
cxPrev				EQU	rom0_base_adr+$859B
monQH				EQU	rom0_base_adr+$85AA
monQT				EQU	rom0_base_adr+$85AB
monQueue			EQU	rom0_base_adr+$85AC
onSP				EQU	rom0_base_adr+$85BC
promptRow			EQU	rom0_base_adr+$85C0
promptCol			EQU	rom0_base_adr+$85C1
promptIns			EQU	rom0_base_adr+$85C2
promptShift			EQU	rom0_base_adr+$85C3
promptRet			EQU	rom0_base_adr+$85C4
promptValid			EQU	rom0_base_adr+$85C6
promptTop			EQU	rom0_base_adr+$85C8
promptCursor		EQU	rom0_base_adr+$85CA
promptTail			EQU	rom0_base_adr+$85CC
promptBtm			EQU	rom0_base_adr+$85CE
varType				EQU	rom0_base_adr+$85D0
varCurrent			EQU	rom0_base_adr+$85D1
varClass			EQU	rom0_base_adr+$85D9
menuActive			EQU	rom0_base_adr+$85DC
menuAppDepth		EQU	rom0_base_adr+$85DD
MenuCurrent			EQU	rom0_base_adr+$85DE
ProgCurrent			EQU	rom0_base_adr+$85E8
userMenuSA			EQU	rom0_base_adr+$85FE
ioPrompt			EQU	rom0_base_adr+$865F
dImageWidth			EQU	rom0_base_adr+$8660
RectFillPHeight		equ	rom0_base_adr+$8660
RectFillPWidth		equ	rom0_base_adr+$8661
RectFillPattern		equ	rom0_base_adr+$8662
ioFlag				EQU	rom0_base_adr+$8670
sndRecState			EQU	rom0_base_adr+$8672
ioErrState			EQU	rom0_base_adr+$8673
header				EQU	rom0_base_adr+$8674
ioData				EQU	rom0_base_adr+$867D
ioNewData			EQU	rom0_base_adr+$8689
bakHeader			EQU	rom0_base_adr+$868B
penCol				EQU	rom0_base_adr+$86D7
penRow				EQU	rom0_base_adr+$86D8
rclQueue			EQU	rom0_base_adr+$86D9
rclQueueEnd			EQU	rom0_base_adr+$86DB
errNo				EQU	rom0_base_adr+$86DD
errSP				EQU	rom0_base_adr+$86DE
errOffset			EQU	rom0_base_adr+$86E0
saveSScreen			EQU	rom0_base_adr+$86EC
bstCounter			EQU	rom0_base_adr+$89EE
flags				EQU	rom0_base_adr+$89F0
statVars			EQU	rom0_base_adr+$8A3A
anovaf_vars			EQU	rom0_base_adr+$8C17
infVars				EQU	rom0_base_adr+$8C4D
curGStyle			EQU	rom0_base_adr+$8D17
curGY				EQU	rom0_base_adr+$8D18
curGX				EQU	rom0_base_adr+$8D19
curGY2				EQU	rom0_base_adr+$8D1A
curGX2				EQU	rom0_base_adr+$8D1B
freeSaveY			EQU	rom0_base_adr+$8D1C
freeSaveX			EQU	rom0_base_adr+$8D1D
XOffset				EQU	rom0_base_adr+$8DA1
YOffset				EQU	rom0_base_adr+$8DA2
lcdTallP			EQU	rom0_base_adr+$8DA3
pixWideP			EQU	rom0_base_adr+$8DA4
pixWide_m_1			EQU	rom0_base_adr+$8DA5
pixWide_m_2			EQU	rom0_base_adr+$8DA6
lastEntryPTR		EQU	rom0_base_adr+$8DA7
lastEntryStk		EQU	rom0_base_adr+$8DA9
numLastEntries		EQU	rom0_base_adr+$8E29
currLastEntry		EQU	rom0_base_adr+$8E2A
curInc				EQU	rom0_base_adr+$8E67
uXmin				EQU	rom0_base_adr+$8E7E
uXmax				EQU	rom0_base_adr+$8E87
uXscl				EQU	rom0_base_adr+$8E90
uYmin				EQU	rom0_base_adr+$8E99
uYmax				EQU	rom0_base_adr+$8EA2
uYscl				EQU	rom0_base_adr+$8EAB
uThetMin			EQU	rom0_base_adr+$8EB4
uThetMax			EQU	rom0_base_adr+$8EBD
uThetStep			EQU	rom0_base_adr+$8EC6
uTmin				EQU	rom0_base_adr+$8ECF
uTmax				EQU	rom0_base_adr+$8ED8
uTStep				EQU	rom0_base_adr+$8EE1
uPlotStart			EQU	rom0_base_adr+$8EEA
unMax				EQU	rom0_base_adr+$8EF3
uu0					EQU	rom0_base_adr+$8EFC
uv0					EQU	rom0_base_adr+$8F05
unMin				EQU	rom0_base_adr+$8F0E
uu02				EQU	rom0_base_adr+$8F17
uv02				EQU	rom0_base_adr+$8F20
uw0					EQU	rom0_base_adr+$8F29
uPlotStep			EQU	rom0_base_adr+$8F32
uXres				EQU	rom0_base_adr+$8F3B
uw02				EQU	rom0_base_adr+$8F44
Xmin				EQU	rom0_base_adr+$8F50
Xmax				EQU	rom0_base_adr+$8F59
Xscl				EQU	rom0_base_adr+$8F62
Ymin				EQU	rom0_base_adr+$8F6B
Ymax				EQU	rom0_base_adr+$8F74
Yscl				EQU	rom0_base_adr+$8F7D
ThetaMin			EQU	rom0_base_adr+$8F86
ThetaMax			EQU	rom0_base_adr+$8F8F
ThetaStep			EQU	rom0_base_adr+$8F98
TminPar				EQU	rom0_base_adr+$8FA1
TmaxPar				EQU	rom0_base_adr+$8FAA
Tstep				EQU	rom0_base_adr+$8FB3
PlotStart			EQU	rom0_base_adr+$8FBC
nMax				EQU	rom0_base_adr+$8FC5
u0					EQU	rom0_base_adr+$8FCE
v0					EQU	rom0_base_adr+$8FD7
nMin				EQU	rom0_base_adr+$8FE0
u02					EQU	rom0_base_adr+$8FE9
v02					EQU	rom0_base_adr+$8FF2
w0					EQU	rom0_base_adr+$8FFB
PlotStep			EQU	rom0_base_adr+$9004
XresO				EQU	rom0_base_adr+$900D
w02					EQU	rom0_base_adr+$9016
un1					EQU	rom0_base_adr+$901F
un2					EQU	rom0_base_adr+$9028
vn1					EQU	rom0_base_adr+$9031
vn2					EQU	rom0_base_adr+$903A
wn1					EQU	rom0_base_adr+$9043
wn2					EQU	rom0_base_adr+$904C
fin_N				EQU	rom0_base_adr+$9055
fin_I				EQU	rom0_base_adr+$905E
fin_PV				EQU	rom0_base_adr+$9067
fin_PMT				EQU	rom0_base_adr+$9070
fin_FV				EQU	rom0_base_adr+$9079
fin_PY				EQU	rom0_base_adr+$9082
fin_CY				EQU	rom0_base_adr+$908B
cal_N				EQU	rom0_base_adr+$9094
cal_I				EQU	rom0_base_adr+$909D
cal_PV				EQU	rom0_base_adr+$90A6
cal_PMT				EQU	rom0_base_adr+$90AF
cal_FV				EQU	rom0_base_adr+$90B8
cal_PY				EQU	rom0_base_adr+$90C1
smallEditRAM		EQU	rom0_base_adr+$90D3
XFact				EQU	rom0_base_adr+$913F
YFact				EQU	rom0_base_adr+$9148
Xres_int			EQU	rom0_base_adr+$9151
deltaX				EQU	rom0_base_adr+$9152
deltaY				EQU	rom0_base_adr+$915B
shortX				EQU	rom0_base_adr+$9164
shortY				EQU	rom0_base_adr+$916D
lower				EQU	rom0_base_adr+$9176
upper				EQU	rom0_base_adr+$917F
XOutSym				EQU	rom0_base_adr+$918C
XOutDat				EQU	rom0_base_adr+$918E
YOutSym				EQU	rom0_base_adr+$9190
YOutDat				EQU	rom0_base_adr+$9192
inputSym			EQU	rom0_base_adr+$9194
inputDat			EQU	rom0_base_adr+$9196
prevData			EQU	rom0_base_adr+$9198
TblMin				EQU	rom0_base_adr+$92B3
TblStep				EQU	rom0_base_adr+$92BC
P1Type				EQU	rom0_base_adr+$92C9
SavX1List			EQU	rom0_base_adr+$92CA
SavY1List			EQU	rom0_base_adr+$92CF
SavF1List			EQU	rom0_base_adr+$92D4
P1FrqOnOff			EQU	rom0_base_adr+$92D9
P2Type				EQU	rom0_base_adr+$92DA
SavX2List			EQU	rom0_base_adr+$92DB
SavY2List			EQU	rom0_base_adr+$92E0
SavF2List			EQU	rom0_base_adr+$92E5
P2FrqOnOff			EQU	rom0_base_adr+$92EA
P3Type				EQU	rom0_base_adr+$92EB	
SavX3List			EQU	rom0_base_adr+$92EC
SavY3List			EQU	rom0_base_adr+$92F1
SavF3List			EQU	rom0_base_adr+$92F6
P3FrqOnOff			EQU	rom0_base_adr+$92FB
plotSScreen			EQU	rom0_base_adr+$9340
seed1				EQU	rom0_base_adr+$9640
seed2				EQU	rom0_base_adr+$9649
cmdShadow			EQU	rom0_base_adr+$966E
cmdShadCur			EQU	rom0_base_adr+$96EE
cmdShadAlph			EQU	rom0_base_adr+$96F0
cmdShadIns			EQU	rom0_base_adr+$96F1
cmdCursor			EQU	rom0_base_adr+$96F2
editTop				EQU	rom0_base_adr+$96F4
editCursor			EQU	rom0_base_adr+$96F6
editTail			EQU	rom0_base_adr+$96F8
editBtm				EQU	rom0_base_adr+$96FA
editSym				EQU	rom0_base_adr+$9706
editDat				EQU	rom0_base_adr+$9708
winTop				EQU	rom0_base_adr+$97A5
winBtm				EQU	rom0_base_adr+$97A6
winLeftEdge			EQU	rom0_base_adr+$97A7
winLeft				EQU	rom0_base_adr+$97A8
winAbove			EQU	rom0_base_adr+$97AA
winRow				EQU	rom0_base_adr+$97AC
winCol				EQU	rom0_base_adr+$97AE
fmtDigits			EQU	rom0_base_adr+$97B0
fmtString			EQU	rom0_base_adr+$97B1
fmtConv				EQU	rom0_base_adr+$97F2
fmtLeft				EQU	rom0_base_adr+$9804
fmtIndex			EQU	rom0_base_adr+$9806
fmtMatSym			EQU	rom0_base_adr+$9808
fmtMatMem			EQU	rom0_base_adr+$980A
EQS					EQU	rom0_base_adr+$980C
tSymPtr1			EQU	rom0_base_adr+$9818
tSymPtr2			EQU	rom0_base_adr+$981A
chkDelPtr3			EQU	rom0_base_adr+$981C
chkDelPtr4			EQU	rom0_base_adr+$981E
tempMem				EQU	rom0_base_adr+$9820
fpBase				EQU	rom0_base_adr+$9822
FPS					EQU	rom0_base_adr+$9824
OPBase				EQU	rom0_base_adr+$9826
OPS					EQU	rom0_base_adr+$9828
pTempCnt			EQU	rom0_base_adr+$982A
cleanTmp			EQU	rom0_base_adr+$982C
pTemp				EQU	rom0_base_adr+$982E
progPtr				EQU	rom0_base_adr+$9830
newDataPtr			EQU	rom0_base_adr+$9832
pagedCount			EQU	rom0_base_adr+$9834
pagedPN				EQU	rom0_base_adr+$9835
pagedGetPtr			EQU	rom0_base_adr+$9836
pagedPutPtr			EQU	rom0_base_adr+$9838
pagedBuf			EQU	rom0_base_adr+$983A
appErr1				EQU	rom0_base_adr+$984D
appErr2				EQU	rom0_base_adr+$985A
flashByte1			EQU	rom0_base_adr+$9867
flashByte2			EQU	rom0_base_adr+$9868
freeArcBlock		EQU	rom0_base_adr+$9869
arcPage				EQU	rom0_base_adr+$986B
arcPtr				EQU	rom0_base_adr+$986C
appRawKeyHandle		EQU	rom0_base_adr+$9870
appBackUpScreen		EQU	rom0_base_adr+$9872
customHeight		EQU	rom0_base_adr+$9B72
localLanguage		EQU	rom0_base_adr+$9B73
cursorHookPtr		EQU	rom0_base_adr+$9B7C
rawKeyHookPtr		EQU	rom0_base_adr+$9B84
getKeyHookPtr		EQU	rom0_base_adr+$9B88
fontHookPtr			EQU	rom0_base_adr+$9B9C
restartClr			EQU	rom0_base_adr+$9BD0
localTokStr			EQU	rom0_base_adr+$9D65
keyForStr			EQU	rom0_base_adr+$9D76
keyToStrRam			EQU	rom0_base_adr+$9D77
sedMonSp			EQU	rom0_base_adr+$9D88
bpSave				EQU	rom0_base_adr+$9D8A
userMem				EQU	rom0_base_adr+$9D95
symTable			EQU	rom0_base_adr+$FE66

;//---
textFlags		EQU   5 	;Text output flags
textEraseBelow	EQU    1	; 1=erase line below small char
textScrolled	EQU    2	; 1=screen scrolled
textInverse		EQU    3	; 1=display inverse bit-map
textInsMode		EQU    4	; 0=overstrike, 1=insert mode
;//-
internalFlags   EQU   6     ;##THESE FLAGS WEREN'T BEING USED
leadingSpace    EQU  0      ; Internal use

;//-
newDispF        EQU  8		;Derivative mode flags
apdFlags		EQU  8		;Automatic power-down
preClrForMode   EQU   0		; 1=HELP BLINK ON MODE SCREEN
apdAble 		EQU   2		; 1=APD enabled
apdRunning		EQU   3		; 1=APD clock running
;//-
appFlags		EQU   13	;application flags
appWantIntrpt	EQU    0	; 1=want ON key interrupts
appTextSave		EQU    1	; 1=save characters in textShadow
appAutoScroll	EQU    2	; 1=auto-scroll text on last line
appMenus		EQU    3	; 1=process keys that bring up menus
							; 0=check Lock menu flag
appLockMenus	EQU    4	; 1=ignore menu keys
							; 0=switch to home screen and bring up menu
appCurGraphic	EQU    5	; 1=graphic cursor
appCurWord		EQU    6	; 1=text cursor covers entire word
appExit 		EQU    7	; 1=application handles [EXIT] key itself
;//-
sGrFlags		EQU   20
grfSplit		EQU    0	; 1=Split Graph, 0=Normal
vertSplit		EQU    1	; 1=Vertical (left-right) Split
grfSChanged		EQU    2	; 1=Graph just changed Split <-> normal
grfSplitOverride EQU   3	; 1 = ignore graph split flag if set
write_on_graph	EQU    4	; 1 = TEXT OR EQU WRITING TO GRAPH SCREEN
g_style_active	EQU    5	; 1 = GRAPH STYLES ARE ENABLED, USE THEM
cmp_mod_box		EQU    6	; 1 = DOING MOD BOX PLOT COMPUTATION
textWrite		EQU    7	; 1 = Small font writes to buffer
							; 0 = Small font writes to display
;//-
fontFlags		EQU  50
fracDrawLFont	EQU   2
fracTallLFont	EQU   3
customFont		EQU   7  

;//---


internal_state  EQU rom2_base_adr + $002C00 ;128 bytes: variables


screen_buffer	EQU internal_state+ $000080	;768 bytes: 96*64/8 pixel buffer
display_lut		EQU screen_buffer + $000300	;768 bytes: 256*3 byte pixel map LUT
display_buffer	EQU display_lut	  + $000300	;9600 bytes: 320*240/8 mem-mapped LCD















