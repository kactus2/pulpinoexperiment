//-----------------------------------------------------------------------------
// File          : apb_node_wrap_0.v
// Creation date : 26.11.2018
// Creation time : 09:48:06
// Description   : 
// Created by    : epe
// Tool : Kactus2 3.6.99 64-bit
// Plugin : Verilog generator 2.2
// This file was generated based on IP-XACT component pulp-platform.org:communication.bus:apb_node_wrap:1.0
// whose XML file is /home/epe/pulpino/ip-xact/pulp-platform.org/communication.bus/apb_node_wrap/1.0/apb_node_wrap.1.0.xml
//-----------------------------------------------------------------------------

`include "apb_bus.sv"

module apb_node_wrap_0 #(
    parameter                              APB_ADDR_WIDTH   = 32,
    parameter                              APB_DATA_WIDTH   = 32,
    parameter                              NB_MASTER        = 9
) (
    // Interface: apb_master_0
    input  logic         [31:0]         apb_master_0_prdata,
    input  logic                        apb_master_0_pready,
    input  logic                        apb_master_0_pslverr,
    output logic         [11:0]         apb_master_0_paddr,
    output logic                        apb_master_0_penable,
    output logic                        apb_master_0_psel,
    output logic         [31:0]         apb_master_0_pwdata,
    output logic                        apb_master_0_pwrite,

    // Interface: apb_master_1
    input  logic         [31:0]         apb_master_1_prdata,
    input  logic                        apb_master_1_pready,
    input  logic                        apb_master_1_pslverr,
    output logic         [11:0]         apb_master_1_paddr,
    output logic                        apb_master_1_penable,
    output logic                        apb_master_1_psel,
    output logic         [31:0]         apb_master_1_pwdata,
    output logic                        apb_master_1_pwrite,

    // Interface: apb_master_2
    input  logic         [31:0]         apb_master_2_prdata,
    input  logic                        apb_master_2_pready,
    input  logic                        apb_master_2_pslverr,
    output logic         [11:0]         apb_master_2_paddr,
    output logic                        apb_master_2_penable,
    output logic                        apb_master_2_psel,
    output logic         [31:0]         apb_master_2_pwdata,
    output logic                        apb_master_2_pwrite,

    // Interface: apb_master_3
    input  logic         [31:0]         apb_master_3_prdata,
    input  logic                        apb_master_3_pready,
    input  logic                        apb_master_3_pslverr,
    output logic         [11:0]         apb_master_3_paddr,
    output logic                        apb_master_3_penable,
    output logic                        apb_master_3_psel,
    output logic         [31:0]         apb_master_3_pwdata,
    output logic                        apb_master_3_pwrite,

    // Interface: apb_master_4
    input  logic         [31:0]         apb_master_4_prdata,
    input  logic                        apb_master_4_pready,
    input  logic                        apb_master_4_pslverr,
    output logic         [11:0]         apb_master_4_paddr,
    output logic                        apb_master_4_penable,
    output logic                        apb_master_4_psel,
    output logic         [31:0]         apb_master_4_pwdata,
    output logic                        apb_master_4_pwrite,

    // Interface: apb_master_5
    input  logic         [31:0]         apb_master_5_prdata,
    input  logic                        apb_master_5_pready,
    input  logic                        apb_master_5_pslverr,
    output logic         [11:0]         apb_master_5_paddr,
    output logic                        apb_master_5_penable,
    output logic                        apb_master_5_psel,
    output logic         [31:0]         apb_master_5_pwdata,
    output logic                        apb_master_5_pwrite,

    // Interface: apb_master_6
    input  logic         [31:0]         apb_master_6_prdata,
    input  logic                        apb_master_6_pready,
    input  logic                        apb_master_6_pslverr,
    output logic         [11:0]         apb_master_6_paddr,
    output logic                        apb_master_6_penable,
    output logic                        apb_master_6_psel,
    output logic         [31:0]         apb_master_6_pwdata,
    output logic                        apb_master_6_pwrite,

    // Interface: apb_master_7
    input  logic         [31:0]         apb_master_7_prdata,
    input  logic                        apb_master_7_pready,
    input  logic                        apb_master_7_pslverr,
    output logic         [11:0]         apb_master_7_paddr,
    output logic                        apb_master_7_penable,
    output logic                        apb_master_7_psel,
    output logic         [31:0]         apb_master_7_pwdata,
    output logic                        apb_master_7_pwrite,

    // Interface: apb_master_8
    input  logic         [31:0]         apb_master_8_prdata,
    input  logic                        apb_master_8_pready,
    input  logic                        apb_master_8_pslverr,
    output logic         [31:0]         apb_master_8_paddr,
    output logic                        apb_master_8_penable,
    output logic                        apb_master_8_psel,
    output logic         [31:0]         apb_master_8_pwdata,
    output logic                        apb_master_8_pwrite,

    // Interface: s_slave
    input               [31:0]          apb_slave_paddr,
    input                               apb_slave_penable,
    input                               apb_slave_psel,
    input               [31:0]          apb_slave_pwdata,
    input                               apb_slave_pwrite,
    output              [31:0]          apb_slave_prdata,
    output                              apb_slave_pready,
    output                              apb_slave_pslverr,

    // These ports are not in any interface
    input                               clk_i,
    input                               rst_ni
);

    // apb_node_i_apb_master_0_to_apb_master_0 wires:
    wire [31:0] apb_node_i_apb_master_0_to_apb_master_0_PADDR;
    wire       apb_node_i_apb_master_0_to_apb_master_0_PENABLE;
    wire [31:0] apb_node_i_apb_master_0_to_apb_master_0_PRDATA;
    wire       apb_node_i_apb_master_0_to_apb_master_0_PREADY;
    wire       apb_node_i_apb_master_0_to_apb_master_0_PSELx;
    wire       apb_node_i_apb_master_0_to_apb_master_0_PSLVERR;
    wire [31:0] apb_node_i_apb_master_0_to_apb_master_0_PWDATA;
    wire       apb_node_i_apb_master_0_to_apb_master_0_PWRITE;
    // apb_node_i_apb_master_8_to_apb_master_8 wires:
    wire [31:0] apb_node_i_apb_master_8_to_apb_master_8_PADDR;
    wire       apb_node_i_apb_master_8_to_apb_master_8_PENABLE;
    wire [31:0] apb_node_i_apb_master_8_to_apb_master_8_PRDATA;
    wire       apb_node_i_apb_master_8_to_apb_master_8_PREADY;
    wire       apb_node_i_apb_master_8_to_apb_master_8_PSELx;
    wire       apb_node_i_apb_master_8_to_apb_master_8_PSLVERR;
    wire [31:0] apb_node_i_apb_master_8_to_apb_master_8_PWDATA;
    wire       apb_node_i_apb_master_8_to_apb_master_8_PWRITE;
    // apb_node_i_apb_master_7_to_apb_master_7 wires:
    wire [31:0] apb_node_i_apb_master_7_to_apb_master_7_PADDR;
    wire       apb_node_i_apb_master_7_to_apb_master_7_PENABLE;
    wire [31:0] apb_node_i_apb_master_7_to_apb_master_7_PRDATA;
    wire       apb_node_i_apb_master_7_to_apb_master_7_PREADY;
    wire       apb_node_i_apb_master_7_to_apb_master_7_PSELx;
    wire       apb_node_i_apb_master_7_to_apb_master_7_PSLVERR;
    wire [31:0] apb_node_i_apb_master_7_to_apb_master_7_PWDATA;
    wire       apb_node_i_apb_master_7_to_apb_master_7_PWRITE;
    // apb_node_i_apb_master_6_to_apb_master_6 wires:
    wire [31:0] apb_node_i_apb_master_6_to_apb_master_6_PADDR;
    wire       apb_node_i_apb_master_6_to_apb_master_6_PENABLE;
    wire [31:0] apb_node_i_apb_master_6_to_apb_master_6_PRDATA;
    wire       apb_node_i_apb_master_6_to_apb_master_6_PREADY;
    wire       apb_node_i_apb_master_6_to_apb_master_6_PSELx;
    wire       apb_node_i_apb_master_6_to_apb_master_6_PSLVERR;
    wire [31:0] apb_node_i_apb_master_6_to_apb_master_6_PWDATA;
    wire       apb_node_i_apb_master_6_to_apb_master_6_PWRITE;
    // apb_node_i_apb_master_5_to_apb_master_5 wires:
    wire [31:0] apb_node_i_apb_master_5_to_apb_master_5_PADDR;
    wire       apb_node_i_apb_master_5_to_apb_master_5_PENABLE;
    wire [31:0] apb_node_i_apb_master_5_to_apb_master_5_PRDATA;
    wire       apb_node_i_apb_master_5_to_apb_master_5_PREADY;
    wire       apb_node_i_apb_master_5_to_apb_master_5_PSELx;
    wire       apb_node_i_apb_master_5_to_apb_master_5_PSLVERR;
    wire [31:0] apb_node_i_apb_master_5_to_apb_master_5_PWDATA;
    wire       apb_node_i_apb_master_5_to_apb_master_5_PWRITE;
    // apb_node_i_apb_master_4_to_apb_master_4 wires:
    wire [31:0] apb_node_i_apb_master_4_to_apb_master_4_PADDR;
    wire       apb_node_i_apb_master_4_to_apb_master_4_PENABLE;
    wire [31:0] apb_node_i_apb_master_4_to_apb_master_4_PRDATA;
    wire       apb_node_i_apb_master_4_to_apb_master_4_PREADY;
    wire       apb_node_i_apb_master_4_to_apb_master_4_PSELx;
    wire       apb_node_i_apb_master_4_to_apb_master_4_PSLVERR;
    wire [31:0] apb_node_i_apb_master_4_to_apb_master_4_PWDATA;
    wire       apb_node_i_apb_master_4_to_apb_master_4_PWRITE;
    // apb_node_i_apb_master_3_to_apb_master_3 wires:
    wire [31:0] apb_node_i_apb_master_3_to_apb_master_3_PADDR;
    wire       apb_node_i_apb_master_3_to_apb_master_3_PENABLE;
    wire [31:0] apb_node_i_apb_master_3_to_apb_master_3_PRDATA;
    wire       apb_node_i_apb_master_3_to_apb_master_3_PREADY;
    wire       apb_node_i_apb_master_3_to_apb_master_3_PSELx;
    wire       apb_node_i_apb_master_3_to_apb_master_3_PSLVERR;
    wire [31:0] apb_node_i_apb_master_3_to_apb_master_3_PWDATA;
    wire       apb_node_i_apb_master_3_to_apb_master_3_PWRITE;
    // apb_node_i_apb_master_2_to_apb_master_2 wires:
    wire [31:0] apb_node_i_apb_master_2_to_apb_master_2_PADDR;
    wire       apb_node_i_apb_master_2_to_apb_master_2_PENABLE;
    wire [31:0] apb_node_i_apb_master_2_to_apb_master_2_PRDATA;
    wire       apb_node_i_apb_master_2_to_apb_master_2_PREADY;
    wire       apb_node_i_apb_master_2_to_apb_master_2_PSELx;
    wire       apb_node_i_apb_master_2_to_apb_master_2_PSLVERR;
    wire [31:0] apb_node_i_apb_master_2_to_apb_master_2_PWDATA;
    wire       apb_node_i_apb_master_2_to_apb_master_2_PWRITE;
    // apb_node_i_apb_master_1_to_apb_master_1 wires:
    wire [31:0] apb_node_i_apb_master_1_to_apb_master_1_PADDR;
    wire       apb_node_i_apb_master_1_to_apb_master_1_PENABLE;
    wire [31:0] apb_node_i_apb_master_1_to_apb_master_1_PRDATA;
    wire       apb_node_i_apb_master_1_to_apb_master_1_PREADY;
    wire       apb_node_i_apb_master_1_to_apb_master_1_PSELx;
    wire       apb_node_i_apb_master_1_to_apb_master_1_PSLVERR;
    wire [31:0] apb_node_i_apb_master_1_to_apb_master_1_PWDATA;
    wire       apb_node_i_apb_master_1_to_apb_master_1_PWRITE;
    // apb_node_i_apb_slave_to_s_slave wires:
    wire [31:0] apb_node_i_apb_slave_to_s_slave_PADDR;
    wire       apb_node_i_apb_slave_to_s_slave_PENABLE;
    wire [31:0] apb_node_i_apb_slave_to_s_slave_PRDATA;
    wire       apb_node_i_apb_slave_to_s_slave_PREADY;
    wire       apb_node_i_apb_slave_to_s_slave_PSELx;
    wire       apb_node_i_apb_slave_to_s_slave_PSLVERR;
    wire [31:0] apb_node_i_apb_slave_to_s_slave_PWDATA;
    wire       apb_node_i_apb_slave_to_s_slave_PWRITE;

    // apb_node_i port wires:
    wire [31:0] apb_node_i_paddr_i;
    wire [8:0][31:0] apb_node_i_paddr_o;
    wire       apb_node_i_penable_i;
    wire [8:0] apb_node_i_penable_o;
    wire [8:0][31:0] apb_node_i_prdata_i;
    wire [31:0] apb_node_i_prdata_o;
    wire [8:0] apb_node_i_pready_i;
    wire       apb_node_i_pready_o;
    wire [8:0] apb_node_i_psel_o;
    wire [8:0] apb_node_i_pslverr_i;
    wire       apb_node_i_pslverr_o;
    wire [31:0] apb_node_i_pwdata_i;
    wire [8:0][31:0] apb_node_i_pwdata_o;
    wire       apb_node_i_pwrite_i;
    wire [8:0] apb_node_i_pwrite_o;


  logic [NB_MASTER-1:0][APB_ADDR_WIDTH-1:0] s_start_addr;
  logic [NB_MASTER-1:0][APB_ADDR_WIDTH-1:0] s_end_addr;

    // Assignments for the ports of the encompassing component:
    assign apb_master_0_paddr = apb_node_i_apb_master_0_to_apb_master_0_PADDR[11:0];
    assign apb_master_0_penable = apb_node_i_apb_master_0_to_apb_master_0_PENABLE;
    assign apb_node_i_apb_master_0_to_apb_master_0_PRDATA = apb_master_0_prdata;
    assign apb_node_i_apb_master_0_to_apb_master_0_PREADY = apb_master_0_pready;
    assign apb_master_0_psel = apb_node_i_apb_master_0_to_apb_master_0_PSELx;
    assign apb_node_i_apb_master_0_to_apb_master_0_PSLVERR = apb_master_0_pslverr;
    assign apb_master_0_pwdata = apb_node_i_apb_master_0_to_apb_master_0_PWDATA;
    assign apb_master_0_pwrite = apb_node_i_apb_master_0_to_apb_master_0_PWRITE;
    assign apb_master_1_paddr = apb_node_i_apb_master_1_to_apb_master_1_PADDR[11:0];
    assign apb_master_1_penable = apb_node_i_apb_master_1_to_apb_master_1_PENABLE;
    assign apb_node_i_apb_master_1_to_apb_master_1_PRDATA = apb_master_1_prdata;
    assign apb_node_i_apb_master_1_to_apb_master_1_PREADY = apb_master_1_pready;
    assign apb_master_1_psel = apb_node_i_apb_master_1_to_apb_master_1_PSELx;
    assign apb_node_i_apb_master_1_to_apb_master_1_PSLVERR = apb_master_1_pslverr;
    assign apb_master_1_pwdata = apb_node_i_apb_master_1_to_apb_master_1_PWDATA;
    assign apb_master_1_pwrite = apb_node_i_apb_master_1_to_apb_master_1_PWRITE;
    assign apb_master_2_paddr = apb_node_i_apb_master_2_to_apb_master_2_PADDR[11:0];
    assign apb_master_2_penable = apb_node_i_apb_master_2_to_apb_master_2_PENABLE;
    assign apb_node_i_apb_master_2_to_apb_master_2_PRDATA = apb_master_2_prdata;
    assign apb_node_i_apb_master_2_to_apb_master_2_PREADY = apb_master_2_pready;
    assign apb_master_2_psel = apb_node_i_apb_master_2_to_apb_master_2_PSELx;
    assign apb_node_i_apb_master_2_to_apb_master_2_PSLVERR = apb_master_2_pslverr;
    assign apb_master_2_pwdata = apb_node_i_apb_master_2_to_apb_master_2_PWDATA;
    assign apb_master_2_pwrite = apb_node_i_apb_master_2_to_apb_master_2_PWRITE;
    assign apb_master_3_paddr = apb_node_i_apb_master_3_to_apb_master_3_PADDR[11:0];
    assign apb_master_3_penable = apb_node_i_apb_master_3_to_apb_master_3_PENABLE;
    assign apb_node_i_apb_master_3_to_apb_master_3_PRDATA = apb_master_3_prdata;
    assign apb_node_i_apb_master_3_to_apb_master_3_PREADY = apb_master_3_pready;
    assign apb_master_3_psel = apb_node_i_apb_master_3_to_apb_master_3_PSELx;
    assign apb_node_i_apb_master_3_to_apb_master_3_PSLVERR = apb_master_3_pslverr;
    assign apb_master_3_pwdata = apb_node_i_apb_master_3_to_apb_master_3_PWDATA;
    assign apb_master_3_pwrite = apb_node_i_apb_master_3_to_apb_master_3_PWRITE;
    assign apb_master_4_paddr = apb_node_i_apb_master_4_to_apb_master_4_PADDR[11:0];
    assign apb_master_4_penable = apb_node_i_apb_master_4_to_apb_master_4_PENABLE;
    assign apb_node_i_apb_master_4_to_apb_master_4_PRDATA = apb_master_4_prdata;
    assign apb_node_i_apb_master_4_to_apb_master_4_PREADY = apb_master_4_pready;
    assign apb_master_4_psel = apb_node_i_apb_master_4_to_apb_master_4_PSELx;
    assign apb_node_i_apb_master_4_to_apb_master_4_PSLVERR = apb_master_4_pslverr;
    assign apb_master_4_pwdata = apb_node_i_apb_master_4_to_apb_master_4_PWDATA;
    assign apb_master_4_pwrite = apb_node_i_apb_master_4_to_apb_master_4_PWRITE;
    assign apb_master_5_paddr = apb_node_i_apb_master_5_to_apb_master_5_PADDR[11:0];
    assign apb_master_5_penable = apb_node_i_apb_master_5_to_apb_master_5_PENABLE;
    assign apb_node_i_apb_master_5_to_apb_master_5_PRDATA = apb_master_5_prdata;
    assign apb_node_i_apb_master_5_to_apb_master_5_PREADY = apb_master_5_pready;
    assign apb_master_5_psel = apb_node_i_apb_master_5_to_apb_master_5_PSELx;
    assign apb_node_i_apb_master_5_to_apb_master_5_PSLVERR = apb_master_5_pslverr;
    assign apb_master_5_pwdata = apb_node_i_apb_master_5_to_apb_master_5_PWDATA;
    assign apb_master_5_pwrite = apb_node_i_apb_master_5_to_apb_master_5_PWRITE;
    assign apb_master_6_paddr = apb_node_i_apb_master_6_to_apb_master_6_PADDR[11:0];
    assign apb_master_6_penable = apb_node_i_apb_master_6_to_apb_master_6_PENABLE;
    assign apb_node_i_apb_master_6_to_apb_master_6_PRDATA = apb_master_6_prdata;
    assign apb_node_i_apb_master_6_to_apb_master_6_PREADY = apb_master_6_pready;
    assign apb_master_6_psel = apb_node_i_apb_master_6_to_apb_master_6_PSELx;
    assign apb_node_i_apb_master_6_to_apb_master_6_PSLVERR = apb_master_6_pslverr;
    assign apb_master_6_pwdata = apb_node_i_apb_master_6_to_apb_master_6_PWDATA;
    assign apb_master_6_pwrite = apb_node_i_apb_master_6_to_apb_master_6_PWRITE;
    assign apb_master_7_paddr = apb_node_i_apb_master_7_to_apb_master_7_PADDR[11:0];
    assign apb_master_7_penable = apb_node_i_apb_master_7_to_apb_master_7_PENABLE;
    assign apb_node_i_apb_master_7_to_apb_master_7_PRDATA = apb_master_7_prdata;
    assign apb_node_i_apb_master_7_to_apb_master_7_PREADY = apb_master_7_pready;
    assign apb_master_7_psel = apb_node_i_apb_master_7_to_apb_master_7_PSELx;
    assign apb_node_i_apb_master_7_to_apb_master_7_PSLVERR = apb_master_7_pslverr;
    assign apb_master_7_pwdata = apb_node_i_apb_master_7_to_apb_master_7_PWDATA;
    assign apb_master_7_pwrite = apb_node_i_apb_master_7_to_apb_master_7_PWRITE;
    assign apb_master_8_paddr = apb_node_i_apb_master_8_to_apb_master_8_PADDR;
    assign apb_master_8_penable = apb_node_i_apb_master_8_to_apb_master_8_PENABLE;
    assign apb_node_i_apb_master_8_to_apb_master_8_PRDATA = apb_master_8_prdata;
    assign apb_node_i_apb_master_8_to_apb_master_8_PREADY = apb_master_8_pready;
    assign apb_master_8_psel = apb_node_i_apb_master_8_to_apb_master_8_PSELx;
    assign apb_node_i_apb_master_8_to_apb_master_8_PSLVERR = apb_master_8_pslverr;
    assign apb_master_8_pwdata = apb_node_i_apb_master_8_to_apb_master_8_PWDATA;
    assign apb_master_8_pwrite = apb_node_i_apb_master_8_to_apb_master_8_PWRITE;
    assign apb_node_i_apb_slave_to_s_slave_PADDR = apb_slave_paddr;
    assign apb_node_i_apb_slave_to_s_slave_PENABLE = apb_slave_penable;
    assign apb_slave_prdata = apb_node_i_apb_slave_to_s_slave_PRDATA;
    assign apb_slave_pready = apb_node_i_apb_slave_to_s_slave_PREADY;
    assign apb_slave_pslverr = apb_node_i_apb_slave_to_s_slave_PSLVERR;
    assign apb_node_i_apb_slave_to_s_slave_PWDATA = apb_slave_pwdata;
    assign apb_node_i_apb_slave_to_s_slave_PWRITE = apb_slave_pwrite;


    // apb_node_i assignments:
    assign apb_node_i_paddr_i = apb_node_i_apb_slave_to_s_slave_PADDR;
    assign apb_node_i_apb_master_0_to_apb_master_0_PADDR = apb_node_i_paddr_o[0];
    assign apb_node_i_apb_master_8_to_apb_master_8_PADDR = apb_node_i_paddr_o[8];
    assign apb_node_i_apb_master_7_to_apb_master_7_PADDR = apb_node_i_paddr_o[7];
    assign apb_node_i_apb_master_6_to_apb_master_6_PADDR = apb_node_i_paddr_o[6];
    assign apb_node_i_apb_master_5_to_apb_master_5_PADDR = apb_node_i_paddr_o[5];
    assign apb_node_i_apb_master_4_to_apb_master_4_PADDR = apb_node_i_paddr_o[4];
    assign apb_node_i_apb_master_3_to_apb_master_3_PADDR = apb_node_i_paddr_o[3];
    assign apb_node_i_apb_master_2_to_apb_master_2_PADDR = apb_node_i_paddr_o[2];
    assign apb_node_i_apb_master_1_to_apb_master_1_PADDR = apb_node_i_paddr_o[1];
    assign apb_node_i_penable_i = apb_node_i_apb_slave_to_s_slave_PENABLE;
    assign apb_node_i_apb_master_0_to_apb_master_0_PENABLE = apb_node_i_penable_o[0];
    assign apb_node_i_apb_master_8_to_apb_master_8_PENABLE = apb_node_i_penable_o[8];
    assign apb_node_i_apb_master_7_to_apb_master_7_PENABLE = apb_node_i_penable_o[7];
    assign apb_node_i_apb_master_6_to_apb_master_6_PENABLE = apb_node_i_penable_o[6];
    assign apb_node_i_apb_master_5_to_apb_master_5_PENABLE = apb_node_i_penable_o[5];
    assign apb_node_i_apb_master_4_to_apb_master_4_PENABLE = apb_node_i_penable_o[4];
    assign apb_node_i_apb_master_3_to_apb_master_3_PENABLE = apb_node_i_penable_o[3];
    assign apb_node_i_apb_master_2_to_apb_master_2_PENABLE = apb_node_i_penable_o[2];
    assign apb_node_i_apb_master_1_to_apb_master_1_PENABLE = apb_node_i_penable_o[1];
    assign apb_node_i_prdata_i[0] = apb_node_i_apb_master_0_to_apb_master_0_PRDATA;
    assign apb_node_i_prdata_i[8] = apb_node_i_apb_master_8_to_apb_master_8_PRDATA;
    assign apb_node_i_prdata_i[7] = apb_node_i_apb_master_7_to_apb_master_7_PRDATA;
    assign apb_node_i_prdata_i[6] = apb_node_i_apb_master_6_to_apb_master_6_PRDATA;
    assign apb_node_i_prdata_i[5] = apb_node_i_apb_master_5_to_apb_master_5_PRDATA;
    assign apb_node_i_prdata_i[4] = apb_node_i_apb_master_4_to_apb_master_4_PRDATA;
    assign apb_node_i_prdata_i[3] = apb_node_i_apb_master_3_to_apb_master_3_PRDATA;
    assign apb_node_i_prdata_i[2] = apb_node_i_apb_master_2_to_apb_master_2_PRDATA;
    assign apb_node_i_prdata_i[1] = apb_node_i_apb_master_1_to_apb_master_1_PRDATA;
    assign apb_node_i_apb_slave_to_s_slave_PRDATA = apb_node_i_prdata_o;
    assign apb_node_i_pready_i[0] = apb_node_i_apb_master_0_to_apb_master_0_PREADY;
    assign apb_node_i_pready_i[8] = apb_node_i_apb_master_8_to_apb_master_8_PREADY;
    assign apb_node_i_pready_i[7] = apb_node_i_apb_master_7_to_apb_master_7_PREADY;
    assign apb_node_i_pready_i[6] = apb_node_i_apb_master_6_to_apb_master_6_PREADY;
    assign apb_node_i_pready_i[5] = apb_node_i_apb_master_5_to_apb_master_5_PREADY;
    assign apb_node_i_pready_i[4] = apb_node_i_apb_master_4_to_apb_master_4_PREADY;
    assign apb_node_i_pready_i[3] = apb_node_i_apb_master_3_to_apb_master_3_PREADY;
    assign apb_node_i_pready_i[2] = apb_node_i_apb_master_2_to_apb_master_2_PREADY;
    assign apb_node_i_pready_i[1] = apb_node_i_apb_master_1_to_apb_master_1_PREADY;
    assign apb_node_i_apb_slave_to_s_slave_PREADY = apb_node_i_pready_o;
    assign apb_node_i_apb_master_0_to_apb_master_0_PSELx = apb_node_i_psel_o[0];
    assign apb_node_i_apb_master_8_to_apb_master_8_PSELx = apb_node_i_psel_o[8];
    assign apb_node_i_apb_master_7_to_apb_master_7_PSELx = apb_node_i_psel_o[7];
    assign apb_node_i_apb_master_6_to_apb_master_6_PSELx = apb_node_i_psel_o[6];
    assign apb_node_i_apb_master_5_to_apb_master_5_PSELx = apb_node_i_psel_o[5];
    assign apb_node_i_apb_master_4_to_apb_master_4_PSELx = apb_node_i_psel_o[4];
    assign apb_node_i_apb_master_3_to_apb_master_3_PSELx = apb_node_i_psel_o[3];
    assign apb_node_i_apb_master_2_to_apb_master_2_PSELx = apb_node_i_psel_o[2];
    assign apb_node_i_apb_master_1_to_apb_master_1_PSELx = apb_node_i_psel_o[1];
    assign apb_node_i_pslverr_i[0] = apb_node_i_apb_master_0_to_apb_master_0_PSLVERR;
    assign apb_node_i_pslverr_i[8] = apb_node_i_apb_master_8_to_apb_master_8_PSLVERR;
    assign apb_node_i_pslverr_i[7] = apb_node_i_apb_master_7_to_apb_master_7_PSLVERR;
    assign apb_node_i_pslverr_i[6] = apb_node_i_apb_master_6_to_apb_master_6_PSLVERR;
    assign apb_node_i_pslverr_i[5] = apb_node_i_apb_master_5_to_apb_master_5_PSLVERR;
    assign apb_node_i_pslverr_i[4] = apb_node_i_apb_master_4_to_apb_master_4_PSLVERR;
    assign apb_node_i_pslverr_i[3] = apb_node_i_apb_master_3_to_apb_master_3_PSLVERR;
    assign apb_node_i_pslverr_i[2] = apb_node_i_apb_master_2_to_apb_master_2_PSLVERR;
    assign apb_node_i_pslverr_i[1] = apb_node_i_apb_master_1_to_apb_master_1_PSLVERR;
    assign apb_node_i_apb_slave_to_s_slave_PSLVERR = apb_node_i_pslverr_o;
    assign apb_node_i_pwdata_i = apb_node_i_apb_slave_to_s_slave_PWDATA;
    assign apb_node_i_apb_master_0_to_apb_master_0_PWDATA = apb_node_i_pwdata_o[0];
    assign apb_node_i_apb_master_8_to_apb_master_8_PWDATA = apb_node_i_pwdata_o[8];
    assign apb_node_i_apb_master_7_to_apb_master_7_PWDATA = apb_node_i_pwdata_o[7];
    assign apb_node_i_apb_master_6_to_apb_master_6_PWDATA = apb_node_i_pwdata_o[6];
    assign apb_node_i_apb_master_5_to_apb_master_5_PWDATA = apb_node_i_pwdata_o[5];
    assign apb_node_i_apb_master_4_to_apb_master_4_PWDATA = apb_node_i_pwdata_o[4];
    assign apb_node_i_apb_master_3_to_apb_master_3_PWDATA = apb_node_i_pwdata_o[3];
    assign apb_node_i_apb_master_2_to_apb_master_2_PWDATA = apb_node_i_pwdata_o[2];
    assign apb_node_i_apb_master_1_to_apb_master_1_PWDATA = apb_node_i_pwdata_o[1];
    assign apb_node_i_pwrite_i = apb_node_i_apb_slave_to_s_slave_PWRITE;
    assign apb_node_i_apb_master_0_to_apb_master_0_PWRITE = apb_node_i_pwrite_o[0];
    assign apb_node_i_apb_master_8_to_apb_master_8_PWRITE = apb_node_i_pwrite_o[8];
    assign apb_node_i_apb_master_7_to_apb_master_7_PWRITE = apb_node_i_pwrite_o[7];
    assign apb_node_i_apb_master_6_to_apb_master_6_PWRITE = apb_node_i_pwrite_o[6];
    assign apb_node_i_apb_master_5_to_apb_master_5_PWRITE = apb_node_i_pwrite_o[5];
    assign apb_node_i_apb_master_4_to_apb_master_4_PWRITE = apb_node_i_pwrite_o[4];
    assign apb_node_i_apb_master_3_to_apb_master_3_PWRITE = apb_node_i_pwrite_o[3];
    assign apb_node_i_apb_master_2_to_apb_master_2_PWRITE = apb_node_i_pwrite_o[2];
    assign apb_node_i_apb_master_1_to_apb_master_1_PWRITE = apb_node_i_pwrite_o[1];


    assign s_start_addr[0] = `UART_START_ADDR;
    assign s_end_addr[0]   = `UART_END_ADDR;

    assign s_start_addr[1] = `GPIO_START_ADDR;
    assign s_end_addr[1]   = `GPIO_END_ADDR;

    assign s_start_addr[2] = `SPI_START_ADDR;
    assign s_end_addr[2]   = `SPI_END_ADDR;

    assign s_start_addr[3] = `TIMER_START_ADDR;
    assign s_end_addr[3]   = `TIMER_END_ADDR;

    assign s_start_addr[4] = `EVENT_UNIT_START_ADDR;
    assign s_end_addr[4]   = `EVENT_UNIT_END_ADDR;

    assign s_start_addr[5] = `I2C_START_ADDR;
    assign s_end_addr[5]   = `I2C_END_ADDR;

    assign s_start_addr[6] = `FLL_START_ADDR;
    assign s_end_addr[6]   = `FLL_END_ADDR;

    assign s_start_addr[7] = `SOC_CTRL_START_ADDR;
    assign s_end_addr[7]   = `SOC_CTRL_END_ADDR;

    assign s_start_addr[8] = `DEBUG_START_ADDR;
    assign s_end_addr[8]   = `DEBUG_END_ADDR;

    // IP-XACT VLNV: pulp-platform.org:communication.bus:apb_node:1.0
    apb_node  #(
    .NB_MASTER	    (NB_MASTER),
    .APB_ADDR_WIDTH ( APB_ADDR_WIDTH ),
    .APB_DATA_WIDTH ( APB_DATA_WIDTH )
	)   
	apb_node_i(
        // Interface: apb_slave
        .paddr_i             (apb_node_i_paddr_i),
        .penable_i           (apb_node_i_penable_i),
        .pwdata_i            (apb_node_i_pwdata_i),
        .pwrite_i            (apb_node_i_pwrite_i),
        .prdata_o            (apb_node_i_prdata_o),
        .pready_o            (apb_node_i_pready_o),
        .pslverr_o           (apb_node_i_pslverr_o),
        // There ports are contained in many interfaces
        .prdata_i            (apb_node_i_prdata_i),
        .pready_i            (apb_node_i_pready_i),
        .pslverr_i           (apb_node_i_pslverr_i),
        .paddr_o             (apb_node_i_paddr_o),
        .penable_o           (apb_node_i_penable_o),
        .psel_o              (apb_node_i_psel_o),
        .pwdata_o            (apb_node_i_pwdata_o),
        .pwrite_o            (apb_node_i_pwrite_o),
        // These ports are not in any interface
        .END_ADDR_i          (s_end_addr),
        .START_ADDR_i        (s_start_addr));


endmodule
