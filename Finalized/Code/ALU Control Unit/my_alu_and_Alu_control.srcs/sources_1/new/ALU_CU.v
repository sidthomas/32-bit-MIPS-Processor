`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2017 20:21:45
// Design Name: 
// Module Name: ALU_CU
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


module ALU_CU(
    input [5:0] opcode,
    input  [5:0] alu_fn,
    output reg [3:0] alu_cu
    );
    
    always @(opcode, alu_fn)
    begin
    case(opcode)
        6'b000000:
        begin
            case(alu_fn)
                6'b100000: alu_cu = 4'b0000;  //add
                6'b100010: alu_cu = 4'b1000;  //sub
                6'b100100: alu_cu = 4'b0001;  //and
                6'b100101: alu_cu = 4'b0010;  //or
                6'b100110: alu_cu = 4'b0011;  //xor
                6'b101010: alu_cu = 4'b0100;  //slt
                default: alu_cu = 4'b0000;
            endcase
        end
        6'b001000: alu_cu = 4'b0000; //addi
        6'b100011: alu_cu = 4'b0000; //lw 
        6'b101011: alu_cu = 4'b0000; //sw
        6'b000100: alu_cu = 4'b1000; //beq
        6'b000101: alu_cu = 4'b1000; //bne
        6'b001100: alu_cu = 4'b0001; //andi
        6'b001101: alu_cu = 4'b0010; //ori
        6'b001110: alu_cu = 4'b0011; //xori
        6'b001010: alu_cu = 4'b0100; //slti
        default: alu_cu = 4'b0000;  
          
    endcase 
   
   end
endmodule
