// -----------------------------------------------------------------------------
//  Title         : P2S Output module
//  Project       : LEDlines
// -----------------------------------------------------------------------------
//  File          : P2S_OUT.v
//  Author        : K.Ishiwatari
//  Created       : 2017/ 6/30
//  Last modified : 
// -----------------------------------------------------------------------------
//  Description   : Convert parallel data to serial data.
// -----------------------------------------------------------------------------
//  Copyright (C) 2017 K.Ishiwatari All Rights Reserved.
// -----------------------------------------------------------------------------

`timescale  1ns/1ps

module P2S_OUT #(
    parameter   DATA_WIDTH = 25,
) (
    // 
    input   wire                                        CCLK,
    input   wire                                        RST_N,
    //
    input   wire                                        iTRIG,
    //
    input   wire    [DATA_WIDTH -1: 0]                  iDATA,
    //
    output  wire                                        oSERIAL
);

    //
    localparam      STATE_WIDTH                         = 4;
    // 
    localparam      IDLE_STATE                          = 4'b0000;

    reg     [STATE_WIDTH -1: 0]                         next_state, state;

    // 
    always @(*) begin
        case (state)
            IDLE_STATE: begin
                            next_state     <= CALC_Y_DIR;
                        end
            default:    begin
                            next_state     <= IDLE_STATE;
                        end
        endcase
    end

    // 
    always @(posedge CCLK or negedge RST_N) begin
        if (!RST_N) begin
            state     <= IDLE_STATE;
            //
        end else begin
            state     <= next_state;
            //
        end
    end

endmodule
