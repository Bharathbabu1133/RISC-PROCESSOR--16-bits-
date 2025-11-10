`timescale 1ns / 1ps

module decoder_unittest();

    reg clk;
    reg en;
    reg [15:0]inst;
    
    wire [4:0]aluop;
    wire [2:0]selA;
    wire [2:0]selB;
    wire [2:0]selD;
    wire [15:0]imm;
    wire regwe;

inst_dec inst_unit(
    clk,
    en,
    inst,
    aluop,
    selA,
    selB,
    selD,
    imm,
    regwe 
);

initial begin
    clk <= 0;
    en <=0;
    inst <= 0;
    
    #10;
    inst = 16'b0001011100000100;
    
    #10;
    en = 1; 
end

always begin
    #5;
    clk = ~clk;
end

endmodule
