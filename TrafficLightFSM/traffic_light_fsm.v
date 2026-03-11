module traffic_light_fsm(
    input clk,
    input reset,
    output reg [2:0] main_road,
    output reg [2:0] side_road
);

// State encoding
localparam MAIN_GREEN  = 2'b00;
localparam MAIN_YELLOW = 2'b01;
localparam SIDE_GREEN  = 2'b10;
localparam SIDE_YELLOW = 2'b11;

reg [1:0] state, next_state;
reg [3:0] timer;

// State register + timer
always @(posedge clk) begin
    if (reset) begin
        state <= MAIN_GREEN;
        timer <= 4'd0;
    end
    else begin
        if (timer == 4'd4) begin
            state <= next_state;
            timer <= 4'd0;
        end
        else begin
            state <= state;
            timer <= timer + 1'b1;
        end
    end
end

// Next-state logic
always @(*) begin
    case (state)
        MAIN_GREEN:  next_state = MAIN_YELLOW;
        MAIN_YELLOW: next_state = SIDE_GREEN;
        SIDE_GREEN:  next_state = SIDE_YELLOW;
        SIDE_YELLOW: next_state = MAIN_GREEN;
        default:     next_state = MAIN_GREEN;
    endcase
end

// Output logic
always @(*) begin
    // default all lights off
    main_road = 3'b000;
    side_road = 3'b000;

    case (state)
        MAIN_GREEN: begin
            main_road = 3'b001; // Green
            side_road = 3'b100; // Red
        end

        MAIN_YELLOW: begin
            main_road = 3'b010; // Yellow
            side_road = 3'b100; // Red
        end

        SIDE_GREEN: begin
            main_road = 3'b100; // Red
            side_road = 3'b001; // Green
        end

        SIDE_YELLOW: begin
            main_road = 3'b100; // Red
            side_road = 3'b010; // Yellow
        end

        default: begin
            main_road = 3'b100; // Red
            side_road = 3'b100; // Red
        end
    endcase
end

endmodule
