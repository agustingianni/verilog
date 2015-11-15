module RippleCarryCounter_test ();
    reg clk, rst;
    wire [3:0] q;

    // Create the carry counter.
    RippleCarryCounter rcc (clk, rst, q);

    // Setup the simulation environment.
    initial
    begin
        clk = 0;    // Set the clock to low.
        rst = 1;    // Reset the counter.

        // Play with the time and reset.
        #30 rst = 0;
        #30 rst = 1;
        #30 rst = 0;
        #30 rst = 1;
        #30 rst = 0;
        #30 rst = 1;
        #30 rst = 0;
        #30 rst = 1;
        #30 rst = 0;

        // End the simulation after 50 time units.
        #50;
        $finish;
    end

    // Every 5 time units change the clock.
    always 
    begin 
        #5 clk = ~clk;
    end

    initial
    begin
       $monitor("At time %t, q=%2d, rst=%d", $time, q, rst);
    end



endmodule