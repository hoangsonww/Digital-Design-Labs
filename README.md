# Digital Design in `System Verilog` and `Assembly`

## Overview

This repository contains a suite of digital design modules written in SystemVerilog and assembly language programs. The collection covers a range of topics from basic logic components to complex sequential designs and a microprocessor-interfacing game, suitable for educational purposes and as a reference for designing similar systems.

## Contents

### SystemVerilog Modules

- **DecoderEncoder.sv**: Implements a 3-to-8 line decoder and a 8-to-3 encoder with enable functionality, translating 3-bit binary inputs into an 8-bit one-hot encoded output and vice versa.
- **alu_slice.sv**: Represents a slice of an Arithmetic Logic Unit (ALU) capable of performing a variety of arithmetic and logical operations.
- **cla_adder.sv**: A carry-lookahead adder module that provides fast binary addition by pre-computing carry signals.
- **gen_alu.sv**: A general ALU module that combines multiple `alu_slice` modules to perform operations on wider data.
- **module_b.sv**, **module_d.sv**, **module_s.sv**: Various SystemVerilog modules demonstrating different digital design constructs and methodologies.
- **rc_adder4.sv**: A 4-bit ripple-carry adder built using cascaded full-adder stages.
- **rc_adder_slice.sv**: A single slice/stage of a ripple-carry adder used within larger bit-width adders.
- **tbird_fsm.sv**: A finite state machine (FSM) implementation for a traffic light controller (often used as an example in state machine design).
- **testbench_*.sv**: A series of testbenches corresponding to various SystemVerilog modules for simulation and validation of the modules' functionalities.
- **up_down_counter.sv**: A counter module that can count up or down based on control signals.

### Assembly Programs

- **GuessingGame.ASM**: An interactive guessing game written in assembly language, demonstrating branching and memory interfacing on a microprocessor.
- **parta.ASM**, **partb.ASM**, **partc.ASM**, **partd.ASM**: Assembly programs covering different aspects of assembly language programming and microprocessor operations.

## Getting Started

To run the SystemVerilog files, you'll need to have an HDL simulator like ModelSim or Vivado installed. You can compile and simulate each module and its corresponding testbench to observe the behavior and validate the design.

For the assembly language files, an assembler and simulator for the specific microprocessor architecture they are written for are required. These files can be assembled into machine code, loaded, and run on the simulator to watch the program's execution.

## How to Use

1. Clone the repository to your local machine.
2. Navigate to the specific project or file you wish to examine or simulate.
3. Open the file with an appropriate editor or IDE for SystemVerilog/assembly language.
4. To simulate SystemVerilog modules, compile them along with the testbenches using your HDL simulator and run the simulation.
5. To run assembly programs, assemble them with your chosen assembler and run them using a simulator or an actual microprocessor, if available.

## Contributing

Your contributions are welcome! If you have suggestions for additional modules, improvements to existing ones, or have found any issues, please open a pull request or issue.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

I'd like to thank all the contributors and users of this repository for their interest in digital design and assembly programming!

---

Created with ❤️ by [Son Nguyen](https://github.com/hoangsonww) in 2024.
