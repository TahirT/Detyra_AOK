`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/27/2020 12:53:33 AM
// Design Name: 
// Module Name: Memory
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


module Memory(
input Hyrja, input Dalja
    );
wire[15:0] Hyrja;
wire[15:0] Dalja;

reg[5:0] instrMemory[127:0];
initial $readmemh("instrMem.mem", instrMemory);

assign Dalja = instrMemory[Hyrja];


endmodule
