*  Generated for: PrimeSim
*  Design library name: Mixer
*  Design cell name: Mixer_tb
*  Design view name: schematic
.lib 'saed32nm.lib' TT
.param F=1meg
*Custom Compiler Version S-2021.09
*Mon Feb 28 12:08:53 2022

.global gnd!
********************************************************************************
* Library          : Mixer
* Cell             : Mixer
* View             : schematic
* View Search List : hspice hspiceD schematic spice veriloga
* View Stop List   : hspice hspiceD
********************************************************************************
.subckt mixer vdd vss v_lo+ v_lo- v_rf+ v_rf- v_out+ v_out-
xm7 net6 net6 vss vss n105 w=2u l=0.03u nf=20 m=1
xm6 net4 net4 vss vss n105 w=2u l=0.03u nf=20 m=1
xm5 net3 net4 vss vss n105 w=2u l=0.03u nf=20 m=1
xm4 net5 net6 vss vss n105 w=2u l=0.03u nf=20 m=1
xm3 v_out- v_lo+ net2 vss n105 w=6u l=0.03u nf=60 m=1
xm2 v_out+ v_lo- net2 vss n105 w=6u l=0.03u nf=60 m=1
xm1 v_out- v_lo- net5 vss n105 w=6u l=0.03u nf=60 m=1
xm0 v_out+ v_lo+ net5 vss n105 w=6u l=0.03u nf=60 m=1
xm21 net1 v_bias vdd vdd p105 w=3u l=0.03u nf=30 m=1
xm20 net7 v_bias vdd vdd p105 w=3u l=0.03u nf=30 m=1
xm19 net10 v_bias vdd vdd p105 w=6u l=0.03u nf=60 m=1
xm18 net8 v_bias2 net9 vdd p105 w=6u l=0.03u nf=60 m=1
xm17 net9 v_bias vdd vdd p105 w=6u l=0.03u nf=60 m=1
xm27 v_out+ v_bias2 net7 vdd p105 w=3u l=0.03u nf=30 m=1
xm28 v_out- v_bias2 net1 vdd p105 w=3u l=0.03u nf=30 m=1
xm9 net4 v_rf- net8 vdd p105 w=6u l=0.03u nf=60 m=1
xm8 net6 v_rf+ net8 vdd p105 w=6u l=0.03u nf=60 m=1
r16 net2 net3 r=1m
r26 v_bias v_bias2 r=3k
r29 net10 v_bias r=3k
i30 v_bias2 vss dc=100u
.ends mixer

********************************************************************************
* Library          : Mixer
* Cell             : Mixer_tb
* View             : schematic
* View Search List : hspice hspiceD schematic spice veriloga
* View Stop List   : hspice hspiceD
********************************************************************************
xi0 net14 gnd! net38 net22 net39 net20 net33 net29 mixer
xm16 net14 net33 net34 gnd! n105 w=3u l=0.03u nf=30 m=1
xm15 net14 net29 net36 gnd! n105 w=3u l=0.03u nf=30 m=1
v5 net20 gnd! dc=0.5
v4 net22 gnd! dc=0.7
v3 net14 gnd! dc=1.8
v19 net39 net20 dc=0 cos ( 0 100m 50meg 0 0 0 )
r18 net36 gnd! r=1k
r17 net34 gnd! r=1k
v20 net38 net22 dc=0 sin ( 0 100m 450meg 0 0 0 )








.tran '500p' '50n' name=tran

.option primesim_remove_probe_prefix = 0
.probe v(*) i(*) level=1
.probe tran v(net29) v(net33) v(net38) v(net39)

.temp 25



.option primesim_output=wdf


.option parhier = LOCAL






.end
