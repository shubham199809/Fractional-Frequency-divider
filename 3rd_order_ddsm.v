`include "16_bit_Accumulator.v"
`include "two_complement.v"
module third_order_ddsm(a,c,clk,rst);
input [15:0]a;
input clk,rst;
output  signed[3:0]c;
wire [15:0]b0,b1,b2;
wire [3:0] c0,c1,c2;
reg signed[3:0]c2_d;//wire [3:0]neg_c2_d;
reg  signed[3:0]c3_d; //wire [3:0]neg_c3_d;
wire signed[3:0]c3;
//wire [3:0] s0,s1;
//wire g1,g2,g3,g4;
accumulator_16_bit A1(a,clk,b0,c0,rst);
accumulator_16_bit A2(b0,clk,b1,c1,rst);
accumulator_16_bit A3(b1,clk,b2,c2,rst);
always @(posedge clk ) begin
    if (rst==1) begin
        c2_d<=0;
        c3_d<=0;
    end
    else begin
        c2_d<=c2;
        c3_d<=c3;
    end
end
assign c3=c1+c2-c2_d;
assign c=c0+c3-c3_d;


endmodule

