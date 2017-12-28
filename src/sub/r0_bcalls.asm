.ASSUME ADL=0
;===============================================================================
;OS 2.43 basecall table is 4917 bytes long (1639 entries) starting at $4000
#DEFINE OS_NUMCALLS 1639

bcall_sbase_os:
;.ds (bcall_sbase_os+(3*OS_NUMCALLS))-$
.dw errnosupport    \.db $00    ;$4000 _JErrorNo 
.dw errnosupport    \.db $00    ;$4003 _FontHook 
.dw errnosupport    \.db $00    ;$4006 _call_character_hook 
.dw errnosupport    \.db $00    ;$4009 _ldHLind 
.dw errnosupport    \.db $00    ;$400C _CpHLDE 
.dw errnosupport    \.db $00    ;$400F _DivHLBy10 
.dw errnosupport    \.db $00    ;$4012 _DivHLByA 
.dw errnosupport    \.db $00    ;$4015 _kdbScan 
.dw errnosupport    \.db $00    ;$4018 _GetCSC 
.dw errnosupport    \.db $00    ;$401B _coorMon 
.dw errnosupport    \.db $00    ;$401E _Mon 
.dw errnosupport    \.db $00    ;$4021 _monForceKey 
.dw errnosupport    \.db $00    ;$4024 _sendKPress 
.dw errnosupport    \.db $00    ;$4027 _JForceCmdNoChar 
.dw errnosupport    \.db $00    ;$402A _JForceCmd 
.dw errnosupport    \.db $00    ;$402D _sysErrHandler 
.dw errnosupport    \.db $00    ;$4030 _newContext 
.dw errnosupport    \.db $00    ;$4033 _newContext0 
.dw errnosupport    \.db $00    ;$4036 _cxPutAway 
.dw errnosupport    \.db $00    ;$4039 _cxPutAway2 
.dw errnosupport    \.db $00    ;$403C _cxPPutAway 
.dw errnosupport    \.db $00    ;$403F _cxSizeWind 
.dw errnosupport    \.db $00    ;$4042 _cxErrEP 
.dw errnosupport    \.db $00    ;$4045 _cxMain 
.dw errnosupport    \.db $00    ;$4048 _monErrHand 
.dw errnosupport    \.db $00    ;$404B _AppInit 
.dw errnosupport    \.db $00    ;$404E _resetRam 
.dw errnosupport    \.db $00    ;$4051 _lcd_busy 
.dw errnosupport    \.db $00    ;$4054 _Min 
.dw errnosupport    \.db $00    ;$4057 _Max 
.dw errnosupport    \.db $00    ;$405A  
.dw errnosupport    \.db $00    ;$405D  
.dw errnosupport    \.db $00    ;$4060 _Trunc 
.dw errnosupport    \.db $00    ;$4063 _InvSub 
.dw errnosupport    \.db $00    ;$4066 _Times2 
.dw errnosupport    \.db $00    ;$4069 _Plus1 
.dw errnosupport    \.db $00    ;$406C _Minus1 
.dw errnosupport    \.db $00    ;$406F _FPSub 
.dw errnosupport    \.db $00    ;$4072 _FPAdd 
.dw errnosupport    \.db $00    ;$4075 _DToR 
.dw errnosupport    \.db $00    ;$4078 _RToD 
.dw errnosupport    \.db $00    ;$407B _Cube 
.dw errnosupport    \.db $00    ;$407E _TimesPt5 
.dw errnosupport    \.db $00    ;$4081 _FPSquare 
.dw errnosupport    \.db $00    ;$4084 _FPMult 
.dw errnosupport    \.db $00    ;$4087 _LJRND 
.dw errnosupport    \.db $00    ;$408A _InvOP1SC 
.dw errnosupport    \.db $00    ;$408D _InvOP1S 
.dw errnosupport    \.db $00    ;$4090 _InvOP2S 
.dw errnosupport    \.db $00    ;$4093 _frac 
.dw errnosupport    \.db $00    ;$4096 _fprecip 
.dw errnosupport    \.db $00    ;$4099 _fpdiv 
.dw errnosupport    \.db $00    ;$409C _SqRoot 
.dw errnosupport    \.db $00    ;$409F _RndGuard 
.dw errnosupport    \.db $00    ;$40A2 _RnFx 
.dw errnosupport    \.db $00    ;$40A5 _int 
.dw errnosupport    \.db $00    ;$40A8 _Round 
.dw errnosupport    \.db $00    ;$40AB _LnX 
.dw errnosupport    \.db $00    ;$40AE _LogX 
.dw errnosupport    \.db $00    ;$40B1 _LJNORND 
.dw errnosupport    \.db $00    ;$40B4 _EToX 
.dw errnosupport    \.db $00    ;$40B7 _TenX 
.dw errnosupport    \.db $00    ;$40BA _SinCosRad 
.dw errnosupport    \.db $00    ;$40BD _Sin 
.dw errnosupport    \.db $00    ;$40C0 _cos 
.dw errnosupport    \.db $00    ;$40C3 _Tan 
.dw errnosupport    \.db $00    ;$40C6 _SinHCosH 
.dw errnosupport    \.db $00    ;$40C9 _TanH 
.dw errnosupport    \.db $00    ;$40CC _cosh 
.dw errnosupport    \.db $00    ;$40CF _SinH 
.dw errnosupport    \.db $00    ;$40D2 _ACosRad 
.dw errnosupport    \.db $00    ;$40D5 _ATanRad 
.dw errnosupport    \.db $00    ;$40D8 _ATan2Rad 
.dw errnosupport    \.db $00    ;$40DB _ASinRad 
.dw errnosupport    \.db $00    ;$40DE _ACos 
.dw errnosupport    \.db $00    ;$40E1 _ATan 
.dw errnosupport    \.db $00    ;$40E4 _ASin 
.dw errnosupport    \.db $00    ;$40E7 _ATan2 
.dw errnosupport    \.db $00    ;$40EA _ATanH 
.dw errnosupport    \.db $00    ;$40ED _ASinH 
.dw errnosupport    \.db $00    ;$40F0 _ACosH 
.dw errnosupport    \.db $00    ;$40F3 _PtoR 
.dw errnosupport    \.db $00    ;$40F6 _RToP 
.dw errnosupport    \.db $00    ;$40F9 _HLTimes9 
.dw errnosupport    \.db $00    ;$40FC _CkOP1Cplx 
.dw errnosupport    \.db $00    ;$40FF _CkOP1Real 
.dw errnosupport    \.db $00    ;$4102 _Angle 
.dw errnosupport    \.db $00    ;$4105 _COP1Set0 
.dw errnosupport    \.db $00    ;$4108 _CpOP4OP3 
.dw errnosupport    \.db $00    ;$410B _Mov9OP2Cp 
.dw errnosupport    \.db $00    ;$410E _AbsO1O2Cp 
.dw errnosupport    \.db $00    ;$4111 _cpop1op2 
.dw errnosupport    \.db $00    ;$4114 _OP3ToOP4 
.dw errnosupport    \.db $00    ;$4117 _OP1ToOP4 
.dw errnosupport    \.db $00    ;$411A _OP2ToOP4 
.dw errnosupport    \.db $00    ;$411D _OP4ToOP2 
.dw errnosupport    \.db $00    ;$4120  
.dw errnosupport    \.db $00    ;$4123 _OP1ToOP3 
.dw errnosupport    \.db $00    ;$4126 _OP5ToOP2 
.dw errnosupport    \.db $00    ;$4129 _OP5ToOP6 
.dw errnosupport    \.db $00    ;$412C _OP5ToOP4 
.dw errnosupport    \.db $00    ;$412F _OP1ToOP2 
.dw errnosupport    \.db $00    ;$4132 _OP6ToOP2 
.dw errnosupport    \.db $00    ;$4135 _OP6ToOP1 
.dw errnosupport    \.db $00    ;$4138 _OP4ToOP1 
.dw errnosupport    \.db $00    ;$413B _OP5ToOP1 
.dw errnosupport    \.db $00    ;$413E _OP3ToOP1 
.dw errnosupport    \.db $00    ;$4141 _OP6ToOP5 
.dw errnosupport    \.db $00    ;$4144 _OP4ToOP5 
.dw errnosupport    \.db $00    ;$4147 _OP3ToOP5 
.dw errnosupport    \.db $00    ;$414A _OP2ToOP5 
.dw errnosupport    \.db $00    ;$414D _OP2ToOP6 
.dw errnosupport    \.db $00    ;$4150 _OP1ToOP6 
.dw errnosupport    \.db $00    ;$4153 _OP1ToOP5 
.dw errnosupport    \.db $00    ;$4156 _OP2ToOP1 
.dw errnosupport    \.db $00    ;$4159 _Mov11B 
.dw errnosupport    \.db $00    ;$415C _Mov10B 
.dw errnosupport    \.db $00    ;$415F _Mov9B 
.dw errnosupport    \.db $00    ;$4162 _mov9B2 
.dw errnosupport    \.db $00    ;$4165 _Mov8B 
.dw errnosupport    \.db $00    ;$4168 _Mov7B 
.dw errnosupport    \.db $00    ;$416B _Mov7B2 
.dw errnosupport    \.db $00    ;$416E _OP2ToOP3 
.dw errnosupport    \.db $00    ;$4171 _OP4ToOP3 
.dw errnosupport    \.db $00    ;$4174 _OP5ToOP3 
.dw errnosupport    \.db $00    ;$4177 _OP4ToOP6 
.dw errnosupport    \.db $00    ;$417A _Mov9ToOP1 
.dw errnosupport    \.db $00    ;$417D _Mov9OP1OP2 
.dw errnosupport    \.db $00    ;$4180 _Mov9ToOP2 
.dw errnosupport    \.db $00    ;$4183 _MovFrOP1 
.dw errnosupport    \.db $00    ;$4186 _OP4Set1 
.dw errnosupport    \.db $00    ;$4189 _OP3Set1 
.dw errnosupport    \.db $00    ;$418C _OP2Set8 
.dw errnosupport    \.db $00    ;$418F _OP2Set5 
.dw errnosupport    \.db $00    ;$4192 _OP2SetA 
.dw errnosupport    \.db $00    ;$4195 _OP2Set4 
.dw errnosupport    \.db $00    ;$4198 _OP2Set3 
.dw errnosupport    \.db $00    ;$419B _OP1Set1 
.dw errnosupport    \.db $00    ;$419E _OP1Set4 
.dw errnosupport    \.db $00    ;$41A1 _OP1Set3 
.dw errnosupport    \.db $00    ;$41A4 _OP3Set2 
.dw errnosupport    \.db $00    ;$41A7 _OP1Set2 
.dw errnosupport    \.db $00    ;$41AA _OP2Set2 
.dw errnosupport    \.db $00    ;$41AD _OP2Set1 
.dw errnosupport    \.db $00    ;$41B0 _Zero16D 
.dw errnosupport    \.db $00    ;$41B3 _OP5Set0 
.dw errnosupport    \.db $00    ;$41B6 _OP4Set0 
.dw errnosupport    \.db $00    ;$41B9 _OP3Set0 
.dw errnosupport    \.db $00    ;$41BC _OP2Set0 
.dw errnosupport    \.db $00    ;$41BF _OP1Set0 
.dw errnosupport    \.db $00    ;$41C2 _OPSet0 
.dw errnosupport    \.db $00    ;$41C5 _ZeroOP1 
.dw errnosupport    \.db $00    ;$41C8 _ZeroOP2 
.dw errnosupport    \.db $00    ;$41CB _ZeroOP3 
.dw errnosupport    \.db $00    ;$41CE _ZeroOP 
.dw errnosupport    \.db $00    ;$41D1 _ClrLp 
.dw errnosupport    \.db $00    ;$41D4 _ShRAcc 
.dw errnosupport    \.db $00    ;$41D7 _ShLAcc 
.dw errnosupport    \.db $00    ;$41DA _ShR18 
.dw errnosupport    \.db $00    ;$41DD _SHR18A 
.dw errnosupport    \.db $00    ;$41E0 _SHR16 
.dw errnosupport    \.db $00    ;$41E3 _SHR14 
.dw errnosupport    \.db $00    ;$41E6 _SHL16 
.dw errnosupport    \.db $00    ;$41E9 _SHL14 
.dw errnosupport    \.db $00    ;$41EC _SRDO1 
.dw errnosupport    \.db $00    ;$41EF _SHRDRND 
.dw errnosupport    \.db $00    ;$41F2 _MANTPA 
.dw errnosupport    \.db $00    ;$41F5 _ADDPROP 
.dw errnosupport    \.db $00    ;$41F8 _ADDPROPLP 
.dw errnosupport    \.db $00    ;$41FB _ADD16D 
.dw errnosupport    \.db $00    ;$41FE _ADD14D 
.dw errnosupport    \.db $00    ;$4201 _SUB16D 
.dw errnosupport    \.db $00    ;$4204 _SUB14D 
.dw errnosupport    \.db $00    ;$4207 _OP2ExOP6 
.dw errnosupport    \.db $00    ;$420A _OP5ExOP6 
.dw errnosupport    \.db $00    ;$420D _OP1ExOP5 
.dw errnosupport    \.db $00    ;$4210 _OP1ExOP6 
.dw errnosupport    \.db $00    ;$4213 _OP2ExOP4 
.dw errnosupport    \.db $00    ;$4216 _OP2ExOP5 
.dw errnosupport    \.db $00    ;$4219 _OP1ExOP3 
.dw errnosupport    \.db $00    ;$421C _OP1ExOP4 
.dw errnosupport    \.db $00    ;$421F _OP1ExOP2 
.dw errnosupport    \.db $00    ;$4222 _ExLp 
.dw errnosupport    \.db $00    ;$4225 _CkOP1C0 
.dw errnosupport    \.db $00    ;$4228 _CkOP1FP0 
.dw errnosupport    \.db $00    ;$422B _CkOP2FP0 
.dw errnosupport    \.db $00    ;$422E _PosNo0Int 
.dw errnosupport    \.db $00    ;$4231 _CKPosInt 
.dw errnosupport    \.db $00    ;$4234 _CKInt 
.dw errnosupport    \.db $00    ;$4237 _CKOdd 
.dw errnosupport    \.db $00    ;$423A _CKOP1M 
.dw errnosupport    \.db $00    ;$423D _GETCONOP1 
.dw errnosupport    \.db $00    ;$4240 _GETCONOP2 
.dw errnosupport    \.db $00    ;$4243 _PIDIV2 
.dw errnosupport    \.db $00    ;$4246 _PIDIV4 
.dw errnosupport    \.db $00    ;$4249 _PItimes2 
.dw errnosupport    \.db $00    ;$424C _PI 
.dw errnosupport    \.db $00    ;$424F _ExpToHex 
.dw errnosupport    \.db $00    ;$4252 _OP1ExpToDec 
.dw errnosupport    \.db $00    ;$4255 _ckop2pos 
.dw errnosupport    \.db $00    ;$4258 _CkOP1Pos 
.dw errnosupport    \.db $00    ;$425B _ClrOP2S 
.dw errnosupport    \.db $00    ;$425E _ClrOP1S 
.dw errnosupport    \.db $00    ;$4261 _FDIV100 
.dw errnosupport    \.db $00    ;$4264 _FDIV10 
.dw errnosupport    \.db $00    ;$4267 _DecO1Exp 
.dw errnosupport    \.db $00    ;$426A _INCO1EXP 
.dw errnosupport    \.db $00    ;$426D _INCEXP 
.dw errnosupport    \.db $00    ;$4270 _CkValidNum 
.dw errnosupport    \.db $00    ;$4273 _GETEXP 
.dw errnosupport    \.db $00    ;$4276 _HTimesL 
.dw errnosupport    \.db $00    ;$4279 _EOP1NotReal 
.dw errnosupport    \.db $00    ;$427C _ThetaName 
.dw errnosupport    \.db $00    ;$427F _RName 
.dw errnosupport    \.db $00    ;$4282 _REGEQNAME 
.dw errnosupport    \.db $00    ;$4285 _RECURNNAME 
.dw errnosupport    \.db $00    ;$4288 _XName 
.dw errnosupport    \.db $00    ;$428B _YName 
.dw errnosupport    \.db $00    ;$428E _TName 
.dw errnosupport    \.db $00    ;$4291 _REALNAME 
.dw errnosupport    \.db $00    ;$4294 _SETesTOfps 
.dw errnosupport    \.db $00    ;$4297 _markTableDirty 
.dw errnosupport    \.db $00    ;$429A _OP1MOP2EXP 
.dw errnosupport    \.db $00    ;$429D _OP1EXPMinusE 
.dw errnosupport    \.db $00    ;$42A0 _CHKERRBREAK 
.dw errnosupport    \.db $00    ;$42A3 _isA2ByteTok 
.dw errnosupport    \.db $00    ;$42A6 _GETLASTENTRY 
.dw errnosupport    \.db $00    ;$42A9 _GETLASTENTRYPTR 
.dw errnosupport    \.db $00    ;$42AC _REGCLRCHNG 
.dw errnosupport    \.db $00    ;$42AF _RESETWINTOP 
.dw errnosupport    \.db $00    ;$42B2 _SetYUp 
.dw errnosupport    \.db $00    ;$42B5 _SetXUp 
.dw errnosupport    \.db $00    ;$42B8 _ISO1NONTLSTorPROG 
.dw errnosupport    \.db $00    ;$42BB _ISO1NONTEMPLST 
.dw errnosupport    \.db $00    ;$42BE _IS_A_LSTorCLST 
.dw errnosupport    \.db $00    ;$42C1 _CHK_HL_999 
.dw errnosupport    \.db $00    ;$42C4 _equ_or_newequ 
.dw errnosupport    \.db $00    ;$42C7 _errd_op1notpos 
.dw errnosupport    \.db $00    ;$42CA _ErrD_OP1Not_R 
.dw errnosupport    \.db $00    ;$42CD _ErrD_OP1NotPosInt 
.dw errnosupport    \.db $00    ;$42D0 _ErrD_OP1_LE_0 
.dw errnosupport    \.db $00    ;$42D3 _ErrD_OP1_0 
.dw errnosupport    \.db $00    ;$42D6 _FINDSYM_GET_SIZE 
.dw errnosupport    \.db $00    ;$42D9 _STO_STATVAR 
.dw errnosupport    \.db $00    ;$42DC _Rcl_StatVar 
.dw errnosupport    \.db $00    ;$42DF _CkOP2Real 
.dw errnosupport    \.db $00    ;$42E2 _GET_X_INDIRECT 
.dw errnosupport    \.db $00    ;$42E5 _MemChk 
.dw errnosupport    \.db $00    ;$42E8 _CMPPRGNAMLEN1 
.dw errnosupport    \.db $00    ;$42EB _CMPPRGNAMLEN 
.dw errnosupport    \.db $00    ;$42EE _FINDPROGSYM 
.dw errnosupport    \.db $00    ;$42F1 _ChkFindSym 
.dw errnosupport    \.db $00    ;$42F4 _FindSym 
.dw errnosupport    \.db $00    ;$42F7 _InsertMem 
.dw errnosupport    \.db $00    ;$42FA _INSERTMEMA 
.dw errnosupport    \.db $00    ;$42FD _EnoughMem 
.dw errnosupport    \.db $00    ;$4300 _CMPMEMNEED 
.dw errnosupport    \.db $00    ;$4303 _CREATEPVAR4 
.dw errnosupport    \.db $00    ;$4306 _CREATEPVAR3 
.dw errnosupport    \.db $00    ;$4309 _CREATEVAR3 
.dw errnosupport    \.db $00    ;$430C _CreateCplx 
.dw errnosupport    \.db $00    ;$430F _CreateReal 
.dw errnosupport    \.db $00    ;$4312 _CreateTempRList 
.dw errnosupport    \.db $00    ;$4315 _CreateRList 
.dw errnosupport    \.db $00    ;$4318 _CREATETCLIST 
.dw errnosupport    \.db $00    ;$431B _CreateCList 
.dw errnosupport    \.db $00    ;$431E _CreateTempRMat 
.dw errnosupport    \.db $00    ;$4321 _CreateRMat 
.dw errnosupport    \.db $00    ;$4324 _CreateTempString 
.dw errnosupport    \.db $00    ;$4327 _CreateStrng 
.dw errnosupport    \.db $00    ;$432A _Create0Equ 
.dw errnosupport    \.db $00    ;$432D _CreateTempEqu 
.dw errnosupport    \.db $00    ;$4330 _CreateEqu 
.dw errnosupport    \.db $00    ;$4333 _CreatePict 
.dw errnosupport    \.db $00    ;$4336 _CreateGDB 
.dw errnosupport    \.db $00    ;$4339 _CreateProg 
.dw errnosupport    \.db $00    ;$433C _CHKDEL 
.dw errnosupport    \.db $00    ;$433F _CHKDELA 
.dw errnosupport    \.db $00    ;$4342 _ADJPARSER 
.dw errnosupport    \.db $00    ;$4345 _ADJMATH 
.dw errnosupport    \.db $00    ;$4348 _ADJM7 
.dw errnosupport    \.db $00    ;$434B _DELMEMA 
.dw errnosupport    \.db $00    ;$434E _GET_FORM_NUM 
.dw errnosupport    \.db $00    ;$4351 _DelVar 
.dw errnosupport    \.db $00    ;$4354 _DELVARIO 
.dw errnosupport    \.db $00    ;$4357 _DelMem 
.dw errnosupport    \.db $00    ;$435A _DELVAR3D 
.dw errnosupport    \.db $00    ;$435D _DELVAR3C 
.dw errnosupport    \.db $00    ;$4360 _DELVAR3DC 
.dw errnosupport    \.db $00    ;$4363 _IsFixedName 
.dw errnosupport    \.db $00    ;$4366 _DelVarEntry 
.dw errnosupport    \.db $00    ;$4369 _DataSizeA 
.dw errnosupport    \.db $00    ;$436C _DataSize 
.dw errnosupport    \.db $00    ;$436F _POPMCPLXO1 
.dw errnosupport    \.db $00    ;$4372 _POPMCPLX 
.dw errnosupport    \.db $00    ;$4375 _MOVCPLX 
.dw errnosupport    \.db $00    ;$4378 _popOP5 
.dw errnosupport    \.db $00    ;$437B _popOP3 
.dw errnosupport    \.db $00    ;$437E _popOP1 
.dw errnosupport    \.db $00    ;$4381 _PopRealO6 
.dw errnosupport    \.db $00    ;$4384 _PopRealO5 
.dw errnosupport    \.db $00    ;$4387 _PopRealO4 
.dw errnosupport    \.db $00    ;$438A _PopRealO3 
.dw errnosupport    \.db $00    ;$438D _PopRealO2 
.dw errnosupport    \.db $00    ;$4390 _PopRealO1 
.dw errnosupport    \.db $00    ;$4393 _PopReal 
.dw errnosupport    \.db $00    ;$4396 _FPOPCPLX 
.dw errnosupport    \.db $00    ;$4399 _FPOPREAL 
.dw errnosupport    \.db $00    ;$439C _FPOPFPS 
.dw errnosupport    \.db $00    ;$439F _DeallocFPS 
.dw errnosupport    \.db $00    ;$43A2 _DeallocFPS1 
.dw errnosupport    \.db $00    ;$43A5 _AllocFPS 
.dw errnosupport    \.db $00    ;$43A8 _AllocFPS1 
.dw errnosupport    \.db $00    ;$43AB _PushRealO6 
.dw errnosupport    \.db $00    ;$43AE _PushRealO5 
.dw errnosupport    \.db $00    ;$43B1 _PushRealO4 
.dw errnosupport    \.db $00    ;$43B4 _PushRealO3 
.dw errnosupport    \.db $00    ;$43B7 _PushRealO2 
.dw errnosupport    \.db $00    ;$43BA _PushRealO1 
.dw errnosupport    \.db $00    ;$43BD _PushReal 
.dw errnosupport    \.db $00    ;$43C0 _PushOP5 
.dw errnosupport    \.db $00    ;$43C3 _PushOP3 
.dw errnosupport    \.db $00    ;$43C6 _PUSHMCPLXO3 
.dw errnosupport    \.db $00    ;$43C9 _PushOP1 
.dw errnosupport    \.db $00    ;$43CC _PUSHMCPLXO1 
.dw errnosupport    \.db $00    ;$43CF _PUSHMCPLX 
.dw errnosupport    \.db $00    ;$43D2 _ExMCplxO1 
.dw errnosupport    \.db $00    ;$43D5 _Exch9 
.dw errnosupport    \.db $00    ;$43D8 _CpyTo1FPS11 
.dw errnosupport    \.db $00    ;$43DB _CpyTo2FPS5 
.dw errnosupport    \.db $00    ;$43DE _CpyTo1FPS5 
.dw errnosupport    \.db $00    ;$43E1 _CpyTo2FPS6 
.dw errnosupport    \.db $00    ;$43E4 _CpyTo1FPS6 
.dw errnosupport    \.db $00    ;$43E7 _CpyTo2FPS7 
.dw errnosupport    \.db $00    ;$43EA _CpyTo1FPS7 
.dw errnosupport    \.db $00    ;$43ED _CpyTo1FPS8 
.dw errnosupport    \.db $00    ;$43F0 _CpyTo2FPS8 
.dw errnosupport    \.db $00    ;$43F3 _CpyTo1FPS10 
.dw errnosupport    \.db $00    ;$43F6 _CpyTo1FPS9 
.dw errnosupport    \.db $00    ;$43F9 _CpyTo2FPS4 
.dw errnosupport    \.db $00    ;$43FC _CpyTo6FPS3 
.dw errnosupport    \.db $00    ;$43FF _CpyTo6FPS2 
.dw errnosupport    \.db $00    ;$4402 _CpyTo2FPS3 
.dw errnosupport    \.db $00    ;$4405 _CPYCTO1FPS3 
.dw errnosupport    \.db $00    ;$4408 _CpyTo1FPS3 
.dw errnosupport    \.db $00    ;$440B _CPYFPS3 
.dw errnosupport    \.db $00    ;$440E _CpyTo1FPS4 
.dw errnosupport    \.db $00    ;$4411 _CpyTo3FPS2 
.dw errnosupport    \.db $00    ;$4414 _CpyTo5FPST 
.dw errnosupport    \.db $00    ;$4417 _CpyTo6FPST 
.dw errnosupport    \.db $00    ;$441A _CpyTo4FPST 
.dw errnosupport    \.db $00    ;$441D _CpyTo3FPST 
.dw errnosupport    \.db $00    ;$4420 _CpyTo2FPST 
.dw errnosupport    \.db $00    ;$4423 _CpyTo1FPST 
.dw errnosupport    \.db $00    ;$4426 _CPYFPST 
.dw errnosupport    \.db $00    ;$4429 _CpyStack 
.dw errnosupport    \.db $00    ;$442C _CpyTo3FPS1 
.dw errnosupport    \.db $00    ;$442F _CpyTo2FPS1 
.dw errnosupport    \.db $00    ;$4432 _CpyTo1FPS1 
.dw errnosupport    \.db $00    ;$4435 _CPYFPS1 
.dw errnosupport    \.db $00    ;$4438 _CpyTo2FPS2 
.dw errnosupport    \.db $00    ;$443B _CpyTo1FPS2 
.dw errnosupport    \.db $00    ;$443E _CPYFPS2 
.dw errnosupport    \.db $00    ;$4441 _CpyO3ToFPST 
.dw errnosupport    \.db $00    ;$4444 _CpyO2ToFPST 
.dw errnosupport    \.db $00    ;$4447 _CpyO6ToFPST 
.dw errnosupport    \.db $00    ;$444A _CpyO1ToFPST 
.dw errnosupport    \.db $00    ;$444D _CpyToFPST 
.dw errnosupport    \.db $00    ;$4450 _CpyToStack 
.dw errnosupport    \.db $00    ;$4453 _CpyO3ToFPS1 
.dw errnosupport    \.db $00    ;$4456 _CpyO5ToFPS1 
.dw errnosupport    \.db $00    ;$4459 _CpyO2ToFPS1 
.dw errnosupport    \.db $00    ;$445C _CpyO1ToFPS1 
.dw errnosupport    \.db $00    ;$445F _CpyToFPS1 
.dw errnosupport    \.db $00    ;$4462 _CpyO2ToFPS2 
.dw errnosupport    \.db $00    ;$4465 _CpyO3ToFPS2 
.dw errnosupport    \.db $00    ;$4468 _CpyO6ToFPS2 
.dw errnosupport    \.db $00    ;$446B _CpyO1ToFPS2 
.dw errnosupport    \.db $00    ;$446E _CpyToFPS2 
.dw errnosupport    \.db $00    ;$4471 _CpyO5ToFPS3 
.dw errnosupport    \.db $00    ;$4474 _CpyO2ToFPS3 
.dw errnosupport    \.db $00    ;$4477 _CpyO1ToFPS3 
.dw errnosupport    \.db $00    ;$447A _CpyToFPS3 
.dw errnosupport    \.db $00    ;$447D _CpyO1ToFPS6 
.dw errnosupport    \.db $00    ;$4480 _CpyO1ToFPS7 
.dw errnosupport    \.db $00    ;$4483 _CpyO1ToFPS5 
.dw errnosupport    \.db $00    ;$4486 _CpyO2ToFPS4 
.dw errnosupport    \.db $00    ;$4489 _CpyO1ToFPS4 
.dw errnosupport    \.db $00    ;$448C _ErrNotEnoughMem 
.dw errnosupport    \.db $00    ;$448F _FPSMINUS9 
.dw errnosupport    \.db $00    ;$4492 _HLMINUS9 
.dw errnosupport    \.db $00    ;$4495 _ErrOverflow 
.dw errnosupport    \.db $00    ;$4498 _ErrDivBy0 
.dw errnosupport    \.db $00    ;$449B _ErrSingularMat 
.dw errnosupport    \.db $00    ;$449E _ErrDomain 
.dw errnosupport    \.db $00    ;$44A1 _ErrIncrement 
.dw errnosupport    \.db $00    ;$44A4 _ErrNon_Real 
.dw errnosupport    \.db $00    ;$44A7 _ErrSyntax 
.dw errnosupport    \.db $00    ;$44AA _ErrDataType 
.dw errnosupport    \.db $00    ;$44AD _ErrArgument 
.dw errnosupport    \.db $00    ;$44B0 _ErrDimMismatch 
.dw errnosupport    \.db $00    ;$44B3 _ErrDimension 
.dw errnosupport    \.db $00    ;$44B6 _ErrUndefined 
.dw errnosupport    \.db $00    ;$44B9 _ErrMemory 
.dw errnosupport    \.db $00    ;$44BC _ErrInvalid 
.dw errnosupport    \.db $00    ;$44BF _ErrBreak 
.dw errnosupport    \.db $00    ;$44C2 _ErrStat 
.dw errnosupport    \.db $00    ;$44C5 _ErrSignChange 
.dw errnosupport    \.db $00    ;$44C8 _ErrIterations 
.dw errnosupport    \.db $00    ;$44CB _ErrBadGuess 
.dw errnosupport    \.db $00    ;$44CE _ErrTolTooSmall 
.dw errnosupport    \.db $00    ;$44D1 _ErrStatPlot 
.dw errnosupport    \.db $00    ;$44D4 _ErrLinkXmit 
.dw errnosupport    \.db $00    ;$44D7 _JError 
.dw errnosupport    \.db $00    ;$44DA _noErrorEntry 
.dw errnosupport    \.db $00    ;$44DD _pushErrorHandleR 
.dw errnosupport    \.db $00    ;$44E0 _popErrorHandleR 
.dw errnosupport    \.db $00    ;$44E3 _strcopy 
.dw errnosupport    \.db $00    ;$44E6 _strCat 
.dw errnosupport    \.db $00    ;$44E9 _isInSet 
.dw errnosupport    \.db $00    ;$44EC _sDone 
.dw errnosupport    \.db $00    ;$44EF _serrort 
.dw errnosupport    \.db $00    ;$44F2 _sNameEq 
.dw errnosupport    \.db $00    ;$44F5 _sUnderScr 
.dw errnosupport    \.db $00    ;$44F8 _sFAIL 
.dw errnosupport    \.db $00    ;$44FB _sName 
.dw errnosupport    \.db $00    ;$44FE _sOK 
.dw errnosupport    \.db $00    ;$4501 _PutMap 
.dw errnosupport    \.db $00    ;$4504 _PutC 
.dw errnosupport    \.db $00    ;$4507 _DispHL 
.dw errnosupport    \.db $00    ;$450A _PutS 
.dw errnosupport    \.db $00    ;$450D _putpsb 
.dw errnosupport    \.db $00    ;$4510 _PutPS 
.dw errnosupport    \.db $00    ;$4513 _wputps 
.dw errnosupport    \.db $00    ;$4516 _putbuf 
.dw errnosupport    \.db $00    ;$4519 _putbuf1 
.dw errnosupport    \.db $00    ;$451C _wputc 
.dw errnosupport    \.db $00    ;$451F _wputs 
.dw errnosupport    \.db $00    ;$4522 _wputsEOL 
.dw errnosupport    \.db $00    ;$4525 _wdispEOL 
.dw errnosupport    \.db $00    ;$4528 _whomeup 
.dw errnosupport    \.db $00    ;$452B _setNumWindow 
.dw errnosupport    \.db $00    ;$452E _newline 
.dw errnosupport    \.db $00    ;$4531 _moveDown 
.dw errnosupport    \.db $00    ;$4534 _scrollUp 
.dw errnosupport    \.db $00    ;$4537 _shrinkWindow 
.dw errnosupport    \.db $00    ;$453A _moveUp 
.dw errnosupport    \.db $00    ;$453D _scrollDown 
.dw errnosupport    \.db $00    ;$4540 _ClrLCDFull 
.dw errnosupport    \.db $00    ;$4543 _ClrLCD 
.dw errnosupport    \.db $00    ;$4546 _ClrScrnFull 
.dw errnosupport    \.db $00    ;$4549 _ClrScrn 
.dw errnosupport    \.db $00    ;$454C _ClrTxtShd 
.dw errnosupport    \.db $00    ;$454F _ClrWindow 
.dw errnosupport    \.db $00    ;$4552 _EraseEOL 
.dw errnosupport    \.db $00    ;$4555 _EraseEOW 
.dw errnosupport    \.db $00    ;$4558 _HomeUp 
.dw errnosupport    \.db $00    ;$455B _getcurloc 
.dw errnosupport    \.db $00    ;$455E _VPutMap 
.dw errnosupport    \.db $00    ;$4561 _VPutS 
.dw errnosupport    \.db $00    ;$4564 _VPutSN 
.dw errnosupport    \.db $00    ;$4567 _vputsnG 
.dw errnosupport    \.db $00    ;$456A _vputsnT 
.dw errnosupport    \.db $00    ;$456D _RunIndicOn 
.dw errnosupport    \.db $00    ;$4570 _RunIndicOff 
.dw errnosupport    \.db $00    ;$4573 _saveCmdShadow 
.dw errnosupport    \.db $00    ;$4576 _saveShadow 
.dw errnosupport    \.db $00    ;$4579 _rstrShadow 
.dw errnosupport    \.db $00    ;$457C _rstrpartial 
.dw errnosupport    \.db $00    ;$457F _rstrCurRow 
.dw errnosupport    \.db $00    ;$4582 _rstrUnderMenu 
.dw errnosupport    \.db $00    ;$4585 _rstrbotrow 
.dw errnosupport    \.db $00    ;$4588 _saveTR 
.dw errnosupport    \.db $00    ;$458B _restoreTR 
.dw errnosupport    \.db $00    ;$458E _GetKeyPress 
.dw errnosupport    \.db $00    ;$4591 _GetTokLen 
.dw errnosupport    \.db $00    ;$4594 _GET_TOK_STRNG 
.dw errnosupport    \.db $00    ;$4597 _GETTOKSTRING 
.dw errnosupport    \.db $00    ;$459A _PUTBPATBUF2 
.dw errnosupport    \.db $00    ;$459D _PUTBPATBUF 
.dw errnosupport    \.db $00    ;$45A0 _putbPAT 
.dw errnosupport    \.db $00    ;$45A3 _putcCheckScrolL 
.dw errnosupport    \.db $00    ;$45A6 _DispEOL 
.dw errnosupport    \.db $00    ;$45A9 _fdispEOL 
.dw errnosupport    \.db $00    ;$45AC _MAKEROWCMD 
.dw errnosupport    \.db $00    ;$45AF _TOTOSTRP 
.dw errnosupport    \.db $00    ;$45B2 _SETVARNAME 
.dw errnosupport    \.db $00    ;$45B5 _DispDone 
.dw errnosupport    \.db $00    ;$45B8 _finishoutput 
.dw errnosupport    \.db $00    ;$45BB _curBlink 
.dw errnosupport    \.db $00    ;$45BE _CursorOff 
.dw errnosupport    \.db $00    ;$45C1 _hideCursor 
.dw errnosupport    \.db $00    ;$45C4 _CursorOn 
.dw errnosupport    \.db $00    ;$45C7 _showCursor 
.dw errnosupport    \.db $00    ;$45CA _KeyToString 
.dw errnosupport    \.db $00    ;$45CD _PULLDOWNCHK 
.dw errnosupport    \.db $00    ;$45D0 _MenuCatCommon 
.dw errnosupport    \.db $00    ;$45D3 _ZIfCatalog 
.dw errnosupport    \.db $00    ;$45D6 _ZIfMatrixMenu 
.dw errnosupport    \.db $00    ;$45D9 _LoadMenuNum 
.dw errnosupport    \.db $00    ;$45DC _LoadMenuNumL 
.dw errnosupport    \.db $00    ;$45DF _MenCatRet 
.dw errnosupport    \.db $00    ;$45E2 _MenuSwitchContext 
.dw errnosupport    \.db $00    ;$45E5 _MenuEdKey 
.dw errnosupport    \.db $00    ;$45E8 _BackUpGraphSettings 
.dw errnosupport    \.db $00    ;$45EB _notalphnum 
.dw errnosupport    \.db $00    ;$45EE _SaveSavedFlags 
.dw errnosupport    \.db $00    ;$45F1 _SetMenuFlags 
.dw errnosupport    \.db $00    ;$45F4 _RstrSomeFlags 
.dw errnosupport    \.db $00    ;$45F7 _RstrOScreen 
.dw errnosupport    \.db $00    ;$45FA _SaveOScreen 
.dw errnosupport    \.db $00    ;$45FD _dispListName 
.dw errnosupport    \.db $00    ;$4600 _PrevContext 
.dw errnosupport    \.db $00    ;$4603 _CompareContext 
.dw errnosupport    \.db $00    ;$4606 _AdrMRow 
.dw errnosupport    \.db $00    ;$4609 _AdrMEle 
.dw errnosupport    \.db $00    ;$460C _GETMATOP1A 
.dw errnosupport    \.db $00    ;$460F _GETM1TOOP1 
.dw errnosupport    \.db $00    ;$4612 _GETM1TOP1A 
.dw errnosupport    \.db $00    ;$4615 _GetMToOP1 
.dw errnosupport    \.db $00    ;$4618 _PUTTOM1A 
.dw errnosupport    \.db $00    ;$461B _PUTTOMA1 
.dw errnosupport    \.db $00    ;$461E _PutToMat 
.dw errnosupport    \.db $00    ;$4621 _MAT_EL_DIV 
.dw errnosupport    \.db $00    ;$4624 _CMATFUN 
.dw errnosupport    \.db $00    ;$4627 _ROWECH_POLY 
.dw errnosupport    \.db $00    ;$462A _ROWECHELON 
.dw errnosupport    \.db $00    ;$462D _AdrLEle 
.dw errnosupport    \.db $00    ;$4630 _GETL1TOOP1 
.dw errnosupport    \.db $00    ;$4633 _GETL1TOP1A 
.dw errnosupport    \.db $00    ;$4636 _GetLToOP1 
.dw errnosupport    \.db $00    ;$4639 _GETL1TOOP2 
.dw errnosupport    \.db $00    ;$463C _GETL1TOP2A 
.dw errnosupport    \.db $00    ;$463F _GETL2TOP1A 
.dw errnosupport    \.db $00    ;$4642 _PUTTOLA1 
.dw errnosupport    \.db $00    ;$4645 _PutToL 
.dw errnosupport    \.db $00    ;$4648 _MAXMINLST 
.dw errnosupport    \.db $00    ;$464B _LLOW 
.dw errnosupport    \.db $00    ;$464E _LHIGH 
.dw errnosupport    \.db $00    ;$4651 _LSUM 
.dw errnosupport    \.db $00    ;$4654 CUMSUM 
.dw errnosupport    \.db $00    ;$4657 _ToFrac 
.dw errnosupport    \.db $00    ;$465A _SEQSET 
.dw errnosupport    \.db $00    ;$465D _SEQSOLVE 
.dw errnosupport    \.db $00    ;$4660 _CMP_NUM_INIT 
.dw errnosupport    \.db $00    ;$4663 _BinOPExec 
.dw errnosupport    \.db $00    ;$4666 _EXMEAN1 
.dw errnosupport    \.db $00    ;$4669 _SET2MVLPTRS 
.dw errnosupport    \.db $00    ;$466C _SETMAT1 
.dw errnosupport    \.db $00    ;$466F _CREATETLIST 
.dw errnosupport    \.db $00    ;$4672 _UnOPExec 
.dw errnosupport    \.db $00    ;$4675 _ThreeExec 
.dw errnosupport    \.db $00    ;$4678 _RESTOREERRNO 
.dw errnosupport    \.db $00    ;$467B _FourExec 
.dw errnosupport    \.db $00    ;$467E _FiveExec 
.dw errnosupport    \.db $00    ;$4681 _CPYTO2ES1 
.dw errnosupport    \.db $00    ;$4684 _CPYTO6ES1 
.dw errnosupport    \.db $00    ;$4687 _CPYTO1ES1 
.dw errnosupport    \.db $00    ;$468A _CPYTO3ES1 
.dw errnosupport    \.db $00    ;$468D _CPYTO3ES2 
.dw errnosupport    \.db $00    ;$4690 _CPYTO2ES2 
.dw errnosupport    \.db $00    ;$4693 _CPYTO1ES2 
.dw errnosupport    \.db $00    ;$4696 _CPYTO2ES3 
.dw errnosupport    \.db $00    ;$4699 _CPYTO1ES3 
.dw errnosupport    \.db $00    ;$469C _CPYTO3ES4 
.dw errnosupport    \.db $00    ;$469F _CPYTO6ES3 
.dw errnosupport    \.db $00    ;$46A2 _CPYTO2ES4 
.dw errnosupport    \.db $00    ;$46A5 _CPYTO1ES4 
.dw errnosupport    \.db $00    ;$46A8 _CPYTO2ES5 
.dw errnosupport    \.db $00    ;$46AB _CPYTO1ES5 
.dw errnosupport    \.db $00    ;$46AE _CPYTO4EST 
.dw errnosupport    \.db $00    ;$46B1 _CPYTO2EST 
.dw errnosupport    \.db $00    ;$46B4 _CPYTO1EST 
.dw errnosupport    \.db $00    ;$46B7 _CPYTO2ES6 
.dw errnosupport    \.db $00    ;$46BA _CPYTO1ES6 
.dw errnosupport    \.db $00    ;$46BD _CPYTO2ES7 
.dw errnosupport    \.db $00    ;$46C0 _CPYTO1ES7 
.dw errnosupport    \.db $00    ;$46C3 _CPYTO2ES8 
.dw errnosupport    \.db $00    ;$46C6 _CPYTO1ES8 
.dw errnosupport    \.db $00    ;$46C9 _CPYTO1ES9 
.dw errnosupport    \.db $00    ;$46CC _CPYTO2ES9 
.dw errnosupport    \.db $00    ;$46CF _CPYTO2ES10 
.dw errnosupport    \.db $00    ;$46D2 _CPYTO1ES10 
.dw errnosupport    \.db $00    ;$46D5 _CPYTO2ES11 
.dw errnosupport    \.db $00    ;$46D8 _CPYTO1ES11 
.dw errnosupport    \.db $00    ;$46DB _CPYTO2ES12 
.dw errnosupport    \.db $00    ;$46DE _CPYTO1ES12 
.dw errnosupport    \.db $00    ;$46E1 _CPYTO2ES13 
.dw errnosupport    \.db $00    ;$46E4 _CPYTO1ES13 
.dw errnosupport    \.db $00    ;$46E7 _CPYTO1ES14 
.dw errnosupport    \.db $00    ;$46EA _CPYTO1ES16 
.dw errnosupport    \.db $00    ;$46ED _CPYTO1ES17 
.dw errnosupport    \.db $00    ;$46F0 _CPYTO1ES18 
.dw errnosupport    \.db $00    ;$46F3 _CPYTO1ES15 
.dw errnosupport    \.db $00    ;$46F6 _CPYTO2ES15 
.dw errnosupport    \.db $00    ;$46F9 _CPYO1TOEST 
.dw errnosupport    \.db $00    ;$46FC _CPYO1TOES1 
.dw errnosupport    \.db $00    ;$46FF _CPYO6TOES1 
.dw errnosupport    \.db $00    ;$4702 _CPYO6TOES3 
.dw errnosupport    \.db $00    ;$4705 _CPYO1TOES2 
.dw errnosupport    \.db $00    ;$4708 _CPYO2TOES2 
.dw errnosupport    \.db $00    ;$470B _CPYO1TOES3 
.dw errnosupport    \.db $00    ;$470E _CPYO1TOES4 
.dw errnosupport    \.db $00    ;$4711 _CPYO1TOES5 
.dw errnosupport    \.db $00    ;$4714 _CPYO1TOES6 
.dw errnosupport    \.db $00    ;$4717 _CPYO1TOES7 
.dw errnosupport    \.db $00    ;$471A _CPYO2TOES4 
.dw errnosupport    \.db $00    ;$471D _CPYO2TOES5 
.dw errnosupport    \.db $00    ;$4720 _CPYO2TOES6 
.dw errnosupport    \.db $00    ;$4723 _CPYO2TOES7 
.dw errnosupport    \.db $00    ;$4726 _CPYO2TOES8 
.dw errnosupport    \.db $00    ;$4729 _CPYO2TOES9 
.dw errnosupport    \.db $00    ;$472C _CPYO1TOES8 
.dw errnosupport    \.db $00    ;$472F _CPYO1TOES9 
.dw errnosupport    \.db $00    ;$4732 _CPYO1TOES10 
.dw errnosupport    \.db $00    ;$4735 _CPYO1TOES11 
.dw errnosupport    \.db $00    ;$4738 _CPYO1TOES12 
.dw errnosupport    \.db $00    ;$473B _CPYO1TOES13 
.dw errnosupport    \.db $00    ;$473E _CPYO1TOES14 
.dw errnosupport    \.db $00    ;$4741 _CPYO1TOES15 
.dw errnosupport    \.db $00    ;$4744 _EVALF3A 
.dw errnosupport    \.db $00    ;$4747 _GetK 
.dw errnosupport    \.db $00    ;$474A _setTitle 
.dw errnosupport    \.db $00    ;$474D _dispVarVal 
.dw errnosupport    \.db $00    ;$4750 _RecallEd 
.dw errnosupport    \.db $00    ;$4753 _createNumEditBuf 
.dw errnosupport    \.db $00    ;$4756 _ProcessBufKeys 
.dw errnosupport    \.db $00    ;$4759 _CallCommon 
.dw errnosupport    \.db $00    ;$475C _CommonKeys 
.dw errnosupport    \.db $00    ;$475F _Leftmore 
.dw errnosupport    \.db $00    ;$4762 _fDel 
.dw errnosupport    \.db $00    ;$4765 _fClear 
.dw errnosupport    \.db $00    ;$4768 _finsDisp 
.dw errnosupport    \.db $00    ;$476B _FinsDisp02 
.dw errnosupport    \.db $00    ;$476E _closeeditbufnor 
.dw errnosupport    \.db $00    ;$4771 _releaseBuffer 
.dw errnosupport    \.db $00    ;$4774 _varnameToOP1hl 
.dw errnosupport    \.db $00    ;$4777 _nameToOP1 
.dw errnosupport    \.db $00    ;$477A _numPPutAway 
.dw errnosupport    \.db $00    ;$477D _numRedisp 
.dw errnosupport    \.db $00    ;$4780 _numError02 
.dw errnosupport    \.db $00    ;$4783 _Load_SFont 
.dw errnosupport    \.db $00    ;$4786 _SFont_Len 
.dw errnosupport    \.db $00    ;$4789 _InitNumVec 
.dw errnosupport    \.db $00    ;$478C _SetXXOP1 
.dw errnosupport    \.db $00    ;$478F _SetXXOP2 
.dw errnosupport    \.db $00    ;$4792 _SetXXXXOP2 
.dw errnosupport    \.db $00    ;$4795 _UCLineS 
.dw errnosupport    \.db $00    ;$4798 _CLine 
.dw errnosupport    \.db $00    ;$479B _CLineS 
.dw errnosupport    \.db $00    ;$479E _XRootY 
.dw errnosupport    \.db $00    ;$47A1 _YToX 
.dw errnosupport    \.db $00    ;$47A4 _ZmStats 
.dw errnosupport    \.db $00    ;$47A7 _POINT_STAT_HLP 
.dw errnosupport    \.db $00    ;$47AA _DRAWSPLOT 
.dw errnosupport    \.db $00    ;$47AD _INITNEWTRACEP 
.dw errnosupport    \.db $00    ;$47B0 _SPLOTCOORD 
.dw errnosupport    \.db $00    ;$47B3 _SPLOTRIGHT 
.dw errnosupport    \.db $00    ;$47B6 _SPLOTLEFT 
.dw errnosupport    \.db $00    ;$47B9 _CMPBOXINFO 
.dw errnosupport    \.db $00    ;$47BC _NEXTPLOT 
.dw errnosupport    \.db $00    ;$47BF _PREVPLOT 
.dw errnosupport    \.db $00    ;$47C2 _CLRPREVPLOT 
.dw errnosupport    \.db $00    ;$47C5 _PUT_INDEX_LST 
.dw errnosupport    \.db $00    ;$47C8 _GET_INDEX_LST 
.dw errnosupport    \.db $00    ;$47CB _HEAP_SORT 
.dw errnosupport    \.db $00    ;$47CE _StoGDB2 
.dw errnosupport    \.db $00    ;$47D1 _RclGDB2 
.dw errnosupport    \.db $00    ;$47D4 _CircCmd 
.dw errnosupport    \.db $00    ;$47D7 _GrphCirc 
.dw errnosupport    \.db $00    ;$47DA _Mov18B 
.dw errnosupport    \.db $00    ;$47DD _DarkLine 
.dw errnosupport    \.db $00    ;$47E0 _ILine 
.dw errnosupport    \.db $00    ;$47E3 _IPoint 
.dw errnosupport    \.db $00    ;$47E6 _XYRNDBOTH 
.dw errnosupport    \.db $00    ;$47E9 _XYRND 
.dw errnosupport    \.db $00    ;$47EC _CheckTOP 
.dw errnosupport    \.db $00    ;$47EF _CheckXY 
.dw errnosupport    \.db $00    ;$47F2 _DarkPnt 
.dw errnosupport    \.db $00    ;$47F5 _CPointS 
.dw errnosupport    \.db $00    ;$47F8 _WTOV 
.dw errnosupport    \.db $00    ;$47FB _VtoWHLDE 
.dw errnosupport    \.db $00    ;$47FE _Xitof 
.dw errnosupport    \.db $00    ;$4801 _YftoI 
.dw errnosupport    \.db $00    ;$4804 _XftoI 
.dw errnosupport    \.db $00    ;$4807 _TraceOff 
.dw errnosupport    \.db $00    ;$480A _GrRedisp 
.dw errnosupport    \.db $00    ;$480D _GDISPTOKEN 
.dw errnosupport    \.db $00    ;$4810 _GRDECODA 
.dw errnosupport    \.db $00    ;$4813 _LABCOOR 
.dw errnosupport    \.db $00    ;$4816 _COORDISP 
.dw errnosupport    \.db $00    ;$4819 _TMPEQUNOSRC 
.dw errnosupport    \.db $00    ;$481C _GRLABELS 
.dw errnosupport    \.db $00    ;$481F _YPIXSET 
.dw errnosupport    \.db $00    ;$4822 _XPIXSET 
.dw errnosupport    \.db $00    ;$4825 _COPYRNG 
.dw errnosupport    \.db $00    ;$4828 _VALCUR 
.dw errnosupport    \.db $00    ;$482B _GRPUTAWAY 
.dw errnosupport    \.db $00    ;$482E _RSTGFLAGS 
.dw errnosupport    \.db $00    ;$4831 _GRReset 
.dw errnosupport    \.db $00    ;$4834 _XYCENT 
.dw errnosupport    \.db $00    ;$4837 _ZOOMXYCMD 
.dw errnosupport    \.db $00    ;$483A _CPTDELY 
.dw errnosupport    \.db $00    ;$483D _CPTDELX 
.dw errnosupport    \.db $00    ;$4840 _SetFuncM 
.dw errnosupport    \.db $00    ;$4843 _SetSeqM 
.dw errnosupport    \.db $00    ;$4846 _SetPolM 
.dw errnosupport    \.db $00    ;$4849 _SetParM 
.dw errnosupport    \.db $00    ;$484C _ZmInt 
.dw errnosupport    \.db $00    ;$484F _ZmDecml 
.dw errnosupport    \.db $00    ;$4852 _ZmPrev 
.dw errnosupport    \.db $00    ;$4855 _ZmUsr 
.dw errnosupport    \.db $00    ;$4858 _SETUZM 
.dw errnosupport    \.db $00    ;$485B _ZmFit 
.dw errnosupport    \.db $00    ;$485E _ZmSquare 
.dw errnosupport    \.db $00    ;$4861 _ZmTrig 
.dw errnosupport    \.db $00    ;$4864 _SetXMinMax 
.dw errnosupport    \.db $00    ;$4867 _ZooDefault 
.dw errnosupport    \.db $00    ;$486A _GrBufCpy 
.dw errnosupport    \.db $00    ;$486D _DRAWSPLITLINE 
.dw errnosupport    \.db $00    ;$4870 _RestoreDisp 
.dw errnosupport    \.db $00    ;$4873 _FNDDB 
.dw errnosupport    \.db $00    ;$4876 _AllEq 
.dw errnosupport    \.db $00    ;$4879 _fndallseleq 
.dw errnosupport    \.db $00    ;$487C _NEXTEQ 
.dw errnosupport    \.db $00    ;$487F _PREVEQ 
.dw errnosupport    \.db $00    ;$4882 _BLINKGCUR 
.dw errnosupport    \.db $00    ;$4885 _NBCURSOR 
.dw errnosupport    \.db $00    ;$4888 _STATMARK 
.dw errnosupport    \.db $00    ;$488B _CHKTEXTCURS 
.dw errnosupport    \.db $00    ;$488E _Regraph 
.dw errnosupport    \.db $00    ;$4891 _DOREFFLAGS02 
.dw errnosupport    \.db $00    ;$4894 INITNSEQ 
.dw errnosupport    \.db $00    ;$4897 _YRES 
.dw errnosupport    \.db $00    ;$489A _Ceiling 
.dw errnosupport    \.db $00    ;$489D _PutXY 
.dw errnosupport    \.db $00    ;$48A0 _PUTEQUNO 
.dw errnosupport    \.db $00    ;$48A3 _PDspGrph 
.dw errnosupport    \.db $00    ;$48A6 _HorizCmd 
.dw errnosupport    \.db $00    ;$48A9 _VertCmd 
.dw errnosupport    \.db $00    ;$48AC _LineCmd 
.dw errnosupport    \.db $00    ;$48AF _UnLineCmd 
.dw errnosupport    \.db $00    ;$48B2 _PointCmd 
.dw errnosupport    \.db $00    ;$48B5 _PixelTest 
.dw errnosupport    \.db $00    ;$48B8 _PixelCmd 
.dw errnosupport    \.db $00    ;$48BB _TanLnF 
.dw errnosupport    \.db $00    ;$48BE _DRAWCMD_INIT 
.dw errnosupport    \.db $00    ;$48C1 _DrawCmd 
.dw errnosupport    \.db $00    ;$48C4 _SHADECMD 
.dw errnosupport    \.db $00    ;$48C7 _InvCmd 
.dw errnosupport    \.db $00    ;$48CA _STATSHADE 
.dw errnosupport    \.db $00    ;$48CD _dspmattable 
.dw errnosupport    \.db $00    ;$48D0 _dsplsts 
.dw errnosupport    \.db $00    ;$48D3 _closeEditBuf 
.dw errnosupport    \.db $00    ;$48D6 _parseEditBuf 
.dw errnosupport    \.db $00    ;$48D9 _putsm 
.dw errnosupport    \.db $00    ;$48DC _DspCurTbl 
.dw errnosupport    \.db $00    ;$48DF _DSPGRTBL 
.dw errnosupport    \.db $00    ;$48E2 _zeroTemplate 
.dw errnosupport    \.db $00    ;$48E5 _settblrefs 
.dw errnosupport    \.db $00    ;$48E8 _dispTblBot 
.dw errnosupport    \.db $00    ;$48EB _DispTblTop 
.dw errnosupport    \.db $00    ;$48EE _dispTblbody 
.dw errnosupport    \.db $00    ;$48F1 _VPUTBLANK 
.dw errnosupport    \.db $00    ;$48F4 _TBLTRACE 
.dw errnosupport    \.db $00    ;$48F7 _dispListNameY 
.dw errnosupport    \.db $00    ;$48FA _CurNameLength 
.dw errnosupport    \.db $00    ;$48FD _NameToBuf 
.dw errnosupport    \.db $00    ;$4900 _jpromptcursor 
.dw errnosupport    \.db $00    ;$4903 _BufLeft 
.dw errnosupport    \.db $00    ;$4906 _BufRight 
.dw errnosupport    \.db $00    ;$4909 _bufInsert 
.dw errnosupport    \.db $00    ;$490C _bufQueueChar 
.dw errnosupport    \.db $00    ;$490F _BufReplace 
.dw errnosupport    \.db $00    ;$4912 _BufDelete 
.dw errnosupport    \.db $00    ;$4915 _BUFPEEK 
.dw errnosupport    \.db $00    ;$4918 _BUFPEEK1 
.dw errnosupport    \.db $00    ;$491B _BUFPEEK2 
.dw errnosupport    \.db $00    ;$491E _BUFPEEK3 
.dw errnosupport    \.db $00    ;$4921 _BufToBtm 
.dw errnosupport    \.db $00    ;$4924 _setupEditEqu 
.dw errnosupport    \.db $00    ;$4927 _BufToTop 
.dw errnosupport    \.db $00    ;$492A _isEditFull 
.dw errnosupport    \.db $00    ;$492D _IsEditEmpty 
.dw errnosupport    \.db $00    ;$4930 _IsAtTop 
.dw errnosupport    \.db $00    ;$4933 _IsAtBtm 
.dw errnosupport    \.db $00    ;$4936 _BufClear 
.dw errnosupport    \.db $00    ;$4939 _JcursorFirst 
.dw errnosupport    \.db $00    ;$493C _JcursorLast 
.dw errnosupport    \.db $00    ;$493F _CursorLeft 
.dw errnosupport    \.db $00    ;$4942 _cursorRight 
.dw errnosupport    \.db $00    ;$4945 _cursorUp 
.dw errnosupport    \.db $00    ;$4948 _CursorDown 
.dw errnosupport    \.db $00    ;$494B _cursorToOffset 
.dw errnosupport    \.db $00    ;$494E _InsDisp 
.dw errnosupport    \.db $00    ;$4951 _FDISPBOL1 
.dw errnosupport    \.db $00    ;$4954 _FDISPBOL 
.dw errnosupport    \.db $00    ;$4957 _DispEOW 
.dw errnosupport    \.db $00    ;$495A _DispHead 
.dw errnosupport    \.db $00    ;$495D _DispTail 
.dw errnosupport    \.db $00    ;$4960 _PutTokString 
.dw errnosupport    \.db $00    ;$4963 _setupEditCmd 
.dw errnosupport    \.db $00    ;$4966 _setEmptyEditEqu 
.dw errnosupport    \.db $00    ;$4969 _SetEmptyEditPtr 
.dw errnosupport    \.db $00    ;$496C _CloseEditEqu 
.dw errnosupport    \.db $00    ;$496F _GetPrevTok 
.dw errnosupport    \.db $00    ;$4972 _getkey 
.dw errnosupport    \.db $00    ;$4975 _canIndic 
.dw errnosupport    \.db $00    ;$4978 _LCD_DRIVERON 
.dw errnosupport    \.db $00    ;$497B _DFMIN2 
.dw errnosupport    \.db $00    ;$497E _formDisp 
.dw errnosupport    \.db $00    ;$4981 _formMatrix 
.dw errnosupport    \.db $00    ;$4984 _wscrollLeft 
.dw errnosupport    \.db $00    ;$4987 _wscrollUp 
.dw errnosupport    \.db $00    ;$498A _wscrollDown 
.dw errnosupport    \.db $00    ;$498D _wscrollRight 
.dw errnosupport    \.db $00    ;$4990 _FormEReal 
.dw errnosupport    \.db $00    ;$4993 _formERealTOK 
.dw errnosupport    \.db $00    ;$4996 _FormDCplx 
.dw errnosupport    \.db $00    ;$4999 _FormReal 
.dw errnosupport    \.db $00    ;$499C _formScrollUp 
.dw errnosupport    \.db $00    ;$499F _setwinabove 
.dw errnosupport    \.db $00    ;$49A2 _disarmScroll 
.dw errnosupport    \.db $00    ;$49A5 _OP1toEdit 
.dw errnosupport    \.db $00    ;$49A8 _MinToEdit 
.dw errnosupport    \.db $00    ;$49AB _rclVarToEdit 
.dw errnosupport    \.db $00    ;$49AE _rclVarToEditPtR 
.dw errnosupport    \.db $00    ;$49B1 _RCLENTRYTOEDIT 
.dw errnosupport    \.db $00    ;$49B4 _rclToQueue 
.dw errnosupport    \.db $00    ;$49B7 _FORMTOTOK 
.dw errnosupport    \.db $00    ;$49BA _DISP_INTERVAL 
.dw errnosupport    \.db $00    ;$49BD _DisplstName 
.dw errnosupport    \.db $00    ;$49C0 _dispSLstNameHL 
.dw errnosupport    \.db $00    ;$49C3 _EditEqu 
.dw errnosupport    \.db $00    ;$49C6 _closeEquField 
.dw errnosupport    \.db $00    ;$49C9 _AutoSelect 
.dw errnosupport    \.db $00    ;$49CC _DISPYEOS 
.dw errnosupport    \.db $00    ;$49CF _dispNumEOS 
.dw errnosupport    \.db $00    ;$49D2 _setupdispeq 
.dw errnosupport    \.db $00    ;$49D5 _DispForward 
.dw errnosupport    \.db $00    ;$49D8 _DispYPrompt2 
.dw errnosupport    \.db $00    ;$49DB _stringwidth 
.dw errnosupport    \.db $00    ;$49DE _dispErrorScreen 
.dw errnosupport    \.db $00    ;$49E1 _POPCX 
.dw errnosupport    \.db $00    ;$49E4 _loadnoeentry 
.dw errnosupport    \.db $00    ;$49E7 _SaveScreen 
.dw errnosupport    \.db $00    ;$49EA _RETSCREEN 
.dw errnosupport    \.db $00    ;$49ED _RetScreenErr 
.dw errnosupport    \.db $00    ;$49F0 _CheckSplitFlag 
.dw errnosupport    \.db $00    ;$49F3 _SolveRedisp 
.dw errnosupport    \.db $00    ;$49F6 _SolveDisp 
.dw errnosupport    \.db $00    ;$49F9 _itemName 
.dw errnosupport    \.db $00    ;$49FC _SetNorm_Vals 
.dw errnosupport    \.db $00    ;$49FF _SetYOffset 
.dw errnosupport    \.db $00    ;$4A02 _ConvKeyToTok 
.dw errnosupport    \.db $00    ;$4A05 _ConvFCKeyToTok 
.dw errnosupport    \.db $00    ;$4A08 _ConvFEKeyToTok 
.dw errnosupport    \.db $00    ;$4A0B _TokToKey 
.dw errnosupport    \.db $00    ;$4A0E _SendSkipExitPacket 
.dw errnosupport    \.db $00    ;$4A11 _GETVARCMD 
.dw errnosupport    \.db $00    ;$4A14 _SendVarCmd 
.dw errnosupport    \.db $00    ;$4A17 _SendScreenshot 
.dw errnosupport    \.db $00    ;$4A1A keyscnlnk 
.dw errnosupport    \.db $00    ;$4A1D _DeselectAllVars 
.dw errnosupport    \.db $00    ;$4A20 _DelRes 
.dw errnosupport    \.db $00    ;$4A23 _ConvLcToLr 
.dw errnosupport    \.db $00    ;$4A26 _RedimMat 
.dw errnosupport    \.db $00    ;$4A29 _IncLstSize 
.dw errnosupport    \.db $00    ;$4A2C _InsertList 
.dw errnosupport    \.db $00    ;$4A2F _dellistel 
.dw errnosupport    \.db $00    ;$4A32 _EditProg 
.dw errnosupport    \.db $00    ;$4A35 _CloseProg 
.dw errnosupport    \.db $00    ;$4A38 _ClrGraphRef 
.dw errnosupport    \.db $00    ;$4A3B _FixTempCnt 
.dw errnosupport    \.db $00    ;$4A3E _SAVEDATA 
.dw errnosupport    \.db $00    ;$4A41 _RESTOREDATA 
.dw errnosupport    \.db $00    ;$4A44 _FindAlphaUp 
.dw errnosupport    \.db $00    ;$4A47 _FindAlphaDn 
.dw errnosupport    \.db $00    ;$4A4A _CmpSyms 
.dw errnosupport    \.db $00    ;$4A4D _CREATETEMP 
.dw errnosupport    \.db $00    ;$4A50 _CleanAll 
.dw errnosupport    \.db $00    ;$4A53 _MoveToNextSym 
.dw errnosupport    \.db $00    ;$4A56 _ConvLrToLc 
.dw errnosupport    \.db $00    ;$4A59 _TblScreenDn 
.dw errnosupport    \.db $00    ;$4A5C _TblScreenUp 
.dw errnosupport    \.db $00    ;$4A5F _SCREENUP 
.dw errnosupport    \.db $00    ;$4A62 _ScreenUpDown 
.dw errnosupport    \.db $00    ;$4A65 _ZifRclHandler 
.dw errnosupport    \.db $00    ;$4A68 _zifrclkapp 
.dw errnosupport    \.db $00    ;$4A6B _RCLKEY 
.dw errnosupport    \.db $00    ;$4A6E _RCLREGEQ_CALL 
.dw errnosupport    \.db $00    ;$4A71 _RCLREGEQ 
.dw errnosupport    \.db $00    ;$4A74 _initNamePrompt 
.dw errnosupport    \.db $00    ;$4A77 _NamePrompt2 
.dw errnosupport    \.db $00    ;$4A7A _CATALOGCHK 
.dw errnosupport    \.db $00    ;$4A7D _clrTR 
.dw errnosupport    \.db $00    ;$4A80 _QUAD 
.dw errnosupport    \.db $00    ;$4A83 _GRAPHQUAD 
.dw errnosupport    \.db $00    ;$4A86 _BC2NOREAL 
.dw errnosupport    \.db $00    ;$4A89 _ErrNonReal_FPST_FPS1 
.dw errnosupport    \.db $00    ;$4A8C _ErrNonReal 
.dw errnosupport    \.db $00    ;$4A8F _WRITE_TEXT 
.dw errnosupport    \.db $00    ;$4A92 _FORSEQINIT 
.dw errnosupport    \.db $00    ;$4A95 _GRPHPARS 
.dw errnosupport    \.db $00    ;$4A98 _PLOTPARS 
.dw errnosupport    \.db $00    ;$4A9B _ParseInp 
.dw errnosupport    \.db $00    ;$4A9E _PARSEOFF 
.dw errnosupport    \.db $00    ;$4AA1 _PARSESCAN 
.dw errnosupport    \.db $00    ;$4AA4 _GETPARSE 
.dw errnosupport    \.db $00    ;$4AA7 _SAVEPARSE 
.dw errnosupport    \.db $00    ;$4AAA _InitPFlgs 
.dw errnosupport    \.db $00    ;$4AAD _CKENDLINERR 
.dw errnosupport    \.db $00    ;$4AB0 _OP2Set60 
.dw errnosupport    \.db $00    ;$4AB3 _GETSTATPTR 
.dw errnosupport    \.db $00    ;$4AB6 _CMP_STATPTR 
.dw errnosupport    \.db $00    ;$4AB9 _VARSYSADR 
.dw errnosupport    \.db $00    ;$4ABC _StoSysTok 
.dw errnosupport    \.db $00    ;$4ABF _StoAns 
.dw errnosupport    \.db $00    ;$4AC2 _StoTheta 
.dw errnosupport    \.db $00    ;$4AC5 _StoR 
.dw errnosupport    \.db $00    ;$4AC8 _StoY 
.dw errnosupport    \.db $00    ;$4ACB _StoN 
.dw errnosupport    \.db $00    ;$4ACE _StoT 
.dw errnosupport    \.db $00    ;$4AD1 _StoX 
.dw errnosupport    \.db $00    ;$4AD4 _StoOther 
.dw errnosupport    \.db $00    ;$4AD7 _RclAns 
.dw errnosupport    \.db $00    ;$4ADA _RclY 
.dw errnosupport    \.db $00    ;$4ADD _RclN 
.dw errnosupport    \.db $00    ;$4AE0 _RclX 
.dw errnosupport    \.db $00    ;$4AE3 _RclVarSym 
.dw errnosupport    \.db $00    ;$4AE6 _RclSysTok 
.dw errnosupport    \.db $00    ;$4AE9 _StMatEl 
.dw errnosupport    \.db $00    ;$4AEC _STLSTVECEL 
.dw errnosupport    \.db $00    ;$4AEF _ConvOP1 
.dw errnosupport    \.db $00    ;$4AF2 _Find_Parse_Formula 
.dw errnosupport    \.db $00    ;$4AF5 _PARSE_FORMULA 
.dw errnosupport    \.db $00    ;$4AF8 _FetchQuotedString 
.dw errnosupport    \.db $00    ;$4AFB _FetchNumLine 
.dw errnosupport    \.db $00    ;$4AFE _ParseNameTokens 
.dw errnosupport    \.db $00    ;$4B01 _ParseInpGraph 
.dw errnosupport    \.db $00    ;$4B04 _ParseInpGraphReset 
.dw errnosupport    \.db $00    ;$4B07 _ParseInpLastEnt 
.dw errnosupport    \.db $00    ;$4B0A _ErrOnCertainTypes 
.dw errnosupport    \.db $00    ;$4B0D _CreatePair 
.dw errnosupport    \.db $00    ;$4B10 _PUSHNUM 
.dw errnosupport    \.db $00    ;$4B13 _INCCURPCERREND 
.dw errnosupport    \.db $00    ;$4B16 _ERREND 
.dw errnosupport    \.db $00    ;$4B19 _COMMAERRF 
.dw errnosupport    \.db $00    ;$4B1C _COMMAERR 
.dw errnosupport    \.db $00    ;$4B1F _STEQARG2 
.dw errnosupport    \.db $00    ;$4B22 _STEQARG 
.dw errnosupport    \.db $00    ;$4B25 _INPARG 
.dw errnosupport    \.db $00    ;$4B28 _STEQARG3 
.dw errnosupport    \.db $00    ;$4B2B _NXTFETCH 
.dw errnosupport    \.db $00    ;$4B2E _CKFETCHVAR 
.dw errnosupport    \.db $00    ;$4B31 _FETCHVARA 
.dw errnosupport    \.db $00    ;$4B34 _FETCHVAR 
.dw errnosupport    \.db $00    ;$4B37 _CKENDLIN 
.dw errnosupport    \.db $00    ;$4B3A _CKENDEXP 
.dw errnosupport    \.db $00    ;$4B3D _CKPARSEND 
.dw errnosupport    \.db $00    ;$4B40 _STOTYPEARG 
.dw errnosupport    \.db $00    ;$4B43 _ConvDim 
.dw errnosupport    \.db $00    ;$4B46 _ConvDim00 
.dw errnosupport    \.db $00    ;$4B49 _AHEADEQUAL 
.dw errnosupport    \.db $00    ;$4B4C _PARSAHEADS 
.dw errnosupport    \.db $00    ;$4B4F _PARSAHEAD 
.dw errnosupport    \.db $00    ;$4B52 _AnsName 
.dw errnosupport    \.db $00    ;$4B55 _STOCMPREALS 
.dw errnosupport    \.db $00    ;$4B58 _GETDEPTR 
.dw errnosupport    \.db $00    ;$4B5B _PUSH2BOPER 
.dw errnosupport    \.db $00    ;$4B5E _POP2BOPER 
.dw errnosupport    \.db $00    ;$4B61 _PUSHOPER 
.dw errnosupport    \.db $00    ;$4B64 _POPOPER 
.dw errnosupport    \.db $00    ;$4B67 _FIND_E_UNDEF 
.dw errnosupport    \.db $00    ;$4B6A _STTMPEQ 
.dw errnosupport    \.db $00    ;$4B6D _FINDEOL 
.dw errnosupport    \.db $00    ;$4B70 _BRKINC 
.dw errnosupport    \.db $00    ;$4B73 _INCFETCH 
.dw errnosupport    \.db $00    ;$4B76 _CURFETCH 
.dw errnosupport    \.db $00    ;$4B79 _Random 
.dw errnosupport    \.db $00    ;$4B7C _StoRand 
.dw errnosupport    \.db $00    ;$4B7F _RandInit 
.dw errnosupport    \.db $00    ;$4B82 _resetStacks 
.dw errnosupport    \.db $00    ;$4B85 _Factorial 
.dw errnosupport    \.db $00    ;$4B88 _YONOFF 
.dw errnosupport    \.db $00    ;$4B8B _EQSELUNSEL 
.dw errnosupport    \.db $00    ;$4B8E _ITSOLVER 
.dw errnosupport    \.db $00    ;$4B91 _GRITSOLVER 
.dw errnosupport    \.db $00    ;$4B94 _ITSOLVERB 
.dw errnosupport    \.db $00    ;$4B97 _ITSOLVERNB 
.dw errnosupport    \.db $00    ;$4B9A _ExTest_INT 
.dw errnosupport    \.db $00    ;$4B9D  
.dw errnosupport    \.db $00    ;$4BA0 _LogGamma 
.dw errnosupport    \.db $00    ;$4BA3 _OneVar 
.dw errnosupport    \.db $00    ;$4BA6 _ONEVARS_0 
.dw errnosupport    \.db $00    ;$4BA9 _ORDSTAT 
.dw errnosupport    \.db $00    ;$4BAC _INITSTATANS2 
.dw errnosupport    \.db $00    ;$4BAF _ANOVA_SPEC 
.dw errnosupport    \.db $00    ;$4BB2 _OutputExpr 
.dw errnosupport    \.db $00    ;$4BB5 _CentCursor 
.dw errnosupport    \.db $00    ;$4BB8 _TEXT 
.dw errnosupport    \.db $00    ;$4BBB _FINISHSPEC 
.dw errnosupport    \.db $00    ;$4BBE _TRCYFUNC 
.dw errnosupport    \.db $00    ;$4BC1 _RCL_SEQ_X 
.dw errnosupport    \.db $00    ;$4BC4 _RCLSEQ2 
.dw errnosupport    \.db $00    ;$4BC7 _GRPPutAway 
.dw errnosupport    \.db $00    ;$4BCA _CKVALDELX 
.dw errnosupport    \.db $00    ;$4BCD _CKVALDELTA 
.dw errnosupport    \.db $00    ;$4BD0 _GrBufClr 
.dw errnosupport    \.db $00    ;$4BD3 _GRBUFCPY_V 
.dw errnosupport    \.db $00    ;$4BD6 _FNDSELEQ 
.dw errnosupport    \.db $00    ;$4BD9 _CLRGRAPHXY 
.dw errnosupport    \.db $00    ;$4BDC _NEDXT_Y_STYLE 
.dw errnosupport    \.db $00    ;$4BDF _PLOTPT 
.dw errnosupport    \.db $00    ;$4BE2 _NEWINDEP 
.dw errnosupport    \.db $00    ;$4BE5 _Axes 
.dw errnosupport    \.db $00    ;$4BE8 _setPenX 
.dw errnosupport    \.db $00    ;$4BEB _setPenY 
.dw errnosupport    \.db $00    ;$4BEE _setPenT 
.dw errnosupport    \.db $00    ;$4BF1 _TAN_EQU_DISP 
.dw errnosupport    \.db $00    ;$4BF4 _PutAns 
.dw errnosupport    \.db $00    ;$4BF7 _DispOP1A 
.dw errnosupport    \.db $00    ;$4BFA _MATHTANLN 
.dw errnosupport    \.db $00    ;$4BFD _ENDDRAW 
.dw errnosupport    \.db $00    ;$4C00 _SetTblGraphDraw 
.dw errnosupport    \.db $00    ;$4C03 _StartDialog 
.dw errnosupport    \.db $00    ;$4C06 _DialogInit 
.dw errnosupport    \.db $00    ;$4C09 _GetDialogNumOP1 
.dw errnosupport    \.db $00    ;$4C0C _SetDialogNumOP1 
.dw errnosupport    \.db $00    ;$4C0F _GetDialogNumHL 
.dw errnosupport    \.db $00    ;$4C12 _ErrArgumentO123 
.dw errnosupport    \.db $00    ;$4C15 _SetDialogKeyOverride 
.dw errnosupport    \.db $00    ;$4C18 _ResDialogKeyOverride 
.dw errnosupport    \.db $00    ;$4C1B _ForceDialogKeypress 
.dw errnosupport    \.db $00    ;$4C1E _DialogStartGetKey 
.dw errnosupport    \.db $00    ;$4C21 _StartDialog_Override 
.dw errnosupport    \.db $00    ;$4C24 _CallDialogCallback 
.dw errnosupport    \.db $00    ;$4C27 _SetDialogCallback 
.dw errnosupport    \.db $00    ;$4C2A _ResDialogCallback 
.dw errnosupport    \.db $00    ;$4C2D _CopyDialogNum 
.dw errnosupport    \.db $00    ;$4C30 _MemClear 
.dw errnosupport    \.db $00    ;$4C33 _MemSet 
.dw errnosupport    \.db $00    ;$4C36 _ReloadAppEntryVecs 
.dw errnosupport    \.db $00    ;$4C39 _PointOn 
.dw errnosupport    \.db $00    ;$4C3C _ExecuteNewPrgm 
.dw errnosupport    \.db $00    ;$4C3F _StrLength 
.dw errnosupport    \.db $00    ;$4C42 _VPutMapRec 
.dw errnosupport    \.db $00    ;$4C45 _getRomPage 
.dw errnosupport    \.db $00    ;$4C48 _FindAppUp 
.dw errnosupport    \.db $00    ;$4C4B _FindAppDn 
.dw errnosupport    \.db $00    ;$4C4E _FindApp 
.dw errnosupport    \.db $00    ;$4C51 _ExecuteApp 
.dw errnosupport    \.db $00    ;$4C54 _MonReset 
.dw errnosupport    \.db $00    ;$4C57 _ClearParseVar 
.dw errnosupport    \.db $00    ;$4C5A _SetParseVarProg 
.dw errnosupport    \.db $00    ;$4C5D _isContextKey 
.dw errnosupport    \.db $00    ;$4C60 _IBounds 
.dw errnosupport    \.db $00    ;$4C63 _IOffset 
.dw errnosupport    \.db $00    ;$4C66 _DrawCirc2 
.dw errnosupport    \.db $00    ;$4C69 _CanAlphIns 
.dw errnosupport    \.db $00    ;$4C6C cxRedisp 
.dw errnosupport    \.db $00    ;$4C6F _GetBaseVer 
.dw errnosupport    \.db $00    ;$4C72 _OPSet0DE 
.dw errnosupport    \.db $00    ;$4C75 _AppGetCbl 
.dw errnosupport    \.db $00    ;$4C78 _AppGetCalc 
.dw errnosupport    \.db $00    ;$4C7B _SaveDisp 
.dw errnosupport    \.db $00    ;$4C7E _SetIgnoreKey 
.dw errnosupport    \.db $00    ;$4C81 _SetSendThisKeyBack 
.dw errnosupport    \.db $00    ;$4C84 _DisableApd 
.dw errnosupport    \.db $00    ;$4C87 _EnableApd 
.dw errnosupport    \.db $00    ;$4C8A _JForceCmdNoChar2 
.dw errnosupport    \.db $00    ;$4C8D _set2IY34 
.dw errnosupport    \.db $00    ;$4C90 _forcecmd 
.dw errnosupport    \.db $00    ;$4C93 _ApdSetup 
.dw errnosupport    \.db $00    ;$4C96 _Get_NumKey 
.dw errnosupport    \.db $00    ;$4C99 _AppSetup 
.dw errnosupport    \.db $00    ;$4C9C _HandleLinkKeyActivity 
.dw errnosupport    \.db $00    ;$4C9F _JForceCmdNoChar3 
.dw errnosupport    \.db $00    ;$4CA2 _ReleaseSedit 
.dw errnosupport    \.db $00    ;$4CA5 _initsmalleditline 
.dw errnosupport    \.db $00    ;$4CA8 _startsmalledit 
.dw errnosupport    \.db $00    ;$4CAB  
.dw errnosupport    \.db $00    ;$4CAE _SGetTokString 
.dw errnosupport    \.db $00    ;$4CB1 _LoadPattern 
.dw errnosupport    \.db $00    ;$4CB4 _SStringLength 
.dw errnosupport    \.db $00    ;$4CB7 _RestorePenCol 
.dw errnosupport    \.db $00    ;$4CBA  
.dw errnosupport    \.db $00    ;$4CBD _DoNothing 
.dw errnosupport    \.db $00    ;$4CC0 _ForceSmallEditReturn 
.dw errnosupport    \.db $00    ;$4CC3  
.dw errnosupport    \.db $00    ;$4CC6  
.dw errnosupport    \.db $00    ;$4CC9  
.dw errnosupport    \.db $00    ;$4CCC  
.dw errnosupport    \.db $00    ;$4CCF _VEraseEOL 
.dw errnosupport    \.db $00    ;$4CD2  
.dw errnosupport    \.db $00    ;$4CD5  
.dw errnosupport    \.db $00    ;$4CD8 _GoToErr 
.dw errnosupport    \.db $00    ;$4CDB _initsmalleditBox 
.dw errnosupport    \.db $00    ;$4CDE  
.dw errnosupport    \.db $00    ;$4CE1 _EmptyHook 
.dw errnosupport    \.db $00    ;$4CE4 _ForceSmallEditReturn2 
.dw errnosupport    \.db $00    ;$4CE7  
.dw errnosupport    \.db $00    ;$4CEA  
.dw errnosupport    \.db $00    ;$4CED _ClearRow 
.dw errnosupport    \.db $00    ;$4CF0  
.dw errnosupport    \.db $00    ;$4CF3  
.dw errnosupport    \.db $00    ;$4CF6  
.dw errnosupport    \.db $00    ;$4CF9  
.dw errnosupport    \.db $00    ;$4CFC  
.dw errnosupport    \.db $00    ;$4CFF  
.dw errnosupport    \.db $00    ;$4D02  
.dw errnosupport    \.db $00    ;$4D05  
.dw errnosupport    \.db $00    ;$4D08  
.dw errnosupport    \.db $00    ;$4D0B  
.dw errnosupport    \.db $00    ;$4D0E  
.dw errnosupport    \.db $00    ;$4D11  
.dw errnosupport    \.db $00    ;$4D14  
.dw errnosupport    \.db $00    ;$4D17  
.dw errnosupport    \.db $00    ;$4D1A  
.dw errnosupport    \.db $00    ;$4D1D  
.dw errnosupport    \.db $00    ;$4D20  
.dw errnosupport    \.db $00    ;$4D23  
.dw errnosupport    \.db $00    ;$4D26 _AppScreenUpDown 
.dw errnosupport    \.db $00    ;$4D29 _AppScreenUpDown1 
.dw errnosupport    \.db $00    ;$4D2C  
.dw errnosupport    \.db $00    ;$4D2F _initsmalleditlinevar 
.dw errnosupport    \.db $00    ;$4D32 _initsmalleditlineop1 
.dw errnosupport    \.db $00    ;$4D35 _initsmalleditboxvar 
.dw errnosupport    \.db $00    ;$4D38 _initsmalleditboxop1 
.dw errnosupport    \.db $00    ;$4D3B  
.dw errnosupport    \.db $00    ;$4D3E _RestartDialog 
.dw errnosupport    \.db $00    ;$4D41 _ErrCustom1 
.dw errnosupport    \.db $00    ;$4D44 _ErrCustom2 
.dw errnosupport    \.db $00    ;$4D47 _AppStartMouse 
.dw errnosupport    \.db $00    ;$4D4A _AppStartMouseNoSetup 
.dw errnosupport    \.db $00    ;$4D4D _AppMouseGetKey 
.dw errnosupport    \.db $00    ;$4D50 _AppDispMouse 
.dw errnosupport    \.db $00    ;$4D53 _AppEraseMouse 
.dw errnosupport    \.db $00    ;$4D56 _AppSetupMouseMem 
.dw errnosupport    \.db $00    ;$4D59 _GetDispRowOffset 
.dw errnosupport    \.db $00    ;$4D5C _ClearRect 
.dw errnosupport    \.db $00    ;$4D5F _InvertRect 
.dw errnosupport    \.db $00    ;$4D62 _FillRect 
.dw errnosupport    \.db $00    ;$4D65 _AppUpdateMouse 
.dw errnosupport    \.db $00    ;$4D68 _AppDispPrevMouse 
.dw errnosupport    \.db $00    ;$4D6B  
.dw errnosupport    \.db $00    ;$4D6E _initcellbox 
.dw errnosupport    \.db $00    ;$4D71 _drawcell 
.dw errnosupport    \.db $00    ;$4D74  
.dw errnosupport    \.db $00    ;$4D77 _invertcell 
.dw errnosupport    \.db $00    ;$4D7A _setcelloverride 
.dw errnosupport    \.db $00    ;$4D7D _DrawRectBorder 
.dw errnosupport    \.db $00    ;$4D80 _ClearCell 
.dw errnosupport    \.db $00    ;$4D83 _covercell 
.dw errnosupport    \.db $00    ;$4D86 _EraseRectBorder 
.dw errnosupport    \.db $00    ;$4D89 _FillRectPattern 
.dw errnosupport    \.db $00    ;$4D8C _DrawRectBorderClear 
.dw errnosupport    \.db $00    ;$4D8F  
.dw errnosupport    \.db $00    ;$4D92  
.dw errnosupport    \.db $00    ;$4D95 _VerticalLine 
.dw errnosupport    \.db $00    ;$4D98 _IBoundsFull 
.dw errnosupport    \.db $00    ;$4D9B _DisplayImage 
.dw errnosupport    \.db $00    ;$4D9E  
.dw errnosupport    \.db $00    ;$4DA1  
.dw errnosupport    \.db $00    ;$4DA4 _AppUpdateMouseCoords 
.dw errnosupport    \.db $00    ;$4DA7 _ShiftBitsLeft 
.dw errnosupport    \.db $00    ;$4DAA  
.dw errnosupport    \.db $00    ;$4DAD  
.dw errnosupport    \.db $00    ;$4DB0  
.dw errnosupport    \.db $00    ;$4DB3  
.dw errnosupport    \.db $00    ;$4DB6  
.dw errnosupport    \.db $00    ;$4DB9  
.dw errnosupport    \.db $00    ;$4DBC  
.dw errnosupport    \.db $00    ;$4DBF _AppUpdateMouseRow 
.dw errnosupport    \.db $00    ;$4DC2 _AppDrawMouse 
.dw errnosupport    \.db $00    ;$4DC5 _AppDrawMouseDirect 
.dw errnosupport    \.db $00    ;$4DC8 _CPoint 
.dw errnosupport    \.db $00    ;$4DCB _DeleteApp 
.dw errnosupport    \.db $00    ;$4DCE _AppUpdateMouseXY 
.dw errnosupport    \.db $00    ;$4DD1 _setmodecellflag 
.dw errnosupport    \.db $00    ;$4DD4 _resetmodecellflag 
.dw errnosupport    \.db $00    ;$4DD7 _ismodecellset 
.dw errnosupport    \.db $00    ;$4DDA _getmodecellflag 
.dw errnosupport    \.db $00    ;$4DDD  
.dw errnosupport    \.db $00    ;$4DE0 _CellBoxManager 
.dw errnosupport    \.db $00    ;$4DE3 _startnewcell 
.dw errnosupport    \.db $00    ;$4DE6  
.dw errnosupport    \.db $00    ;$4DE9 _CellCursorHandle 
.dw errnosupport    \.db $00    ;$4DEC  
.dw errnosupport    \.db $00    ;$4DEF  
.dw errnosupport    \.db $00    ;$4DF2 _ClearCurCell 
.dw errnosupport    \.db $00    ;$4DF5 _drawcurcell 
.dw errnosupport    \.db $00    ;$4DF8 _invertcurcell 
.dw errnosupport    \.db $00    ;$4DFB _covercurcell 
.dw errnosupport    \.db $00    ;$4DFE _BlinkCell 
.dw errnosupport    \.db $00    ;$4E01 _BlinkCellNoLookUp 
.dw errnosupport    \.db $00    ;$4E04 _BlinkCurCell 
.dw errnosupport    \.db $00    ;$4E07 _BlinkCellToOn 
.dw errnosupport    \.db $00    ;$4E0A _BlinkCellToOnNoLookUp 
.dw errnosupport    \.db $00    ;$4E0D _BlinkCurCellToOn 
.dw errnosupport    \.db $00    ;$4E10 _BlinkCellToOff 
.dw errnosupport    \.db $00    ;$4E13 _BlinkCellToOffNoLookUp 
.dw errnosupport    \.db $00    ;$4E16 _BlinkCurCellToOff 
.dw errnosupport    \.db $00    ;$4E19 _getcurmodecellflag 
.dw errnosupport    \.db $00    ;$4E1C  
.dw errnosupport    \.db $00    ;$4E1F _startsmalleditreturn 
.dw errnosupport    \.db $00    ;$4E22  
.dw errnosupport    \.db $00    ;$4E25  
.dw errnosupport    \.db $00    ;$4E28 _CellkHandle 
.dw errnosupport    \.db $00    ;$4E2B _errchkalphabox 
.dw errnosupport    \.db $00    ;$4E2E  
.dw errnosupport    \.db $00    ;$4E31  
.dw errnosupport    \.db $00    ;$4E34  
.dw errnosupport    \.db $00    ;$4E37  
.dw errnosupport    \.db $00    ;$4E3A _eraseallcells 
.dw errnosupport    \.db $00    ;$4E3D _iscurmodecellset 
.dw errnosupport    \.db $00    ;$4E40  
.dw errnosupport    \.db $00    ;$4E43 _initalphabox 
.dw errnosupport    \.db $00    ;$4E46  
.dw errnosupport    \.db $00    ;$4E49  
.dw errnosupport    \.db $00    ;$4E4C _drawblnkcell 
.dw errnosupport    \.db $00    ;$4E4F _ClearBlnkCell 
.dw errnosupport    \.db $00    ;$4E52 _invertblnkcell 
.dw errnosupport    \.db $00    ;$4E55 _AppMouseForceKey 
.dw errnosupport    \.db $00    ;$4E58 _AppSetupMouseMemCoords 
.dw errnosupport    \.db $00    ;$4E5B _AppMoveMouse 
.dw errnosupport    \.db $00    ;$4E5E _GetStringInput 
.dw errnosupport    \.db $00    ;$4E61 _GetStringInput2 
.dw errnosupport    \.db $00    ;$4E64 _WaitEnterKeyValue 
.dw errnosupport    \.db $00    ;$4E67 _HorizontalLine 
.dw errnosupport    \.db $00    ;$4E6A _CreateAppVar 
.dw errnosupport    \.db $00    ;$4E6D _CreateProtProg 
.dw errnosupport    \.db $00    ;$4E70 _CreateVar 
.dw errnosupport    \.db $00    ;$4E73 _AsmComp 
.dw errnosupport    \.db $00    ;$4E76 _GetAsmSize 
.dw errnosupport    \.db $00    ;$4E79 _SquishPrgm 
.dw errnosupport    \.db $00    ;$4E7C _ExecutePrgm 
.dw errnosupport    \.db $00    ;$4E7F _ChkFindSymAsm 
.dw errnosupport    \.db $00    ;$4E82 _ParsePrgmName 
.dw errnosupport    \.db $00    ;$4E85 _CSub 
.dw errnosupport    \.db $00    ;$4E88 _CAdd 
.dw errnosupport    \.db $00    ;$4E8B _CSqaure 
.dw errnosupport    \.db $00    ;$4E8E _CMult 
.dw errnosupport    \.db $00    ;$4E91 _CRecip 
.dw errnosupport    \.db $00    ;$4E94 _CDiv 
.dw errnosupport    \.db $00    ;$4E97 _CAbs 
.dw errnosupport    \.db $00    ;$4E9A _AddSquares 
.dw errnosupport    \.db $00    ;$4E9D _CSqRoot 
.dw errnosupport    \.db $00    ;$4EA0 _CLN 
.dw errnosupport    \.db $00    ;$4EA3 _CLog 
.dw errnosupport    \.db $00    ;$4EA6 _CTenX 
.dw errnosupport    \.db $00    ;$4EA9 _CEtoX 
.dw errnosupport    \.db $00    ;$4EAC _CXrootY 
.dw errnosupport    \.db $00    ;$4EAF  
.dw errnosupport    \.db $00    ;$4EB2 _CYtoX 
.dw errnosupport    \.db $00    ;$4EB5 _InvertNonReal 
.dw errnosupport    \.db $00    ;$4EB8 _CplxMult 
.dw errnosupport    \.db $00    ;$4EBB _CplxDiv 
.dw errnosupport    \.db $00    ;$4EBE _CplxTrunc 
.dw errnosupport    \.db $00    ;$4EC1 _CplxFrac 
.dw errnosupport    \.db $00    ;$4EC4 _CplxFloor 
.dw errnosupport    \.db $00    ;$4EC7 _SendHeaderPacket 
.dw errnosupport    \.db $00    ;$4ECA _CancelTransmission 
.dw errnosupport    \.db $00    ;$4ECD _SendScreenContents 
.dw errnosupport    \.db $00    ;$4ED0 _SendRAMVarData 
.dw errnosupport    \.db $00    ;$4ED3 _SendRAMCmd 
.dw errnosupport    \.db $00    ;$4ED6 _SendPacket 
.dw errnosupport    \.db $00    ;$4ED9 _ReceiveAck 
.dw errnosupport    \.db $00    ;$4EDC _Send4BytePacket 
.dw errnosupport    \.db $00    ;$4EDF _SendDataByte 
.dw errnosupport    \.db $00    ;$4EE2 _Send4Bytes 
.dw errnosupport    \.db $00    ;$4EE5 _SendAByte 
.dw errnosupport    \.db $00    ;$4EE8 _SendCByte 
.dw errnosupport    \.db $00    ;$4EEB _GetSmallPacket 
.dw errnosupport    \.db $00    ;$4EEE _GetDataPacket 
.dw errnosupport    \.db $00    ;$4EF1 _SendAck 
.dw errnosupport    \.db $00    ;$4EF4 _Get4Bytes 
.dw errnosupport    \.db $00    ;$4EF7 _Get3Bytes 
.dw errnosupport    \.db $00    ;$4EFA _Rec1stByte 
.dw errnosupport    \.db $00    ;$4EFD _Rec1stByteNC 
.dw errnosupport    \.db $00    ;$4F00 _ContinueGetByte 
.dw errnosupport    \.db $00    ;$4F03 _RecAByteIO 
.dw errnosupport    \.db $00    ;$4F06 _ReceiveVar 
.dw errnosupport    \.db $00    ;$4F09 _ReceiveVarDataExists 
.dw errnosupport    \.db $00    ;$4F0C _ReceiveVarData 
.dw errnosupport    \.db $00    ;$4F0F _SrchVLstUp 
.dw errnosupport    \.db $00    ;$4F12 _SrchVLstDn 
.dw errnosupport    \.db $00    ;$4F15 _SendVariable 
.dw errnosupport    \.db $00    ;$4F18 _Get4BytesCursor 
.dw errnosupport    \.db $00    ;$4F1B _Get4BytesNC 
.dw errnosupport    \.db $00    ;$4F1E _Convert85List 
.dw errnosupport    \.db $00    ;$4F21 _SendDirectoryContents 
.dw errnosupport    \.db $00    ;$4F24 _SendReadyPacket 
.dw errnosupport    \.db $00    ;$4F27 _Convert85Real 
.dw errnosupport    \.db $00    ;$4F2A _ret_6 
.dw errnosupport    \.db $00    ;$4F2D _SendCertificate 
.dw errnosupport    \.db $00    ;$4F30 _SendApplication 
.dw errnosupport    \.db $00    ;$4F33 _SendOSHeader 
.dw errnosupport    \.db $00    ;$4F36 _SendOSPage 
.dw errnosupport    \.db $00    ;$4F39 _SendOS 
.dw errnosupport    \.db $00    ;$4F3C _FlashWriteDisable 
.dw errnosupport    \.db $00    ;$4F3F _SendCmd 
.dw errnosupport    \.db $00    ;$4F42 _SendOSValidationData 
.dw errnosupport    \.db $00    ;$4F45 _Disp 
.dw errnosupport    \.db $00    ;$4F48 _SendGetkeyPress 
.dw errnosupport    \.db $00    ;$4F4B _RejectCommand 
.dw errnosupport    \.db $00    ;$4F4E _CheckLinkLines 
.dw errnosupport    \.db $00    ;$4F51 _GetHookByte 
.dw errnosupport    \.db $00    ;$4F54 _GetBytePaged 
.dw errnosupport    \.db $00    ;$4F57 _cursorhook 
.dw errnosupport    \.db $00    ;$4F5A _call_library_hook 
.dw errnosupport    \.db $00    ;$4F5D _call_rawkey_hook 
.dw errnosupport    \.db $00    ;$4F60 _setCursorHook 
.dw errnosupport    \.db $00    ;$4F63 _EnableLibraryHook 
.dw errnosupport    \.db $00    ;$4F66 _SetGetKeyHook 
.dw errnosupport    \.db $00    ;$4F69 _ClrCursorHook 
.dw errnosupport    \.db $00    ;$4F6C _DisableLibraryHook 
.dw errnosupport    \.db $00    ;$4F6F _ClrRawKeyHook 
.dw errnosupport    \.db $00    ;$4F72 _ResetHookBytes 
.dw errnosupport    \.db $00    ;$4F75 _AdjustAllHooks 
.dw errnosupport    \.db $00    ;$4F78 _getkeyhook 
.dw errnosupport    \.db $00    ;$4F7B _SetGetcscHook 
.dw errnosupport    \.db $00    ;$4F7E _ClrGetKeyHook 
.dw errnosupport    \.db $00    ;$4F81 _call_linkactivity_hook 
.dw errnosupport    \.db $00    ;$4F84 _EnableLinkActivityHook 
.dw errnosupport    \.db $00    ;$4F87 _DisableLinkHook 
.dw errnosupport    \.db $00    ;$4F8A _GetSmallPacket2 
.dw errnosupport    \.db $00    ;$4F8D _EnableCatalog2Hook 
.dw errnosupport    \.db $00    ;$4F90 _DisableCatalog2Hook 
.dw errnosupport    \.db $00    ;$4F93 _EnableLocalizeHook 
.dw errnosupport    \.db $00    ;$4F96 _DisableLocalizeHook 
.dw errnosupport    \.db $00    ;$4F99 _SetTokenHook 
.dw errnosupport    \.db $00    ;$4F9C _ClearTokenHook 
.dw errnosupport    \.db $00    ;$4F9F  
.dw errnosupport    \.db $00    ;$4FA2  
.dw errnosupport    \.db $00    ;$4FA5 _DispListElementOffLA 
.dw errnosupport    \.db $00    ;$4FA8 _Bit_VertSplit 
.dw errnosupport    \.db $00    ;$4FAB _SetHomescreenHook 
.dw errnosupport    \.db $00    ;$4FAE _ClrHomeScreenHook 
.dw errnosupport    \.db $00    ;$4FB1 _SetWindowHook 
.dw errnosupport    \.db $00    ;$4FB4 _DisableWindowHook 
.dw errnosupport    \.db $00    ;$4FB7 _SetGraphModeHook 
.dw errnosupport    \.db $00    ;$4FBA _DisableGraphHook 
.dw errnosupport    \.db $00    ;$4FBD _ParseAndStoreSysVar 
.dw errnosupport    \.db $00    ;$4FC0 _DisplayEditSysVar 
.dw errnosupport    \.db $00    ;$4FC3 _JForceWindowSettings 
.dw errnosupport    \.db $00    ;$4FC6 _DelVarArc 
.dw errnosupport    \.db $00    ;$4FC9 _DelVarNoArc 
.dw errnosupport    \.db $00    ;$4FCC _SetAllPlots 
.dw errnosupport    \.db $00    ;$4FCF _SetYeditHook 
.dw errnosupport    \.db $00    ;$4FD2 _DisableYEquHook 
.dw errnosupport    \.db $00    ;$4FD5 _JForceYEqu 
.dw errnosupport    \.db $00    ;$4FD8 _Arc_Unarc 
.dw errnosupport    \.db $00    ;$4FDB _ArchiveVar 
.dw errnosupport    \.db $00    ;$4FDE _UnarchiveVar 
.dw errnosupport    \.db $00    ;$4FE1 _DialogKeyHook 
.dw errnosupport    \.db $00    ;$4FE4 _SetFontHook 
.dw errnosupport    \.db $00    ;$4FE7 _ClrFontHook 
.dw errnosupport    \.db $00    ;$4FEA _SetRegraphHook 
.dw errnosupport    \.db $00    ;$4FED _DisableRegraphHook 
.dw errnosupport    \.db $00    ;$4FF0 _RunGraphingHook 
.dw errnosupport    \.db $00    ;$4FF3 _SetTraceHook 
.dw errnosupport    \.db $00    ;$4FF6 _DisableTraceHook 
.dw errnosupport    \.db $00    ;$4FF9 _RunTraceHook 
.dw errnosupport    \.db $00    ;$4FFC _NDeriv 
.dw errnosupport    \.db $00    ;$4FFF _PolarDerivative 
.dw errnosupport    \.db $00    ;$5002 _JForceGraphNoKey 
.dw errnosupport    \.db $00    ;$5005 _JForceGraphKey 
.dw errnosupport    \.db $00    ;$5008 _PowerOff 
.dw errnosupport    \.db $00    ;$500B _GetKeyRetOff 
.dw errnosupport    \.db $00    ;$500E _FindGroupSym 
.dw errnosupport    \.db $00    ;$5011 _FillBasePageTable 
.dw errnosupport    \.db $00    ;$5014 _ArcChk 
.dw errnosupport    \.db $00    ;$5017 _FlashToRam 
.dw errnosupport    \.db $00    ;$501A _LoadDEIndPaged 
.dw errnosupport    \.db $00    ;$501D _LoadCIndPaged 
.dw errnosupport    \.db $00    ;$5020 _SetupPagedPtr 
.dw errnosupport    \.db $00    ;$5023 _PagedGet 
.dw errnosupport    \.db $00    ;$5026 _SetParserHook 
.dw errnosupport    \.db $00    ;$5029 _ClearParserHook 
.dw errnosupport    \.db $00    ;$502C _SetAppChangeHook 
.dw errnosupport    \.db $00    ;$502F _ClearAppChangeHook 
.dw errnosupport    \.db $00    ;$5032 _EnableGraphicsHook 
.dw errnosupport    \.db $00    ;$5035 _DisableGraphicsHook 
.dw errnosupport    \.db $00    ;$5038 _IPointNoGraphicsHook 
.dw errnosupport    \.db $00    ;$503B _ILineNoHook 
.dw errnosupport    \.db $00    ;$503E  
.dw errnosupport    \.db $00    ;$5041 _DeleteTempPrograms 
.dw errnosupport    \.db $00    ;$5044 _EnableCatalog1Hook 
.dw errnosupport    \.db $00    ;$5047 _DisableCatalog1Hook 
.dw errnosupport    \.db $00    ;$504A _EnableHelpHook 
.dw errnosupport    \.db $00    ;$504D _DisableHelpHook 
.dw errnosupport    \.db $00    ;$5050 _DispCatalogEnd 
.dw errnosupport    \.db $00    ;$5053 _GetMenuKeypress 
.dw errnosupport    \.db $00    ;$5056 _GetCatalogItem 
.dw errnosupport    \.db $00    ;$5059 _RunCatalog2Hook 
.dw errnosupport    \.db $00    ;$505C _RunCatalog1Hook 
.dw errnosupport    \.db $00    ;$505F  
.dw errnosupport    \.db $00    ;$5062  
.dw errnosupport    \.db $00    ;$5065 _dispMenuTitle 
.dw errnosupport    \.db $00    ;$5068  
.dw errnosupport    \.db $00    ;$506B _EnablecxRedispHook 
.dw errnosupport    \.db $00    ;$506E _DisablecxRedispHook 
.dw errnosupport    \.db $00    ;$5071 _BufCpy 
.dw errnosupport    \.db $00    ;$5074 _BufClr 
.dw errnosupport    \.db $00    ;$5077 _UnOPExec2 
.dw errnosupport    \.db $00    ;$507A _BinOPExec2 
.dw errnosupport    \.db $00    ;$507D _LoadMenuB 
.dw errnosupport    \.db $00    ;$5080 _DisplayVarInfo 
.dw errnosupport    \.db $00    ;$5083 _SetMenuHook 
.dw errnosupport    \.db $00    ;$5086 _ClearMenuHook 
.dw errnosupport    \.db $00    ;$5089 _getBCOffsetIX 
.dw errnosupport    \.db $00    ;$508C _GetBCOffsetIX2 
.dw errnosupport    \.db $00    ;$508F _ForceFullScreen 
.dw errnosupport    \.db $00    ;$5092 _GetVariableData 
.dw errnosupport    \.db $00    ;$5095 _FindSwapSector 
.dw errnosupport    \.db $00    ;$5098 _CopyFlashPage 
.dw errnosupport    \.db $00    ;$509B _FindAppNumPages 
.dw errnosupport    \.db $00    ;$509E _HLMinus5 
.dw errnosupport    \.db $00    ;$50A1 _SendArcPacket 
.dw errnosupport    \.db $00    ;$50A4 _ForceGraphKeypress 
.dw errnosupport    \.db $00    ;$50A7 _DoNothing3 
.dw errnosupport    \.db $00    ;$50AA _FormBase 
.dw errnosupport    \.db $00    ;$50AD  
.dw errnosupport    \.db $00    ;$50B0 _IsFragmented 
.dw errnosupport    \.db $00    ;$50B3 _Chk_Batt_Low 
.dw errnosupport    \.db $00    ;$50B6 _Chk_Batt_Low_2 
.dw errnosupport    \.db $00    ;$50B9 _Arc_Unarc2 
.dw errnosupport    \.db $00    ;$50BC _GetAppBasePage 
.dw errnosupport    \.db $00    ;$50BF _SetExSpeed 
.dw errnosupport    \.db $00    ;$50C2 _RclExit 
.dw errnosupport    \.db $00    ;$50C5 _GroupAllVars 
.dw errnosupport    \.db $00    ;$50C8 _UngroupVar 
.dw errnosupport    \.db $00    ;$50CB _WriteToFlash 
.dw errnosupport    \.db $00    ;$50CE _SetSilentLinkHook 
.dw errnosupport    \.db $00    ;$50D1 _DisableSilentLinkHook 
.dw errnosupport    \.db $00    ;$50D4 _TwoVarSet 
.dw errnosupport    \.db $00    ;$50D7 _ExecClassCToken 
.dw errnosupport    \.db $00    ;$50DA _ExecClass3Token 
.dw errnosupport    \.db $00    ;$50DD _GetSysInfo 
.dw errnosupport    \.db $00    ;$50E0 _NZIf83Plus 
.dw errnosupport    \.db $00    ;$50E3 _LinkStatus 
.dw errnosupport    \.db $00    ;$50E6 _DoNothing2 
.dw errnosupport    \.db $00    ;$50E9 _KeyboardGetKey 
.dw errnosupport    \.db $00    ;$50EC _RunAppLib 
.dw errnosupport    \.db $00    ;$50EF _FindSpecialAppHeader 
.dw errnosupport    \.db $00    ;$50F2 _SendUSBData 
.dw errnosupport    \.db $00    ;$50F5 _AppGetCBLUSB 
.dw errnosupport    \.db $00    ;$50F8 _AppGetCalcUSB 
.dw errnosupport    \.db $00    ;$50FB _GetVarCmdUSB 
.dw errnosupport    \.db $00    ;$50FE  
.dw errnosupport    \.db $00    ;$5101 _TenX2 
.dw errnosupport    \.db $00    ;$5104  
.dw errnosupport    \.db $00    ;$5107  
.dw errnosupport    \.db $00    ;$510A _GetVarVersion 
.dw errnosupport    \.db $00    ;$510D  
.dw errnosupport    \.db $00    ;$5110  
.dw errnosupport    \.db $00    ;$5113 _DeleteTempEditEqu 
.dw errnosupport    \.db $00    ;$5116 _JcursorFirst2 
.dw errnosupport    \.db $00    ;$5119  
.dw errnosupport    \.db $00    ;$511C _PromptMoveBackLeft 
.dw errnosupport    \.db $00    ;$511F _wputsEOL2 
.dw errnosupport    \.db $00    ;$5122 _InvertTextInsMode 
.dw errnosupport    \.db $00    ;$5125  
.dw errnosupport    \.db $00    ;$5128 _ResetDefaults 
.dw errnosupport    \.db $00    ;$512B _ZeroFinanceVars 
.dw errnosupport    \.db $00    ;$512E _DispHeader 
.dw errnosupport    \.db $00    ;$5131 _JForceGroup 
.dw errnosupport    \.db $00    ;$5134  
.dw errnosupport    \.db $00    ;$5137  
.dw errnosupport    \.db $00    ;$513A _DispCoords 
.dw errnosupport    \.db $00    ;$513D  
.dw errnosupport    \.db $00    ;$5140  
.dw errnosupport    \.db $00    ;$5143 _chkTmr 
.dw errnosupport    \.db $00    ;$5146  
.dw errnosupport    \.db $00    ;$5149  
.dw errnosupport    \.db $00    ;$514C  
.dw errnosupport    \.db $00    ;$514F _getDate 
.dw errnosupport    \.db $00    ;$5152 _GetDateString 
.dw errnosupport    \.db $00    ;$5155 _getDtFmt 
.dw errnosupport    \.db $00    ;$5158 _getDtStr 
.dw errnosupport    \.db $00    ;$515B _getTime 
.dw errnosupport    \.db $00    ;$515E _GetTimeString 
.dw errnosupport    \.db $00    ;$5161 _getTmFmt 
.dw errnosupport    \.db $00    ;$5164 _getTmStr 
.dw errnosupport    \.db $00    ;$5167 _SetZeroOne 
.dw errnosupport    \.db $00    ;$516A _setDate 
.dw errnosupport    \.db $00    ;$516D _IsOneTwoThree 
.dw errnosupport    \.db $00    ;$5170 _setTime 
.dw errnosupport    \.db $00    ;$5173 _IsOP112or24 
.dw errnosupport    \.db $00    ;$5176 _chkTimer0 
.dw errnosupport    \.db $00    ;$5179 _timeCnv 
.dw errnosupport    \.db $00    ;$517C _GetLToOP1Extra 
.dw errnosupport    \.db $00    ;$517F _ClrWindowAndFlags 
.dw errnosupport    \.db $00    ;$5182 _SetMachineID 
.dw errnosupport    \.db $00    ;$5185 _ResetLists 
.dw errnosupport    \.db $00    ;$5188 _DispValue 
.dw errnosupport    \.db $00    ;$518B  
.dw errnosupport    \.db $00    ;$518E  
.dw errnosupport    \.db $00    ;$5191 _ExecLib 
.dw errnosupport    \.db $00    ;$5194  
.dw errnosupport    \.db $00    ;$5197 _CPOP1OP2Rounded 
.dw errnosupport    \.db $00    ;$519A _CPOP1OP2Rounded2 
.dw errnosupport    \.db $00    ;$519D _OpenLib 
.dw errnosupport    \.db $00    ;$51A0  
.dw errnosupport    \.db $00    ;$51A3  
.dw errnosupport    \.db $00    ;$51A6 _ResetIOPrompt 
.dw errnosupport    \.db $00    ;$51A9 _StrCpyVarData 
.dw errnosupport    \.db $00    ;$51AC _SetUpEditor 
.dw errnosupport    \.db $00    ;$51AF _SortA 
.dw errnosupport    \.db $00    ;$51B2 _SortD 
.dw errnosupport    \.db $00    ;$51B5  
.dw errnosupport    \.db $00    ;$51B8 _IsOP1ResID 
.dw errnosupport    \.db $00    ;$51BB _ListEdNameCxMain 
.dw errnosupport    \.db $00    ;$51BE _ListEdEnterNewName 
.dw errnosupport    \.db $00    ;$51C1  
.dw errnosupport    \.db $00    ;$51C4 _ForceModeKeypress 
.dw errnosupport    \.db $00    ;$51C7 _DispAboutScreen 
.dw errnosupport    \.db $00    ;$51CA _ChkHelpHookVer 
.dw errnosupport    \.db $00    ;$51CD _Disp32 
.dw errnosupport    \.db $00    ;$51D0  
.dw errnosupport    \.db $00    ;$51D3  
.dw errnosupport    \.db $00    ;$51D6  
.dw errnosupport    \.db $00    ;$51D9  
.dw errnosupport    \.db $00    ;$51DC _DrawTableEditor 
.dw errnosupport    \.db $00    ;$51DF _DisplayListNameEquals 
.dw errnosupport    \.db $00    ;$51E2 _DisplayListHeader 
.dw errnosupport    \.db $00    ;$51E5 _DispMatrixDimensions 
.dw errnosupport    \.db $00    ;$51E8 _HighlightListEdItem 
.dw errnosupport    \.db $00    ;$51EB  
.dw errnosupport    \.db $00    ;$51EE  
.dw errnosupport    \.db $00    ;$51F1 _MatrixName 
.dw errnosupport    \.db $00    ;$51F4  
.dw errnosupport    \.db $00    ;$51F7  
.dw errnosupport    \.db $00    ;$51FA  
.dw errnosupport    \.db $00    ;$51FD  
.dw errnosupport    \.db $00    ;$5200  
.dw errnosupport    \.db $00    ;$5203  
.dw errnosupport    \.db $00    ;$5206  
.dw errnosupport    \.db $00    ;$5209  
.dw errnosupport    \.db $00    ;$520C  
.dw errnosupport    \.db $00    ;$520F  
.dw errnosupport    \.db $00    ;$5212 _SetupEmptyEditTempEqu 
.dw errnosupport    \.db $00    ;$5215 _ExecClass1Token 
.dw errnosupport    \.db $00    ;$5218 _HandleMathTokenParse 
.dw errnosupport    \.db $00    ;$521B _MaybePushMultiplyOp 
.dw errnosupport    \.db $00    ;$521E _RestartParseOP1Result 
.dw errnosupport    \.db $00    ;$5221 _Chk_Batt_Level 
.dw errnosupport    \.db $00    ;$5224  
.dw errnosupport    \.db $00    ;$5227  
.dw errnosupport    \.db $00    ;$522A  
.dw errnosupport    \.db $00    ;$522D _DisplayListEquals 
.dw errnosupport    \.db $00    ;$5230 _GetCurPlotListOffset 
.dw errnosupport    \.db $00    ;$5233 _GoToLastRow 
.dw errnosupport    \.db $00    ;$5236 _RectBorder 
.dw errnosupport    \.db $00    ;$5239  
.dw errnosupport    \.db $00    ;$523C  
.dw errnosupport    \.db $00    ;$523F  
.dw errnosupport    \.db $00    ;$5242 _LoadA5 
.dw errnosupport    \.db $00    ;$5245  
.dw errnosupport    \.db $00    ;$5248 _NamedListToOP1 
.dw errnosupport    \.db $00    ;$524B  
.dw errnosupport    \.db $00    ;$524E  
.dw errnosupport    \.db $00    ;$5251  
.dw errnosupport    \.db $00    ;$5254 _InitUSBDeviceCallback 
.dw errnosupport    \.db $00    ;$5257 _KillUSBDevice 
.dw errnosupport    \.db $00    ;$525A _SetUSBConfiguration 
.dw errnosupport    \.db $00    ;$525D _RequestUSBData 
.dw errnosupport    \.db $00    ;$5260 _StopReceivingUSBData 
.dw errnosupport    \.db $00    ;$5263 _FindAppHeaderByPage 
.dw errnosupport    \.db $00    ;$5266 _FindNextHeaderByPage 
.dw errnosupport    \.db $00    ;$5269 _IsMatchingLaunchApp 
.dw errnosupport    \.db $00    ;$526C _InitTimer 
.dw errnosupport    \.db $00    ;$526F _KillTimer 
.dw errnosupport    \.db $00    ;$5272 _StartTimer 
.dw errnosupport    \.db $00    ;$5275 _RestartTimer 
.dw errnosupport    \.db $00    ;$5278 _StopTimer 
.dw errnosupport    \.db $00    ;$527B _WaitTimer 
.dw errnosupport    \.db $00    ;$527E _CheckTimer 
.dw errnosupport    \.db $00    ;$5281 _CheckTimerRestart 
.dw errnosupport    \.db $00    ;$5284 _SetVertGraphActive 
.dw errnosupport    \.db $00    ;$5287 _ClearVertGraphActive 
.dw errnosupport    \.db $00    ;$528A _EnableUSBHook 
.dw errnosupport    \.db $00    ;$528D _DisableUSBHook 
.dw errnosupport    \.db $00    ;$5290 _InitUSBDevice 
.dw errnosupport    \.db $00    ;$5293 _KillUSBPeripheral 
.dw errnosupport    \.db $00    ;$5296 _GetCurPlotListOffset2 
.dw errnosupport    \.db $00    ;$5299  
.dw errnosupport    \.db $00    ;$529C _GraphLine 
.dw errnosupport    \.db $00    ;$529F  
.dw errnosupport    \.db $00    ;$52A2  
.dw errnosupport    \.db $00    ;$52A5  
.dw errnosupport    \.db $00    ;$52A8  
.dw errnosupport    \.db $00    ;$52AB  
.dw errnosupport    \.db $00    ;$52AE  
.dw errnosupport    \.db $00    ;$52B1 _ZifTableEditor 
.dw errnosupport    \.db $00    ;$52B4  
.dw errnosupport    \.db $00    ;$52B7 _GetCurPlotOffset 
.dw errnosupport    \.db $00    ;$52BA  
.dw errnosupport    \.db $00    ;$52BD _FindAppName 
.dw errnosupport    \.db $00    ;$52C0  
.dw errnosupport    \.db $00    ;$52C3  
.dw errnosupport    \.db $00    ;$52C6 _UpdateStatPlotLists 
.dw errnosupport    \.db $00    ;$52C9 _GrBufCpyCustom 
.dw errnosupport    \.db $00    ;$52CC  
.dw errnosupport    \.db $00    ;$52CF  
.dw errnosupport    \.db $00    ;$52D2  
.dw errnosupport    \.db $00    ;$52D5 _VDispRealOP1 
.dw errnosupport    \.db $00    ;$52D8 _DispXEqualsNum 
.dw errnosupport    \.db $00    ;$52DB _ResetGraphSettings 
.dw errnosupport    \.db $00    ;$52DE _InitializeVariables 
.dw errnosupport    \.db $00    ;$52E1  
.dw errnosupport    \.db $00    ;$52E4 _DelVarSym 
.dw errnosupport    \.db $00    ;$52E7 _FindAppUpNoCase 
.dw errnosupport    \.db $00    ;$52EA _FindAppDnNoCase 
.dw errnosupport    \.db $00    ;$52ED _DeleteInvalidApps 
.dw errnosupport    \.db $00    ;$52F0 _DeleteApp_Link 
.dw errnosupport    \.db $00    ;$52F3 _CmpSymsNoCase 
.dw errnosupport    \.db $00    ;$52F6 _SetAppRestrictions 
.dw errnosupport    \.db $00    ;$52F9 _RemoveAppRestrictions 
.dw errnosupport    \.db $00    ;$52FC _QueryAppRestrictions 
.dw errnosupport    \.db $00    ;$52FF _DispAppRestrictions 
.dw errnosupport    \.db $00    ;$5302 _SetupHome 
.dw errnosupport    \.db $00    ;$5305 _GRPUTAWAYFull 
.dw errnosupport    \.db $00    ;$5308 _SendSmartPadKeypress 
.dw errnosupport    \.db $00    ;$530B _ToggleUSBSmartPadInput 
.dw errnosupport    \.db $00    ;$530E _IsUSBDeviceConnected 
.dw errnosupport    \.db $00    ;$5311 _RecycleUSB 
.dw errnosupport    \.db $00    ;$5314 _PolarEquToOP1 
.dw errnosupport    \.db $00    ;$5317 _ParamXEquToOP1 
.dw errnosupport    \.db $00    ;$531A _ParamYEquToOP1 
.dw errnosupport    \.db $00    ;$531D _GetRestrictionsOptions 
.dw errnosupport    \.db $00    ;$5320 _DispResetComplete 
.dw errnosupport    \.db $00    ;$5323 _PTTReset 
.dw errnosupport    \.db $00    ;$5326 _FindAppCustom 
.dw errnosupport    \.db $00    ;$5329 _ClearGraphStyles 
.dw errnosupport    \.db $00    ;$532C  
.dw errnosupport    \.db $00    ;$532F  
.dw errnosupport    \.db $00    ;$5332  

