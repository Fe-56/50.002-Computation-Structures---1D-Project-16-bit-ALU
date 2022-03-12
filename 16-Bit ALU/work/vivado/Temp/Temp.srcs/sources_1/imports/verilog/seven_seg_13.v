/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module seven_seg_13 (
    input [3:0] char,
    output reg [6:0] segs
  );
  
  
  
  always @* begin
    
    case (char)
      1'h0: begin
        segs = 7'h73;
      end
      1'h1: begin
        segs = 7'h77;
      end
      2'h2: begin
        segs = 7'h6d;
      end
      2'h3: begin
        segs = 7'h71;
      end
      3'h4: begin
        segs = 7'h06;
      end
      3'h5: begin
        segs = 7'h38;
      end
      3'h6: begin
        segs = 7'h00;
      end
      3'h7: begin
        segs = 7'h7c;
      end
      4'h8: begin
        segs = 7'h3f;
      end
      default: begin
        segs = 7'h00;
      end
    endcase
  end
endmodule
