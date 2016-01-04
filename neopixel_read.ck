
SerialIO.list() @=> string list[];

Gain master => JCRev j => dac;

SinOsc s1 => master;
TriOsc sin2 => PitShift pit => ResonZ rez => master;



1 => master.gain;

0.09 => j.mix;
0.04 => j.gain;

for(int i; i < list.cap(); i++)
{
    chout <= i <= ": " <= list[i] <= IO.newline();
}

0 => int device;
if(me.args()) me.arg(0) => Std.atoi => device;

SerialIO cereal;
cereal.open(device, SerialIO.B9600, SerialIO.ASCII);

while(true)
{
    cereal.onInts(2) => now;
    cereal.getInts() @=> int ints[];
    chout <= "ints: ";
    for(int i; i < ints.cap(); i++)
    {
        chout <= ints[i] <= " ";
        
          Std.ftom(ints[i]) => s1.freq;
   Std.mtof(ints[i]) => sin2.freq;
ints[i]/2 => pit.shift;

 // Std.mtof(A[b]/Math.sin(2000)) => rez.freq;
   150 => rez.freq; //- ( float , READ/WRITE ) - center frequency
 0.9 => rez.Q ;//- ( float , READ/WRITE ) - Q (quality)
    }
    
    chout <= IO.newline();
}
