`timescale 1ns / 1ps

module main_test();

reg clk;
reg reset;
reg ram_we=0;
reg [15:0] dataI = 0;

wire [2:0] selA;
wire [2:0] selB;
wire [2:0] selD;
wire [15:0] dataA;
wire [15:0] dataB;
wire [15:0] dataD;
wire [4:0] aluop;
wire [15:0] dataO;
wire [1:0] opcode;
wire [15:0] pcO;
wire [7:0] imm;
wire [15:0] addr;


wire shldBranch;
wire enfetch;
wire endec;
wire enrgrd;
wire enalu;
wire enrgwr; 
wire enmem;    
wire regwe;
wire update;

assign enrgwr = regwe & update ;
assign opcode = (reset) ? 2'b11 : ((shldBranch) ? 2'b10 : ((enalu) ? 2'b01 : 2'b00));
     
reg_file main_reg(    
    clk,       
    enrgrd,        
    enrgwr,        
    selA,
    selB,
    selD,
    dataD,
    dataA,
    dataB
);

inst_dec main_unit(
    clk,
    endec,
    dataO,
    aluop,
    selA,
    selB,
    selD,
    imm,
    regwe 
);

alu main_alu(
    clk,
    enalu,
    aluop,
    dataA,
    dataB,
    imm,
    dataD,
    shldBranch
);

ctrl_unit main_ctrl(
    clk,
    reset,
    enfetch,
    endec,
    enrgrd,
    enalu,
    update,
    enmem
    );
    
pc_unit pc_main(
    clk,
    opcode,
    dataD,
    pcO
);   

fake_ram main_ram(
    clk,
    ram_we,
    pcO,
    dataI,
    dataO
    ); 
    
    initial begin
        clk = 0;
        reset = 1;
        #20;
        reset = 0;   
    end
    
    always begin
        #5;
        clk = ~clk;
    end

endmodule
