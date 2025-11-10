`timescale 1ns / 1ps

module regfile_unittest();
reg i_clk;
reg i_en;       
reg i_we;       
reg [2:0]i_selA;
reg [2:0]i_selB;
reg [2:0]i_selD;
reg [15:0]i_dataD;

wire [15:0]o_dataA;
wire [15:0]o_dataB;
    
reg_file reg_test(    
i_clk,       
i_en,        
i_we,        
i_selA,
i_selB,
i_selD,
i_dataD,
o_dataA,
o_dataB
);

initial begin

    i_clk = 1'b0;
    i_dataD = 0;
    i_en = 0;
    i_selA = 0;
    i_selB = 0;
    i_selD = 0;
    i_we = 0;
    
    //start test
    #7;
    i_en = 1;
    i_selA = 3'b000;
    i_selB = 3'b001;
    i_selD = 3'b000;
    
    i_dataD = 16'hFFFF;
    i_we = 1'b1;
    
    #10;
    i_we = 1'b0;
    i_selD = 3'b010;
    i_dataD = 16'h2222;
    
    #10;
    i_we = 1'b1;
    
    #10;
    i_dataD = 16'h3333;
    
    #10;
    i_we = 1'b0;
    i_selD = 3'b000;
    i_dataD = 16'hFEED;
    
    #10;
    i_selD = 3'b100;
    i_dataD = 16'h4444;
    
    #10;
    i_we = 1'b1;
    
    #50;
    i_selA = 3'b100;
    i_selB = 3'b100;
    
    #20;
    $finish;
end

always begin
    #5;
    i_clk = ~i_clk;
end

endmodule
