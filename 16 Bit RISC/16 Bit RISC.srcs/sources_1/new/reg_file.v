`timescale 1ns / 1ps

module reg_file(
    input i_clk,
    input i_en,
    input i_we,
    input [2:0] i_selA,
    input [2:0] i_selB,
    input [2:0] i_selD,
    input [15:0] i_dataD,
    
    output reg [15:0] o_dataA,
    output reg [15:0] o_dataB
    );
    
    reg [15:0] regs [7:0];  // 8 registers, each 16 bits wide
    integer count;
    
    initial begin
        o_dataA = 0;
        o_dataB = 0;
        for(count = 0; count < 8; count = count + 1) begin
            regs[count] = 0;
        end
    end

    always @(negedge i_clk) begin
        if(i_en) begin
            if(i_we)
                regs[i_selD] <= i_dataD;  
                
        o_dataA <= regs[i_selA];  
        o_dataB <= regs[i_selB];         
        end
    end

endmodule
