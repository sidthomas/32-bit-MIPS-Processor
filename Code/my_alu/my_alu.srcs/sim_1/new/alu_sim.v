`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2017 14:41:00
// Design Name: 
// Module Name: alu_sim
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module alu_sim;
    reg [31:0] A;
    reg [31:0] B; 
    reg [3:0] alu_cu;
    wire [31:0] res;
    //wire Z,
   // wire V,
   // wire N
    
    
    ALU uut(
    .A(A),
    .B(B),
    .alu_cu(alu_cu),
    .res(res)
    //.Z(Z),
   // .V(V),
    //.N(N)
    );
    
    initial begin
    A = 8'h00000020;
    B = 8'h00000010;
    alu_cu = 4'b0000;
    end
    
    always begin
    #50; alu_cu = 4'b0001;
    end
    
endmodule
