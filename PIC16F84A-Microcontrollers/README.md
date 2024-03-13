# PIC16F84A Assembly Programs

## Overview

This repository contains a series of assembly programs designed specifically for the PIC16F84A microcontroller. These programs showcase various techniques and functionalities, from basic operations to more complex procedures, providing valuable insights into assembly programming and microcontroller manipulation.

## Contents

The directory is structured with the following assembly files, each serving a unique purpose:

- **`parta.ASM`**: Introduces basic setup and configuration for the PIC16F84A, along with simple arithmetic operations. It demonstrates context saving in interrupt service routines (ISR) and manipulation of the W register.

- **`partb.ASM`**: Builds upon `parta.ASM`, introducing variable manipulation and arithmetic operations using a different strategy. It emphasizes on the usage of the file register for calculations.

- **`partc.ASM`**: Similar to `partb.ASM`, this file further explores arithmetic operations and introduces the XOR operation as a method to achieve specific computational goals.

- **`partd.ASM`**: Extends the concepts introduced in previous parts with more complex operations, including loops and conditional execution based on the manipulation of port and control registers.

## Getting Started

To work with these programs, you will need an assembler like MPASM and a device programmer compatible with the PIC16F84A. Follow these steps to get started:

1. Install the necessary software for compiling and uploading assembly code to the PIC16F84A. The MPLAB X IDE from Microchip is a good starting point, as it includes MPASM.
2. Clone or download this repository to your local machine.
3. Open the desired `.ASM` file with your assembler or IDE.
4. Compile the program to generate a hex file.
5. Upload the hex file to your PIC16F84A using your device programmer.

## Prerequisites

Before working with these files, ensure you have a basic understanding of assembly language and familiarity with the PIC16F84A microcontroller. It's also recommended to have the PIC16F84A datasheet handy for reference.

## Usage and Modification

Feel free to use these programs as a starting point for your own projects or as educational tools to learn more about assembly programming and microcontroller operations. You are encouraged to modify and experiment with the code to better understand the workings of the PIC16F84A.

## Contributing

Contributions to this collection are welcome. Whether it's adding new examples, improving existing ones, or fixing bugs, your input is valuable. Please submit pull requests or open issues as needed.

## License

This project is open-source and freely available for educational and non-commercial use. Please credit the original author(s) when using or modifying these files in your projects.

---
