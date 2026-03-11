`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02/26/2026 11:06:01 AM
// Design Name: 
// Module Name: behave_addr
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


module behave_addr(input [7:0] a , b ,  input cin,
output [7:0] sum , output cout

    );
    
    assign {cout,sum} = a + b + cin;
endmodule
