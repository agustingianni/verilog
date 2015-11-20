// Stupid first CPU.
module SimpleCPU(clk, rst, cur_ins);
    // Definitions.
    parameter REG_SET_SIZE = 16;
    parameter WORD_SIZE = 32;
    
    // Instruction opcodes.
    parameter OP_NOP = 32'b00000000000000000000000000000000;
    parameter OP_INC = 32'b00000000000000000000000000000001;
    parameter OP_DEC = 32'b00000000000000000000000000000010;
    
    // Input ports.
    input clk;
    input rst;
    input [WORD_SIZE-1:0] cur_ins;
        
    // Define the set of registers.
    reg [WORD_SIZE-1:0] regs [0:REG_SET_SIZE];
    reg [WORD_SIZE-1:0] CPSR;
    
    // Define aliases for the CPU registers.
    `define REG_SP regs[13] // Stack pointer.
    `define REG_LR regs[14] // Link register.
    `define REG_PC regs[15] // Program counter.
    
    // Define aliases for the CPU flags. 
    `define CPSR_V CPSR[28] // Overflow flag.
    `define CPSR_C CPSR[29] // Carry flag.
    `define CPSR_Z CPSR[30] // Zero flag.
    `define CPSR_N CPSR[31] // Negative/less than flag.
    
    // Local variables.
    integer i;
    
    // Advance on each 'clk' tick and reset on each 'rst' tick.
    always @(posedge clk or posedge rst) begin 
        if (rst) begin
            $display("Resetting the CPU.");
            
            // Reset the flags register.
            CPSR = 0;
            
            // Reset the general purpose registers.
            for (i = 0; i < REG_SET_SIZE; i = i + 1)
            begin
                regs[i] = 0;
            end
        end
        
        // Increment the program counter.
        `REG_PC = `REG_PC + 1;
        
        // Debug: dump the state.
        $display("Current state:");
        $display("  r0:%8x r1:%8x  r2:%8x  r3:%8x  r4:%8x r5:%8x r6:%8x r7:%8x", regs[0], regs[1], regs[2], regs[3], regs[4], regs[5], regs[6], regs[7]);
        $display("  r8:%8x r9:%8x r10:%8x r11:%8x r12:%8x SP:%8x LR:%8x PC:%8x", regs[8], regs[9], regs[10], regs[11], regs[12], regs[13], regs[14], regs[15]);
        $display("  cur_ins:%8x", cur_ins);
        
        // Main instruction dispatcher.
        case (cur_ins)

            // No operation.
            OP_NOP:
            begin
                $display("OP_NOP");
            end
            
            // Increment r0.
            OP_INC:
            begin
                $display("OP_INC");
                regs[0] = regs[0] + 1; 
            end
            
            // Decrement r0.
            OP_DEC:
            begin
                $display("OP_DEC");
                regs[0] = regs[0] - 1;
            end
            
            // Handle unknown opcodes.
            default:
            begin
                $display("Unknown opcode %8x", cur_ins);
            end
            
        endcase
    end
endmodule
