#include "Talkthrough.h"
#define SIGNALLENGTH 1500
#define SIG_APP 1000


short counter=0;
short data[SIGNALLENGTH]=
		{
			#include "minFil.dat"
		};

short rec_data[SIGNALLENGTH+SIG_APP];

//--------------------------------------------------------------------------//
// Function:	Process_Data()												//
//																			//
// Description: This function is called from inside the SPORT0 ISR every 	//
//				time a complete audio frame has been received. The new 		//
//				input samples can be found in the variables iChannel0LeftIn,//
//				iChannel0RightIn, iChannel1LeftIn and iChannel1RightIn 		//
//				respectively. The processed	data should be stored in 		//
//				iChannel0LeftOut, iChannel0RightOut, iChannel1LeftOut,		//
//				iChannel1RightOut, iChannel2LeftOut and	iChannel2RightOut	//
//				respectively.												//
//--------------------------------------------------------------------------//
void Process_Data(void)
{
	short xn, yn;

	// FlagAMode is changed by using pushbutton	SW4 on board..
	switch (FlagAMode) {
		case PASS_THROUGH :
			counter=0;

			iChannel0LeftOut = 0;

			iChannel1RightOut = 0;
			break;


		case IIR_FILTER_ACTIVE : // Button PF8 pressed

			if(counter<SIGNALLENGTH)
			{
				yn=data[counter];
				iChannel0LeftOut = yn << 16; // Convert to 24 bits
				iChannel0RightOut = yn << 16;
			}

			if(counter<SIGNALLENGTH+SIG_APP)
			{
				rec_data[counter] = iChannel0LeftIn>>16;
			}
			counter++;
			if(counter>=SIGNALLENGTH+SIG_APP)
			{
				counter=SIGNALLENGTH+SIG_APP;
			}
			break;

	}	// end switch


}
