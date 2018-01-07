.ASSUME ADL=0
;===============================================================================
;OS 2.43 basecall table is 4917 bytes long (1639 entries) starting at $4000
#DEFINE OS_NUMCALLS 1639

bcall_sbase_os:
;.ds (bcall_sbase_os+(3*OS_NUMCALLS))-$
.dl errnosupport            ;$4000 _JErrorNo 
.dl errnosupport            ;$4003 _FontHook 
.dl errnosupport            ;$4006 _call_character_hook 
.dl errnosupport            ;$4009 _ldHLind 
.dl errnosupport            ;$400C _CpHLDE 
.dl errnosupport            ;$400F _DivHLBy10 
.dl errnosupport            ;$4012 _DivHLByA 
.dl errnosupport            ;$4015 _kdbScan 
.dl errnosupport            ;$4018 _GetCSC 
.dl errnosupport            ;$401B _coorMon 
.dl errnosupport            ;$401E _Mon 
.dl errnosupport            ;$4021 _monForceKey 
.dl errnosupport            ;$4024 _sendKPress 
.dl errnosupport            ;$4027 _JForceCmdNoChar 
.dl errnosupport            ;$402A _JForceCmd 
.dl errnosupport            ;$402D _sysErrHandler 
.dl errnosupport            ;$4030 _newContext 
.dl errnosupport            ;$4033 _newContext0 
.dl errnosupport            ;$4036 _cxPutAway 
.dl errnosupport            ;$4039 _cxPutAway2 
.dl errnosupport            ;$403C _cxPPutAway 
.dl errnosupport            ;$403F _cxSizeWind 
.dl errnosupport            ;$4042 _cxErrEP 
.dl errnosupport            ;$4045 _cxMain 
.dl errnosupport            ;$4048 _monErrHand 
.dl errnosupport            ;$404B _AppInit 
.dl errnosupport            ;$404E _resetRam 
.dl errnosupport            ;$4051 _lcd_busy 
.dl errnosupport            ;$4054 _Min 
.dl errnosupport            ;$4057 _Max 
.dl errnosupport            ;$405A  
.dl errnosupport            ;$405D  
.dl errnosupport            ;$4060 _Trunc 
.dl errnosupport            ;$4063 _InvSub 
.dl errnosupport            ;$4066 _Times2 
.dl errnosupport            ;$4069 _Plus1 
.dl errnosupport            ;$406C _Minus1 
.dl errnosupport            ;$406F _FPSub 
.dl errnosupport            ;$4072 _FPAdd 
.dl errnosupport            ;$4075 _DToR 
.dl errnosupport            ;$4078 _RToD 
.dl errnosupport            ;$407B _Cube 
.dl errnosupport            ;$407E _TimesPt5 
.dl errnosupport            ;$4081 _FPSquare 
.dl errnosupport            ;$4084 _FPMult 
.dl errnosupport            ;$4087 _LJRND 
.dl errnosupport            ;$408A _InvOP1SC 
.dl errnosupport            ;$408D _InvOP1S 
.dl errnosupport            ;$4090 _InvOP2S 
.dl errnosupport            ;$4093 _frac 
.dl errnosupport            ;$4096 _fprecip 
.dl errnosupport            ;$4099 _fpdiv 
.dl errnosupport            ;$409C _SqRoot 
.dl errnosupport            ;$409F _RndGuard 
.dl errnosupport            ;$40A2 _RnFx 
.dl errnosupport            ;$40A5 _int 
.dl errnosupport            ;$40A8 _Round 
.dl errnosupport            ;$40AB _LnX 
.dl errnosupport            ;$40AE _LogX 
.dl errnosupport            ;$40B1 _LJNORND 
.dl errnosupport            ;$40B4 _EToX 
.dl errnosupport            ;$40B7 _TenX 
.dl errnosupport            ;$40BA _SinCosRad 
.dl errnosupport            ;$40BD _Sin 
.dl errnosupport            ;$40C0 _cos 
.dl errnosupport            ;$40C3 _Tan 
.dl errnosupport            ;$40C6 _SinHCosH 
.dl errnosupport            ;$40C9 _TanH 
.dl errnosupport            ;$40CC _cosh 
.dl errnosupport            ;$40CF _SinH 
.dl errnosupport            ;$40D2 _ACosRad 
.dl errnosupport            ;$40D5 _ATanRad 
.dl errnosupport            ;$40D8 _ATan2Rad 
.dl errnosupport            ;$40DB _ASinRad 
.dl errnosupport            ;$40DE _ACos 
.dl errnosupport            ;$40E1 _ATan 
.dl errnosupport            ;$40E4 _ASin 
.dl errnosupport            ;$40E7 _ATan2 
.dl errnosupport            ;$40EA _ATanH 
.dl errnosupport            ;$40ED _ASinH 
.dl errnosupport            ;$40F0 _ACosH 
.dl errnosupport            ;$40F3 _PtoR 
.dl errnosupport            ;$40F6 _RToP 
.dl errnosupport            ;$40F9 _HLTimes9 
.dl errnosupport            ;$40FC _CkOP1Cplx 
.dl errnosupport            ;$40FF _CkOP1Real 
.dl errnosupport            ;$4102 _Angle 
.dl errnosupport            ;$4105 _COP1Set0 
.dl errnosupport            ;$4108 _CpOP4OP3 
.dl errnosupport            ;$410B _Mov9OP2Cp 
.dl errnosupport            ;$410E _AbsO1O2Cp 
.dl errnosupport            ;$4111 _cpop1op2 
.dl errnosupport            ;$4114 _OP3ToOP4 
.dl errnosupport            ;$4117 _OP1ToOP4 
.dl errnosupport            ;$411A _OP2ToOP4 
.dl errnosupport            ;$411D _OP4ToOP2 
.dl errnosupport            ;$4120  
.dl errnosupport            ;$4123 _OP1ToOP3 
.dl errnosupport            ;$4126 _OP5ToOP2 
.dl errnosupport            ;$4129 _OP5ToOP6 
.dl errnosupport            ;$412C _OP5ToOP4 
.dl errnosupport            ;$412F _OP1ToOP2 
.dl errnosupport            ;$4132 _OP6ToOP2 
.dl errnosupport            ;$4135 _OP6ToOP1 
.dl errnosupport            ;$4138 _OP4ToOP1 
.dl errnosupport            ;$413B _OP5ToOP1 
.dl errnosupport            ;$413E _OP3ToOP1 
.dl errnosupport            ;$4141 _OP6ToOP5 
.dl errnosupport            ;$4144 _OP4ToOP5 
.dl errnosupport            ;$4147 _OP3ToOP5 
.dl errnosupport            ;$414A _OP2ToOP5 
.dl errnosupport            ;$414D _OP2ToOP6 
.dl errnosupport            ;$4150 _OP1ToOP6 
.dl errnosupport            ;$4153 _OP1ToOP5 
.dl errnosupport            ;$4156 _OP2ToOP1 
.dl errnosupport            ;$4159 _Mov11B 
.dl errnosupport            ;$415C _Mov10B 
.dl errnosupport            ;$415F _Mov9B 
.dl errnosupport            ;$4162 _mov9B2 
.dl errnosupport            ;$4165 _Mov8B 
.dl errnosupport            ;$4168 _Mov7B 
.dl errnosupport            ;$416B _Mov7B2 
.dl errnosupport            ;$416E _OP2ToOP3 
.dl errnosupport            ;$4171 _OP4ToOP3 
.dl errnosupport            ;$4174 _OP5ToOP3 
.dl errnosupport            ;$4177 _OP4ToOP6 
.dl errnosupport            ;$417A _Mov9ToOP1 
.dl errnosupport            ;$417D _Mov9OP1OP2 
.dl errnosupport            ;$4180 _Mov9ToOP2 
.dl errnosupport            ;$4183 _MovFrOP1 
.dl errnosupport            ;$4186 _OP4Set1 
.dl errnosupport            ;$4189 _OP3Set1 
.dl errnosupport            ;$418C _OP2Set8 
.dl errnosupport            ;$418F _OP2Set5 
.dl errnosupport            ;$4192 _OP2SetA 
.dl errnosupport            ;$4195 _OP2Set4 
.dl errnosupport            ;$4198 _OP2Set3 
.dl errnosupport            ;$419B _OP1Set1 
.dl errnosupport            ;$419E _OP1Set4 
.dl errnosupport            ;$41A1 _OP1Set3 
.dl errnosupport            ;$41A4 _OP3Set2 
.dl errnosupport            ;$41A7 _OP1Set2 
.dl errnosupport            ;$41AA _OP2Set2 
.dl errnosupport            ;$41AD _OP2Set1 
.dl errnosupport            ;$41B0 _Zero16D 
.dl errnosupport            ;$41B3 _OP5Set0 
.dl errnosupport            ;$41B6 _OP4Set0 
.dl errnosupport            ;$41B9 _OP3Set0 
.dl errnosupport            ;$41BC _OP2Set0 
.dl errnosupport            ;$41BF _OP1Set0 
.dl errnosupport            ;$41C2 _OPSet0 
.dl errnosupport            ;$41C5 _ZeroOP1 
.dl errnosupport            ;$41C8 _ZeroOP2 
.dl errnosupport            ;$41CB _ZeroOP3 
.dl errnosupport            ;$41CE _ZeroOP 
.dl errnosupport            ;$41D1 _ClrLp 
.dl errnosupport            ;$41D4 _ShRAcc 
.dl errnosupport            ;$41D7 _ShLAcc 
.dl errnosupport            ;$41DA _ShR18 
.dl errnosupport            ;$41DD _SHR18A 
.dl errnosupport            ;$41E0 _SHR16 
.dl errnosupport            ;$41E3 _SHR14 
.dl errnosupport            ;$41E6 _SHL16 
.dl errnosupport            ;$41E9 _SHL14 
.dl errnosupport            ;$41EC _SRDO1 
.dl errnosupport            ;$41EF _SHRDRND 
.dl errnosupport            ;$41F2 _MANTPA 
.dl errnosupport            ;$41F5 _ADDPROP 
.dl errnosupport            ;$41F8 _ADDPROPLP 
.dl errnosupport            ;$41FB _ADD16D 
.dl errnosupport            ;$41FE _ADD14D 
.dl errnosupport            ;$4201 _SUB16D 
.dl errnosupport            ;$4204 _SUB14D 
.dl errnosupport            ;$4207 _OP2ExOP6 
.dl errnosupport            ;$420A _OP5ExOP6 
.dl errnosupport            ;$420D _OP1ExOP5 
.dl errnosupport            ;$4210 _OP1ExOP6 
.dl errnosupport            ;$4213 _OP2ExOP4 
.dl errnosupport            ;$4216 _OP2ExOP5 
.dl errnosupport            ;$4219 _OP1ExOP3 
.dl errnosupport            ;$421C _OP1ExOP4 
.dl errnosupport            ;$421F _OP1ExOP2 
.dl errnosupport            ;$4222 _ExLp 
.dl errnosupport            ;$4225 _CkOP1C0 
.dl errnosupport            ;$4228 _CkOP1FP0 
.dl errnosupport            ;$422B _CkOP2FP0 
.dl errnosupport            ;$422E _PosNo0Int 
.dl errnosupport            ;$4231 _CKPosInt 
.dl errnosupport            ;$4234 _CKInt 
.dl errnosupport            ;$4237 _CKOdd 
.dl errnosupport            ;$423A _CKOP1M 
.dl errnosupport            ;$423D _GETCONOP1 
.dl errnosupport            ;$4240 _GETCONOP2 
.dl errnosupport            ;$4243 _PIDIV2 
.dl errnosupport            ;$4246 _PIDIV4 
.dl errnosupport            ;$4249 _PItimes2 
.dl errnosupport            ;$424C _PI 
.dl errnosupport            ;$424F _ExpToHex 
.dl errnosupport            ;$4252 _OP1ExpToDec 
.dl errnosupport            ;$4255 _ckop2pos 
.dl errnosupport            ;$4258 _CkOP1Pos 
.dl errnosupport            ;$425B _ClrOP2S 
.dl errnosupport            ;$425E _ClrOP1S 
.dl errnosupport            ;$4261 _FDIV100 
.dl errnosupport            ;$4264 _FDIV10 
.dl errnosupport            ;$4267 _DecO1Exp 
.dl errnosupport            ;$426A _INCO1EXP 
.dl errnosupport            ;$426D _INCEXP 
.dl errnosupport            ;$4270 _CkValidNum 
.dl errnosupport            ;$4273 _GETEXP 
.dl errnosupport            ;$4276 _HTimesL 
.dl errnosupport            ;$4279 _EOP1NotReal 
.dl errnosupport            ;$427C _ThetaName 
.dl errnosupport            ;$427F _RName 
.dl errnosupport            ;$4282 _REGEQNAME 
.dl errnosupport            ;$4285 _RECURNNAME 
.dl errnosupport            ;$4288 _XName 
.dl errnosupport            ;$428B _YName 
.dl errnosupport            ;$428E _TName 
.dl errnosupport            ;$4291 _REALNAME 
.dl errnosupport            ;$4294 _SETesTOfps 
.dl errnosupport            ;$4297 _markTableDirty 
.dl errnosupport            ;$429A _OP1MOP2EXP 
.dl errnosupport            ;$429D _OP1EXPMinusE 
.dl errnosupport            ;$42A0 _CHKERRBREAK 
.dl errnosupport            ;$42A3 _isA2ByteTok 
.dl errnosupport            ;$42A6 _GETLASTENTRY 
.dl errnosupport            ;$42A9 _GETLASTENTRYPTR 
.dl errnosupport            ;$42AC _REGCLRCHNG 
.dl errnosupport            ;$42AF _RESETWINTOP 
.dl errnosupport            ;$42B2 _SetYUp 
.dl errnosupport            ;$42B5 _SetXUp 
.dl errnosupport            ;$42B8 _ISO1NONTLSTorPROG 
.dl errnosupport            ;$42BB _ISO1NONTEMPLST 
.dl errnosupport            ;$42BE _IS_A_LSTorCLST 
.dl errnosupport            ;$42C1 _CHK_HL_999 
.dl errnosupport            ;$42C4 _equ_or_newequ 
.dl errnosupport            ;$42C7 _errd_op1notpos 
.dl errnosupport            ;$42CA _ErrD_OP1Not_R 
.dl errnosupport            ;$42CD _ErrD_OP1NotPosInt 
.dl errnosupport            ;$42D0 _ErrD_OP1_LE_0 
.dl errnosupport            ;$42D3 _ErrD_OP1_0 
.dl errnosupport            ;$42D6 _FINDSYM_GET_SIZE 
.dl errnosupport            ;$42D9 _STO_STATVAR 
.dl errnosupport            ;$42DC _Rcl_StatVar 
.dl errnosupport            ;$42DF _CkOP2Real 
.dl errnosupport            ;$42E2 _GET_X_INDIRECT 
.dl errnosupport            ;$42E5 _MemChk 
.dl errnosupport            ;$42E8 _CMPPRGNAMLEN1 
.dl errnosupport            ;$42EB _CMPPRGNAMLEN 
.dl errnosupport            ;$42EE _FINDPROGSYM 
.dl errnosupport            ;$42F1 _ChkFindSym 
.dl errnosupport            ;$42F4 _FindSym 
.dl errnosupport            ;$42F7 _InsertMem 
.dl errnosupport            ;$42FA _INSERTMEMA 
.dl errnosupport            ;$42FD _EnoughMem 
.dl errnosupport            ;$4300 _CMPMEMNEED 
.dl errnosupport            ;$4303 _CREATEPVAR4 
.dl errnosupport            ;$4306 _CREATEPVAR3 
.dl errnosupport            ;$4309 _CREATEVAR3 
.dl errnosupport            ;$430C _CreateCplx 
.dl errnosupport            ;$430F _CreateReal 
.dl errnosupport            ;$4312 _CreateTempRList 
.dl errnosupport            ;$4315 _CreateRList 
.dl errnosupport            ;$4318 _CREATETCLIST 
.dl errnosupport            ;$431B _CreateCList 
.dl errnosupport            ;$431E _CreateTempRMat 
.dl errnosupport            ;$4321 _CreateRMat 
.dl errnosupport            ;$4324 _CreateTempString 
.dl errnosupport            ;$4327 _CreateStrng 
.dl errnosupport            ;$432A _Create0Equ 
.dl errnosupport            ;$432D _CreateTempEqu 
.dl errnosupport            ;$4330 _CreateEqu 
.dl errnosupport            ;$4333 _CreatePict 
.dl errnosupport            ;$4336 _CreateGDB 
.dl errnosupport            ;$4339 _CreateProg 
.dl errnosupport            ;$433C _CHKDEL 
.dl errnosupport            ;$433F _CHKDELA 
.dl errnosupport            ;$4342 _ADJPARSER 
.dl errnosupport            ;$4345 _ADJMATH 
.dl errnosupport            ;$4348 _ADJM7 
.dl errnosupport            ;$434B _DELMEMA 
.dl errnosupport            ;$434E _GET_FORM_NUM 
.dl errnosupport            ;$4351 _DelVar 
.dl errnosupport            ;$4354 _DELVARIO 
.dl errnosupport            ;$4357 _DelMem 
.dl errnosupport            ;$435A _DELVAR3D 
.dl errnosupport            ;$435D _DELVAR3C 
.dl errnosupport            ;$4360 _DELVAR3DC 
.dl errnosupport            ;$4363 _IsFixedName 
.dl errnosupport            ;$4366 _DelVarEntry 
.dl errnosupport            ;$4369 _DataSizeA 
.dl errnosupport            ;$436C _DataSize 
.dl errnosupport            ;$436F _POPMCPLXO1 
.dl errnosupport            ;$4372 _POPMCPLX 
.dl errnosupport            ;$4375 _MOVCPLX 
.dl errnosupport            ;$4378 _popOP5 
.dl errnosupport            ;$437B _popOP3 
.dl errnosupport            ;$437E _popOP1 
.dl errnosupport            ;$4381 _PopRealO6 
.dl errnosupport            ;$4384 _PopRealO5 
.dl errnosupport            ;$4387 _PopRealO4 
.dl errnosupport            ;$438A _PopRealO3 
.dl errnosupport            ;$438D _PopRealO2 
.dl errnosupport            ;$4390 _PopRealO1 
.dl errnosupport            ;$4393 _PopReal 
.dl errnosupport            ;$4396 _FPOPCPLX 
.dl errnosupport            ;$4399 _FPOPREAL 
.dl errnosupport            ;$439C _FPOPFPS 
.dl errnosupport            ;$439F _DeallocFPS 
.dl errnosupport            ;$43A2 _DeallocFPS1 
.dl errnosupport            ;$43A5 _AllocFPS 
.dl errnosupport            ;$43A8 _AllocFPS1 
.dl errnosupport            ;$43AB _PushRealO6 
.dl errnosupport            ;$43AE _PushRealO5 
.dl errnosupport            ;$43B1 _PushRealO4 
.dl errnosupport            ;$43B4 _PushRealO3 
.dl errnosupport            ;$43B7 _PushRealO2 
.dl errnosupport            ;$43BA _PushRealO1 
.dl errnosupport            ;$43BD _PushReal 
.dl errnosupport            ;$43C0 _PushOP5 
.dl errnosupport            ;$43C3 _PushOP3 
.dl errnosupport            ;$43C6 _PUSHMCPLXO3 
.dl errnosupport            ;$43C9 _PushOP1 
.dl errnosupport            ;$43CC _PUSHMCPLXO1 
.dl errnosupport            ;$43CF _PUSHMCPLX 
.dl errnosupport            ;$43D2 _ExMCplxO1 
.dl errnosupport            ;$43D5 _Exch9 
.dl errnosupport            ;$43D8 _CpyTo1FPS11 
.dl errnosupport            ;$43DB _CpyTo2FPS5 
.dl errnosupport            ;$43DE _CpyTo1FPS5 
.dl errnosupport            ;$43E1 _CpyTo2FPS6 
.dl errnosupport            ;$43E4 _CpyTo1FPS6 
.dl errnosupport            ;$43E7 _CpyTo2FPS7 
.dl errnosupport            ;$43EA _CpyTo1FPS7 
.dl errnosupport            ;$43ED _CpyTo1FPS8 
.dl errnosupport            ;$43F0 _CpyTo2FPS8 
.dl errnosupport            ;$43F3 _CpyTo1FPS10 
.dl errnosupport            ;$43F6 _CpyTo1FPS9 
.dl errnosupport            ;$43F9 _CpyTo2FPS4 
.dl errnosupport            ;$43FC _CpyTo6FPS3 
.dl errnosupport            ;$43FF _CpyTo6FPS2 
.dl errnosupport            ;$4402 _CpyTo2FPS3 
.dl errnosupport            ;$4405 _CPYCTO1FPS3 
.dl errnosupport            ;$4408 _CpyTo1FPS3 
.dl errnosupport            ;$440B _CPYFPS3 
.dl errnosupport            ;$440E _CpyTo1FPS4 
.dl errnosupport            ;$4411 _CpyTo3FPS2 
.dl errnosupport            ;$4414 _CpyTo5FPST 
.dl errnosupport            ;$4417 _CpyTo6FPST 
.dl errnosupport            ;$441A _CpyTo4FPST 
.dl errnosupport            ;$441D _CpyTo3FPST 
.dl errnosupport            ;$4420 _CpyTo2FPST 
.dl errnosupport            ;$4423 _CpyTo1FPST 
.dl errnosupport            ;$4426 _CPYFPST 
.dl errnosupport            ;$4429 _CpyStack 
.dl errnosupport            ;$442C _CpyTo3FPS1 
.dl errnosupport            ;$442F _CpyTo2FPS1 
.dl errnosupport            ;$4432 _CpyTo1FPS1 
.dl errnosupport            ;$4435 _CPYFPS1 
.dl errnosupport            ;$4438 _CpyTo2FPS2 
.dl errnosupport            ;$443B _CpyTo1FPS2 
.dl errnosupport            ;$443E _CPYFPS2 
.dl errnosupport            ;$4441 _CpyO3ToFPST 
.dl errnosupport            ;$4444 _CpyO2ToFPST 
.dl errnosupport            ;$4447 _CpyO6ToFPST 
.dl errnosupport            ;$444A _CpyO1ToFPST 
.dl errnosupport            ;$444D _CpyToFPST 
.dl errnosupport            ;$4450 _CpyToStack 
.dl errnosupport            ;$4453 _CpyO3ToFPS1 
.dl errnosupport            ;$4456 _CpyO5ToFPS1 
.dl errnosupport            ;$4459 _CpyO2ToFPS1 
.dl errnosupport            ;$445C _CpyO1ToFPS1 
.dl errnosupport            ;$445F _CpyToFPS1 
.dl errnosupport            ;$4462 _CpyO2ToFPS2 
.dl errnosupport            ;$4465 _CpyO3ToFPS2 
.dl errnosupport            ;$4468 _CpyO6ToFPS2 
.dl errnosupport            ;$446B _CpyO1ToFPS2 
.dl errnosupport            ;$446E _CpyToFPS2 
.dl errnosupport            ;$4471 _CpyO5ToFPS3 
.dl errnosupport            ;$4474 _CpyO2ToFPS3 
.dl errnosupport            ;$4477 _CpyO1ToFPS3 
.dl errnosupport            ;$447A _CpyToFPS3 
.dl errnosupport            ;$447D _CpyO1ToFPS6 
.dl errnosupport            ;$4480 _CpyO1ToFPS7 
.dl errnosupport            ;$4483 _CpyO1ToFPS5 
.dl errnosupport            ;$4486 _CpyO2ToFPS4 
.dl errnosupport            ;$4489 _CpyO1ToFPS4 
.dl errnosupport            ;$448C _ErrNotEnoughMem 
.dl errnosupport            ;$448F _FPSMINUS9 
.dl errnosupport            ;$4492 _HLMINUS9 
.dl errnosupport            ;$4495 _ErrOverflow 
.dl errnosupport            ;$4498 _ErrDivBy0 
.dl errnosupport            ;$449B _ErrSingularMat 
.dl errnosupport            ;$449E _ErrDomain 
.dl errnosupport            ;$44A1 _ErrIncrement 
.dl errnosupport            ;$44A4 _ErrNon_Real 
.dl errnosupport            ;$44A7 _ErrSyntax 
.dl errnosupport            ;$44AA _ErrDataType 
.dl errnosupport            ;$44AD _ErrArgument 
.dl errnosupport            ;$44B0 _ErrDimMismatch 
.dl errnosupport            ;$44B3 _ErrDimension 
.dl errnosupport            ;$44B6 _ErrUndefined 
.dl errnosupport            ;$44B9 _ErrMemory 
.dl errnosupport            ;$44BC _ErrInvalid 
.dl errnosupport            ;$44BF _ErrBreak 
.dl errnosupport            ;$44C2 _ErrStat 
.dl errnosupport            ;$44C5 _ErrSignChange 
.dl errnosupport            ;$44C8 _ErrIterations 
.dl errnosupport            ;$44CB _ErrBadGuess 
.dl errnosupport            ;$44CE _ErrTolTooSmall 
.dl errnosupport            ;$44D1 _ErrStatPlot 
.dl errnosupport            ;$44D4 _ErrLinkXmit 
.dl errnosupport            ;$44D7 _JError 
.dl errnosupport            ;$44DA _noErrorEntry 
.dl errnosupport            ;$44DD _pushErrorHandleR 
.dl errnosupport            ;$44E0 _popErrorHandleR 
.dl errnosupport            ;$44E3 _strcopy 
.dl errnosupport            ;$44E6 _strCat 
.dl errnosupport            ;$44E9 _isInSet 
.dl errnosupport            ;$44EC _sDone 
.dl errnosupport            ;$44EF _serrort 
.dl errnosupport            ;$44F2 _sNameEq 
.dl errnosupport            ;$44F5 _sUnderScr 
.dl errnosupport            ;$44F8 _sFAIL 
.dl errnosupport            ;$44FB _sName 
.dl errnosupport            ;$44FE _sOK 
.dl errnosupport            ;$4501 _PutMap 
.dl errnosupport            ;$4504 _PutC 
.dl DispHL                  ;$4507 _DispHL 
.dl errnosupport            ;$450A _PutS 
.dl errnosupport            ;$450D _putpsb 
.dl errnosupport            ;$4510 _PutPS 
.dl errnosupport            ;$4513 _wputps 
.dl errnosupport            ;$4516 _putbuf 
.dl errnosupport            ;$4519 _putbuf1 
.dl errnosupport            ;$451C _wputc 
.dl errnosupport            ;$451F _wputs 
.dl errnosupport            ;$4522 _wputsEOL 
.dl errnosupport            ;$4525 _wdispEOL 
.dl errnosupport            ;$4528 _whomeup 
.dl errnosupport            ;$452B _setNumWindow 
.dl errnosupport            ;$452E _newline 
.dl errnosupport            ;$4531 _moveDown 
.dl errnosupport            ;$4534 _scrollUp 
.dl errnosupport            ;$4537 _shrinkWindow 
.dl errnosupport            ;$453A _moveUp 
.dl errnosupport            ;$453D _scrollDown 
.dl ClrLCDFull              ;$4540 _ClrLCDFull 
.dl errnosupport            ;$4543 _ClrLCD 
.dl ClrScrnFull             ;$4546 _ClrScrnFull 
.dl errnosupport            ;$4549 _ClrScrn 
.dl ClrTxtShd               ;$454C _ClrTxtShd 
.dl errnosupport            ;$454F _ClrWindow 
.dl errnosupport            ;$4552 _EraseEOL 
.dl errnosupport            ;$4555 _EraseEOW 
.dl errnosupport            ;$4558 _HomeUp 
.dl errnosupport            ;$455B _getcurloc 
.dl errnosupport            ;$455E _VPutMap 
.dl errnosupport            ;$4561 _VPutS 
.dl errnosupport            ;$4564 _VPutSN 
.dl errnosupport            ;$4567 _vputsnG 
.dl errnosupport            ;$456A _vputsnT 
.dl errnosupport            ;$456D _RunIndicOn 
.dl errnosupport            ;$4570 _RunIndicOff 
.dl errnosupport            ;$4573 _saveCmdShadow 
.dl errnosupport            ;$4576 _saveShadow 
.dl errnosupport            ;$4579 _rstrShadow 
.dl errnosupport            ;$457C _rstrpartial 
.dl errnosupport            ;$457F _rstrCurRow 
.dl errnosupport            ;$4582 _rstrUnderMenu 
.dl errnosupport            ;$4585 _rstrbotrow 
.dl errnosupport            ;$4588 _saveTR 
.dl errnosupport            ;$458B _restoreTR 
.dl errnosupport            ;$458E _GetKeyPress 
.dl errnosupport            ;$4591 _GetTokLen 
.dl errnosupport            ;$4594 _GET_TOK_STRNG 
.dl errnosupport            ;$4597 _GETTOKSTRING 
.dl errnosupport            ;$459A _PUTBPATBUF2 
.dl errnosupport            ;$459D _PUTBPATBUF 
.dl errnosupport            ;$45A0 _putbPAT 
.dl errnosupport            ;$45A3 _putcCheckScrolL 
.dl errnosupport            ;$45A6 _DispEOL 
.dl errnosupport            ;$45A9 _fdispEOL 
.dl errnosupport            ;$45AC _MAKEROWCMD 
.dl errnosupport            ;$45AF _TOTOSTRP 
.dl errnosupport            ;$45B2 _SETVARNAME 
.dl errnosupport            ;$45B5 _DispDone 
.dl errnosupport            ;$45B8 _finishoutput 
.dl errnosupport            ;$45BB _curBlink 
.dl errnosupport            ;$45BE _CursorOff 
.dl errnosupport            ;$45C1 _hideCursor 
.dl errnosupport            ;$45C4 _CursorOn 
.dl errnosupport            ;$45C7 _showCursor 
.dl errnosupport            ;$45CA _KeyToString 
.dl errnosupport            ;$45CD _PULLDOWNCHK 
.dl errnosupport            ;$45D0 _MenuCatCommon 
.dl errnosupport            ;$45D3 _ZIfCatalog 
.dl errnosupport            ;$45D6 _ZIfMatrixMenu 
.dl errnosupport            ;$45D9 _LoadMenuNum 
.dl errnosupport            ;$45DC _LoadMenuNumL 
.dl errnosupport            ;$45DF _MenCatRet 
.dl errnosupport            ;$45E2 _MenuSwitchContext 
.dl errnosupport            ;$45E5 _MenuEdKey 
.dl errnosupport            ;$45E8 _BackUpGraphSettings 
.dl errnosupport            ;$45EB _notalphnum 
.dl errnosupport            ;$45EE _SaveSavedFlags 
.dl errnosupport            ;$45F1 _SetMenuFlags 
.dl errnosupport            ;$45F4 _RstrSomeFlags 
.dl errnosupport            ;$45F7 _RstrOScreen 
.dl errnosupport            ;$45FA _SaveOScreen 
.dl errnosupport            ;$45FD _dispListName 
.dl errnosupport            ;$4600 _PrevContext 
.dl errnosupport            ;$4603 _CompareContext 
.dl errnosupport            ;$4606 _AdrMRow 
.dl errnosupport            ;$4609 _AdrMEle 
.dl errnosupport            ;$460C _GETMATOP1A 
.dl errnosupport            ;$460F _GETM1TOOP1 
.dl errnosupport            ;$4612 _GETM1TOP1A 
.dl errnosupport            ;$4615 _GetMToOP1 
.dl errnosupport            ;$4618 _PUTTOM1A 
.dl errnosupport            ;$461B _PUTTOMA1 
.dl errnosupport            ;$461E _PutToMat 
.dl errnosupport            ;$4621 _MAT_EL_DIV 
.dl errnosupport            ;$4624 _CMATFUN 
.dl errnosupport            ;$4627 _ROWECH_POLY 
.dl errnosupport            ;$462A _ROWECHELON 
.dl errnosupport            ;$462D _AdrLEle 
.dl errnosupport            ;$4630 _GETL1TOOP1 
.dl errnosupport            ;$4633 _GETL1TOP1A 
.dl errnosupport            ;$4636 _GetLToOP1 
.dl errnosupport            ;$4639 _GETL1TOOP2 
.dl errnosupport            ;$463C _GETL1TOP2A 
.dl errnosupport            ;$463F _GETL2TOP1A 
.dl errnosupport            ;$4642 _PUTTOLA1 
.dl errnosupport            ;$4645 _PutToL 
.dl errnosupport            ;$4648 _MAXMINLST 
.dl errnosupport            ;$464B _LLOW 
.dl errnosupport            ;$464E _LHIGH 
.dl errnosupport            ;$4651 _LSUM 
.dl errnosupport            ;$4654 CUMSUM 
.dl errnosupport            ;$4657 _ToFrac 
.dl errnosupport            ;$465A _SEQSET 
.dl errnosupport            ;$465D _SEQSOLVE 
.dl errnosupport            ;$4660 _CMP_NUM_INIT 
.dl errnosupport            ;$4663 _BinOPExec 
.dl errnosupport            ;$4666 _EXMEAN1 
.dl errnosupport            ;$4669 _SET2MVLPTRS 
.dl errnosupport            ;$466C _SETMAT1 
.dl errnosupport            ;$466F _CREATETLIST 
.dl errnosupport            ;$4672 _UnOPExec 
.dl errnosupport            ;$4675 _ThreeExec 
.dl errnosupport            ;$4678 _RESTOREERRNO 
.dl errnosupport            ;$467B _FourExec 
.dl errnosupport            ;$467E _FiveExec 
.dl errnosupport            ;$4681 _CPYTO2ES1 
.dl errnosupport            ;$4684 _CPYTO6ES1 
.dl errnosupport            ;$4687 _CPYTO1ES1 
.dl errnosupport            ;$468A _CPYTO3ES1 
.dl errnosupport            ;$468D _CPYTO3ES2 
.dl errnosupport            ;$4690 _CPYTO2ES2 
.dl errnosupport            ;$4693 _CPYTO1ES2 
.dl errnosupport            ;$4696 _CPYTO2ES3 
.dl errnosupport            ;$4699 _CPYTO1ES3 
.dl errnosupport            ;$469C _CPYTO3ES4 
.dl errnosupport            ;$469F _CPYTO6ES3 
.dl errnosupport            ;$46A2 _CPYTO2ES4 
.dl errnosupport            ;$46A5 _CPYTO1ES4 
.dl errnosupport            ;$46A8 _CPYTO2ES5 
.dl errnosupport            ;$46AB _CPYTO1ES5 
.dl errnosupport            ;$46AE _CPYTO4EST 
.dl errnosupport            ;$46B1 _CPYTO2EST 
.dl errnosupport            ;$46B4 _CPYTO1EST 
.dl errnosupport            ;$46B7 _CPYTO2ES6 
.dl errnosupport            ;$46BA _CPYTO1ES6 
.dl errnosupport            ;$46BD _CPYTO2ES7 
.dl errnosupport            ;$46C0 _CPYTO1ES7 
.dl errnosupport            ;$46C3 _CPYTO2ES8 
.dl errnosupport            ;$46C6 _CPYTO1ES8 
.dl errnosupport            ;$46C9 _CPYTO1ES9 
.dl errnosupport            ;$46CC _CPYTO2ES9 
.dl errnosupport            ;$46CF _CPYTO2ES10 
.dl errnosupport            ;$46D2 _CPYTO1ES10 
.dl errnosupport            ;$46D5 _CPYTO2ES11 
.dl errnosupport            ;$46D8 _CPYTO1ES11 
.dl errnosupport            ;$46DB _CPYTO2ES12 
.dl errnosupport            ;$46DE _CPYTO1ES12 
.dl errnosupport            ;$46E1 _CPYTO2ES13 
.dl errnosupport            ;$46E4 _CPYTO1ES13 
.dl errnosupport            ;$46E7 _CPYTO1ES14 
.dl errnosupport            ;$46EA _CPYTO1ES16 
.dl errnosupport            ;$46ED _CPYTO1ES17 
.dl errnosupport            ;$46F0 _CPYTO1ES18 
.dl errnosupport            ;$46F3 _CPYTO1ES15 
.dl errnosupport            ;$46F6 _CPYTO2ES15 
.dl errnosupport            ;$46F9 _CPYO1TOEST 
.dl errnosupport            ;$46FC _CPYO1TOES1 
.dl errnosupport            ;$46FF _CPYO6TOES1 
.dl errnosupport            ;$4702 _CPYO6TOES3 
.dl errnosupport            ;$4705 _CPYO1TOES2 
.dl errnosupport            ;$4708 _CPYO2TOES2 
.dl errnosupport            ;$470B _CPYO1TOES3 
.dl errnosupport            ;$470E _CPYO1TOES4 
.dl errnosupport            ;$4711 _CPYO1TOES5 
.dl errnosupport            ;$4714 _CPYO1TOES6 
.dl errnosupport            ;$4717 _CPYO1TOES7 
.dl errnosupport            ;$471A _CPYO2TOES4 
.dl errnosupport            ;$471D _CPYO2TOES5 
.dl errnosupport            ;$4720 _CPYO2TOES6 
.dl errnosupport            ;$4723 _CPYO2TOES7 
.dl errnosupport            ;$4726 _CPYO2TOES8 
.dl errnosupport            ;$4729 _CPYO2TOES9 
.dl errnosupport            ;$472C _CPYO1TOES8 
.dl errnosupport            ;$472F _CPYO1TOES9 
.dl errnosupport            ;$4732 _CPYO1TOES10 
.dl errnosupport            ;$4735 _CPYO1TOES11 
.dl errnosupport            ;$4738 _CPYO1TOES12 
.dl errnosupport            ;$473B _CPYO1TOES13 
.dl errnosupport            ;$473E _CPYO1TOES14 
.dl errnosupport            ;$4741 _CPYO1TOES15 
.dl errnosupport            ;$4744 _EVALF3A 
.dl errnosupport            ;$4747 _GetK 
.dl errnosupport            ;$474A _setTitle 
.dl errnosupport            ;$474D _dispVarVal 
.dl errnosupport            ;$4750 _RecallEd 
.dl errnosupport            ;$4753 _createNumEditBuf 
.dl errnosupport            ;$4756 _ProcessBufKeys 
.dl errnosupport            ;$4759 _CallCommon 
.dl errnosupport            ;$475C _CommonKeys 
.dl errnosupport            ;$475F _Leftmore 
.dl errnosupport            ;$4762 _fDel 
.dl errnosupport            ;$4765 _fClear 
.dl errnosupport            ;$4768 _finsDisp 
.dl errnosupport            ;$476B _FinsDisp02 
.dl errnosupport            ;$476E _closeeditbufnor 
.dl errnosupport            ;$4771 _releaseBuffer 
.dl errnosupport            ;$4774 _varnameToOP1hl 
.dl errnosupport            ;$4777 _nameToOP1 
.dl errnosupport            ;$477A _numPPutAway 
.dl errnosupport            ;$477D _numRedisp 
.dl errnosupport            ;$4780 _numError02 
.dl errnosupport            ;$4783 _Load_SFont 
.dl errnosupport            ;$4786 _SFont_Len 
.dl errnosupport            ;$4789 _InitNumVec 
.dl errnosupport            ;$478C _SetXXOP1 
.dl errnosupport            ;$478F _SetXXOP2 
.dl errnosupport            ;$4792 _SetXXXXOP2 
.dl errnosupport            ;$4795 _UCLineS 
.dl errnosupport            ;$4798 _CLine 
.dl errnosupport            ;$479B _CLineS 
.dl errnosupport            ;$479E _XRootY 
.dl errnosupport            ;$47A1 _YToX 
.dl errnosupport            ;$47A4 _ZmStats 
.dl errnosupport            ;$47A7 _POINT_STAT_HLP 
.dl errnosupport            ;$47AA _DRAWSPLOT 
.dl errnosupport            ;$47AD _INITNEWTRACEP 
.dl errnosupport            ;$47B0 _SPLOTCOORD 
.dl errnosupport            ;$47B3 _SPLOTRIGHT 
.dl errnosupport            ;$47B6 _SPLOTLEFT 
.dl errnosupport            ;$47B9 _CMPBOXINFO 
.dl errnosupport            ;$47BC _NEXTPLOT 
.dl errnosupport            ;$47BF _PREVPLOT 
.dl errnosupport            ;$47C2 _CLRPREVPLOT 
.dl errnosupport            ;$47C5 _PUT_INDEX_LST 
.dl errnosupport            ;$47C8 _GET_INDEX_LST 
.dl errnosupport            ;$47CB _HEAP_SORT 
.dl errnosupport            ;$47CE _StoGDB2 
.dl errnosupport            ;$47D1 _RclGDB2 
.dl errnosupport            ;$47D4 _CircCmd 
.dl errnosupport            ;$47D7 _GrphCirc 
.dl errnosupport            ;$47DA _Mov18B 
.dl errnosupport            ;$47DD _DarkLine 
.dl errnosupport            ;$47E0 _ILine 
.dl errnosupport            ;$47E3 _IPoint 
.dl errnosupport            ;$47E6 _XYRNDBOTH 
.dl errnosupport            ;$47E9 _XYRND 
.dl errnosupport            ;$47EC _CheckTOP 
.dl errnosupport            ;$47EF _CheckXY 
.dl errnosupport            ;$47F2 _DarkPnt 
.dl errnosupport            ;$47F5 _CPointS 
.dl errnosupport            ;$47F8 _WTOV 
.dl errnosupport            ;$47FB _VtoWHLDE 
.dl errnosupport            ;$47FE _Xitof 
.dl errnosupport            ;$4801 _YftoI 
.dl errnosupport            ;$4804 _XftoI 
.dl errnosupport            ;$4807 _TraceOff 
.dl errnosupport            ;$480A _GrRedisp 
.dl errnosupport            ;$480D _GDISPTOKEN 
.dl errnosupport            ;$4810 _GRDECODA 
.dl errnosupport            ;$4813 _LABCOOR 
.dl errnosupport            ;$4816 _COORDISP 
.dl errnosupport            ;$4819 _TMPEQUNOSRC 
.dl errnosupport            ;$481C _GRLABELS 
.dl errnosupport            ;$481F _YPIXSET 
.dl errnosupport            ;$4822 _XPIXSET 
.dl errnosupport            ;$4825 _COPYRNG 
.dl errnosupport            ;$4828 _VALCUR 
.dl errnosupport            ;$482B _GRPUTAWAY 
.dl errnosupport            ;$482E _RSTGFLAGS 
.dl errnosupport            ;$4831 _GRReset 
.dl errnosupport            ;$4834 _XYCENT 
.dl errnosupport            ;$4837 _ZOOMXYCMD 
.dl errnosupport            ;$483A _CPTDELY 
.dl errnosupport            ;$483D _CPTDELX 
.dl errnosupport            ;$4840 _SetFuncM 
.dl errnosupport            ;$4843 _SetSeqM 
.dl errnosupport            ;$4846 _SetPolM 
.dl errnosupport            ;$4849 _SetParM 
.dl errnosupport            ;$484C _ZmInt 
.dl errnosupport            ;$484F _ZmDecml 
.dl errnosupport            ;$4852 _ZmPrev 
.dl errnosupport            ;$4855 _ZmUsr 
.dl errnosupport            ;$4858 _SETUZM 
.dl errnosupport            ;$485B _ZmFit 
.dl errnosupport            ;$485E _ZmSquare 
.dl errnosupport            ;$4861 _ZmTrig 
.dl errnosupport            ;$4864 _SetXMinMax 
.dl errnosupport            ;$4867 _ZooDefault 
.dl errnosupport            ;$486A _GrBufCpy 
.dl errnosupport            ;$486D _DRAWSPLITLINE 
.dl errnosupport            ;$4870 _RestoreDisp 
.dl errnosupport            ;$4873 _FNDDB 
.dl errnosupport            ;$4876 _AllEq 
.dl errnosupport            ;$4879 _fndallseleq 
.dl errnosupport            ;$487C _NEXTEQ 
.dl errnosupport            ;$487F _PREVEQ 
.dl errnosupport            ;$4882 _BLINKGCUR 
.dl errnosupport            ;$4885 _NBCURSOR 
.dl errnosupport            ;$4888 _STATMARK 
.dl errnosupport            ;$488B _CHKTEXTCURS 
.dl errnosupport            ;$488E _Regraph 
.dl errnosupport            ;$4891 _DOREFFLAGS02 
.dl errnosupport            ;$4894 INITNSEQ 
.dl errnosupport            ;$4897 _YRES 
.dl errnosupport            ;$489A _Ceiling 
.dl errnosupport            ;$489D _PutXY 
.dl errnosupport            ;$48A0 _PUTEQUNO 
.dl errnosupport            ;$48A3 _PDspGrph 
.dl errnosupport            ;$48A6 _HorizCmd 
.dl errnosupport            ;$48A9 _VertCmd 
.dl errnosupport            ;$48AC _LineCmd 
.dl errnosupport            ;$48AF _UnLineCmd 
.dl errnosupport            ;$48B2 _PointCmd 
.dl errnosupport            ;$48B5 _PixelTest 
.dl errnosupport            ;$48B8 _PixelCmd 
.dl errnosupport            ;$48BB _TanLnF 
.dl errnosupport            ;$48BE _DRAWCMD_INIT 
.dl errnosupport            ;$48C1 _DrawCmd 
.dl errnosupport            ;$48C4 _SHADECMD 
.dl errnosupport            ;$48C7 _InvCmd 
.dl errnosupport            ;$48CA _STATSHADE 
.dl errnosupport            ;$48CD _dspmattable 
.dl errnosupport            ;$48D0 _dsplsts 
.dl errnosupport            ;$48D3 _closeEditBuf 
.dl errnosupport            ;$48D6 _parseEditBuf 
.dl errnosupport            ;$48D9 _putsm 
.dl errnosupport            ;$48DC _DspCurTbl 
.dl errnosupport            ;$48DF _DSPGRTBL 
.dl errnosupport            ;$48E2 _zeroTemplate 
.dl errnosupport            ;$48E5 _settblrefs 
.dl errnosupport            ;$48E8 _dispTblBot 
.dl errnosupport            ;$48EB _DispTblTop 
.dl errnosupport            ;$48EE _dispTblbody 
.dl errnosupport            ;$48F1 _VPUTBLANK 
.dl errnosupport            ;$48F4 _TBLTRACE 
.dl errnosupport            ;$48F7 _dispListNameY 
.dl errnosupport            ;$48FA _CurNameLength 
.dl errnosupport            ;$48FD _NameToBuf 
.dl errnosupport            ;$4900 _jpromptcursor 
.dl errnosupport            ;$4903 _BufLeft 
.dl errnosupport            ;$4906 _BufRight 
.dl errnosupport            ;$4909 _bufInsert 
.dl errnosupport            ;$490C _bufQueueChar 
.dl errnosupport            ;$490F _BufReplace 
.dl errnosupport            ;$4912 _BufDelete 
.dl errnosupport            ;$4915 _BUFPEEK 
.dl errnosupport            ;$4918 _BUFPEEK1 
.dl errnosupport            ;$491B _BUFPEEK2 
.dl errnosupport            ;$491E _BUFPEEK3 
.dl errnosupport            ;$4921 _BufToBtm 
.dl errnosupport            ;$4924 _setupEditEqu 
.dl errnosupport            ;$4927 _BufToTop 
.dl errnosupport            ;$492A _isEditFull 
.dl errnosupport            ;$492D _IsEditEmpty 
.dl errnosupport            ;$4930 _IsAtTop 
.dl errnosupport            ;$4933 _IsAtBtm 
.dl errnosupport            ;$4936 _BufClear 
.dl errnosupport            ;$4939 _JcursorFirst 
.dl errnosupport            ;$493C _JcursorLast 
.dl errnosupport            ;$493F _CursorLeft 
.dl errnosupport            ;$4942 _cursorRight 
.dl errnosupport            ;$4945 _cursorUp 
.dl errnosupport            ;$4948 _CursorDown 
.dl errnosupport            ;$494B _cursorToOffset 
.dl errnosupport            ;$494E _InsDisp 
.dl errnosupport            ;$4951 _FDISPBOL1 
.dl errnosupport            ;$4954 _FDISPBOL 
.dl errnosupport            ;$4957 _DispEOW 
.dl errnosupport            ;$495A _DispHead 
.dl errnosupport            ;$495D _DispTail 
.dl errnosupport            ;$4960 _PutTokString 
.dl errnosupport            ;$4963 _setupEditCmd 
.dl errnosupport            ;$4966 _setEmptyEditEqu 
.dl errnosupport            ;$4969 _SetEmptyEditPtr 
.dl errnosupport            ;$496C _CloseEditEqu 
.dl errnosupport            ;$496F _GetPrevTok 
.dl errnosupport            ;$4972 _getkey 
.dl errnosupport            ;$4975 _canIndic 
.dl errnosupport            ;$4978 _LCD_DRIVERON 
.dl errnosupport            ;$497B _DFMIN2 
.dl errnosupport            ;$497E _formDisp 
.dl errnosupport            ;$4981 _formMatrix 
.dl errnosupport            ;$4984 _wscrollLeft 
.dl errnosupport            ;$4987 _wscrollUp 
.dl errnosupport            ;$498A _wscrollDown 
.dl errnosupport            ;$498D _wscrollRight 
.dl errnosupport            ;$4990 _FormEReal 
.dl errnosupport            ;$4993 _formERealTOK 
.dl errnosupport            ;$4996 _FormDCplx 
.dl errnosupport            ;$4999 _FormReal 
.dl errnosupport            ;$499C _formScrollUp 
.dl errnosupport            ;$499F _setwinabove 
.dl errnosupport            ;$49A2 _disarmScroll 
.dl errnosupport            ;$49A5 _OP1toEdit 
.dl errnosupport            ;$49A8 _MinToEdit 
.dl errnosupport            ;$49AB _rclVarToEdit 
.dl errnosupport            ;$49AE _rclVarToEditPtR 
.dl errnosupport            ;$49B1 _RCLENTRYTOEDIT 
.dl errnosupport            ;$49B4 _rclToQueue 
.dl errnosupport            ;$49B7 _FORMTOTOK 
.dl errnosupport            ;$49BA _DISP_INTERVAL 
.dl errnosupport            ;$49BD _DisplstName 
.dl errnosupport            ;$49C0 _dispSLstNameHL 
.dl errnosupport            ;$49C3 _EditEqu 
.dl errnosupport            ;$49C6 _closeEquField 
.dl errnosupport            ;$49C9 _AutoSelect 
.dl errnosupport            ;$49CC _DISPYEOS 
.dl errnosupport            ;$49CF _dispNumEOS 
.dl errnosupport            ;$49D2 _setupdispeq 
.dl errnosupport            ;$49D5 _DispForward 
.dl errnosupport            ;$49D8 _DispYPrompt2 
.dl errnosupport            ;$49DB _stringwidth 
.dl errnosupport            ;$49DE _dispErrorScreen 
.dl errnosupport            ;$49E1 _POPCX 
.dl errnosupport            ;$49E4 _loadnoeentry 
.dl errnosupport            ;$49E7 _SaveScreen 
.dl errnosupport            ;$49EA _RETSCREEN 
.dl errnosupport            ;$49ED _RetScreenErr 
.dl errnosupport            ;$49F0 _CheckSplitFlag 
.dl errnosupport            ;$49F3 _SolveRedisp 
.dl errnosupport            ;$49F6 _SolveDisp 
.dl errnosupport            ;$49F9 _itemName 
.dl errnosupport            ;$49FC _SetNorm_Vals 
.dl errnosupport            ;$49FF _SetYOffset 
.dl errnosupport            ;$4A02 _ConvKeyToTok 
.dl errnosupport            ;$4A05 _ConvFCKeyToTok 
.dl errnosupport            ;$4A08 _ConvFEKeyToTok 
.dl errnosupport            ;$4A0B _TokToKey 
.dl errnosupport            ;$4A0E _SendSkipExitPacket 
.dl errnosupport            ;$4A11 _GETVARCMD 
.dl errnosupport            ;$4A14 _SendVarCmd 
.dl errnosupport            ;$4A17 _SendScreenshot 
.dl errnosupport            ;$4A1A keyscnlnk 
.dl errnosupport            ;$4A1D _DeselectAllVars 
.dl errnosupport            ;$4A20 _DelRes 
.dl errnosupport            ;$4A23 _ConvLcToLr 
.dl errnosupport            ;$4A26 _RedimMat 
.dl errnosupport            ;$4A29 _IncLstSize 
.dl errnosupport            ;$4A2C _InsertList 
.dl errnosupport            ;$4A2F _dellistel 
.dl errnosupport            ;$4A32 _EditProg 
.dl errnosupport            ;$4A35 _CloseProg 
.dl errnosupport            ;$4A38 _ClrGraphRef 
.dl errnosupport            ;$4A3B _FixTempCnt 
.dl errnosupport            ;$4A3E _SAVEDATA 
.dl errnosupport            ;$4A41 _RESTOREDATA 
.dl errnosupport            ;$4A44 _FindAlphaUp 
.dl errnosupport            ;$4A47 _FindAlphaDn 
.dl errnosupport            ;$4A4A _CmpSyms 
.dl errnosupport            ;$4A4D _CREATETEMP 
.dl errnosupport            ;$4A50 _CleanAll 
.dl errnosupport            ;$4A53 _MoveToNextSym 
.dl errnosupport            ;$4A56 _ConvLrToLc 
.dl errnosupport            ;$4A59 _TblScreenDn 
.dl errnosupport            ;$4A5C _TblScreenUp 
.dl errnosupport            ;$4A5F _SCREENUP 
.dl errnosupport            ;$4A62 _ScreenUpDown 
.dl errnosupport            ;$4A65 _ZifRclHandler 
.dl errnosupport            ;$4A68 _zifrclkapp 
.dl errnosupport            ;$4A6B _RCLKEY 
.dl errnosupport            ;$4A6E _RCLREGEQ_CALL 
.dl errnosupport            ;$4A71 _RCLREGEQ 
.dl errnosupport            ;$4A74 _initNamePrompt 
.dl errnosupport            ;$4A77 _NamePrompt2 
.dl errnosupport            ;$4A7A _CATALOGCHK 
.dl errnosupport            ;$4A7D _clrTR 
.dl errnosupport            ;$4A80 _QUAD 
.dl errnosupport            ;$4A83 _GRAPHQUAD 
.dl errnosupport            ;$4A86 _BC2NOREAL 
.dl errnosupport            ;$4A89 _ErrNonReal_FPST_FPS1 
.dl errnosupport            ;$4A8C _ErrNonReal 
.dl errnosupport            ;$4A8F _WRITE_TEXT 
.dl errnosupport            ;$4A92 _FORSEQINIT 
.dl errnosupport            ;$4A95 _GRPHPARS 
.dl errnosupport            ;$4A98 _PLOTPARS 
.dl errnosupport            ;$4A9B _ParseInp 
.dl errnosupport            ;$4A9E _PARSEOFF 
.dl errnosupport            ;$4AA1 _PARSESCAN 
.dl errnosupport            ;$4AA4 _GETPARSE 
.dl errnosupport            ;$4AA7 _SAVEPARSE 
.dl errnosupport            ;$4AAA _InitPFlgs 
.dl errnosupport            ;$4AAD _CKENDLINERR 
.dl errnosupport            ;$4AB0 _OP2Set60 
.dl errnosupport            ;$4AB3 _GETSTATPTR 
.dl errnosupport            ;$4AB6 _CMP_STATPTR 
.dl errnosupport            ;$4AB9 _VARSYSADR 
.dl errnosupport            ;$4ABC _StoSysTok 
.dl errnosupport            ;$4ABF _StoAns 
.dl errnosupport            ;$4AC2 _StoTheta 
.dl errnosupport            ;$4AC5 _StoR 
.dl errnosupport            ;$4AC8 _StoY 
.dl errnosupport            ;$4ACB _StoN 
.dl errnosupport            ;$4ACE _StoT 
.dl errnosupport            ;$4AD1 _StoX 
.dl errnosupport            ;$4AD4 _StoOther 
.dl errnosupport            ;$4AD7 _RclAns 
.dl errnosupport            ;$4ADA _RclY 
.dl errnosupport            ;$4ADD _RclN 
.dl errnosupport            ;$4AE0 _RclX 
.dl errnosupport            ;$4AE3 _RclVarSym 
.dl errnosupport            ;$4AE6 _RclSysTok 
.dl errnosupport            ;$4AE9 _StMatEl 
.dl errnosupport            ;$4AEC _STLSTVECEL 
.dl errnosupport            ;$4AEF _ConvOP1 
.dl errnosupport            ;$4AF2 _Find_Parse_Formula 
.dl errnosupport            ;$4AF5 _PARSE_FORMULA 
.dl errnosupport            ;$4AF8 _FetchQuotedString 
.dl errnosupport            ;$4AFB _FetchNumLine 
.dl errnosupport            ;$4AFE _ParseNameTokens 
.dl errnosupport            ;$4B01 _ParseInpGraph 
.dl errnosupport            ;$4B04 _ParseInpGraphReset 
.dl errnosupport            ;$4B07 _ParseInpLastEnt 
.dl errnosupport            ;$4B0A _ErrOnCertainTypes 
.dl errnosupport            ;$4B0D _CreatePair 
.dl errnosupport            ;$4B10 _PUSHNUM 
.dl errnosupport            ;$4B13 _INCCURPCERREND 
.dl errnosupport            ;$4B16 _ERREND 
.dl errnosupport            ;$4B19 _COMMAERRF 
.dl errnosupport            ;$4B1C _COMMAERR 
.dl errnosupport            ;$4B1F _STEQARG2 
.dl errnosupport            ;$4B22 _STEQARG 
.dl errnosupport            ;$4B25 _INPARG 
.dl errnosupport            ;$4B28 _STEQARG3 
.dl errnosupport            ;$4B2B _NXTFETCH 
.dl errnosupport            ;$4B2E _CKFETCHVAR 
.dl errnosupport            ;$4B31 _FETCHVARA 
.dl errnosupport            ;$4B34 _FETCHVAR 
.dl errnosupport            ;$4B37 _CKENDLIN 
.dl errnosupport            ;$4B3A _CKENDEXP 
.dl errnosupport            ;$4B3D _CKPARSEND 
.dl errnosupport            ;$4B40 _STOTYPEARG 
.dl errnosupport            ;$4B43 _ConvDim 
.dl errnosupport            ;$4B46 _ConvDim00 
.dl errnosupport            ;$4B49 _AHEADEQUAL 
.dl errnosupport            ;$4B4C _PARSAHEADS 
.dl errnosupport            ;$4B4F _PARSAHEAD 
.dl errnosupport            ;$4B52 _AnsName 
.dl errnosupport            ;$4B55 _STOCMPREALS 
.dl errnosupport            ;$4B58 _GETDEPTR 
.dl errnosupport            ;$4B5B _PUSH2BOPER 
.dl errnosupport            ;$4B5E _POP2BOPER 
.dl errnosupport            ;$4B61 _PUSHOPER 
.dl errnosupport            ;$4B64 _POPOPER 
.dl errnosupport            ;$4B67 _FIND_E_UNDEF 
.dl errnosupport            ;$4B6A _STTMPEQ 
.dl errnosupport            ;$4B6D _FINDEOL 
.dl errnosupport            ;$4B70 _BRKINC 
.dl errnosupport            ;$4B73 _INCFETCH 
.dl errnosupport            ;$4B76 _CURFETCH 
.dl errnosupport            ;$4B79 _Random 
.dl errnosupport            ;$4B7C _StoRand 
.dl errnosupport            ;$4B7F _RandInit 
.dl errnosupport            ;$4B82 _resetStacks 
.dl errnosupport            ;$4B85 _Factorial 
.dl errnosupport            ;$4B88 _YONOFF 
.dl errnosupport            ;$4B8B _EQSELUNSEL 
.dl errnosupport            ;$4B8E _ITSOLVER 
.dl errnosupport            ;$4B91 _GRITSOLVER 
.dl errnosupport            ;$4B94 _ITSOLVERB 
.dl errnosupport            ;$4B97 _ITSOLVERNB 
.dl errnosupport            ;$4B9A _ExTest_INT 
.dl errnosupport            ;$4B9D  
.dl errnosupport            ;$4BA0 _LogGamma 
.dl errnosupport            ;$4BA3 _OneVar 
.dl errnosupport            ;$4BA6 _ONEVARS_0 
.dl errnosupport            ;$4BA9 _ORDSTAT 
.dl errnosupport            ;$4BAC _INITSTATANS2 
.dl errnosupport            ;$4BAF _ANOVA_SPEC 
.dl errnosupport            ;$4BB2 _OutputExpr 
.dl errnosupport            ;$4BB5 _CentCursor 
.dl errnosupport            ;$4BB8 _TEXT 
.dl errnosupport            ;$4BBB _FINISHSPEC 
.dl errnosupport            ;$4BBE _TRCYFUNC 
.dl errnosupport            ;$4BC1 _RCL_SEQ_X 
.dl errnosupport            ;$4BC4 _RCLSEQ2 
.dl errnosupport            ;$4BC7 _GRPPutAway 
.dl errnosupport            ;$4BCA _CKVALDELX 
.dl errnosupport            ;$4BCD _CKVALDELTA 
.dl errnosupport            ;$4BD0 _GrBufClr 
.dl errnosupport            ;$4BD3 _GRBUFCPY_V 
.dl errnosupport            ;$4BD6 _FNDSELEQ 
.dl errnosupport            ;$4BD9 _CLRGRAPHXY 
.dl errnosupport            ;$4BDC _NEDXT_Y_STYLE 
.dl errnosupport            ;$4BDF _PLOTPT 
.dl errnosupport            ;$4BE2 _NEWINDEP 
.dl errnosupport            ;$4BE5 _Axes 
.dl errnosupport            ;$4BE8 _setPenX 
.dl errnosupport            ;$4BEB _setPenY 
.dl errnosupport            ;$4BEE _setPenT 
.dl errnosupport            ;$4BF1 _TAN_EQU_DISP 
.dl errnosupport            ;$4BF4 _PutAns 
.dl errnosupport            ;$4BF7 _DispOP1A 
.dl errnosupport            ;$4BFA _MATHTANLN 
.dl errnosupport            ;$4BFD _ENDDRAW 
.dl errnosupport            ;$4C00 _SetTblGraphDraw 
.dl errnosupport            ;$4C03 _StartDialog 
.dl errnosupport            ;$4C06 _DialogInit 
.dl errnosupport            ;$4C09 _GetDialogNumOP1 
.dl errnosupport            ;$4C0C _SetDialogNumOP1 
.dl errnosupport            ;$4C0F _GetDialogNumHL 
.dl errnosupport            ;$4C12 _ErrArgumentO123 
.dl errnosupport            ;$4C15 _SetDialogKeyOverride 
.dl errnosupport            ;$4C18 _ResDialogKeyOverride 
.dl errnosupport            ;$4C1B _ForceDialogKeypress 
.dl errnosupport            ;$4C1E _DialogStartGetKey 
.dl errnosupport            ;$4C21 _StartDialog_Override 
.dl errnosupport            ;$4C24 _CallDialogCallback 
.dl errnosupport            ;$4C27 _SetDialogCallback 
.dl errnosupport            ;$4C2A _ResDialogCallback 
.dl errnosupport            ;$4C2D _CopyDialogNum 
.dl errnosupport            ;$4C30 _MemClear 
.dl errnosupport            ;$4C33 _MemSet 
.dl errnosupport            ;$4C36 _ReloadAppEntryVecs 
.dl errnosupport            ;$4C39 _PointOn 
.dl errnosupport            ;$4C3C _ExecuteNewPrgm 
.dl errnosupport            ;$4C3F _StrLength 
.dl errnosupport            ;$4C42 _VPutMapRec 
.dl errnosupport            ;$4C45 _getRomPage 
.dl errnosupport            ;$4C48 _FindAppUp 
.dl errnosupport            ;$4C4B _FindAppDn 
.dl errnosupport            ;$4C4E _FindApp 
.dl errnosupport            ;$4C51 _ExecuteApp 
.dl errnosupport            ;$4C54 _MonReset 
.dl errnosupport            ;$4C57 _ClearParseVar 
.dl errnosupport            ;$4C5A _SetParseVarProg 
.dl errnosupport            ;$4C5D _isContextKey 
.dl errnosupport            ;$4C60 _IBounds 
.dl errnosupport            ;$4C63 _IOffset 
.dl errnosupport            ;$4C66 _DrawCirc2 
.dl errnosupport            ;$4C69 _CanAlphIns 
.dl errnosupport            ;$4C6C cxRedisp 
.dl errnosupport            ;$4C6F _GetBaseVer 
.dl errnosupport            ;$4C72 _OPSet0DE 
.dl errnosupport            ;$4C75 _AppGetCbl 
.dl errnosupport            ;$4C78 _AppGetCalc 
.dl errnosupport            ;$4C7B _SaveDisp 
.dl errnosupport            ;$4C7E _SetIgnoreKey 
.dl errnosupport            ;$4C81 _SetSendThisKeyBack 
.dl errnosupport            ;$4C84 _DisableApd 
.dl errnosupport            ;$4C87 _EnableApd 
.dl errnosupport            ;$4C8A _JForceCmdNoChar2 
.dl errnosupport            ;$4C8D _set2IY34 
.dl errnosupport            ;$4C90 _forcecmd 
.dl errnosupport            ;$4C93 _ApdSetup 
.dl errnosupport            ;$4C96 _Get_NumKey 
.dl errnosupport            ;$4C99 _AppSetup 
.dl errnosupport            ;$4C9C _HandleLinkKeyActivity 
.dl errnosupport            ;$4C9F _JForceCmdNoChar3 
.dl errnosupport            ;$4CA2 _ReleaseSedit 
.dl errnosupport            ;$4CA5 _initsmalleditline 
.dl errnosupport            ;$4CA8 _startsmalledit 
.dl errnosupport            ;$4CAB  
.dl errnosupport            ;$4CAE _SGetTokString 
.dl errnosupport            ;$4CB1 _LoadPattern 
.dl errnosupport            ;$4CB4 _SStringLength 
.dl errnosupport            ;$4CB7 _RestorePenCol 
.dl errnosupport            ;$4CBA  
.dl errnosupport            ;$4CBD _DoNothing 
.dl errnosupport            ;$4CC0 _ForceSmallEditReturn 
.dl errnosupport            ;$4CC3  
.dl errnosupport            ;$4CC6  
.dl errnosupport            ;$4CC9  
.dl errnosupport            ;$4CCC  
.dl errnosupport            ;$4CCF _VEraseEOL 
.dl errnosupport            ;$4CD2  
.dl errnosupport            ;$4CD5  
.dl errnosupport            ;$4CD8 _GoToErr 
.dl errnosupport            ;$4CDB _initsmalleditBox 
.dl errnosupport            ;$4CDE  
.dl errnosupport            ;$4CE1 _EmptyHook 
.dl errnosupport            ;$4CE4 _ForceSmallEditReturn2 
.dl errnosupport            ;$4CE7  
.dl errnosupport            ;$4CEA  
.dl errnosupport            ;$4CED _ClearRow 
.dl errnosupport            ;$4CF0  
.dl errnosupport            ;$4CF3  
.dl errnosupport            ;$4CF6  
.dl errnosupport            ;$4CF9  
.dl errnosupport            ;$4CFC  
.dl errnosupport            ;$4CFF  
.dl errnosupport            ;$4D02  
.dl errnosupport            ;$4D05  
.dl errnosupport            ;$4D08  
.dl errnosupport            ;$4D0B  
.dl errnosupport            ;$4D0E  
.dl errnosupport            ;$4D11  
.dl errnosupport            ;$4D14  
.dl errnosupport            ;$4D17  
.dl errnosupport            ;$4D1A  
.dl errnosupport            ;$4D1D  
.dl errnosupport            ;$4D20  
.dl errnosupport            ;$4D23  
.dl errnosupport            ;$4D26 _AppScreenUpDown 
.dl errnosupport            ;$4D29 _AppScreenUpDown1 
.dl errnosupport            ;$4D2C  
.dl errnosupport            ;$4D2F _initsmalleditlinevar 
.dl errnosupport            ;$4D32 _initsmalleditlineop1 
.dl errnosupport            ;$4D35 _initsmalleditboxvar 
.dl errnosupport            ;$4D38 _initsmalleditboxop1 
.dl errnosupport            ;$4D3B  
.dl errnosupport            ;$4D3E _RestartDialog 
.dl errnosupport            ;$4D41 _ErrCustom1 
.dl errnosupport            ;$4D44 _ErrCustom2 
.dl errnosupport            ;$4D47 _AppStartMouse 
.dl errnosupport            ;$4D4A _AppStartMouseNoSetup 
.dl errnosupport            ;$4D4D _AppMouseGetKey 
.dl errnosupport            ;$4D50 _AppDispMouse 
.dl errnosupport            ;$4D53 _AppEraseMouse 
.dl errnosupport            ;$4D56 _AppSetupMouseMem 
.dl errnosupport            ;$4D59 _GetDispRowOffset 
.dl errnosupport            ;$4D5C _ClearRect 
.dl errnosupport            ;$4D5F _InvertRect 
.dl errnosupport            ;$4D62 _FillRect 
.dl errnosupport            ;$4D65 _AppUpdateMouse 
.dl errnosupport            ;$4D68 _AppDispPrevMouse 
.dl errnosupport            ;$4D6B  
.dl errnosupport            ;$4D6E _initcellbox 
.dl errnosupport            ;$4D71 _drawcell 
.dl errnosupport            ;$4D74  
.dl errnosupport            ;$4D77 _invertcell 
.dl errnosupport            ;$4D7A _setcelloverride 
.dl errnosupport            ;$4D7D _DrawRectBorder 
.dl errnosupport            ;$4D80 _ClearCell 
.dl errnosupport            ;$4D83 _covercell 
.dl errnosupport            ;$4D86 _EraseRectBorder 
.dl errnosupport            ;$4D89 _FillRectPattern 
.dl errnosupport            ;$4D8C _DrawRectBorderClear 
.dl errnosupport            ;$4D8F  
.dl errnosupport            ;$4D92  
.dl errnosupport            ;$4D95 _VerticalLine 
.dl errnosupport            ;$4D98 _IBoundsFull 
.dl errnosupport            ;$4D9B _DisplayImage 
.dl errnosupport            ;$4D9E  
.dl errnosupport            ;$4DA1  
.dl errnosupport            ;$4DA4 _AppUpdateMouseCoords 
.dl errnosupport            ;$4DA7 _ShiftBitsLeft 
.dl errnosupport            ;$4DAA  
.dl errnosupport            ;$4DAD  
.dl errnosupport            ;$4DB0  
.dl errnosupport            ;$4DB3  
.dl errnosupport            ;$4DB6  
.dl errnosupport            ;$4DB9  
.dl errnosupport            ;$4DBC  
.dl errnosupport            ;$4DBF _AppUpdateMouseRow 
.dl errnosupport            ;$4DC2 _AppDrawMouse 
.dl errnosupport            ;$4DC5 _AppDrawMouseDirect 
.dl errnosupport            ;$4DC8 _CPoint 
.dl errnosupport            ;$4DCB _DeleteApp 
.dl errnosupport            ;$4DCE _AppUpdateMouseXY 
.dl errnosupport            ;$4DD1 _setmodecellflag 
.dl errnosupport            ;$4DD4 _resetmodecellflag 
.dl errnosupport            ;$4DD7 _ismodecellset 
.dl errnosupport            ;$4DDA _getmodecellflag 
.dl errnosupport            ;$4DDD  
.dl errnosupport            ;$4DE0 _CellBoxManager 
.dl errnosupport            ;$4DE3 _startnewcell 
.dl errnosupport            ;$4DE6  
.dl errnosupport            ;$4DE9 _CellCursorHandle 
.dl errnosupport            ;$4DEC  
.dl errnosupport            ;$4DEF  
.dl errnosupport            ;$4DF2 _ClearCurCell 
.dl errnosupport            ;$4DF5 _drawcurcell 
.dl errnosupport            ;$4DF8 _invertcurcell 
.dl errnosupport            ;$4DFB _covercurcell 
.dl errnosupport            ;$4DFE _BlinkCell 
.dl errnosupport            ;$4E01 _BlinkCellNoLookUp 
.dl errnosupport            ;$4E04 _BlinkCurCell 
.dl errnosupport            ;$4E07 _BlinkCellToOn 
.dl errnosupport            ;$4E0A _BlinkCellToOnNoLookUp 
.dl errnosupport            ;$4E0D _BlinkCurCellToOn 
.dl errnosupport            ;$4E10 _BlinkCellToOff 
.dl errnosupport            ;$4E13 _BlinkCellToOffNoLookUp 
.dl errnosupport            ;$4E16 _BlinkCurCellToOff 
.dl errnosupport            ;$4E19 _getcurmodecellflag 
.dl errnosupport            ;$4E1C  
.dl errnosupport            ;$4E1F _startsmalleditreturn 
.dl errnosupport            ;$4E22  
.dl errnosupport            ;$4E25  
.dl errnosupport            ;$4E28 _CellkHandle 
.dl errnosupport            ;$4E2B _errchkalphabox 
.dl errnosupport            ;$4E2E  
.dl errnosupport            ;$4E31  
.dl errnosupport            ;$4E34  
.dl errnosupport            ;$4E37  
.dl errnosupport            ;$4E3A _eraseallcells 
.dl errnosupport            ;$4E3D _iscurmodecellset 
.dl errnosupport            ;$4E40  
.dl errnosupport            ;$4E43 _initalphabox 
.dl errnosupport            ;$4E46  
.dl errnosupport            ;$4E49  
.dl errnosupport            ;$4E4C _drawblnkcell 
.dl errnosupport            ;$4E4F _ClearBlnkCell 
.dl errnosupport            ;$4E52 _invertblnkcell 
.dl errnosupport            ;$4E55 _AppMouseForceKey 
.dl errnosupport            ;$4E58 _AppSetupMouseMemCoords 
.dl errnosupport            ;$4E5B _AppMoveMouse 
.dl errnosupport            ;$4E5E _GetStringInput 
.dl errnosupport            ;$4E61 _GetStringInput2 
.dl errnosupport            ;$4E64 _WaitEnterKeyValue 
.dl errnosupport            ;$4E67 _HorizontalLine 
.dl errnosupport            ;$4E6A _CreateAppVar 
.dl errnosupport            ;$4E6D _CreateProtProg 
.dl errnosupport            ;$4E70 _CreateVar 
.dl errnosupport            ;$4E73 _AsmComp 
.dl errnosupport            ;$4E76 _GetAsmSize 
.dl errnosupport            ;$4E79 _SquishPrgm 
.dl errnosupport            ;$4E7C _ExecutePrgm 
.dl errnosupport            ;$4E7F _ChkFindSymAsm 
.dl errnosupport            ;$4E82 _ParsePrgmName 
.dl errnosupport            ;$4E85 _CSub 
.dl errnosupport            ;$4E88 _CAdd 
.dl errnosupport            ;$4E8B _CSqaure 
.dl errnosupport            ;$4E8E _CMult 
.dl errnosupport            ;$4E91 _CRecip 
.dl errnosupport            ;$4E94 _CDiv 
.dl errnosupport            ;$4E97 _CAbs 
.dl errnosupport            ;$4E9A _AddSquares 
.dl errnosupport            ;$4E9D _CSqRoot 
.dl errnosupport            ;$4EA0 _CLN 
.dl errnosupport            ;$4EA3 _CLog 
.dl errnosupport            ;$4EA6 _CTenX 
.dl errnosupport            ;$4EA9 _CEtoX 
.dl errnosupport            ;$4EAC _CXrootY 
.dl errnosupport            ;$4EAF  
.dl errnosupport            ;$4EB2 _CYtoX 
.dl errnosupport            ;$4EB5 _InvertNonReal 
.dl errnosupport            ;$4EB8 _CplxMult 
.dl errnosupport            ;$4EBB _CplxDiv 
.dl errnosupport            ;$4EBE _CplxTrunc 
.dl errnosupport            ;$4EC1 _CplxFrac 
.dl errnosupport            ;$4EC4 _CplxFloor 
.dl errnosupport            ;$4EC7 _SendHeaderPacket 
.dl errnosupport            ;$4ECA _CancelTransmission 
.dl errnosupport            ;$4ECD _SendScreenContents 
.dl errnosupport            ;$4ED0 _SendRAMVarData 
.dl errnosupport            ;$4ED3 _SendRAMCmd 
.dl errnosupport            ;$4ED6 _SendPacket 
.dl errnosupport            ;$4ED9 _ReceiveAck 
.dl errnosupport            ;$4EDC _Send4BytePacket 
.dl errnosupport            ;$4EDF _SendDataByte 
.dl errnosupport            ;$4EE2 _Send4Bytes 
.dl errnosupport            ;$4EE5 _SendAByte 
.dl errnosupport            ;$4EE8 _SendCByte 
.dl errnosupport            ;$4EEB _GetSmallPacket 
.dl errnosupport            ;$4EEE _GetDataPacket 
.dl errnosupport            ;$4EF1 _SendAck 
.dl errnosupport            ;$4EF4 _Get4Bytes 
.dl errnosupport            ;$4EF7 _Get3Bytes 
.dl errnosupport            ;$4EFA _Rec1stByte 
.dl errnosupport            ;$4EFD _Rec1stByteNC 
.dl errnosupport            ;$4F00 _ContinueGetByte 
.dl errnosupport            ;$4F03 _RecAByteIO 
.dl errnosupport            ;$4F06 _ReceiveVar 
.dl errnosupport            ;$4F09 _ReceiveVarDataExists 
.dl errnosupport            ;$4F0C _ReceiveVarData 
.dl errnosupport            ;$4F0F _SrchVLstUp 
.dl errnosupport            ;$4F12 _SrchVLstDn 
.dl errnosupport            ;$4F15 _SendVariable 
.dl errnosupport            ;$4F18 _Get4BytesCursor 
.dl errnosupport            ;$4F1B _Get4BytesNC 
.dl errnosupport            ;$4F1E _Convert85List 
.dl errnosupport            ;$4F21 _SendDirectoryContents 
.dl errnosupport            ;$4F24 _SendReadyPacket 
.dl errnosupport            ;$4F27 _Convert85Real 
.dl errnosupport            ;$4F2A _ret_6 
.dl errnosupport            ;$4F2D _SendCertificate 
.dl errnosupport            ;$4F30 _SendApplication 
.dl errnosupport            ;$4F33 _SendOSHeader 
.dl errnosupport            ;$4F36 _SendOSPage 
.dl errnosupport            ;$4F39 _SendOS 
.dl errnosupport            ;$4F3C _FlashWriteDisable 
.dl errnosupport            ;$4F3F _SendCmd 
.dl errnosupport            ;$4F42 _SendOSValidationData 
.dl errnosupport            ;$4F45 _Disp 
.dl errnosupport            ;$4F48 _SendGetkeyPress 
.dl errnosupport            ;$4F4B _RejectCommand 
.dl errnosupport            ;$4F4E _CheckLinkLines 
.dl errnosupport            ;$4F51 _GetHookByte 
.dl errnosupport            ;$4F54 _GetBytePaged 
.dl errnosupport            ;$4F57 _cursorhook 
.dl errnosupport            ;$4F5A _call_library_hook 
.dl errnosupport            ;$4F5D _call_rawkey_hook 
.dl errnosupport            ;$4F60 _setCursorHook 
.dl errnosupport            ;$4F63 _EnableLibraryHook 
.dl errnosupport            ;$4F66 _SetGetKeyHook 
.dl errnosupport            ;$4F69 _ClrCursorHook 
.dl errnosupport            ;$4F6C _DisableLibraryHook 
.dl errnosupport            ;$4F6F _ClrRawKeyHook 
.dl errnosupport            ;$4F72 _ResetHookBytes 
.dl errnosupport            ;$4F75 _AdjustAllHooks 
.dl errnosupport            ;$4F78 _getkeyhook 
.dl errnosupport            ;$4F7B _SetGetcscHook 
.dl errnosupport            ;$4F7E _ClrGetKeyHook 
.dl errnosupport            ;$4F81 _call_linkactivity_hook 
.dl errnosupport            ;$4F84 _EnableLinkActivityHook 
.dl errnosupport            ;$4F87 _DisableLinkHook 
.dl errnosupport            ;$4F8A _GetSmallPacket2 
.dl errnosupport            ;$4F8D _EnableCatalog2Hook 
.dl errnosupport            ;$4F90 _DisableCatalog2Hook 
.dl errnosupport            ;$4F93 _EnableLocalizeHook 
.dl errnosupport            ;$4F96 _DisableLocalizeHook 
.dl errnosupport            ;$4F99 _SetTokenHook 
.dl errnosupport            ;$4F9C _ClearTokenHook 
.dl errnosupport            ;$4F9F  
.dl errnosupport            ;$4FA2  
.dl errnosupport            ;$4FA5 _DispListElementOffLA 
.dl errnosupport            ;$4FA8 _Bit_VertSplit 
.dl errnosupport            ;$4FAB _SetHomescreenHook 
.dl errnosupport            ;$4FAE _ClrHomeScreenHook 
.dl errnosupport            ;$4FB1 _SetWindowHook 
.dl errnosupport            ;$4FB4 _DisableWindowHook 
.dl errnosupport            ;$4FB7 _SetGraphModeHook 
.dl errnosupport            ;$4FBA _DisableGraphHook 
.dl errnosupport            ;$4FBD _ParseAndStoreSysVar 
.dl errnosupport            ;$4FC0 _DisplayEditSysVar 
.dl errnosupport            ;$4FC3 _JForceWindowSettings 
.dl errnosupport            ;$4FC6 _DelVarArc 
.dl errnosupport            ;$4FC9 _DelVarNoArc 
.dl errnosupport            ;$4FCC _SetAllPlots 
.dl errnosupport            ;$4FCF _SetYeditHook 
.dl errnosupport            ;$4FD2 _DisableYEquHook 
.dl errnosupport            ;$4FD5 _JForceYEqu 
.dl errnosupport            ;$4FD8 _Arc_Unarc 
.dl errnosupport            ;$4FDB _ArchiveVar 
.dl errnosupport            ;$4FDE _UnarchiveVar 
.dl errnosupport            ;$4FE1 _DialogKeyHook 
.dl errnosupport            ;$4FE4 _SetFontHook 
.dl errnosupport            ;$4FE7 _ClrFontHook 
.dl errnosupport            ;$4FEA _SetRegraphHook 
.dl errnosupport            ;$4FED _DisableRegraphHook 
.dl errnosupport            ;$4FF0 _RunGraphingHook 
.dl errnosupport            ;$4FF3 _SetTraceHook 
.dl errnosupport            ;$4FF6 _DisableTraceHook 
.dl errnosupport            ;$4FF9 _RunTraceHook 
.dl errnosupport            ;$4FFC _NDeriv 
.dl errnosupport            ;$4FFF _PolarDerivative 
.dl errnosupport            ;$5002 _JForceGraphNoKey 
.dl errnosupport            ;$5005 _JForceGraphKey 
.dl errnosupport            ;$5008 _PowerOff 
.dl errnosupport            ;$500B _GetKeyRetOff 
.dl errnosupport            ;$500E _FindGroupSym 
.dl errnosupport            ;$5011 _FillBasePageTable 
.dl errnosupport            ;$5014 _ArcChk 
.dl errnosupport            ;$5017 _FlashToRam 
.dl errnosupport            ;$501A _LoadDEIndPaged 
.dl errnosupport            ;$501D _LoadCIndPaged 
.dl errnosupport            ;$5020 _SetupPagedPtr 
.dl errnosupport            ;$5023 _PagedGet 
.dl errnosupport            ;$5026 _SetParserHook 
.dl errnosupport            ;$5029 _ClearParserHook 
.dl errnosupport            ;$502C _SetAppChangeHook 
.dl errnosupport            ;$502F _ClearAppChangeHook 
.dl errnosupport            ;$5032 _EnableGraphicsHook 
.dl errnosupport            ;$5035 _DisableGraphicsHook 
.dl errnosupport            ;$5038 _IPointNoGraphicsHook 
.dl errnosupport            ;$503B _ILineNoHook 
.dl errnosupport            ;$503E  
.dl errnosupport            ;$5041 _DeleteTempPrograms 
.dl errnosupport            ;$5044 _EnableCatalog1Hook 
.dl errnosupport            ;$5047 _DisableCatalog1Hook 
.dl errnosupport            ;$504A _EnableHelpHook 
.dl errnosupport            ;$504D _DisableHelpHook 
.dl errnosupport            ;$5050 _DispCatalogEnd 
.dl errnosupport            ;$5053 _GetMenuKeypress 
.dl errnosupport            ;$5056 _GetCatalogItem 
.dl errnosupport            ;$5059 _RunCatalog2Hook 
.dl errnosupport            ;$505C _RunCatalog1Hook 
.dl errnosupport            ;$505F  
.dl errnosupport            ;$5062  
.dl errnosupport            ;$5065 _dispMenuTitle 
.dl errnosupport            ;$5068  
.dl errnosupport            ;$506B _EnablecxRedispHook 
.dl errnosupport            ;$506E _DisablecxRedispHook 
.dl errnosupport            ;$5071 _BufCpy 
.dl errnosupport            ;$5074 _BufClr 
.dl errnosupport            ;$5077 _UnOPExec2 
.dl errnosupport            ;$507A _BinOPExec2 
.dl errnosupport            ;$507D _LoadMenuB 
.dl errnosupport            ;$5080 _DisplayVarInfo 
.dl errnosupport            ;$5083 _SetMenuHook 
.dl errnosupport            ;$5086 _ClearMenuHook 
.dl errnosupport            ;$5089 _getBCOffsetIX 
.dl errnosupport            ;$508C _GetBCOffsetIX2 
.dl errnosupport            ;$508F _ForceFullScreen 
.dl errnosupport            ;$5092 _GetVariableData 
.dl errnosupport            ;$5095 _FindSwapSector 
.dl errnosupport            ;$5098 _CopyFlashPage 
.dl errnosupport            ;$509B _FindAppNumPages 
.dl errnosupport            ;$509E _HLMinus5 
.dl errnosupport            ;$50A1 _SendArcPacket 
.dl errnosupport            ;$50A4 _ForceGraphKeypress 
.dl errnosupport            ;$50A7 _DoNothing3 
.dl errnosupport            ;$50AA _FormBase 
.dl errnosupport            ;$50AD  
.dl errnosupport            ;$50B0 _IsFragmented 
.dl errnosupport            ;$50B3 _Chk_Batt_Low 
.dl errnosupport            ;$50B6 _Chk_Batt_Low_2 
.dl errnosupport            ;$50B9 _Arc_Unarc2 
.dl errnosupport            ;$50BC _GetAppBasePage 
.dl errnosupport            ;$50BF _SetExSpeed 
.dl errnosupport            ;$50C2 _RclExit 
.dl errnosupport            ;$50C5 _GroupAllVars 
.dl errnosupport            ;$50C8 _UngroupVar 
.dl errnosupport            ;$50CB _WriteToFlash 
.dl errnosupport            ;$50CE _SetSilentLinkHook 
.dl errnosupport            ;$50D1 _DisableSilentLinkHook 
.dl errnosupport            ;$50D4 _TwoVarSet 
.dl errnosupport            ;$50D7 _ExecClassCToken 
.dl errnosupport            ;$50DA _ExecClass3Token 
.dl errnosupport            ;$50DD _GetSysInfo 
.dl errnosupport            ;$50E0 _NZIf83Plus 
.dl errnosupport            ;$50E3 _LinkStatus 
.dl errnosupport            ;$50E6 _DoNothing2 
.dl errnosupport            ;$50E9 _KeyboardGetKey 
.dl errnosupport            ;$50EC _RunAppLib 
.dl errnosupport            ;$50EF _FindSpecialAppHeader 
.dl errnosupport            ;$50F2 _SendUSBData 
.dl errnosupport            ;$50F5 _AppGetCBLUSB 
.dl errnosupport            ;$50F8 _AppGetCalcUSB 
.dl errnosupport            ;$50FB _GetVarCmdUSB 
.dl errnosupport            ;$50FE  
.dl errnosupport            ;$5101 _TenX2 
.dl errnosupport            ;$5104  
.dl errnosupport            ;$5107  
.dl errnosupport            ;$510A _GetVarVersion 
.dl errnosupport            ;$510D  
.dl errnosupport            ;$5110  
.dl errnosupport            ;$5113 _DeleteTempEditEqu 
.dl errnosupport            ;$5116 _JcursorFirst2 
.dl errnosupport            ;$5119  
.dl errnosupport            ;$511C _PromptMoveBackLeft 
.dl errnosupport            ;$511F _wputsEOL2 
.dl errnosupport            ;$5122 _InvertTextInsMode 
.dl errnosupport            ;$5125  
.dl errnosupport            ;$5128 _ResetDefaults 
.dl errnosupport            ;$512B _ZeroFinanceVars 
.dl errnosupport            ;$512E _DispHeader 
.dl errnosupport            ;$5131 _JForceGroup 
.dl errnosupport            ;$5134  
.dl errnosupport            ;$5137  
.dl errnosupport            ;$513A _DispCoords 
.dl errnosupport            ;$513D  
.dl errnosupport            ;$5140  
.dl errnosupport            ;$5143 _chkTmr 
.dl errnosupport            ;$5146  
.dl errnosupport            ;$5149  
.dl errnosupport            ;$514C  
.dl errnosupport            ;$514F _getDate 
.dl errnosupport            ;$5152 _GetDateString 
.dl errnosupport            ;$5155 _getDtFmt 
.dl errnosupport            ;$5158 _getDtStr 
.dl errnosupport            ;$515B _getTime 
.dl errnosupport            ;$515E _GetTimeString 
.dl errnosupport            ;$5161 _getTmFmt 
.dl errnosupport            ;$5164 _getTmStr 
.dl errnosupport            ;$5167 _SetZeroOne 
.dl errnosupport            ;$516A _setDate 
.dl errnosupport            ;$516D _IsOneTwoThree 
.dl errnosupport            ;$5170 _setTime 
.dl errnosupport            ;$5173 _IsOP112or24 
.dl errnosupport            ;$5176 _chkTimer0 
.dl errnosupport            ;$5179 _timeCnv 
.dl errnosupport            ;$517C _GetLToOP1Extra 
.dl errnosupport            ;$517F _ClrWindowAndFlags 
.dl errnosupport            ;$5182 _SetMachineID 
.dl errnosupport            ;$5185 _ResetLists 
.dl errnosupport            ;$5188 _DispValue 
.dl errnosupport            ;$518B  
.dl errnosupport            ;$518E  
.dl errnosupport            ;$5191 _ExecLib 
.dl errnosupport            ;$5194  
.dl errnosupport            ;$5197 _CPOP1OP2Rounded 
.dl errnosupport            ;$519A _CPOP1OP2Rounded2 
.dl errnosupport            ;$519D _OpenLib 
.dl errnosupport            ;$51A0  
.dl errnosupport            ;$51A3  
.dl errnosupport            ;$51A6 _ResetIOPrompt 
.dl errnosupport            ;$51A9 _StrCpyVarData 
.dl errnosupport            ;$51AC _SetUpEditor 
.dl errnosupport            ;$51AF _SortA 
.dl errnosupport            ;$51B2 _SortD 
.dl errnosupport            ;$51B5  
.dl errnosupport            ;$51B8 _IsOP1ResID 
.dl errnosupport            ;$51BB _ListEdNameCxMain 
.dl errnosupport            ;$51BE _ListEdEnterNewName 
.dl errnosupport            ;$51C1  
.dl errnosupport            ;$51C4 _ForceModeKeypress 
.dl errnosupport            ;$51C7 _DispAboutScreen 
.dl errnosupport            ;$51CA _ChkHelpHookVer 
.dl errnosupport            ;$51CD _Disp32 
.dl errnosupport            ;$51D0  
.dl errnosupport            ;$51D3  
.dl errnosupport            ;$51D6  
.dl errnosupport            ;$51D9  
.dl errnosupport            ;$51DC _DrawTableEditor 
.dl errnosupport            ;$51DF _DisplayListNameEquals 
.dl errnosupport            ;$51E2 _DisplayListHeader 
.dl errnosupport            ;$51E5 _DispMatrixDimensions 
.dl errnosupport            ;$51E8 _HighlightListEdItem 
.dl errnosupport            ;$51EB  
.dl errnosupport            ;$51EE  
.dl errnosupport            ;$51F1 _MatrixName 
.dl errnosupport            ;$51F4  
.dl errnosupport            ;$51F7  
.dl errnosupport            ;$51FA  
.dl errnosupport            ;$51FD  
.dl errnosupport            ;$5200  
.dl errnosupport            ;$5203  
.dl errnosupport            ;$5206  
.dl errnosupport            ;$5209  
.dl errnosupport            ;$520C  
.dl errnosupport            ;$520F  
.dl errnosupport            ;$5212 _SetupEmptyEditTempEqu 
.dl errnosupport            ;$5215 _ExecClass1Token 
.dl errnosupport            ;$5218 _HandleMathTokenParse 
.dl errnosupport            ;$521B _MaybePushMultiplyOp 
.dl errnosupport            ;$521E _RestartParseOP1Result 
.dl errnosupport            ;$5221 _Chk_Batt_Level 
.dl errnosupport            ;$5224  
.dl errnosupport            ;$5227  
.dl errnosupport            ;$522A  
.dl errnosupport            ;$522D _DisplayListEquals 
.dl errnosupport            ;$5230 _GetCurPlotListOffset 
.dl errnosupport            ;$5233 _GoToLastRow 
.dl errnosupport            ;$5236 _RectBorder 
.dl errnosupport            ;$5239  
.dl errnosupport            ;$523C  
.dl errnosupport            ;$523F  
.dl errnosupport            ;$5242 _LoadA5 
.dl errnosupport            ;$5245  
.dl errnosupport            ;$5248 _NamedListToOP1 
.dl errnosupport            ;$524B  
.dl errnosupport            ;$524E  
.dl errnosupport            ;$5251  
.dl errnosupport            ;$5254 _InitUSBDeviceCallback 
.dl errnosupport            ;$5257 _KillUSBDevice 
.dl errnosupport            ;$525A _SetUSBConfiguration 
.dl errnosupport            ;$525D _RequestUSBData 
.dl errnosupport            ;$5260 _StopReceivingUSBData 
.dl errnosupport            ;$5263 _FindAppHeaderByPage 
.dl errnosupport            ;$5266 _FindNextHeaderByPage 
.dl errnosupport            ;$5269 _IsMatchingLaunchApp 
.dl errnosupport            ;$526C _InitTimer 
.dl errnosupport            ;$526F _KillTimer 
.dl errnosupport            ;$5272 _StartTimer 
.dl errnosupport            ;$5275 _RestartTimer 
.dl errnosupport            ;$5278 _StopTimer 
.dl errnosupport            ;$527B _WaitTimer 
.dl errnosupport            ;$527E _CheckTimer 
.dl errnosupport            ;$5281 _CheckTimerRestart 
.dl errnosupport            ;$5284 _SetVertGraphActive 
.dl errnosupport            ;$5287 _ClearVertGraphActive 
.dl errnosupport            ;$528A _EnableUSBHook 
.dl errnosupport            ;$528D _DisableUSBHook 
.dl errnosupport            ;$5290 _InitUSBDevice 
.dl errnosupport            ;$5293 _KillUSBPeripheral 
.dl errnosupport            ;$5296 _GetCurPlotListOffset2 
.dl errnosupport            ;$5299  
.dl errnosupport            ;$529C _GraphLine 
.dl errnosupport            ;$529F  
.dl errnosupport            ;$52A2  
.dl errnosupport            ;$52A5  
.dl errnosupport            ;$52A8  
.dl errnosupport            ;$52AB  
.dl errnosupport            ;$52AE  
.dl errnosupport            ;$52B1 _ZifTableEditor 
.dl errnosupport            ;$52B4  
.dl errnosupport            ;$52B7 _GetCurPlotOffset 
.dl errnosupport            ;$52BA  
.dl errnosupport            ;$52BD _FindAppName 
.dl errnosupport            ;$52C0  
.dl errnosupport            ;$52C3  
.dl errnosupport            ;$52C6 _UpdateStatPlotLists 
.dl errnosupport            ;$52C9 _GrBufCpyCustom 
.dl errnosupport            ;$52CC  
.dl errnosupport            ;$52CF  
.dl errnosupport            ;$52D2  
.dl errnosupport            ;$52D5 _VDispRealOP1 
.dl errnosupport            ;$52D8 _DispXEqualsNum 
.dl errnosupport            ;$52DB _ResetGraphSettings 
.dl errnosupport            ;$52DE _InitializeVariables 
.dl errnosupport            ;$52E1  
.dl errnosupport            ;$52E4 _DelVarSym 
.dl errnosupport            ;$52E7 _FindAppUpNoCase 
.dl errnosupport            ;$52EA _FindAppDnNoCase 
.dl errnosupport            ;$52ED _DeleteInvalidApps 
.dl errnosupport            ;$52F0 _DeleteApp_Link 
.dl errnosupport            ;$52F3 _CmpSymsNoCase 
.dl errnosupport            ;$52F6 _SetAppRestrictions 
.dl errnosupport            ;$52F9 _RemoveAppRestrictions 
.dl errnosupport            ;$52FC _QueryAppRestrictions 
.dl errnosupport            ;$52FF _DispAppRestrictions 
.dl errnosupport            ;$5302 _SetupHome 
.dl errnosupport            ;$5305 _GRPUTAWAYFull 
.dl errnosupport            ;$5308 _SendSmartPadKeypress 
.dl errnosupport            ;$530B _ToggleUSBSmartPadInput 
.dl errnosupport            ;$530E _IsUSBDeviceConnected 
.dl errnosupport            ;$5311 _RecycleUSB 
.dl errnosupport            ;$5314 _PolarEquToOP1 
.dl errnosupport            ;$5317 _ParamXEquToOP1 
.dl errnosupport            ;$531A _ParamYEquToOP1 
.dl errnosupport            ;$531D _GetRestrictionsOptions 
.dl errnosupport            ;$5320 _DispResetComplete 
.dl errnosupport            ;$5323 _PTTReset 
.dl errnosupport            ;$5326 _FindAppCustom 
.dl errnosupport            ;$5329 _ClearGraphStyles 
.dl errnosupport            ;$532C  
.dl errnosupport            ;$532F  
.dl errnosupport            ;$5332  

