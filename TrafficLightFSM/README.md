# Traffic Light FSM in Verilog

This project implements a simple traffic light controller using a finite state machine (FSM) in Verilog.

## Overview

The design controls two roads:

- Main road
- Side road

Only one road gets a green light at a time.  
The traffic light sequence is:

1. Main road green, side road red
2. Main road yellow, side road red
3. Main road red, side road green
4. Main road red, side road yellow
5. Repeat

## Files

- `traffic_light_fsm.v` : Verilog implementation of the traffic light controller
- `traffic_light_fsm_tb.v` : Testbench for simulation

## State Machine

The FSM has 4 states:

- `MAIN_GREEN`
- `MAIN_YELLOW`
- `SIDE_GREEN`
- `SIDE_YELLOW`

A small timer is used to keep each state active for a few clock cycles before moving to the next state.

## Output Encoding

Each road uses 3 bits:

- `3'b100` = Red
- `3'b010` = Yellow
- `3'b001` = Green

## Learning Goals

This project demonstrates:

- Basic FSM design in Verilog
- State encoding using localparam
- Next-state logic
- Output logic
- Testbench-based simulation

## Note

This is a beginner-friendly FSM example created as part of my digital design learning process.
