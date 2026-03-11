# Verilog Counter

This repository contains a simple 4-bit synchronous up-counter written in Verilog.

The design demonstrates basic sequential logic using a clocked process with reset and enable control.

## Files

counter.v  
Implementation of the 4-bit counter.

counter_tb.v  
Testbench used to simulate and verify the counter functionality.

## Counter Description

The counter increments on the rising edge of the clock when the enable signal is active.

Inputs:
- clk   : clock signal
- reset : synchronous reset
- en    : enable signal

Output:
- count[3:0] : 4-bit counter value

Behavior:
- When reset = 1, the counter resets to 0.
- When en = 1, the counter increments on each clock cycle.
- When en = 0, the counter holds its current value.

## Testbench

The testbench generates a clock signal and applies different control sequences:
- Reset the counter
- Enable counting
- Disable counting
- Re-enable counting
- Reset again

Simulation output prints the counter value over time to verify correct behavior.

## Learning Goals

This project demonstrates:
- Sequential logic design in Verilog
- Clock-driven circuits
- Use of reset and enable signals
- Writing Verilog testbenches
- Simulation-based verification
