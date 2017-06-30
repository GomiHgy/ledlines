// -----------------------------------------------------------------------------
//  Title         : Top module
//  Project       : ledlines
// -----------------------------------------------------------------------------
//  File          : TOP.v
//  Author        : K.Ishiwatari
//  Created       : 2017/ 6/30
//  Last modified : 
// -----------------------------------------------------------------------------
//  Description   : Top module for LEDLines
// -----------------------------------------------------------------------------
//  Copyright (C) 2017 K.Ishiwatari All Rights Reserved.
// -----------------------------------------------------------------------------

`timescale                                  1ns/1ps

module TOP #(  
) (
    input   wire                        CLK,                // 50MHz
    input   wire                        RST_N,
    //
    input   wire                        SW,
    //
    output  wire                        LED_SIG0,
    output  wire                        LED_SIG1,
    output  wire                        LED_SIG2,
    output  wire                        LED_SIG3
);

    //
    localparam  DATA_WIDTH              = 25;

    // 

endmodule
