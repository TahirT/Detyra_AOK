`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2020 05:57:46 PM
// Design Name: 
// Module Name: Datapath
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


module Datapath(input clk, input pcFill, input RegDst, input MemRead,input MemToReg, input ALUOp, input MemWrite, 
input ALUSrc, input RegWrite, output opcode);

reg pc;
reg z;
wire [15:0] instruksioni;
wire [1:0] opcode;
wire [2:0] RS;
wire [2:0] RT;
wire [2:0] RD;
wire [15:0] WD;
wire RFwe;
wire [15:0] RD1, RD2;
reg s;
wire [15:0] alu2;
wire [15:0] imm_long;
wire [4:0] funct;
wire [7:0] immediate;
wire [2:0] ALUControlli;

initial begin
assign pc = 16'd0;
end

always @(posedge clk)
begin
    assign pc = pcFill;
end

InstrMemory DPIM(clk, pc, instruksioni); 

assign opcode = instruksioni[15:14];
assign RS = instruksioni[13:11];
assign RT = instruksioni[10:8];
assign RD = instruksioni[7:5];
assign funct = instruksioni[4:0];
assign immediate = instruksioni[7:0];

always @(opcode)
begin
    if (opcode == 2'd0)
    //formati R
    s = 0;
   
    else
    //formati I
    s = 1;
end
mux_2to1 M21HyrjeRF(s, RD, RT, z);
RegisterFile RF (RS, RT, RD, WD, RFwe, clk, RD1, RD2);

assign imm_long = {{8{immediate[7]}},immediate[7:0]}; //Sign extender
assign alu2 = s ? immediate : RD2;

Alu_Control ALU_C( ALU_Controlli, ALUOp, Function);//me e ba alu control

assign ALUControlli = ALU_Controlli;

alu16Bit aluRF(
     RD1,
     alu2,
    
     ainvert,
     bnegate,
      ALUControlli,           //kto jan te alu control Bit1 bit2 bit 3, duhet me ba edhe 1 multiplekser 3 to 1
     result,         //qe zgjedh operacionin(brenda alu_16Bit)
     cout,
    );

DataMemory DPDM(AdresaNeHyrje, WriteData,  MemWrite,  MemRead,  clk, ReadData);

assign Rfwe = 1;

initial begin
assign z = MemToReg;
end

assign WD = s ? (z = 1 ? ReadData : 0) : result;

endmodule
