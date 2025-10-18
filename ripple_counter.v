// 4-bit Ripple Counter (Asynchronous)
module ripple_counter (
    input clk,        // Clock input
    input reset,      // Active high reset
    output [3:0] q    // 4-bit output
);

    // Internal signals for flip-flops
    reg [3:0] q_reg;

    assign q = q_reg;  // Connect internal register to output

    always @(posedge clk or posedge reset)
    begin
        if (reset)
            q_reg[0] <= 1'b0;           // Reset LSB
        else
            q_reg[0] <= ~q_reg[0];      // Toggle on each clock pulse
    end

    always @(posedge q_reg[0] or posedge reset)
    begin
        if (reset)
            q_reg[1] <= 1'b0;
        else
            q_reg[1] <= ~q_reg[1];
    end

    always @(posedge q_reg[1] or posedge reset)
    begin
        if (reset)
            q_reg[2] <= 1'b0;
        else
            q_reg[2] <= ~q_reg[2];
    end

    always @(posedge q_reg[2] or posedge reset)
    begin
        if (reset)
            q_reg[3] <= 1'b0;
        else
            q_reg[3] <= ~q_reg[3];
    end

endmodule
