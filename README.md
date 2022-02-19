# RISC-V based SOC design with PLL,10-bit DAC and SRAM using Open-Source EDA tools #
Table of Contents
* [Introduction](#Introduction "Goto Introduction")
* [Required tools](#Required tools "Goto Required tools")
* [Theory](#Theory "Goto Theory")
  * [PLL clock multiplier](#PLL multiplier "Goto PLL multiplier")
      * Specification
      * Pre-layout
        * PD circuit
        * Frequency Divider Circuit
        * Charge pump
        * VCO
        * PLL
* DAC specs
* SRAM specs
* Installation & Runs
* Methodology
* OpenLane and sky 130 installation
* Synthesis
* References
* Acknowledgements


# Introduction #
This repository contains simulation files and other files on the VSDMiniSoC - RISC-V based SoC with PLL using PLL (Fclkin - 5MHz to 12MHz, Fclkout-40MHz to 100MHz at 1.8v),DAC and SRAM.The specifications are provided from VSD corporstion Pvt. Ltd. The On-chip multiplier is present in almost all synchronous processor chips(Integrated circuits).
The target is to design a On-chip clock multiplier using the 130nm techonology node.

## Theory ##
**PLL Clock Multiplier**

The block diagram of PLL is as shown below:
![image](https://user-images.githubusercontent.com/34981932/154804826-e733c9ab-6d25-432b-8567-2bdc9578a729.png)

**Specifications**
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




