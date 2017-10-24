`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2017 12:14:27
// Design Name: 
// Module Name: a
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


module a(
    output reg [ 7:0] res,
    input clk);
    
    reg [7:0] memory [0:7];
    integer i=0;
    
    initial begin
    $readmemh("abc.dat",memory);
    end
    
    always @(posedge clk) begin
        res = memory[i];
        i=i+1;
        end
endmodule
