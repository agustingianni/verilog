module counter_test;
    parameter WIDTH = 8;

    reg rst = 0;
    
    initial
    begin
        # 17 rst = 1;
        # 11 rst = 0;
        # 29 rst = 1;
        # 11 rst = 0;
        # 100 $stop;
    end

    reg clk = 0;
    always #5 clk = !clk;

    wire [WIDTH - 1 : 0] value;
    counter c1 (value, clk, rst);

    initial
    begin
       $monitor("At time %t, value = %h (%0d)", $time, value, value);
    end

endmodule