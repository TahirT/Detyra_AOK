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


module Datapath(input clk, input pcfill, input RegDat,... output opcode);

wire instruksioni(15:0);
wire [1:0] opcode;
wire [2:0] RS;
wire [2:0] RT;
wire [2:0] RD;
wire [15:0] WD;
wire RFwe;
wire [15:0] RD1, RD2;
wire s;
wire [15:0] alu2;
wire [15:0] imm_long;

initial begin
assign pc =16'd0;
end

always(@posedge clk)
begin
    assign pc = pcfill;
    
end

InstMemory DPIM (clk, pc, instruksioni); 

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
mux_2to1 M21HyrjeRF(s, RD, RT, z)
RegisterFile RF(RS, RT, RD, WD, RFwe, clk, RD1, RD2);

assign imm_long = {{8{immediate[7]}},immediate[7:0]};
assign alu2 = s ? immediate : RD2;

aluControl()//me e ba alu coltrol
alu_32bit aluRF(
     RD1,
     alu2,
    
    input ainvert,
    input bnegate,
    input [2:0] op,
    output result,
    output cout,
    );

DataMemory DPDM(input AdresaNeHyrje, input WriteData, input MemWrite, input MemRead, input clk, output ReadData);
assign Rfwe = 1;

assign WD = s ? (memToReg = 1 ? ReadData : 0) : result;

endmodule
