`timescale 1ns / 1ps

// REGISTER
module REG #(parameter DATAWIDTH = 4)(D, Q, clk, rst);
	input      [DATAWIDTH-1:0] D;
	input                      clk, rst;
	output reg [DATAWIDTH-1:0] Q;

	always @(posedge clk) begin
		if (rst == 1) // synchronous reset 
			Q <= 0;
		else
			Q <=D;
	end
endmodule

// ADDER 
module ADD #(parameter DATAWIDTH = 4)(A, B, Sum);
	input      [DATAWIDTH-1:0] A, B;
	output reg [DATAWIDTH-1:0] Sum;

	always @(A,B) begin
		Sum <= A + B;
	end
endmodule

// SUBTRACTOR
module SUB #(parameter DATAWIDTH = 4)(a, b, diff);
    input      [DATAWIDTH-1:0] a, b;
    output reg [DATAWIDTH-1:0] diff;
    
    always @(a,b) begin
        diff <= a - b;
    end
endmodule

// MULTIPLIER
module MUL #(parameter DATAWIDTH = 4)(A, B, Prod);
	input      [DATAWIDTH-1:0] A, B;
	output reg [DATAWIDTH-1:0] Prod;

	always @(A,B) begin
		Prod <= A * B;
	end
endmodule

// DIVIDER
module DIV #(parameter DATAWIDTH = 4)(A, B, Quot);
	input      [DATAWIDTH-1:0] A, B;
	output reg [DATAWIDTH-1:0] Quot;

	always @(A,B) begin
		Quot <= A/B;
	end
endmodule

// REMAINDER
module MOD #(parameter DATAWIDTH = 4)(A, B, rem);
	input      [DATAWIDTH-1:0] A, B;
	output reg [DATAWIDTH-1:0] rem;
			
	always @(A,B) begin
		rem <= A%B;	 
	end
endmodule

// COMPARE
module COMP #(parameter DATAWIDTH = 4)(A, B, gt, lt, eq);
	input      [DATAWIDTH-1:0] A, B;
	output reg                 gt, lt, eq;

	always @(A,B) begin
		gt <= 0; lt <= 0; eq <= 0;
        
		if ($signed({1'b0,A}) > B) //convert unsigned to signed
			gt<=1;
		else if ($signed({1'b0,A}) < B) //convert unsigned to signed
			lt<=1;
		else begin
			eq<=1;
		end
	end
endmodule

// 2->1 MULTIPLEXOR
module MUX2x1 #(parameter DATAWIDTH = 4)(A, B, Sel, D);
	input      [DATAWIDTH-1:0] A, B;
	input                      Sel;
	output reg [DATAWIDTH-1:0] D;

	always @(A,B,Sel) begin
		if (Sel == 1'b0)
			D <= A;
		else if (Sel == 1'b1)
			D <= B;
	end
endmodule

// SHIFT RIGHT REG
module SHR #(parameter DATAWIDTH = 4)(A, Sh_amt, D);
	input      [DATAWIDTH-1:0] A, Sh_amt;
	output reg [DATAWIDTH-1:0] D;

	always @(A, Sh_amt) begin
		D<= A >> Sh_amt;
	end
endmodule

// SHIFT LEFT REG
module SHL #(parameter DATAWIDTH = 4)(A, Sh_amt, D);
	input      [DATAWIDTH-1:0] A, Sh_amt;
	output reg [DATAWIDTH-1:0] D;

	always @(A, Sh_amt) begin
		D<= A << Sh_amt;
	end
endmodule

// INCREMENT
module INC #(parameter DATAWIDTH = 4)(a, d);
    input      [DATAWIDTH-1:0] a;
    output reg [DATAWIDTH-1:0] d;
    
    always @(a) begin
        /*if (a == {DATAWIDTH{1'b1}})
            d <= 0;
        else
            d <= a + 1;*/
        d <= a + 1;
    end
endmodule

// DECREMENT
module DEC #(parameter DATAWIDTH = 4)(a, d);
    input      [DATAWIDTH-1:0] a;
    output reg [DATAWIDTH-1:0] d;
    
    always @(a) begin
        /*if (a == 0)
            d <= {DATAWIDTH{1'b1}};
        else
            d <= a - 1;*/
       d <= a - 1;
    end
endmodule
