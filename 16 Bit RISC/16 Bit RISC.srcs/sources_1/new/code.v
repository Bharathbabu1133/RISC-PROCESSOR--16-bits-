`timescale 1ns / 1ps

module inst_dec(
    input clk,
    input en,
    input [15:0]inst,
    
    output reg [4:0]aluop,
    output reg [2:0]selA,
    output reg [2:0]selB,
    output reg [2:0]selD,
    output reg [15:0]imm,
    output reg regwe    //reg write enable
    );
    
    //Initial Block
    initial begin
        aluop = 0;
        selA  = 0;
        selB  = 0;
        selD  = 0;
        imm   = 0;
        regwe =0;
        
    end
    
    //Instruction Decoder Block
    always@(negedge clk) begin
        if(en) begin
            aluop <= inst[15:11];       //opcode
            selA <= inst[10:8];     //reg a
            selB <= inst[7:5];      //reg b
            selD <= inst[4:2];      //reg d
            imm <= inst [7:0];      //imm data
        
            //Reg write enable
            case(inst[15:12]) 
                4'b0111: regwe <= 0; 
                4'b1100: regwe <= 0;
                4'b1101: regwe <= 0;
                default: regwe <= 1;
            endcase   
        end   
    end    
    
endmodule
