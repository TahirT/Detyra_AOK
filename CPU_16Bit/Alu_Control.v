`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2020 01:14:29 AM
// Design Name: 
// Module Name: Alu_Control
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
 
 module Alu_Control( ALU_Controlli, ALUOp, Function);  
 output reg[2:0] ALU_Controlli;  
 input ALUOp;  
 input [3:0] Function;
 wire Dalja;
 
  cu ControlUnit( opcode,   RegDst,   ALUSrc,
   MemToReg ,   RegWrite ,   MemRead , 
   MemWrite ,   ALUOp);
 InstrMemory Instruksioni( clk,  Hyrja,  Dalja);
 
 assign ALUOp = opcode;
 assign Function = Dalja;
  
 wire [5:0] ALUControlIn;  
 assign ALUControlIn = {ALUOp,Function};  
 always @(ALUControlIn)  
 casex (ALUControlIn)  
  6'b000001: ALU_Controlli=3'b000;  
  6'b000010: ALU_Controlli=3'b010;  
  6'b000011: ALU_Controlli=3'b011;  
  6'b000100: ALU_Controlli=3'b100;  
  6'b000111: ALU_Controlli=3'b101;  
  6'b101000: ALU_Controlli=3'b100;  
  6'b001001: ALU_Controlli=3'b001;  
  6'b010000: ALU_Controlli=3'b110;  
  default: ALU_Controlli=3'b000;  
  endcase  
 
 endmodule  


