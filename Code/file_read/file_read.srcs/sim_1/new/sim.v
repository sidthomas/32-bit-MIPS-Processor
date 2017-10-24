`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 02.09.2017 12:26:28
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
    reg clk;
    wire [7:0] res;
    
    a uut(
    .clk(clk),
    .res(res)
    );
    
    initial begin
    clk=0;
    end
    
    always begin
    #50 clk=~clk;
    end
    
    
    endmodule
