`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2020 02:59:29 PM
// Design Name: 
// Module Name: cu
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


module cu(input  [5:0] opcode, output reg RegDst, output reg ALUSrc, output reg MemToReg , output reg RegWrite , output reg MemRead , output reg MemWrite, output reg Branch , output reg ALUOp1 , output reg ALUOp2);


always @(opcode)
begin
case(opcode)
6'b000000: //R format
begin 
assign RegDst = 1; 
assign ALUSrc = 0; 
assign MemToReg = 0; 
assign RegWrite = 1; 
assign MemRead = 0; 
assign MemWrite = 0; 
assign Branch = 0; 
assign ALUOp1 = 1; 
assign ALUOp2 =0; 
end

6'b100011: // LW
begin 
assign RegDst = 0; 
assign ALUSrc = 1; 
assign MemToReg = 1; 
assign RegWrite = 1; 
assign MemRead = 1; 
assign MemWrite = 0; 
assign Branch = 0; 
assign ALUOp1 = 0; 
assign ALUOp2 =0; 
end

6'b101011: // SW
begin 
assign RegDst = 0; 
assign ALUSrc = 1; 
assign MemToReg = 0; 
assign RegWrite = 0; 
assign MemRead = 0; 
assign MemWrite = 1; 
assign Branch = 0; 
assign ALUOp1 = 0; 
assign ALUOp2 =0; 
end

6'b000100: // BEQ

begin 
assign RegDst = 0; 
assign ALUSrc = 0; 
assign MemToReg = 0; 
assign RegWrite = 0; 
assign MemRead = 0; 
assign MemWrite = 0; 
assign Branch = 1; 
assign ALUOp1 = 0; 
assign ALUOp2 =1; 
end
endcase
end

endmodule
