`timescale 1ns / 1ps

module ctrl_unit(
    input clk,
    input reset,
    
    output o_enfetch,
    output o_endec,
    output o_enrgrd,
    output o_enalu,
    output o_enrgwr,
    output o_enmem
    );
          
     reg [5:0] state;
     
     initial begin
        state <= 6'b000001; 
     end
     
always @(posedge clk or posedge reset) begin
    if (reset)
        state <= 6'b000001;           // start at fetch
    else begin
        if (state == 6'b100000)       // if last state
            state <= 6'b000001;       // wrap back
        else
            state <= state << 1;      // shift left
    end
end
      
     
     //Assignment enable signals
     assign o_enfetch =state[0];
     assign o_endec   =state[1];
     assign o_enrgrd  =state[2] | state[4];
     assign o_enalu   =state[3];
     assign o_enrgwr  =state[4];
     assign o_enmem   =state[5];
               
endmodule
