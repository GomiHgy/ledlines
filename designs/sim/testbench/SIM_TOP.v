// -----------------------------------------------------------------------------
//  Title         : Simulation Top module
//  Project       : LedLines
// -----------------------------------------------------------------------------
//  File          : SIM_TOP.v
//  Author        : K.Ishiwatari
//  Created       : 2017/ 6/30
//  Last modified : 
// -----------------------------------------------------------------------------
//  Description   : Simulation Top module
// -----------------------------------------------------------------------------
//  Copyright (C) 2017 K.Ishiwatari All Rights Reserved.
// -----------------------------------------------------------------------------

`timescale      1ps/1ps

`define             CLOCK_PERIOD            20000           // 50[MHz]

module  SIM_TOP();
    //

    //
    reg                                 clk;
    reg                                 resetn;
    reg                                 start_ledlines;
    //
    TOP #(  
    )   m_TOP (
        .CLK(clk), .RST_N(resetn),
        //
        .SW(start_ledlines),
        //
        .LED_SIG0(),
        .LED_SIG1(),
        .LED_SIG2(),
        .LED_SIG3()
        );

    // Simulation control
    initial begin
        clk            <= 1'b1;
        resetn         <= 1'b1;
        start_ledlines <= 1'b0;
        //
        //
        repeat (40) begin
            @(posedge clk);
        end
        resetn <= #(`CLOCK_PERIOD/8) 1'b0;
        // 
        repeat (500) begin
            @(posedge clk);
        end
        start_ledlines  <= 1;
    end

    initial begin
        //
        @(posedge start_ledlines);
        //
        repeat (500000) begin
            @(posedge clk);
        end
        //
        $finish;
    end

endmodule
