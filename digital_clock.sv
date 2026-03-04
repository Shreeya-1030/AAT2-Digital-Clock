//File: digital_clock.sv
//Author: Shreeya Sachin Kirdat / 1BM23EC249
//Created: 25/02/2026
//Module: Digital CLock
//Project: SystemVerilog and Verification (23EC6PE2SV)
//	 Faculty: Prof. Ajaykumar Devarapalli
//Description: A simple SystemVerilog code for a digital clock to count upto 59:59.

`timescale 1ns/1ps

module digital_clock (
    input  logic        clk,
    input  logic        reset,
    output logic [5:0]  seconds,
    output logic [5:0]  minutes
);

    always_ff @(posedge clk) begin
        if (reset) begin
            seconds <= 6'd0;
            minutes <= 6'd0;
        end
        else begin
            if (seconds == 6'd59) begin
                seconds <= 6'd0;

                if (minutes == 6'd59)
                    minutes <= 6'd0;
                else
                    minutes <= minutes + 1;
            end
            else begin
                seconds <= seconds + 1;
            end
        end
    end

endmodule
