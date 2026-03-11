`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/27/2026 09:16:48 PM
// Design Name: 
// Module Name: chip_top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module chip_top (
    input  wire [15:0] SW,   // Switches from board
    output wire [8:0] LED    // LEDs from board
);

    wire [7:0] sum;
    wire       cout;

    // Behavioral 8-bit adder
    behave_addr beh_dut (
        .a   (SW[7:0]),      // SW[7:0]  ->  A
        .b   (SW[15:8]),     // SW[15:8] ->  B
        .cin (1'b0),         // Carry in is always 0
        .sum (sum),
        .cout(cout)
    );

    // Drive LEDs
    assign LED[7:0] = sum;   // Show sum on LEDs 0-7
    assign LED[8]   = cout;  // Show carry out on LED[8]



endmodule
