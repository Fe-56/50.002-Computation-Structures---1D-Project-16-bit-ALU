/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module rom2_9 (
    input [4:0] selector,
    output reg [18:0] out
  );
  
  
  
  localparam INPUTS = 437'h000543c258028d0b7a0059143dba02ddd00011000000000600009000000002400008000c000080002a00018001000008dca4b532d80080;
  
  always @* begin
    out = INPUTS[(selector)*19+18-:19];
  end
endmodule
