//File: clock_tb.sv
//Author: Shreeya Sachin Kirdat / 1BM23EC249
//Created: 25/02/2026
//Module: Digital CLock
//Project: SystemVerilog and Verification (23EC6PE2SV)
//	 Faculty: Prof. Ajaykumar Devarapalli
//Description: A simple SystemVerilog top module for a digital clock to count upto 59:59.

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
