# Thunderbird Tail Lights Finite State Machine (FSM) Simulation

## Overview

The `finite-state-machine` directory contains SystemVerilog modules for simulating the behavior of tail lights in a hypothetical Thunderbird car model, utilizing a finite state machine (FSM). This simulation includes modes for left turn, right turn, hazard lights, and idle states. It demonstrates the use of enumerations for state definitions and sequential logic to transition between states based on input signals.

## Files Description

- **`tbird-fsm.sv`**: Defines the FSM logic for the Thunderbird tail lights. The module transitions between different states (IDLE, L1-L3 for left signals, R1-R3 for right signals, and LR3 for hazards) based on inputs for left, right, and hazard commands.

- **`testbench_8.sv`**: Provides a testbench for the tbird_fsm module. It systematically applies different combinations of the left, right, and hazard inputs to verify the FSM's response under various conditions.

## Simulation Setup

### Prerequisites

To simulate these modules, you'll need:

- A SystemVerilog-compatible simulator (e.g., ModelSim, VCS, or Vivado Simulator).
- Basic knowledge of digital logic design and SystemVerilog.

### Simulation Steps

1. **Compile** both `tbird-fsm.sv` and `testbench_8.sv` files in your SystemVerilog simulation environment.
2. **Run** the simulation by executing the `testbench_8` module.
3. **Observe** the changes in the `l_lights` and `r_lights` output vectors as different input scenarios are applied. These outputs represent the state of the left and right tail lights, respectively.

## Understanding the FSM Behavior

The FSM transitions through states based on the combination of inputs:

- **IDLE**: All lights are off unless a left, right, or hazard signal is activated.
- **L1-L3**: Sequences through left tail lights to simulate a left turn signal.
- **R1-R3**: Sequences through right tail lights to simulate a right turn signal.
- **LR3**: Activates all tail lights to indicate hazard lights are on.

The testbench applies various combinations of inputs over time to ensure the FSM correctly transitions between these states.

## Contributing

Contributions to this FSM simulation project are welcome. Whether it's adding new features, refining the existing logic, or improving the testbench for more comprehensive coverage, your input is valuable. Please feel free to fork the repository, make your modifications, and submit a pull request with a clear explanation of your changes.

## License

This project is provided for educational purposes and is not associated with any commercial product. It is available under an open-source license, allowing for modification and distribution with appropriate attribution.

---
