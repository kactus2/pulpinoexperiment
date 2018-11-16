//-----------------------------------------------------------------------------
// File          : spi_master_fsm.v
// Creation date : 12.11.2018
// Creation time : 12:04:21
// Description   : 
// Created by    : epe
// Tool : Kactus2 3.6.91 64-bit
// Plugin : Verilog generator 2.2
// This file was generated based on IP-XACT component pulp-platform.org:peripheral.logic:spi_master_fsm:1.0
// whose XML file is /home/epe/pulpino/ip-xact/pulp-platform.org/peripheral.logic/spi_master_fsm/1.0/spi_master_fsm.1.0.xml
//-----------------------------------------------------------------------------

module spi_master_fsm #(
    parameter                              BUFFER_DEPTH     = 10,
    parameter                              LOG_BUFFER_DEPTH = $clog2(BUFFER_DEPTH)
) (
    // These ports are not in any interface
    input          [LOG_BUFFER_DEPTH:0]       cnt_rx,
    input          [LOG_BUFFER_DEPTH:0]       cnt_tx,
    input          [LOG_BUFFER_DEPTH:0]       elements_rx,
    input          [LOG_BUFFER_DEPTH:0]       elements_tx,
    input                               HCLK,
    input                               HRESETn,
    input                               int_cnt_en,
    input                               int_en,
    input                               int_rd_sta,
    input                               spi_ctrl_data_rx_ready,
    input                               spi_ctrl_data_rx_valid,
    input                               spi_ctrl_data_tx_ready,
    input                               spi_ctrl_data_tx_valid,
    input          [6:0]                spi_ctrl_status,
    input          [LOG_BUFFER_DEPTH:0]       th_rx,
    input          [LOG_BUFFER_DEPTH:0]       th_tx,
    output                              events_o,
    output         [31:0]               spi_status
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
endmodule
