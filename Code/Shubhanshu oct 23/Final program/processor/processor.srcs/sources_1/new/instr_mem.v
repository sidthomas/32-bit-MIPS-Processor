`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.10.2017 15:25:54
// Design Name: 
// Module Name: instr_mem
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


module instr_mem(
        input [31:0] addr,
        //input clk,
        output /*reg*/ [31:0]  instruction
        );        
reg [31:0] mem [255:0];  

      integer i;  
     initial begin  
           for(i=0;i<256;i=i+1)  
                mem[i] <= 32'b00000000000000000000000000000000;
                
          mem[0]=32'b00010000000000010001000000000000;
         //  mem[1] = 32'b0000111111111111111111111111111;
         // mem[2] = 32'b0001001111111111111000000000000;  
      end 
 /*always @ (posedge clk)
 begin*/
  assign instruction = mem[addr];
  //end

endmodule


    