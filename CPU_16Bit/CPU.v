`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2020 07:06:38 PM
// Design Name: 
// Module Name: CPU
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


module CPU(
input clk
  );
  wire pcfill = 16'd10;
  wire RegDst;
  wire[1:0] opcode;
  Datapath(clk, input pcfill, input RegDat,... output opcode);  
  cu CPU_CU(opcode,RegDst, output reg ALUSrc, output reg MemToReg , output reg RegWrite , output reg MemRead , output reg MemWrite, output reg Branch , output reg ALUOp1 , output reg ALUOp2);
    //te gjitha qeto inputa i bajm ma nalt si Wire

endmodule