;===============================================================================
;84+SE boot 1.00 basecall table is 276 bytes long (92 entries) starting at #8018
#DEFINE BOOT_NUMCALLS 92

bcall_sbase_boot:
;.ds (bcall_sbase_boot+(3*BOOT_NUMCALLS))-$
.dw errnosupport    \.db $00    ;$8018  * MD5Final
.dw errnosupport    \.db $00    ;$801B  * RSAValidate
.dw errnosupport    \.db $00    ;$801E  * BigNumCompare
.dw errnosupport    \.db $00    ;$8021  * WriteAByte
.dw errnosupport    \.db $00    ;$8024  * EraseFlash
.dw errnosupport    \.db $00    ;$8027  * FindFirstCertificateField 
.dw errnosupport    \.db $00    ;$802A  * ZeroToCertificate
.dw errnosupport    \.db $00    ;$802D  * GetCertificateField
.dw errnosupport    \.db $00    ;$8030  * FindGroupedField
.dw donothing       \.db $00    ;$8033  * RET
.dw donothing       \.db $00    ;$8036  * RET
.dw donothing       \.db $00    ;$8039  * RET
.dw donothing       \.db $00    ;$803C  * RET
.dw donothing       \.db $00    ;$803F  * RET
.dw errnosupport    \.db $00    ;$8042  * Mult8By8
.dw errnosupport    \.db $00    ;$8045  * Mult16By8
.dw errnosupport    \.db $00    ;$8048  * Div16By8
.dw errnosupport    \.db $00    ;$804B  * Divide16By16
.dw errnosupport    \.db $00    ;$804E  
.dw errnosupport    \.db $00    ;$8051  * LoadAIndPaged
.dw errnosupport    \.db $00    ;$8054  * FlashToRAM2
.dw errnosupport    \.db $00    ;$8057  * GetCertificateStart
.dw errnosupport    \.db $00    ;$805A  * GetFieldSize
.dw errnosupport    \.db $00    ;$805D  * FindSubField
.dw errnosupport    \.db $00    ;$8060  * EraseCertificateSector
.dw errnosupport    \.db $00    ;$8063  * CheckHeaderKey
.dw errnosupport    \.db $00    ;$8066  
.dw errnosupport    \.db $00    ;$8069  
.dw errnosupport    \.db $00    ;$806C  * Load_LFontV2
.dw errnosupport    \.db $00    ;$806F  * Load_LFontV
.dw errnosupport    \.db $00    ;$8072  * ReceiveOS
.dw errnosupport    \.db $00    ;$8075  * FindOSHeaderSubField
.dw errnosupport    \.db $00    ;$8078  * FindNextCertificateField
.dw errnosupport    \.db $00    ;$807B  * GetByteOrBoot
.dw errnosupport    \.db $00    ;$807E  * GetCalcSerial
.dw errnosupport    \.db $00    ;$8081  
.dw errnosupport    \.db $00    ;$8084  * EraseFlashPage
.dw errnosupport    \.db $00    ;$8087  * WriteFlashUnsafe
.dw errnosupport    \.db $00    ;$808A  * DispBootVer
.dw errnosupport    \.db $00    ;$808D  * MD5Init
.dw errnosupport    \.db $00    ;$8090  * MD5Update
.dw errnosupport    \.db $00    ;$8093  * MarkOSInvalid
.dw errnosupport    \.db $00    ;$8096  
.dw errnosupport    \.db $00    ;$8099  * MarkOSValid
.dw errnosupport    \.db $00    ;$809C  * CheckOSValidated
.dw errnosupport    \.db $00    ;$809F  * SetupAppPubKey
.dw errnosupport    \.db $00    ;$80A2  * SigModR
.dw errnosupport    \.db $00    ;$80A5  * TransformHash
.dw errnosupport    \.db $00    ;$80A8  * IsAppFreeware
.dw errnosupport    \.db $00    ;$80AB  * FindAppheaderSubField
.dw errnosupport    \.db $00    ;$80AE  
.dw errnosupport    \.db $00    ;$80B1  * Div32By16
.dw errnosupport    \.db $00    ;$80B4  
.dw errnosupport    \.db $00    ;$80B7  * GetBootVer
.dw errnosupport    \.db $00    ;$80BA  * GetHWVer
.dw bootxora        \.db $00    ;$80BD  * XorA
.dw errnosupport    \.db $00    ;$80C0  * bignumpowermod17
.dw errnosupport    \.db $00    ;$80C3  * ProdNrPart1
.dw errnosupport    \.db $00    ;$80C6  * WriteAByteSafe
.dw errnosupport    \.db $00    ;$80C9  * WriteFlash
.dw errnosupport    \.db $00    ;$80CC  * SetupDateStampPubKey
.dw errnosupport    \.db $00    ;$80CF  * SetFlashLowerBound
.dw errnosupport    \.db $00    ;$80D2  * LowBatteryBoot
.dw errnosupport    \.db $00    ;$80D5  
.dw errnosupport    \.db $00    ;$80D8  
.dw errnosupport    \.db $00    ;$80DB  
.dw errnosupport    \.db $00    ;$80DE  
.dw errnosupport    \.db $00    ;$80E1  
.dw errnosupport    \.db $00    ;$80E4  
.dw errnosupport    \.db $00    ;$80E7 ** DisplayBootMessage
.dw errnosupport    \.db $00    ;$80EA ** NewLineWrap
.dw errnosupport    \.db $00    ;$80ED  
.dw errnosupport    \.db $00    ;$80F0  
.dw errnosupport    \.db $00    ;$80F3  
.dw errnosupport    \.db $00    ;$80F6  
.dw errnosupport    \.db $00    ;$80F9 ** DispOSPercentage
.dw errnosupport    \.db $00    ;$80FC ** ResetCalc
.dw errnosupport    \.db $00    ;$80FF ** SetupOSPubKey
.dw errnosupport    \.db $00    ;$8102  
.dw errnosupport    \.db $00    ;$8105  
.dw errnosupport    \.db $00    ;$8108  
.dw errnosupport    \.db $00    ;$810B  
.dw errnosupport    \.db $00    ;$810E  
.dw errnosupport    \.db $00    ;$8111 #* Validate2048 
.dw errnosupport    \.db $00    ;$8114  
.dw errnosupport    \.db $00    ;$8117  
.dw errnosupport    \.db $00    ;$811A  
.dw errnosupport    \.db $00    ;$811D  
.dw errnosupport    \.db $00    ;$8120  
.dw errnosupport    \.db $00    ;$8123  
.dw errnosupport    \.db $00    ;$8126  
.dw errnosupport    \.db $00    ;$8129  

;** - These calls are present only on the TI-84+(SE), minimum HW ver 2
;#* - These calls are present only on the TI-84+(SE), minimum HW ver 3

