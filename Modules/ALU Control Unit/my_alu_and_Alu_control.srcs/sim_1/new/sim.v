`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 27.09.2017 22:34:36
// Design Name: 
// Module Name: sim
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


module sim;
    reg [5:0] opcode;
    reg [5:0] alu_fn;
    wire [3:0] alu_cu;
    
    ALU_CU uut(
    .opcode(opcode),
    .alu_fn(alu_fn),
    .alu_cu(alu_cu)
    );
    
    initial begin 
    alu_fn = 6'b100000;
    opcode = 6'b001000;
    #50; opcode = 6'b000100; 
    #50; opcode = 6'b000101; 
    #50; opcode = 6'b001100;
    #50; opcode = 6'b001101;
    #50; opcode = 6'b001110; 
    #50; opcode = 6'b001010;
    #50; opcode = 6'b000000;
    #50; alu_fn = 6'b100010;
    #50; alu_fn = 6'b100100;
    #50; alu_fn = 6'b100101;
    #50; alu_fn = 6'b100110;
    #50; alu_fn = 6'b101010;
     
       
    end
    
endmodule
