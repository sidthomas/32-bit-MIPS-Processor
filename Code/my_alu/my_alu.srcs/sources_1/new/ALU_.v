`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.09.2017 20:50:25
// Design Name: 
// Module Name: ALU
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


module ALU(
    input  [31:0] A,
    input  [31:0] B, 
    input  [3:0] alu_cu,
    output [31:0] res
    //output reg Z,
    //output reg V,
    //output reg N
    );
    
    reg [31:0] res;
    //wire [31:0] S = A+B; 
    always @(A,B,alu_cu)
    begin
        case(alu_cu)
        4'b0000: res = A&B;  //and , andi
        4'b0001: res = A|B;  //or , ori
        4'b0010: res = A+B;  //add,  addi
        4'b0011: res = A-B;  //sub, beq, bne
        4'b0100: res = A^B;  //xor , xori
        4'b0111:             //slt  
            begin
            if(A<B)
                res = 8'h00000001;
            else
                res = 8'h00000000;
            end
        default: res = 8'h00000000;
        endcase     
        
       //Z = ((S + alu_cu[2] ) == 32'h00000000); 
       // V = (A[31] & B[31] & ~S[31])+(~A[31] &~B[31] & S[31]);
       // N = S[31];
        
    end
    
endmodule
