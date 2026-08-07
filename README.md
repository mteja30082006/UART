# UART Transmitter using Verilog HDL

## Overview
UART (Universal Asynchronous Receiver/Transmitter) is a serial communication protocol used for data transmission between digital devices. It transmits data asynchronously using a start bit, data bits, and a stop bit.

This project implements a simple 8-bit UART Transmitter in Verilog HDL.

## Features
- 8-bit data transmission
- 1 Start Bit
- 1 Stop Bit
- Serial data output
- Busy signal during transmission

## Inputs
- clk : System clock
- reset : Active-high reset
- tx_start : Starts transmission
- tx_data[7:0] : Data to transmit

## Outputs
- tx : Serial output
- busy : High while transmitting

## Files
- uart_tx.v
- uart_tx_tb.v
- simulation_result.txt

## Tools Used
- Verilog HDL
- ModelSim
- Xilinx Vivado
- Icarus Verilog

## Applications
- Serial Communication
- Microcontroller Interfaces
- Embedded Systems
- FPGA Communication# UART
my tenth verilog project 
