//Pseudokode til DSA CASE 4

#define SIGNAL_LENGTH 882




//Til afspilning og optagelse af lyd.
int i=0;
for(i; i<SIGNAL_LENGTH; i++)
{
	leftout=data(i);
	recorded(i)=mic_in;
}