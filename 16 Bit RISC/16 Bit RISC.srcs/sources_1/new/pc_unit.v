`timescale 1ns / 1ps

module pc_unit(
    input i_clk,
    input [1:0] i_opcode,
    input [15:0] i_pc,
    
    output reg [15:0] o_pc
    );
    
    initial begin  
        o_pc = 0;
    end
    
    always @(negedge i_clk) begin
        case (i_opcode)
            2'b00: o_pc <= o_pc;
            2'b01: o_pc <= o_pc + 1;
            2'b10: o_pc <= i_pc;
            2'b11:o_pc <= 0;
        endcase
    end
    
endmodule
