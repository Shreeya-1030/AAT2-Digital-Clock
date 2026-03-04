//File: clock_interface.sv
//Author: Shreeya Sachin Kirdat / 1BM23EC249
//Created: 25/02/2026
//Module: Digital CLock
//Project: SystemVerilog and Verification (23EC6PE2SV)
//	 Faculty: Prof. Ajaykumar Devarapalli
//Description: A simple SystemVerilog interface block (with modport) code for a digital clock to count upto 59:59.

`timescale 1ns/1ps

interface clock_if (input logic clk);

    logic reset;
    logic [5:0] seconds;
    logic [5:0] minutes;

    modport DUT (
        input  clk, reset,
        output seconds, minutes
    );

    modport TB (
        input  clk,        
        output reset,
        input  seconds, minutes
    );

endinterface
