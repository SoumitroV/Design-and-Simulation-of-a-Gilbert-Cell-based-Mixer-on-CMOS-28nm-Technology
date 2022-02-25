# Design-and-Simulation-of-a-Gilbert-Cell-based-Mixer-on-CMOS-28nm-Technology

## Table of Contents

Introduction

Device Characterization

Circuit Design

Simulation

Author 

Acknowledgements

## Introduction

Mixers find wide use in communication applications expecially in up and down converter analog font ends. New applications such as Radio Frequency Integrated Circuits (RFIC) require low-power, low-cost single chip designs. This repository presents the design and simulation of Gilbert cell based mixer on CMOS 28nm technology. The design has been created on Synopsis [Custom Compiler](https://www.synopsys.com/implementation-and-signoff/custom-design-platform/custom-compiler.html) software and simulated using [PrimeWave](https://www.synopsys.com/implementation-and-signoff/ams-simulation/primewave.html) environment. 

<p align="center">
<img src="https://user-images.githubusercontent.com/41693726/155741693-ada2c3e9-4e41-4473-857c-a0bd099c9e77.png">
</p>
<p align="center">
Fig 1. Mixer schematic
</p>

Fig 1. shows the mixer schematic, consisting of a folded Gilbert cell. Here the local oscillator's (LO) differential input is fed to M1-M2 and M3-M4 pairs which act as transconductance amplifiers. The output current of both amplifiers is summed with opposite polarity and passed through load resistors R_L to produce the differential output voltage. The transconductance of both amplifiers can be varied by varying the currents I_1 and I_2. This is achieved with current mirror formed using FET’s M7-M9 and M8-M10 controlled using the differential pair (M5-M6). The Radio Frequency (RF) signal is applied to this differential pair M5-M6, hence modulating the gain for the LO signal. The use of current mirror results in larger output voltage swing and ease of biasing.

## Device Characterization

Before the design of any circuit, a thorough understanding of the characterisitics of used device is required. This becomes even more crucial for MOS devices of lower technology nodes which deviate a lot from the ideal MOS characteristics due to short channel effects.

The device characterization of NMOS and PMOS was performed using standard circuits for device characterization. The mosfets were taken from 28nm PDK library with width to length ratio of 0.3um/0.03um. The drain to source voltages and gate to source voltages were sweeped to produce the below plots.

<br/>
<p align="center">
<img src="https://user-images.githubusercontent.com/41693726/155748353-a8f99600-4016-4db4-a576-994fc59fc3b5.png">
</p>
<p align="center">
Fig 2. I_D vs V_DS for NMOS device
</p>

Fig 2. presents the drain current (I_D) of NMOS device as a function of drain to source voltage (V_DS) for some fixed value of gate to source voltage (V_GS). As can be observed the device in saturation region has a high slope indicating a strong dependence on V_DS. This presents a challenge to the circuit designer as the MOS no longer remains an ideal transconductance device!

<br/>
<p align="center">
<img src="https://user-images.githubusercontent.com/41693726/155748383-1163c4ea-103f-49d2-a4af-e50f61ac9591.png">
</p>
<p align="center">
Fig 3. I_D vs V_GS for NMOS device
</p>

Fig 3. presents I_D of NMOS device as a function of V_GS for some fixed value of V_DS. As can be observed the device is no longer follows the squared law but has a linear rise even in saturation region due to velocity saturation effects!

<br/>
<p align="center">
<img src="https://user-images.githubusercontent.com/41693726/155748683-c204c584-82d0-460f-80d6-8104c5c9ba94.png">
</p>
<p align="center">
Fig 4. I_D vs V_SG for PMOS device
</p>

Fig 4. presents I_D of PMOS device as a function of V_SG for some fixed value of V_SG. The PMOS device has lower current than NMOS for similar voltage levels.

## Circuit Design

<p align="center">
<img src="https://user-images.githubusercontent.com/41693726/155755254-912c3921-fa5f-4111-bebc-9109666a7832.png">
</p>
<p align="center">
Fig 5. Mixer schematic
</p>


