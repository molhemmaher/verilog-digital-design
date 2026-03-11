`timescale 1ns/1ps

module counter_tb;

reg clk;
reg reset;
reg en;
wire [3:0] count;

counter uut (
    .clk(clk),
    .reset(reset),
    .en(en),
    .count(count)
);

// Clock generation: 10ns period
always #5 clk = ~clk;

initial begin
    $display("Starting Counter Testbench...");

    clk = 0;
    reset = 1;
    en = 0;

    // Apply reset
    #10;
    reset = 0;
    en = 1;

    // Let counter run
    #80;

    // Disable counting
    en = 0;
    #20;

    // Enable again
    en = 1;
    #40;

    // Reset again
    reset = 1;
    #10;
    reset = 0;
    #20;

    $display("Counter Testbench Finished.");
    $stop;
end

initial begin
    $monitor("Time=%0t | reset=%b en=%b count=%b", $time, reset, en, count);
end

endmodule
