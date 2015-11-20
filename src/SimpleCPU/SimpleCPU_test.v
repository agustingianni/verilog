// Test the implemenation of SimpleCPU.
// iverilog -o SimpleCPU SimpleCPU.v SimpleCPU_test.v
// 
module SimpleCPU_test ();
	reg clk, rst;
	reg [31:0] cur_ins;
	
	// Instanciate our CPU and connect the input ports.
	SimpleCPU cpu(clk, rst, cur_ins);
	
	// Setup the simulation environment.
    initial
    begin
        clk = 0;    // Set the clock to low.
        rst = 1;    // Reset the counter.
        cur_ins = 1;
        
        // After 5 time units change the reset flag.
        #5 rst = 0;

        // End the simulation after 50 time units.
        #50;
        $finish;
    end

    // Every 5 time units change the clock.
    always 
    begin 
        #5 clk = ~clk;
    end
	
endmodule