;===============================================================================
;84+SE boot 1.00 basecall table is 276 bytes long (92 entries) starting at #8018
#DEFINE BOOT_NUMCALLS 92

bcall_sbase_boot:
;.ds (bcall_sbase_boot+(3*BOOT_NUMCALLS))-$
.dl errnosupport            ;$8018  * MD5Final
.dl errnosupport            ;$801B  * RSAValidate
.dl errnosupport            ;$801E  * BigNumCompare
.dl errnosupport            ;$8021  * WriteAByte
.dl errnosupport            ;$8024  * EraseFlash
.dl errnosupport            ;$8027  * FindFirstCertificateField 
.dl errnosupport            ;$802A  * ZeroToCertificate
.dl errnosupport            ;$802D  * GetCertificateField
.dl errnosupport            ;$8030  * FindGroupedField
.dl donothing               ;$8033  * RET
.dl donothing               ;$8036  * RET
.dl donothing               ;$8039  * RET
.dl donothing               ;$803C  * RET
.dl donothing               ;$803F  * RET
.dl errnosupport            ;$8042  * Mult8By8
.dl errnosupport            ;$8045  * Mult16By8
.dl errnosupport            ;$8048  * Div16By8
.dl errnosupport            ;$804B  * Divide16By16
.dl errnosupport            ;$804E  
.dl errnosupport            ;$8051  * LoadAIndPaged
.dl errnosupport            ;$8054  * FlashToRAM2
.dl errnosupport            ;$8057  * GetCertificateStart
.dl errnosupport            ;$805A  * GetFieldSize
.dl errnosupport            ;$805D  * FindSubField
.dl errnosupport            ;$8060  * EraseCertificateSector
.dl errnosupport            ;$8063  * CheckHeaderKey
.dl errnosupport            ;$8066  
.dl errnosupport            ;$8069  
.dl errnosupport            ;$806C  * Load_LFontV2
.dl errnosupport            ;$806F  * Load_LFontV
.dl errnosupport            ;$8072  * ReceiveOS
.dl errnosupport            ;$8075  * FindOSHeaderSubField
.dl errnosupport            ;$8078  * FindNextCertificateField
.dl errnosupport            ;$807B  * GetByteOrBoot
.dl errnosupport            ;$807E  * GetCalcSerial
.dl errnosupport            ;$8081  
.dl errnosupport            ;$8084  * EraseFlashPage
.dl errnosupport            ;$8087  * WriteFlashUnsafe
.dl errnosupport            ;$808A  * DispBootVer
.dl errnosupport            ;$808D  * MD5Init
.dl errnosupport            ;$8090  * MD5Update
.dl errnosupport            ;$8093  * MarkOSInvalid
.dl errnosupport            ;$8096  
.dl errnosupport            ;$8099  * MarkOSValid
.dl errnosupport            ;$809C  * CheckOSValidated
.dl errnosupport            ;$809F  * SetupAppPubKey
.dl errnosupport            ;$80A2  * SigModR
.dl errnosupport            ;$80A5  * TransformHash
.dl errnosupport            ;$80A8  * IsAppFreeware
.dl errnosupport            ;$80AB  * FindAppheaderSubField
.dl errnosupport            ;$80AE  
.dl errnosupport            ;$80B1  * Div32By16
.dl errnosupport            ;$80B4  
.dl errnosupport            ;$80B7  * GetBootVer
.dl errnosupport            ;$80BA  * GetHWVer
.dl r0_bootxora             ;$80BD  * XorA
.dl errnosupport            ;$80C0  * bignumpowermod17
.dl errnosupport            ;$80C3  * ProdNrPart1
.dl errnosupport            ;$80C6  * WriteAByteSafe
.dl errnosupport            ;$80C9  * WriteFlash
.dl errnosupport            ;$80CC  * SetupDateStampPubKey
.dl errnosupport            ;$80CF  * SetFlashLowerBound
.dl errnosupport            ;$80D2  * LowBatteryBoot
.dl errnosupport            ;$80D5  
.dl errnosupport            ;$80D8  
.dl errnosupport            ;$80DB  
.dl errnosupport            ;$80DE  
.dl errnosupport            ;$80E1  
.dl errnosupport            ;$80E4  
.dl errnosupport            ;$80E7 ** DisplayBootMessage
.dl errnosupport            ;$80EA ** NewLineWrap
.dl errnosupport            ;$80ED  
.dl errnosupport            ;$80F0  
.dl errnosupport            ;$80F3  
.dl errnosupport            ;$80F6  
.dl errnosupport            ;$80F9 ** DispOSPercentage
.dl errnosupport            ;$80FC ** ResetCalc
.dl errnosupport            ;$80FF ** SetupOSPubKey
.dl errnosupport            ;$8102  
.dl errnosupport            ;$8105  
.dl errnosupport            ;$8108  
.dl errnosupport            ;$810B  
.dl errnosupport            ;$810E  
.dl errnosupport            ;$8111 #* Validate2048 
.dl errnosupport            ;$8114  
.dl errnosupport            ;$8117  
.dl errnosupport            ;$811A  
.dl errnosupport            ;$811D  
.dl errnosupport            ;$8120  
.dl errnosupport            ;$8123  
.dl errnosupport            ;$8126  
.dl errnosupport            ;$8129  

;** - These calls are present only on the TI-84+(SE), minimum HW ver 2
;#* - These calls are present only on the TI-84+(SE), minimum HW ver 3

