// Flip flop that sets the output 'q' to 't' when there is a possitive
// clock tick.
module ToggleFlipFlop (clk, rst, q);
    input clk, rst, t;
    output q;
    reg q;

    always @(negedge clk or posedge rst)
    begin
        if(rst) begin
            q <= 0;
        end else begin
            q <= ~q;
        end
    end

endmodule // ToggleFlipFlop

module RippleCarryCounter (clk, rst, q);
    input clk, rst;
    output [3:0] q;

    // Instanciate the toggle flip flop.
    ToggleFlipFlop tff1(clk , rst, q[0]);
    ToggleFlipFlop tff2(q[0], rst, q[1]);
    ToggleFlipFlop tff3(q[1], rst, q[2]);
    ToggleFlipFlop tff4(q[2], rst, q[3]);

endmodule // RippleCarryCounter
