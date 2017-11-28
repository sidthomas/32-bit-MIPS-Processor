`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/16/2017 03:32:20 PM
// Design Name: 
// Module Name: reg_file
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

module reg_file(
        input [4:0] ins25_21_1,ins20_16_1,WReg1,ins25_21_2,ins20_16_2,WReg2,
        input [31:0] WData1,WData2,
        input RegWrite1,RegWrite2,clk,
        output [31:0] RData1_1,RData2_1,RData1_2,RData2_2 
  //      output [31:0] Register
        );        
reg [31:0] Registers [31:0];
integer i,id; 
 initial 
 begin    
          Registers[0] <= 32'b00000000000000000000000000000000; 
          Registers[1] <= 32'b00000000000000000000000000000100;
          Registers[2] <= 32'b00000000000000000000000000000010; 
          Registers[3] <= 32'b00000000000000000000000000001000;
          Registers[4] <= 32'b00000000000000000000000000000011; 
          Registers[5] <= 32'b00000000000000000000000000001110;
          Registers[6] <= 32'b00000000000000000000000000010010; 
          Registers[7] <= 32'b00000000000000000000000000001000;
          Registers[8] <= 32'b00000000000000000000000000000010;
          Registers[9] <= 32'b00000000000000000000000000110000;
          Registers[10] <= 32'b0000000000000000000000000001100; 
          Registers[11] <= 32'b0000000000000000000000000010011;
          Registers[12] <= 32'b0000000000000000000000000000101; 
          Registers[13] <= 32'b0000000000000000000000000001001;
          Registers[14] <= 32'b0000000000000000000000000000101; 
          Registers[15] <= 32'b0000000000000000000000000000001;
          Registers[16] <= 32'b0000000000000000000000000000001; 
          Registers[17] <= 32'b0000000000000000000000000000001;
          Registers[18] <= 32'b0000000000000000000000000000001;
          Registers[19] <= 32'b0000000000000000000000000000001;
          
                                                  
                                        
                                        
                                                
          
      end

always @(posedge clk)
begin
if (RegWrite1 == 1) 
    begin
      Registers[WReg1] <= WData1;
    end
if (RegWrite2 == 1) 
    begin
      Registers[WReg2] <= WData2;
    end
    
    
   /* begin
         id= $fopen("C:\\Users\\Sidharth Thomas\\Desktop\\Final CMP\\IM\\\bin\\Debug\\reg_data.txt","w");
         for(i=0;i<32;i=i+1)  
               begin
                    $fwrite(id,"%32b",Registers[i],"\n");
                end 
         $fclose(id);
        end*/
end
    
    assign  RData1_1 = Registers[ins25_21_1];
    assign  RData2_1 = Registers[ins20_16_1];
    assign  RData1_2 = Registers[ins25_21_2];
    assign RData2_2 = Registers[ins20_16_2];
    
always @(negedge clk)
    begin
     id= $fopen("C:\\Users\\Sidharth Thomas\\Desktop\\Final CMP\\IM\\\bin\\Debug\\reg_data.txt","w");
     for(i=0;i<32;i=i+1)  
           begin
                $fwrite(id,"%32b",Registers[i],"\n");
            end 
     $fclose(id);
    end
endmodule
    