/*
 *--------------------------------------
 * Program Name: Project VANISH Loader
 * Author: Rodger "Iambian" Weisman
 * License: MIT
 * Description: Loads a program into a TI-83 Plus runtime environment on the CE
 *--------------------------------------
*/

/* Keep these headers */
#include <stdbool.h>
#include <stddef.h>
#include <stdint.h>
#include <tice.h>

/* Standard headers (recommended) */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

/* External library headers */
#include <debug.h>
#include <keypadc.h>
#include <graphx.h>
#include <decompress.h>
#include <fileioc.h>

/* Put your function prototypes here */
typedef void func(void);
func* debugfn = (func*)0xD60000;
void printline(char *s);
void printerr(char *s);
void keywait();
void waitanykey();


/* Put all your globals here */
uint8_t texty;

void main(void) {
	void *fptr,*dptr;
	ti_var_t slot;
	int i,j;
	gfx_Begin();
	gfx_SetDrawBuffer();
	ti_CloseAll();
	
	gfx_FillScreen(0xBF);
	texty = 5;

	printline("Initializing loader system.");
	
	if (!(slot = ti_Open("VANISHR0","r"))) { printerr("Cannot find/open VANISHR0"); gfx_End(); return;	}
	dzx7_Turbo(ti_GetDataPtr(slot),(void*)0xD40000); //USE rom0_base_adr
	ti_CloseAll();
	if (!(slot = ti_Open("VANISHR1","r"))) { printerr("Cannot find/open VANISHR1"); gfx_End(); return;	}
	dzx7_Turbo(ti_GetDataPtr(slot),(void*)0xD50000); //USE rom1_base_adr
	ti_CloseAll();
	if (!(slot = ti_Open("VANISHR2","r"))) { printerr("Cannot find/open VANISHR2"); gfx_End(); return;	}
	dzx7_Turbo(ti_GetDataPtr(slot),(void*)0xD60000); //USE rom2_base_adr
	ti_CloseAll();
	/*######################################################
	## DO NOT OUTPUT TO THE SCREEN BUFFER AFTER THIS POINT #
	######################################################*/
	if (!(slot = ti_OpenVar("DEADEYES","r",0x05))) {
		if (!(slot = ti_OpenVar("TESTRUN","r",0x05))) {
			printerr("Cannot find/open test programs."); gfx_End(); return;
		}
	}
	memcpy((void*)0xD49D93,ti_GetDataPtr(slot),24000);
	ti_CloseAll();
	/* ### START DEBUG ### */
	debugfn();
	/* ### END DEBUG ### */
	gfx_End();
	
}

/* Put other functions here */
void printline(char *s) {
	if (texty>230) return;
	gfx_PrintStringXY(s,5,texty);
	gfx_SwapDraw();
	gfx_PrintStringXY(s,5,texty);
	texty += 10;
}
void printerr(char *s) {
	uint8_t prev_color;
	prev_color = gfx_SetTextFGColor(0xC0); //red
	printline(s);
	gfx_SetTextFGColor(prev_color);
	waitanykey();
}
void keywait() {
	while (kb_AnyKey());  //wait until all keys are released
}
void waitanykey() {
	keywait();            //wait until all keys are released
	while (!kb_AnyKey()); //wait until a key has been pressed.
	keywait();
}	

