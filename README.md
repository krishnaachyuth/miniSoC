# RISC-V based SOC design with PLL,10-bit DAC and SRAM using Open-Source EDA tools #
Table of Contents
* [Introduction](https://github.com/krishnaachyuth/miniSoC/blob/main/README.md#Introduction)
* [EDA tools used](https://github.com/krishnaachyuth/miniSoC/blob/main/README.md#-EDA-Tools-Used-)
* [Theory](https://github.com/krishnaachyuth/miniSoC/blob/main/README.md#Theory)
  * [PLL Clock Multiplier](https://github.com/krishnaachyuth/miniSoC/blob/main/README.md#-PLL-Clock-Multiplier-)
      * [Specifications](https://github.com/krishnaachyuth/miniSoC/blob/main/README.md#Specifications)
      * [Pre-layout](https://github.com/krishnaachyuth/miniSoC/blob/main/README.md#Pre-layout)
        * [PD circuit](https://github.com/krishnaachyuth/miniSoC/blob/main/README.md#PD-circuit)
        * [Frequency Divider Circuit](https://github.com/krishnaachyuth/miniSoC/blob/main/README.md#Frequency-Divider-Circuit)
        * [Charge Pump(CP)](https://github.com/krishnaachyuth/miniSoC/blob/main/README.md#Charge-Pump(CP))
        * [VCO](https://github.com/krishnaachyuth/miniSoC/blob/main/README.md#VCO)
        * [PLL](https://github.com/krishnaachyuth/miniSoC/blob/main/README.md#PLL)
* DAC specs
* SRAM specs
* Installation & Runs
* Methodology
* OpenLane and sky 130 installation
* Synthesis
* References
* Acknowledgements


<h2>Introduction</h2>
This repository contains simulation files and other files on the VSDMiniSoC - RISC-V based SoC with PLL using PLL (Fclkin - 5MHz to 12MHz, Fclkout-40MHz to 100MHz at 1.8v),DAC and SRAM.The specifications are provided from VSD corporstion Pvt. Ltd. The On-chip multiplier is present in almost all synchronous processor chips(Integrated circuits).


<h2> EDA Tools Used </h2>

* [ngspice](http://ngspice.sourceforge.net/download.html) (simulation) <br>
* [magic](http://opencircuitdesign.com/magic/) (layout design) 

<h2>Theory</h2>
<h3> PLL Clock Multiplier </h3>

The block diagram of PLL is as shown below:
![image](https://user-images.githubusercontent.com/34981932/154804826-e733c9ab-6d25-432b-8567-2bdc9578a729.png)

<h2>Specifications</h2>


Parameter     | Description   | Min   | Type | Max | Unit | Condition |
------------- | ------------- |-------|------|-----|------|-----------|
VDD           | Digital Supply voltage | 1.8 |     |    |  V | T=27C |
F<sub>clkRef</sub>      | Reference clock frequency | 5 | 10 | 12.5 | MHz | T=27C |
F<sub>clkout</sub>      | Output clock | 40 |  | 100 | MHz | PLL mode, T=27C |
F<sub>clkout</sub>      | Output clock | 40 |  | 100 | MHz | VCO mode, T=27C |
J<sub>rms</sub>      | Jitter Speed |  |  |  | ps | PLL mode |
DC   | Duty Cycle |  |  |  | % | T=27C |
T<sub>set</sub>      |Settling time | ~37 |  | ~22 | us | T=27C |
C<sub>l</sub>      | Load capacitance |  |  |  | fF | T=27C |
I<sub>DD</sub>      | Supple Current |  |  |  | fF | T=27C |


<h2>PreLayout</h2>
<h3>PD circuit</h3>

![image](https://user-images.githubusercontent.com/34981932/154810086-dc5368fb-7de7-4fe2-918e-79b816e21c8d.png)

<h3>Charge pump(CP)</h3>

![image](https://user-images.githubusercontent.com/34981932/154812737-c8130daf-5a0b-40d8-a67a-e94566d9a11d.png)





