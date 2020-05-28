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
  wire pcFill = 16'd10;
  wire RegDst;
  wire[1:0] opcode;
  wire MemRead;
  wire MemToReg;
  wire ALUOp;
  wire MemWrite;
  wire ALUSrc;
  wire RegWrite;
  //------------------
  Datapath DP( clk,  pcFill,  RegDst, MemRead, MemToReg,  ALUOp,  MemWrite, 
 ALUSrc,  RegWrite, opcode);
 
  cu Cpu_cu(opcode,   RegDst,   ALUSrc,
   MemToReg ,   RegWrite ,  MemRead , 
   MemWrite ,   ALUOp);
    //te gjitha qeto inputa i bajm ma nalt si Wire

endmodule
