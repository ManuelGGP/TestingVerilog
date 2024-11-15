
//==========================================================
// Project4_tb.v
// T. Manikas
// 2024 Aug 13
//
// CS 2340 Project 4
// Fall 2024
//
// test bench for Project 4 Verilog module
//
//==========================================================

// time scale of 1 nanosecond

`timescale 1ns/10ps

// test bench module

module test_Project4;

	reg [2:0] ABC;			// inputs to Project4 module
	wire F;				// output from Project4 module

	// "DUT" = "Design Under Test"
	
	Project4 DUT(F,ABC[2],ABC[1],ABC[0]);		
	
	// test all possible input values of A,B, and C
	
	// start at ABC = "000"
	
	initial
		begin
			ABC <= 3'b000;
		end
	
	//  update input values 
	
	always
		begin

			// allow 10 ns time period between updates

			#10;	        

			// add 1 to get next set of inputs
          
			ABC = ABC + 3'b001; 

			// end after last set of inputs      
			
			if (ABC == 3'b111)        
				begin
					#10;
					$finish;
				end
		end
		
	
	// display table of results
	
	initial
		begin	
			$display("A B C | F\n------------");
			$monitor("%b %b %b | %b",ABC[2],ABC[1],ABC[0],F);
		end
			
endmodule




