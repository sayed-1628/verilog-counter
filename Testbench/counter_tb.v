`timescale 1ns/1ps

module counter_tb;

    reg clk;
    reg rst_n;
    reg en;

    wire [7:0] count;

    // Clock: 50 MHz -> Period = 20 ns
    always #10 clk = ~clk;

    // DUT
    counter uut (
        .clk   (clk),
        .rst_n (rst_n),
        .en    (en),
        .count (count)
    );

    // Test sequence
    initial begin

        // Initial values
        clk   = 0;
        rst_n = 0;
        en    = 0;

        // Reset
        #20;
        rst_n = 1;

        // Enable counter
        #20;
        en = 1;

        // Count for 60 ns
        #60;

        // Disable counter -> Hold
        en = 0;

        // Hold for 40 ns
        #40;

        // Enable again
        en = 1;

        // Count again for 60 ns
        #60;

        // Finish simulation
        $stop;

    end

endmodule
