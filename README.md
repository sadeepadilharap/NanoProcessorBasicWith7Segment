# Nanoprocessor Design Project

## Overview
This project involves the design and development of a simple 4-bit nanoprocessor that can execute a set of basic instructions. The nanoprocessor is designed as part of the CS1050 course in Computer Organization and Digital Design at the University of Moratuwa.

### Project Objective:
The goal of this project is to build a microprocessor that can perform arithmetic operations, control program flow, and execute simple instructions. Key components designed include:
- 4-bit Add/Subtract unit
- Program Counter (PC) with reset
- Instruction Decoder
- Register Bank
- 8-way and 2-way multiplexers
- Program ROM for storing machine code
- Input/Output peripherals like LEDs and 7-segment display

## Components
### 1. **4-bit Add/Subtract Unit**
   - This unit performs addition and subtraction using 2’s complement arithmetic.

### 2. **3-bit Adder**
   - Used to increment the Program Counter (PC) by 1.

### 3. **Program Counter (PC)**
   - A 3-bit register that stores the address of the current instruction. It can be reset to 0 when required.

### 4. **Multiplexers**
   - **2-way 3-bit Mux** and **2-way 4-bit Mux** for selecting values.
   - **8-way 4-bit Mux** to route data from different registers.
   
### 5. **Instruction Decoder**
   - Decodes instructions to activate the necessary components and execute the corresponding operations.

### 6. **Register Bank**
   - Contains 8 registers (R0 to R7), each 4-bits wide. Register R0 is hardcoded to 0.

### 7. **Program ROM**
   - Stores the machine code for the processor's operations.

### 8. **Input/Output**
   - Registers and flags are displayed using LEDs, and results are shown on a 7-segment display.

## Instructions Supported
1. **MOVI R, d** - Move immediate value `d` to register `R`.
2. **ADD Ra, Rb** - Add values in registers `Ra` and `Rb` and store the result in `Ra`.
3. **NEG R** - Compute the 2’s complement of the value in register `R`.
4. **JZR R, d** - Jump to address `d` if the value in register `R` is 0.

## Assembly Program Example
```assembly
MOVI R1, 10 ; R1 <- 10
MOVI R2, 1  ; R2 <- 1
NEG R2      ; R2 <- -R2
ADD R1, R2  ; R1 <- R1 + R2
JZR R1, 7   ; Jump to address 7 if R1 == 0
JZR R0, 3   ; Jump to address 3 if R0 == 0
