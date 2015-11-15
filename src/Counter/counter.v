module counter (out, clk, rst);
    // Like a macro.
    parameter WIDTH = 8;
    
    // Define if the arguments are inputs or outputs.
    output [WIDTH - 1 : 0] out;
    input clk;
    input rst;

    // Set the kind of variable, register or wire depending on what we need.
    reg [WIDTH - 1 : 0] out;
    wire clk;
    wire rst;

    // Execute whenever there is a positive transition on 'clk'.
    always @(posedge clk)
    begin
        // Why don't we use assign here?.
        out <= out + 1;
    end
    
    always @(rst)
    begin
        if (rst)
            assign out = 0;
        else
            deassign out;
    end

endmodule