`timescale 1ns/1ps

module clock_tb;

    logic clk; 
    clock_if vif(clk);

    digital_clock dut (
        .clk     (vif.clk),
        .reset   (vif.reset),
        .seconds (vif.seconds),
        .minutes (vif.minutes)
    );

    clock_test test (vif);

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // VCD Dump
    initial begin
        $dumpfile("clock_wave.vcd");
        $dumpvars(0, clock_tb);
    end

endmodule
