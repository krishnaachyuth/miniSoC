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
* [RISC-V](https://github.com/krishnaachyuth/miniSoC/blob/main/README.md#Introduction-to-RISC-V-ISA)
     * [ABI- Application Binary Interface](https://github.com/krishnaachyuth/miniSoC/blob/main/README.md#ABI--Application-Binary-Interface)
     * [RISC-V CPU Core](https://github.com/krishnaachyuth/miniSoC/blob/main/README.md#RISC--V-CPU-Core)
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


<h2>Pre-layout</h2>
<h3>PD circuit</h3>
Compaes to the reference signal with the input signal with the help of 2 flip-flops(which is used to detect the falling edge of two different signals) and a delay element. 

![image](https://user-images.githubusercontent.com/34981932/154810086-dc5368fb-7de7-4fe2-918e-79b816e21c8d.png)

![image](https://user-images.githubusercontent.com/34981932/154814324-b84dca75-4fd4-4f84-ae44-a62f9b9e8281.png)

<h3>Frequency Divivder Circuit</h3>

![image](https://user-images.githubusercontent.com/34981932/154814267-f727b248-4b22-4224-a3b7-f87a06df32ab.png)

<h3>Charge pump(CP)</h3>
Charge pump converts the digital phase frequency sIgnal into an analog control signal which is given to the oscillator.The complete operation is charge pump is based on the average timing of UP/DOWN output signal of Phase frequency detector cricuit.

![image](https://user-images.githubusercontent.com/34981932/154812737-c8130daf-5a0b-40d8-a67a-e94566d9a11d.png)

<h3>VCO</h3>
The basic component of Voltage controlled oscillator is ring oscillator which is the series combination of odd number of inverters which has certain delay associated with it this causes a output signal to flip after a certain delay. 

![image](https://user-images.githubusercontent.com/34981932/154814510-958417e1-1f68-4da1-8fa8-d874cb28bf41.png)

<h3>PLL output</h3>

![image](https://user-images.githubusercontent.com/34981932/154814200-96752e02-879c-42a6-ad08-0a72c7749688.png)

<h2> Introduction to RISC-V ISA </h2>
ISA- Instruction set architecture, is used to interact with the computer/CPU. For example, for a C program to run on a computer hardware, then:<br>
 * First,the C-program it is compiled to an assembly language program(here, RISC-V).<br>
 * Then the assembly language program is converted into machine language(1's and 0's).<br>
 * Finally, these 1's and 0's are understood by the computer hardware/electronic circuit.<br>
RISC-V is in the hexadecimal which needs to be converted to binary which is done using the assembler. Interface between RISC-V architecture and hardware layout, is the Hardware Descriptive language(HDL - VHDL, Verilog) which are used to implement the required hardware.<br> 

<h2> ABI- Application Binary Interface </h2>
It is also called as System call Interface. This is a feature used by the system software to directly scces the registers in the hardware.<br>
 - RISC-V has 32 registers.<br>
 - Width of each register is XLEN-1, where if<br>
     - XLEN = 32bit --> RV32<br>
     - XLEN = 64bit --> RV64<br>
- RISC V belongs to the little edian memory addresing system,so<br>
     - m[0] - LSB<br>
     - m[7] - MSB<br>

<h2> RISC-V CPU Core </h2>
<h1> TL VErilog </h1>
This is the Verilog implementation of TL-X. TL-X is a set of HDL (Hardware Description Language) features defined as extensions to existing HDL languages, including Verilog (as "TL-Verilog"), VHDL (as "TL-VHDL"), and SystemC (as "TL-C"). This is a wrapper to any HDL to extend it with transaction-level modeling. This makes it more powerful and has a significant code reduction as compared to other HDL languages. A transaction, in this methodology, is an entity that moves through structures like pipelines, arbiters, and queues, A transaction might be a machine instruction, a flit of a packet, or a memory read/write. Transaction logic, like packet header decode or instruction execution, that operates on the transaction can be placed anywhere along the transaction's flow. Tools produce the logic to carry signals through their flows to stitch the transaction logic.

<h1> Makerchip </h1>
Makerchip provides free and instant access to the latest tools from your browser and from your desktop. This includes open-source tools and proprietary ones. We can code, compile, simulate, and debug Verilog designs, all from the browser.

We now will implement RISC-V CPU. The below is the top level block diagram:
![image](https://user-images.githubusercontent.com/34981932/159123149-57d1af6f-a833-49c1-afd6-dd3b8725f3cf.png)


The pieplined logical flow plan for the same looks as below:
![image](https://user-images.githubusercontent.com/34981932/159123203-9c420460-32a9-49b4-9a76-aef19b586b5a.png)








  




