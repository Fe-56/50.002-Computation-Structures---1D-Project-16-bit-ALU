/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module manual_tester_3 (
    input clk,
    input rst,
    input [1:0] button,
    input [15:0] data,
    output reg [15:0] s,
    output reg z,
    output reg v,
    output reg n,
    output reg [2:0] display
  );
  
  
  
  reg [15:0] M_input_a_d, M_input_a_q = 1'h0;
  
  reg [15:0] M_input_b_d, M_input_b_q = 1'h0;
  
  reg [5:0] M_input_alufn_d, M_input_alufn_q = 1'h0;
  
  reg [15:0] M_output_s_d, M_output_s_q = 1'h0;
  
  reg M_output_z_d, M_output_z_q = 1'h0;
  
  reg M_output_v_d, M_output_v_q = 1'h0;
  
  reg M_output_n_d, M_output_n_q = 1'h0;
  
  
  localparam AINPUT_controller = 2'd0;
  localparam BINPUT_controller = 2'd1;
  localparam ALUFNINPUT_controller = 2'd2;
  localparam OUTPUT_controller = 2'd3;
  
  reg [1:0] M_controller_d, M_controller_q = AINPUT_controller;
  
  wire [16-1:0] M_alu_alu;
  wire [1-1:0] M_alu_z;
  wire [1-1:0] M_alu_v;
  wire [1-1:0] M_alu_n;
  reg [6-1:0] M_alu_alufn;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  alu_10 alu (
    .alufn(M_alu_alufn),
    .a(M_alu_a),
    .b(M_alu_b),
    .alu(M_alu_alu),
    .z(M_alu_z),
    .v(M_alu_v),
    .n(M_alu_n)
  );
  
  always @* begin
    M_controller_d = M_controller_q;
    M_output_z_d = M_output_z_q;
    M_input_alufn_d = M_input_alufn_q;
    M_output_v_d = M_output_v_q;
    M_input_a_d = M_input_a_q;
    M_input_b_d = M_input_b_q;
    M_output_s_d = M_output_s_q;
    M_output_n_d = M_output_n_q;
    
    M_alu_a = M_input_a_q;
    M_alu_b = M_input_b_q;
    M_alu_alufn = M_input_alufn_q;
    display = 3'h0;
    
    case (M_controller_q)
      AINPUT_controller: begin
        display = 3'h1;
        M_output_s_d = data;
        if (button[1+0-:1]) begin
          M_input_a_d = data;
          M_controller_d = BINPUT_controller;
        end else begin
          M_controller_d = AINPUT_controller;
        end
      end
      BINPUT_controller: begin
        display = 3'h2;
        M_output_s_d = data;
        if (button[1+0-:1]) begin
          M_input_b_d = data;
          M_controller_d = ALUFNINPUT_controller;
        end else begin
          M_controller_d = BINPUT_controller;
        end
      end
      ALUFNINPUT_controller: begin
        display = 3'h3;
        M_output_s_d[6+9-:10] = 1'h0;
        M_output_s_d[0+5-:6] = data[0+5-:6];
        if (button[1+0-:1]) begin
          M_input_alufn_d = data[0+5-:6];
          M_controller_d = OUTPUT_controller;
        end else begin
          M_controller_d = ALUFNINPUT_controller;
        end
      end
      OUTPUT_controller: begin
        display = 3'h4;
        M_output_s_d = M_alu_alu;
        M_output_z_d = M_alu_z;
        M_output_v_d = M_alu_v;
        M_output_n_d = M_alu_n;
        if (button[1+0-:1]) begin
          M_input_a_d = 1'h0;
          M_input_b_d = 1'h0;
          M_input_alufn_d = 1'h0;
          M_output_s_d = 1'h0;
          M_output_z_d = 1'h0;
          M_output_v_d = 1'h0;
          M_output_n_d = 1'h0;
          M_controller_d = AINPUT_controller;
        end else begin
          M_controller_d = OUTPUT_controller;
        end
      end
    endcase
    if (button[0+0-:1]) begin
      M_input_a_d = 1'h0;
      M_input_b_d = 1'h0;
      M_input_alufn_d = 1'h0;
      M_output_s_d = 1'h0;
      M_output_z_d = 1'h0;
      M_output_v_d = 1'h0;
      M_output_n_d = 1'h0;
      M_controller_d = AINPUT_controller;
    end
    s = M_output_s_q;
    z = M_output_z_q;
    v = M_output_v_q;
    n = M_output_n_q;
  end
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_controller_q <= 1'h0;
    end else begin
      M_controller_q <= M_controller_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_output_n_q <= 1'h0;
    end else begin
      M_output_n_q <= M_output_n_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_output_s_q <= 1'h0;
    end else begin
      M_output_s_q <= M_output_s_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_input_a_q <= 1'h0;
    end else begin
      M_input_a_q <= M_input_a_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_output_z_q <= 1'h0;
    end else begin
      M_output_z_q <= M_output_z_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_output_v_q <= 1'h0;
    end else begin
      M_output_v_q <= M_output_v_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_input_b_q <= 1'h0;
    end else begin
      M_input_b_q <= M_input_b_d;
    end
  end
  
  
  always @(posedge clk) begin
    if (rst == 1'b1) begin
      M_input_alufn_q <= 1'h0;
    end else begin
      M_input_alufn_q <= M_input_alufn_d;
    end
  end
  
endmodule
