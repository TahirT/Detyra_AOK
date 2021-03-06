`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/24/2020 02:00:05 PM
// Design Name: 
// Module Name: mux_4to1
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


module mux_4to1 (s0, s1, s2, d0, d1, d2, d3, d4, z1);// op1 op2 op3 net3 net4 net5 net6 less result
//define inputs and output                      //              and  or
input s0, s1, s2, d0, d1, d2, d3,d4;
output z1;
//use the nested conditional operator
assign z1 = s2 ? (s0 ? d4 : d2) : (s1 ? ( s0? d4 :d1) :(s0? d2: d0));

endmodule