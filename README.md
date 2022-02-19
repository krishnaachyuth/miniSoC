# RISC-V based SOC design with PLL,10-bit DAC and SRAM using Open-Source EDA tools #
Table of Contents
1. Introduction
2. Theory
3. Required Tools
4. PLL specs
5. DAC specs
6. SRAM specs
7. Installation & Runs
8. Methodology
9. OpenLane and sky 130 installation
10. Synthesis
11. References
12. Acknowledgements


# 1. Introduction #
This repository contains simulation files and other files on the VSDMiniSoC - RISC-V based SoC with PLL using PLL (Fclkin - 5MHz to 12MHz, Fclkout-40MHz to 100MHz at 1.8v),DAC and SRAM.The specifications are provided from VSD corporstion Pvt. Ltd. The On-chip multiplier is present in almost all synchronous processor chips(Integrated circuits).
The target is to design a On-chip clock multiplier using the 130nm techonology node.

## 2. Theory ##
**PLL**

![image](https://user-images.githubusercontent.com/34981932/154804549-15a581ea-36db-4c6f-8e89-2d37a6f85c85.png)

