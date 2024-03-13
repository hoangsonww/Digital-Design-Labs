# Arithmetic Logic Unit (ALU) Simulation

## Overview

The `Arithmetic-Logic-Unit` directory contains a set of SystemVerilog files designed to model and simulate the operations of an Arithmetic Logic Unit (ALU). This ALU is capable of performing various arithmetic and logic operations, depending on the selected function code. The design is modular, with a focus on scalability and ease of testing.

## Contents

This directory includes the following SystemVerilog files:

- **`alu_slice.sv`**: Defines a single slice of the ALU, capable of performing one bit of arithmetic or logic operation based on the input function code. It uses a ripple-carry adder slice as a fundamental building block.

- **`gen_alu.sv`**: A parametrizable ALU module that generates a complete ALU of `N` bits by instantiating `N` `alu_slice` modules. It supports scalable arithmetic and logic operations across the specified bit width.

- **`testbench_4.sv`**: Provides a comprehensive testbench for verifying the functionality of the ALU with 4-bit and 8-bit wide operations. It automates the testing process by cycling through test vectors defined in an external file, `test_vectors.txt`, not included in the directory but required for the testbench to function.

## Getting Started

### Prerequisites

- SystemVerilog-compatible simulation environment (e.g., ModelSim, VCS, or Vivado Simulator).
- Basic understanding of digital logic and SystemVerilog.

### Running Simulations

1. **Setup**: Ensure that your simulation tool is installed and configured correctly.

2. **Compile**: Compile the ALU and testbench SystemVerilog files. Include all files in the compilation process since they are interdependent.

3. **Run**: Execute the testbench. This process will automatically load the test vectors from `test_vectors.txt` and cycle through them to validate the ALU's functionality.

4. **Observe**: Monitor the simulation's output. The testbench is designed to display the input and output values for each operation, making it easy to verify correct behavior.

### Understanding the Testbench Output

The testbench output is structured to provide a clear and concise view of each test case. It shows the current simulation time, the inputs to the ALU (`A`, `B`, and function code `f`), and the resulting outputs (`S` for sum/result and `CO` for carry-out), for both 4-bit and 8-bit operations.

## Contributing

Contributions to improve or extend the ALU's functionality and test coverage are welcome. Please feel free to fork the repository, make your changes, and submit a pull request with a clear explanation of your modifications or additions.

## License

This project is released under the MIT License. See the LICENSE file in the repository for more details.

---
