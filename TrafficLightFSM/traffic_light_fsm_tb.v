`timescale 1ns/1ps

module traffic_light_fsm_tb;

reg clk;
reg reset;
wire [2:0] main_road;
wire [2:0] side_road;

traffic_light_fsm uut (
    .clk(clk),
    .reset(reset),
    .main_road(main_road),
    .side_road(side_road)
);

// Clock generation: 10ns period
always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1;

    $display("Starting Traffic Light FSM Testbench...");

    #12;
    reset = 0;

    // Run long enough to observe multiple state transitions
    #250;

    $display("Traffic Light FSM Testbench Finished.");
    $stop;
end

initial begin
    $monitor("Time=%0t | reset=%b | main_road=%b | side_road=%b",
             $time, reset, main_road, side_road);
end

endmodule
