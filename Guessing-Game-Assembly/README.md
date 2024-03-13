# PIC16F84A Guessing Game

## Overview

This directory houses the assembly source code for a guessing game designed for the PIC16F84A microcontroller. The game uses a simple interface with 4 LEDs and input buttons to allow users to guess the correct LED. Success or failure is indicated through dedicated WIN and ERR LEDs, providing immediate feedback on each guess.

## File Description

- **`GuessingGame.asm`**: The main assembly file for the guessing game. It contains the complete program logic, including initialization of the microcontroller, the main game loop, input handling, and LED control logic.

## Getting Started

### Prerequisites

To compile and run this game, you will need:

- MPLAB X IDE or any compatible assembly development environment.
- A PIC16F84A microcontroller.
- A programming device to upload the compiled hex file to the PIC16F84A.
- An electronic setup with 4 input buttons and 6 LEDs (4 for guessing, 1 for WIN indication, and 1 for ERR indication) connected to the appropriate pins on the PIC16F84A.

### Configuration

- The processor frequency is set to 100 kHz.
- The instruction cycle frequency must be set to 25 kHz for proper timing and delays.
- Make sure to configure your project to include the `P16F84A.INC` file for register and bit definitions specific to the PIC16F84A.

### Hardware Setup

- Connect four buttons to PORTA pins (RA0-RA3) for user input.
- Connect six LEDs to PORTB pins (RB0-RB5), where RB0-RB3 are guessing LEDs, RB4 is the ERR LED, and RB5 is the WIN LED.

### Compilation and Upload

1. Open the `GuessingGame.asm` file in your assembly development environment.
2. Compile the assembly code to generate a hex file.
3. Use a PIC programmer to upload the hex file to your PIC16F84A microcontroller.
4. Power up the microcontroller and start playing the guessing game!

## Gameplay

1. The game starts with one of the four guessing LEDs (RB0-RB3) lit up.
2. The player presses one of the four buttons connected to RA0-RA3 to guess which LED is active.
3. If the guess is correct, the WIN LED (RB5) lights up; if incorrect, the ERR LED (RB4) lights up.
4. The game progresses through the LEDs in a predetermined order, waiting for the player's input at each step.
5. The game resets to the initial state once all inputs are cleared after a WIN or ERR condition.

## Contributing

Feel free to fork this project and contribute to making the guessing game more interesting or challenging. Suggestions for new features, bug fixes, or improvements in code efficiency are always welcome.

## License

This project is open-source and available for educational purposes. It is provided "as is", without warranty of any kind.

---
