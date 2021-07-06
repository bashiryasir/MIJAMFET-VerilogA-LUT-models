*JLFET INVERTER
.hdl NFET.va
.hdl PFET.va
.OPTION POST
.options list post node=1
.subckt inverter Vin Vout Vvdd Vgnd

X0 Vout Vin Vgnd NFET W=1
X1 Vout Vin Vvdd PFET W=1

.ends
*** circuit layout
Vsup sup 0 1
X2 in out sup 0 inverter
c1 out 0 15pf

*** simulation                                                                                                                                                                                                                            

.op
V1 in 0 pulse(0 1 0n 100n 100n 2u 4u)

.tran 1ps 8us
.MEASURE TRAN tpHL TRIG V(in) VAL='0.5' RISE=1 TARG V(out) VAL='0.5' FALL=1
.MEASURE TRAN tpLH TRIG V(in) VAL='0.5' FALL=1 TARG V(out) VAL='0.5' RISE=1
.MEASURE TRAN tpavg PARAM='(tpHL+tpLH)/2'
.options post
*** END
.end

 