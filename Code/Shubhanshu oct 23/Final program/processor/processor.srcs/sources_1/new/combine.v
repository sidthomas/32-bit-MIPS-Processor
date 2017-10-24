`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2017 03:59:21 PM
// Design Name: 
// Module Name: combine
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


module combine(
input clk,
output [31:0] res,
output Z,
output N
//output wire [31:0] Register 
);
//wire instruction[31:0];
wire [31:0] instruction;
wire [5:0]opcode;
wire [4:0]ins25_21;//  rs
wire [4:0]ins20_16;//rd
wire [4:0]ins15_11;
wire [15:0]ins15_0;
wire [3:0] alu_cu;
wire RegDst,AluSrc,MemtoReg,RegWrite,MemRead,MemWrite,Jump,Branch;
wire [4:0] WReg;
wire [31:0] WData;
wire [31:0] RData1,RData2;
wire [31:0] read_data;
wire [31:0] sign_extend;
wire [31:0] B;
assign opcode =instruction[31:26];
assign ins25_21=instruction[25:21];
assign ins20_16=instruction[20:16];
assign ins15_11=instruction[15:11];
assign ins15_0=instruction[15:0];

program_counter program_counter(.clk(clk), .addr(addr));

instr_mem instr_mem(.addr(addr),/*.clk(clk),*/.instruction(instruction));

control_unit control_unit(.opcode(opcode),.RegDst(RegDst),
.AluSrc(AluSrc),.MemtoReg(MemtoReg),.RegWrite(RegWrite),
.MemRead(MemRead),.MemWrite(MemWrite),.Jump(Jump),.Branch(Branch));

assign WReg=(RegDst==1'b1) ? ins15_11:ins20_16;

reg_file reg_file(.clk(clk),.RegWrite(RegWrite),
.ins25_21(ins25_21),.ins20_16(ins20_16),
.RData1(RData1),.RData2(RData2),.WData(WData),.WReg(WReg));

ALU_CU ALUCU(.opcode(opcode),.alu_cu(alu_cu));

assign sign_extend={{16{ins15_0[15]}},ins15_0[15:0]};
assign B=(AluSrc==1'b1) ?sign_extend:RData2;

Alu Alu(.alu_cu(alu_cu),.A(RData1),.B(B),.res(res),.Z(Z),.N(N));
data data(.clk(clk),.adres(res),.write_data(RData2),.read_data(read_data),
.MemRead(MemRead),.MemWrite(MemWrite));
assign WData = (MemtoReg==1'b1) ? read_data: res;
endmodule
