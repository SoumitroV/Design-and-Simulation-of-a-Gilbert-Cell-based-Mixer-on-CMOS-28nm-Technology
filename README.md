# Design-and-Simulation-of-a-Gilbert-Cell-based-Mixer-on-CMOS-28nm-Technology

## Table of Contents

- [Introduction](https://github.com/SoumitroV/Design-and-Simulation-of-a-Gilbert-Cell-based-Mixer-on-CMOS-28nm-Technology/edit/main/README.md#introduction)
- [Device Characterization](https://github.com/SoumitroV/Design-and-Simulation-of-a-Gilbert-Cell-based-Mixer-on-CMOS-28nm-Technology/edit/main/README.md#device-characterization)
- [Circuit Design](https://github.com/SoumitroV/Design-and-Simulation-of-a-Gilbert-Cell-based-Mixer-on-CMOS-28nm-Technology/edit/main/README.md#circuit-design)
- [Simulation Results](https://github.com/SoumitroV/Design-and-Simulation-of-a-Gilbert-Cell-based-Mixer-on-CMOS-28nm-Technology/edit/main/README.md#simulation-results)
- [Performance Comparison](https://github.com/SoumitroV/Design-and-Simulation-of-a-Gilbert-Cell-based-Mixer-on-CMOS-28nm-Technology/edit/main/README.md#performance-comparison)
- [Conclusion](https://github.com/SoumitroV/Design-and-Simulation-of-a-Gilbert-Cell-based-Mixer-on-CMOS-28nm-Technology/edit/main/README.md#conclusion)
- [Author](https://github.com/SoumitroV/Design-and-Simulation-of-a-Gilbert-Cell-based-Mixer-on-CMOS-28nm-Technology/edit/main/README.md#author) 
- [Acknowledgements](https://github.com/SoumitroV/Design-and-Simulation-of-a-Gilbert-Cell-based-Mixer-on-CMOS-28nm-Technology/edit/main/README.md#acknowledgements)
- [References](https://github.com/SoumitroV/Design-and-Simulation-of-a-Gilbert-Cell-based-Mixer-on-CMOS-28nm-Technology/edit/main/README.md#references)

## Introduction

Mixers find wide use in communication applications especially in up and down converter analog font ends. New applications such as Radio Frequency Integrated Circuits (RFIC) require low-power, low-cost single chip designs. This repository presents the design and simulation of Gilbert cell based mixer on CMOS 28nm technology. The design has been created on Synopsis [Custom Compiler](https://www.synopsys.com/implementation-and-signoff/custom-design-platform/custom-compiler.html) software and simulated using [PrimeWave](https://www.synopsys.com/implementation-and-signoff/ams-simulation/primewave.html) environment. 

<p align="center">
<img src="https://user-images.githubusercontent.com/41693726/155741693-ada2c3e9-4e41-4473-857c-a0bd099c9e77.png">
</p>
<p align="center">
Fig 1. Mixer schematic
</p>

Fig 1. shows the mixer schematic, consisting of a folded Gilbert cell. Here the local oscillator's (LO) differential input is fed to M1-M2 and M3-M4 pairs which act as transconductance amplifiers. The output current of both amplifiers is summed with opposite polarity and passed through load resistors R_L to produce the differential output voltage. The transconductance of both amplifiers can be varied by varying the currents I_1 and I_2. This is achieved with current mirror formed using FET’s M7-M9 and M8-M10 controlled using the differential pair (M5-M6). The Radio Frequency (RF) signal is applied to this differential pair M5-M6, hence modulating the gain for the LO signal. The use of current mirror results in larger output voltage swing and ease of biasing.

## Device Characterization

Before the design of any circuit, a thorough understanding of the characteristics of used device is required. This becomes even more crucial for MOS devices of lower technology nodes which deviate a lot from the ideal MOS characteristics due to short channel effects.

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

Fig 3. presents I_D of NMOS device as a function of V_GS for some fixed value of V_DS. As can be observed the device is no longer follows the square law but has a linear rise even in saturation region due to velocity saturation effects!

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

Fig 5. presents the mixer schematic. The schematic has been modified to include PMOS devices as active current loads followed with cascode transistors. This results in larger voltage gain while consuming lesser head room compared to resistors. This modification requires proper biasing which in this case has been provided using a PMOS followed with a resistor network. This configuration can be easily replaced with a low voltage cascode current mirror if better matching is required in presence of threshold voltage variations. Although square law cannot be used to determine the quiescent currents, width scaling to generate scaled currents still holds especially when fingers are used. Hence a reference current source (I) is used and mirrored in the RF branch, while the active PMOS loads are designed to mirror I/2 each. 

## Simulation Results

<p align="center">
<img src="https://user-images.githubusercontent.com/41693726/155828213-806a2334-16f8-49d9-be31-1632b2d17759.png">
</p>
<p align="center">
Fig 6. Mixer simulation input and output waveforms
</p>

The simulation of mixer was performed using specifications as presented in [1]. Fig 6. shows the mixer output waveform obtained by applying f_RF = 50MHz and f_LO = 450MHz. The resulting output signal has a frequency IF_1 = 400MHz and IF_2  = 500MHz. Note that the mixer provides almost unity gain or a conversion gain of 0.131dB precisely.

<br/>
<p align="center">
<img src="https://user-images.githubusercontent.com/41693726/155828222-2450f627-bf53-462a-b0da-fac1b0b3abcc.png">
</p>
<p align="center">
Fig 7. DFT of output waveform
</p>

Fig 7. shows the output signal's DFT normalized wrt to peak frequency component. As can be observed, the spectrum peaks around f = 400MHz and f = 500MHz confirming the multiplying property. Intrestingly figure also shows presence of a 50MHz component as some of the RF signal gets leaked to the output.

<br/>
<p align="center">
<img src="https://user-images.githubusercontent.com/41693726/155829965-e9b49c90-fa84-4958-9092-fc9c61f89e83.png">
</p>
<p align="center">
Fig 8. Testbench used to determine -3dB point
</p>

Fig 8. shows the testbench setup used to determine -3dB point for the mixer. A "vsource" element is used to provide the RF and LO signal. AC analysis is performed by using the default frequency as sweep variable and the magnitude of output differential signal is set as output. Note that the output signals are terminated with two NMOS source follower circuits to simulate the effect of connecting the mixer to further stages in an IC. 


<br/>
<p align="center">
<img src="https://user-images.githubusercontent.com/41693726/155829961-13622c5c-7f77-4aa9-aea0-61ac9921b12e.png">
</p>
<p align="center">
Fig 9. Magnitude plot of output signal
</p>

Fig 9. shows that the -3dB point for the mixer is achieved at a frequency of 7.14GHz. Hence the mixer can be easily used for ISM band between 902MHz and 928MHz as well.

<br/>

<br/>
<p align="center">
<img src="https://user-images.githubusercontent.com/41693726/155830279-15d2d7ff-7a21-42c6-bea2-0e55e32a6a5f.png">
</p>
<p align="center">
Fig 10. DC transfer curves of the mixer
</p>

Finally, Fig 10. presents the DC transfer curves of the designed mixer. The mixer lacks linearity especially for higher voltage levels of RF signal, this is evident from the unevenly spaced transfer curves which bunch up for higher RF voltage.

## Performance Comparison

|               |      [1]      |      [2]      |   This work   |
|     :---:     |     :---:     |     :---:     |     :---:     |
|     Vdd (V)   |      5.0      |      1.2      |      1.8      |
|Frequency (GHz)|     0.433     |      4.0      |     0.45      |
|Technology (nm)|      700      |      180      |      28       |
|     Gain      |      3.35     |      1.3      |     1.015     |
|  Power (mW)   |       3       |      7.1      |      0.54     |
|Chip Size (mm sq)|       -       |      0.82      |      -     |

The table presents performance comparison with previously done work in literature. A clear trade off between gain and power can be observed here. The chip area can be determined with post layout measurements and is expected to be smaller than higher technology nodes.

## Conclusion

The repository presents the design and simulation of Gilbert cell based mixer on 28nm technology node. The design consumes 0.54mW of power at 1.8V and provides nearly unity gain. Future works can include improvement of conversion gain and increase in linearity by using better designs and biasing techniques. 

## Author

Soumitro Vyapari, B.Tech(EE), Indian Institute of Technology Tirupati,  Andhra Pradesh 517506.

## Acknowledgements

- [Kunal Ghosh, Co-founder, VSD Corp. Pvt Ltd.](https://www.linkedin.com/in/kunal-ghosh-vlsisystemdesign-com-28084836?lipi=urn%3Ali%3Apage%3Ad_flagship3_profile_view_base_contact_details%3B0xcWjpLDThSEo6S9UPO9Tw%3D%3D)
- Chinmay Panda, IIT Hyderabad
- [Synopsis Team/Company](synopsys.com/company/contact-synopsys/office-locations/india/about-synopsys-india.html)
- [IIT Hyderabad](https://www.iith.ac.in/events/2022/02/15/Cloud-Based-Analog-IC-Design-Hackathon/)
- Active and vibrant hackathon community

## References

[1] Daniel Celino, Yuri Olivato, Talita Granado, J.H. Correia, and Joao Carmo. A rf modulator demodulator for small signal range wireless devices. 07 2016.<br/>
[2] SAZ Murad, RK Pokharel, H Kanaya, and K Yoshida. A 3.0–5.0 ghz high linearity and low power cmos up-conversion mixer for uwb applications. In 2010 IEEE International Conference of Electron Devices and SolidState Circuits (EDSSC), pages 1–4. IEEE, 2010.<br/>
[3] Design of Analog CMOS Integrated Circuits (Behzad Razavi), McGraw-Hill, 2001.


