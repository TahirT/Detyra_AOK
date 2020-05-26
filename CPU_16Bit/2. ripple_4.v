`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/20/2020 02:45:28 PM
// Design Name: 
// Module Name: ripple_4
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


module adder4_ripple_carry (a, b, cin, sum, cout);
input [3:0] a, b; //define inputs and outputs
input cin;
output [3:0] sum;
output cout;
//define internal nets
wire [3:0] c;
//define output
assign cout = c[3];

full_adder inst0 (a[0], b[0], cin, sum[0], c[0]);
full_adder inst1 (a[1], b[1], c[0], sum[1], c[1]);
full_adder inst2 (a[2], b[2], c[1], sum[2], c[2]);
full_adder inst3 (a[3], b[3], c[2], sum[3], c[3]);

endmodule
