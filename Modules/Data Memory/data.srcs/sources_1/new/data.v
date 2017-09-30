`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/28/2017 05:55:24 PM
// Design Name: 
// Module Name: data
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



module data(adres,write_data,read_data,mem_write,mem_read);
 //     input    clk;  
      input  [31:0] adres;  
      input  [31:0] write_data;  
      output [31:0] read_data ;
      input  mem_read;
      input mem_write;  
      integer i;  
      reg [31:0] mem [255:0];  
      wire[31: 0] mem_addr = adres[31 : 0]; 
       reg [31:0] read_data;
      initial begin  
           for(i=0;i<256;i=i+1)  
                mem[i] <= 32'b00000000000000000000000000000000;  
      end  
      always @(*) begin  
           if (mem_write) 
           begin 
                mem[mem_addr] <= write_data;  
      end   
       if(mem_read)begin
        read_data <= mem[mem_addr];
        
     end
     else 
     begin 
     read_data<= 32'b0;
     end
   end
 endmodule
