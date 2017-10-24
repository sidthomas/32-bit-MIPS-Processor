`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/17/2017 04:23:06 PM
// Design Name: 
// Module Name: final
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


module final();
reg clk;
wire [31:0] res;
// Register;
wire Z,N;

    
    combine uut(
    .clk(clk),
    .res(res),
    .Z(Z),
    .N(N)
  //  .Register(Register)
    );
    
 initial 
 begin   
clk=0;
forever
#10 clk =~clk;
end

endmodule
