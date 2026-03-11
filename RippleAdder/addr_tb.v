`timescale 1ns/1ps

module addr_tb();

    reg  [7:0] a, b;
    reg        cin;

    wire       beh_cout, str_cout;
    wire [7:0] beh_sum,  str_sum;

    //ADDED: signed overflow flags 
    wire ovf_beh, ovf_str;
    assign ovf_beh = (a[7] == b[7]) && (beh_sum[7] != a[7]);
    assign ovf_str = (a[7] == b[7]) && (str_sum[7] != a[7]);
 

    behave_addr beh_dut(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(beh_sum),
        .cout(beh_cout)
    );

    struct_addr str_dut(
        .a(a),
        .b(b),
        .cin(cin),
        .sum(str_sum),
        .cout(str_cout)
    );

    initial begin
        a = 8'b10000000; b = 8'b00000001; cin = 1'b0; #10;
        a = 8'b11111111; b = 8'b00000000; cin = 1'b1; #10;
        a = 8'b11111110; b = 8'b00000001; cin = 1'b0; #10;
        a = 8'b10000000; b = 8'b11111111; cin = 1'b0; #10;
          $monitor( //monitor only for last case (with overflow and signed numbers)
          "a=%0d, b=%0d, cin=%b, beh_sum=%0d, beh_cout=%b, beh_ovf=%b, str_sum=%0d, str_cout=%b, str_ovf=%b",
          $signed(a), $signed(b), cin,
          $signed(beh_sum), beh_cout, ovf_beh,
          $signed(str_sum), str_cout, ovf_str
        );
    end

    initial begin
    $monitor ("a=%b , b=%b ,cin=%b ,beh_sum=%b,beh_cout=%b ,str_sum=%b ,str_cout=%b",a ,b ,cin ,beh_sum ,beh_cout ,str_sum ,str_cout);
    end
    

endmodule
