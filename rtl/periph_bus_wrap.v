//-----------------------------------------------------------------------------
// File          : periph_bus_wrap_0.v
// Creation date : 26.11.2018
// Creation time : 13:32:52
// Description   : 
// Created by    : epe
// Tool : Kactus2 3.6.99 64-bit
// Plugin : Verilog generator 2.2
// This file was generated based on IP-XACT component pulp-platform.org:communication.bus:periph_bus_wrap:1.0
// whose XML file is /home/epe/pulpino/ip-xact/pulp-platform.org/communication.bus/periph_bus_wrap/1.0/periph_bus_wrap.1.0.xml
//-----------------------------------------------------------------------------

module periph_bus_wrap #(
    parameter                              APB_ADDR_WIDTH   = 32,
    parameter                              APB_DATA_WIDTH   = 32
) (
  // Interface: apb_slave
    input                [APB_ADDR_WIDTH-1:0] apb_slave_paddr,
    input                               apb_slave_penable,
    input                               apb_slave_psel,
    input                [APB_DATA_WIDTH-1:0] apb_slave_pwdata,
    input                               apb_slave_pwrite,
    output               [APB_DATA_WIDTH-1:0] apb_slave_prdata,
    output                              apb_slave_pready,
    output                              apb_slave_pslverr,

    // Interface: debug_master
    input  logic         [31:0]         PRDATA_8,
    input  logic                        PREADY_8,
    input  logic                        PSLVERR_8,
    output logic         [11:0]         PADDR_8,
    output logic                        PENABLE_8,
    output logic                        PSEL_8,
    output logic         [31:0]         PWDATA_8,
    output logic                        PWRITE_8,

    // Interface: event_unit_master
    input  logic         [31:0]         PRDATA_4,
    input  logic                        PREADY_4,
    input  logic                        PSLVERR_4,
    output logic         [11:0]         PADDR_4,
    output logic                        PENABLE_4,
    output logic                        PSEL_4,
    output logic         [31:0]         PWDATA_4,
    output logic                        PWRITE_4,

    // Interface: fll_master
    input  logic         [31:0]         PRDATA_6,
    input  logic                        PREADY_6,
    input  logic                        PSLVERR_6,
    output logic         [11:0]         PADDR_6,
    output logic                        PENABLE_6,
    output logic                        PSEL_6,
    output logic         [31:0]         PWDATA_6,
    output logic                        PWRITE_6,

    // Interface: gpio_master
    input  logic         [31:0]         PRDATA_1,
    input  logic                        PREADY_1,
    input  logic                        PSLVERR_1,
    output logic         [11:0]         PADDR_1,
    output logic                        PENABLE_1,
    output logic                        PSEL_1,
    output logic         [31:0]         PWDATA_1,
    output logic                        PWRITE_1,

    // Interface: i2c_master
    input  logic         [31:0]         PRDATA_5,
    input  logic                        PREADY_5,
    input  logic                        PSLVERR_5,
    output logic         [11:0]         PADDR_5,
    output logic                        PENABLE_5,
    output logic                        PSEL_5,
    output logic         [31:0]         PWDATA_5,
    output logic                        PWRITE_5,

    // Interface: soc_ctrl_master
    input  logic         [31:0]         PRDATA_7,
    input  logic                        PREADY_7,
    input  logic                        PSLVERR_7,
    output logic         [11:0]         PADDR_7,
    output logic                        PENABLE_7,
    output logic                        PSEL_7,
    output logic         [31:0]         PWDATA_7,
    output logic                        PWRITE_7,

    // Interface: spi_master
    input  logic         [31:0]         PRDATA_2,
    input  logic                        PREADY_2,
    input  logic                        PSLVERR_2,
    output logic         [11:0]         PADDR_2,
    output logic                        PENABLE_2,
    output logic                        PSEL_2,
    output logic         [31:0]         PWDATA_2,
    output logic                        PWRITE_2,

    // Interface: timer_master
    input  logic         [31:0]         PRDATA_3,
    input  logic                        PREADY_3,
    input  logic                        PSLVERR_3,
    output logic         [11:0]         PADDR_3,
    output logic                        PENABLE_3,
    output logic                        PSEL_3,
    output logic         [31:0]         PWDATA_3,
    output logic                        PWRITE_3,

    // Interface: uart_master
    input  logic         [31:0]         PRDATA_0,
    input  logic                        PREADY_0,
    input  logic                        PSLVERR_0,
    output logic         [31:0]         PADDR_0,
    output logic                        PENABLE_0,
    output logic                        PSEL_0,
    output logic         [31:0]         PWDATA_0,
    output logic                        PWRITE_0,

    // These ports are not in any interface
    input                               clk_i,
    input                               rst_ni
);    

    // IP-XACT VLNV: pulp-platform.org:communication.bus:apb_node_wrap:1.0
    apb_node_wrap_0     apb_node_wrap_i(
        // Interface: apb_master_0
        .apb_master_0_prdata (PRDATA_0 ),
        .apb_master_0_pready (PREADY_0 ),
        .apb_master_0_pslverr(PSLVERR_0),
        .apb_master_0_paddr  (PADDR_0  ),
        .apb_master_0_penable(PENABLE_0),
        .apb_master_0_psel   (PSEL_0   ),
        .apb_master_0_pwdata (PWDATA_0 ),
        .apb_master_0_pwrite (PWRITE_0 ),
        // Interface: apb_master_1
        .apb_master_1_prdata (PRDATA_1 ),
        .apb_master_1_pready (PREADY_1 ),
        .apb_master_1_pslverr(PSLVERR_1),
        .apb_master_1_paddr  (PADDR_1  ),
        .apb_master_1_penable(PENABLE_1),
        .apb_master_1_psel   (PSEL_1   ),
        .apb_master_1_pwdata (PWDATA_1 ),
        .apb_master_1_pwrite (PWRITE_1 ),
        // Interface: apb_master_2
        .apb_master_2_prdata (PRDATA_2 ),
        .apb_master_2_pready (PREADY_2 ),
        .apb_master_2_pslverr(PSLVERR_2),
        .apb_master_2_paddr  (PADDR_2  ),
        .apb_master_2_penable(PENABLE_2),
        .apb_master_2_psel   (PSEL_2   ),
        .apb_master_2_pwdata (PWDATA_2 ),
        .apb_master_2_pwrite (PWRITE_2 ),
        // Interface: apb_master_3
        .apb_master_3_prdata (PRDATA_3 ),
        .apb_master_3_pready (PREADY_3 ),
        .apb_master_3_pslverr(PSLVERR_3),
        .apb_master_3_paddr  (PADDR_3  ),
        .apb_master_3_penable(PENABLE_3),
        .apb_master_3_psel   (PSEL_3   ),
        .apb_master_3_pwdata (PWDATA_3 ),
        .apb_master_3_pwrite (PWRITE_3 ),
        // Interface: apb_master_4
        .apb_master_4_prdata (PRDATA_4 ),
        .apb_master_4_pready (PREADY_4 ),
        .apb_master_4_pslverr(PSLVERR_4),
        .apb_master_4_paddr  (PADDR_4  ),
        .apb_master_4_penable(PENABLE_4),
        .apb_master_4_psel   (PSEL_4   ),
        .apb_master_4_pwdata (PWDATA_4 ),
        .apb_master_4_pwrite (PWRITE_4 ),
        // Interface: apb_master_5
        .apb_master_5_prdata (PRDATA_5 ),
        .apb_master_5_pready (PREADY_5 ),
        .apb_master_5_pslverr(PSLVERR_5),
        .apb_master_5_paddr  (PADDR_5  ),
        .apb_master_5_penable(PENABLE_5),
        .apb_master_5_psel   (PSEL_5   ),
        .apb_master_5_pwdata (PWDATA_5 ),
        .apb_master_5_pwrite (PWRITE_5 ),
        // Interface: apb_master_6
        .apb_master_6_prdata (PRDATA_6 ),
        .apb_master_6_pready (PREADY_6 ),
        .apb_master_6_pslverr(PSLVERR_6),
        .apb_master_6_paddr  (PADDR_6  ),
        .apb_master_6_penable(PENABLE_6),
        .apb_master_6_psel   (PSEL_6   ),
        .apb_master_6_pwdata (PWDATA_6 ),
        .apb_master_6_pwrite (PWRITE_6 ),
        // Interface: apb_master_7
        .apb_master_7_prdata (PRDATA_7 ),
        .apb_master_7_pready (PREADY_7 ),
        .apb_master_7_pslverr(PSLVERR_7),
        .apb_master_7_paddr  (PADDR_7  ),
        .apb_master_7_penable(PENABLE_7),
        .apb_master_7_psel   (PSEL_7   ),
        .apb_master_7_pwdata (PWDATA_7 ),
        .apb_master_7_pwrite (PWRITE_7 ),
        // Interface: apb_master_8
        .apb_master_8_prdata (PRDATA_8 ),
        .apb_master_8_pready (PREADY_8 ),
        .apb_master_8_pslverr(PSLVERR_8),
        .apb_master_8_paddr  (PADDR_8  ),
        .apb_master_8_penable(PENABLE_8),
        .apb_master_8_psel   (PSEL_8   ),
        .apb_master_8_pwdata (PWDATA_8 ),
        .apb_master_8_pwrite (PWRITE_8 ),
        // Interface: s_slave
        .apb_slave_paddr     (apb_slave_paddr),
        .apb_slave_penable   (apb_slave_penable),
        .apb_slave_psel      (apb_slave_psel),
        .apb_slave_pwdata    (apb_slave_pwdata),
        .apb_slave_pwrite    (apb_slave_pwrite),
        .apb_slave_prdata    (apb_slave_prdata),
        .apb_slave_pready    (apb_slave_pready),
        .apb_slave_pslverr   (apb_slave_pslverr),
        // These ports are not in any interface
        .clk_i               (clk_i),
        .rst_ni              (rst_ni));


endmodule
