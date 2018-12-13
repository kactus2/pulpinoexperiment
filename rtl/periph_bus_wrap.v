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
    input                [31:0]         apb_slave_paddr,
    input                               apb_slave_penable,
    input                               apb_slave_psel,
    input                [31:0]         apb_slave_pwdata,
    input                               apb_slave_pwrite,
    output               [31:0]         apb_slave_prdata,
    output                              apb_slave_pready,
    output                              apb_slave_pslverr,

    // Interface: debug_master
    input  logic         [31:0]         debug_master_prdata,
    input  logic                        debug_master_pready,
    input  logic                        debug_master_pslverr,
    output logic         [31:0]         debug_master_paddr,
    output logic                        debug_master_penable,
    output logic                        debug_master_psel,
    output logic         [31:0]         debug_master_pwdata,
    output logic                        debug_master_pwrite,

    // Interface: event_unit_master
    input  logic         [31:0]         PRDATA_1,
    input  logic                        PREADY_1,
    input  logic                        PSLVERR_1,
    output logic         [11:0]         PADDR_1,
    output logic                        PENABLE_1,
    output logic                        PSEL_1,
    output logic         [31:0]         PWDATA_1,
    output logic                        PWRITE_1,

    // Interface: fll_master
    input  logic         [31:0]         PRDATA_2,
    input  logic                        PREADY_2,
    input  logic                        PSLVERR_2,
    output logic         [11:0]         PADDR_2,
    output logic                        PENABLE_2,
    output logic                        PSEL_2,
    output logic         [31:0]         PWDATA_2,
    output logic                        PWRITE_2,

    // Interface: gpio_master
    input  logic         [31:0]         PRDATA_3,
    input  logic                        PREADY_3,
    input  logic                        PSLVERR_3,
    output logic         [11:0]         PADDR_3,
    output logic                        PENABLE_3,
    output logic                        PSEL_3,
    output logic         [31:0]         PWDATA_3,
    output logic                        PWRITE_3,

    // Interface: i2c_master
    input  logic         [31:0]         i2c_master_prdata,
    input  logic                        i2c_master_pready,
    input  logic                        i2c_master_pslverr,
    output logic         [11:0]         i2c_master_paddr,
    output logic                        i2c_master_penable,
    output logic                        i2c_master_psel,
    output logic         [31:0]         i2c_master_pwdata,
    output logic                        i2c_master_pwrite,

    // Interface: soc_ctrl_master
    input  logic         [31:0]         PRDATA_5,
    input  logic                        PREADY_5,
    input  logic                        PSLVERR_5,
    output logic         [11:0]         PADDR_5,
    output logic                        PENABLE_5,
    output logic                        PSEL_5,
    output logic         [31:0]         PWDATA_5,
    output logic                        PWRITE_5,

    // Interface: spi_master
    input  logic         [31:0]         PRDATA_8,
    input  logic                        PREADY_8,
    input  logic                        PSLVERR_8,
    output logic         [11:0]         PADDR_8,
    output logic                        PENABLE_8,
    output logic                        PSEL_8,
    output logic         [31:0]         PWDATA_8,
    output logic                        PWRITE_8,

    // Interface: timer_master
    input  logic         [31:0]         PRDATA_6,
    input  logic                        PREADY_6,
    input  logic                        PSLVERR_6,
    output logic         [11:0]         PADDR_6,
    output logic                        PENABLE_6,
    output logic                        PSEL_6,
    output logic         [31:0]         PWDATA_6,
    output logic                        PWRITE_6,

    // Interface: uart_master
    input  logic         [31:0]         PRDATA_7,
    input  logic                        PREADY_7,
    input  logic                        PSLVERR_7,
    output logic         [11:0]         PADDR_7,
    output logic                        PENABLE_7,
    output logic                        PSEL_7,
    output logic         [31:0]         PWDATA_7,
    output logic                        PWRITE_7,

    // These ports are not in any interface
    input                               clk_i,
    input                               rst_ni
);

    // apb_node_wrap_i_s_slave_to_apb_slave wires:
    wire [31:0] apb_node_wrap_i_s_slave_to_apb_slave_PADDR;
    wire       apb_node_wrap_i_s_slave_to_apb_slave_PENABLE;
    wire [31:0] apb_node_wrap_i_s_slave_to_apb_slave_PRDATA;
    wire       apb_node_wrap_i_s_slave_to_apb_slave_PREADY;
    wire       apb_node_wrap_i_s_slave_to_apb_slave_PSELx;
    wire       apb_node_wrap_i_s_slave_to_apb_slave_PSLVERR;
    wire [31:0] apb_node_wrap_i_s_slave_to_apb_slave_PWDATA;
    wire       apb_node_wrap_i_s_slave_to_apb_slave_PWRITE;
    // apb_node_wrap_i_apb_master_0_to_uart_master wires:
    wire [11:0] apb_node_wrap_i_apb_master_0_to_uart_master_PADDR;
    wire       apb_node_wrap_i_apb_master_0_to_uart_master_PENABLE;
    wire [31:0] apb_node_wrap_i_apb_master_0_to_uart_master_PRDATA;
    wire       apb_node_wrap_i_apb_master_0_to_uart_master_PREADY;
    wire       apb_node_wrap_i_apb_master_0_to_uart_master_PSELx;
    wire       apb_node_wrap_i_apb_master_0_to_uart_master_PSLVERR;
    wire [31:0] apb_node_wrap_i_apb_master_0_to_uart_master_PWDATA;
    wire       apb_node_wrap_i_apb_master_0_to_uart_master_PWRITE;
    // apb_node_wrap_i_apb_master_1_to_gpio_master wires:
    wire [11:0] apb_node_wrap_i_apb_master_1_to_gpio_master_PADDR;
    wire       apb_node_wrap_i_apb_master_1_to_gpio_master_PENABLE;
    wire [31:0] apb_node_wrap_i_apb_master_1_to_gpio_master_PRDATA;
    wire       apb_node_wrap_i_apb_master_1_to_gpio_master_PREADY;
    wire       apb_node_wrap_i_apb_master_1_to_gpio_master_PSELx;
    wire       apb_node_wrap_i_apb_master_1_to_gpio_master_PSLVERR;
    wire [31:0] apb_node_wrap_i_apb_master_1_to_gpio_master_PWDATA;
    wire       apb_node_wrap_i_apb_master_1_to_gpio_master_PWRITE;
    // apb_node_wrap_i_apb_master_2_to_spi_master wires:
    wire [11:0] apb_node_wrap_i_apb_master_2_to_spi_master_PADDR;
    wire       apb_node_wrap_i_apb_master_2_to_spi_master_PENABLE;
    wire [31:0] apb_node_wrap_i_apb_master_2_to_spi_master_PRDATA;
    wire       apb_node_wrap_i_apb_master_2_to_spi_master_PREADY;
    wire       apb_node_wrap_i_apb_master_2_to_spi_master_PSELx;
    wire       apb_node_wrap_i_apb_master_2_to_spi_master_PSLVERR;
    wire [31:0] apb_node_wrap_i_apb_master_2_to_spi_master_PWDATA;
    wire       apb_node_wrap_i_apb_master_2_to_spi_master_PWRITE;
    // apb_node_wrap_i_apb_master_3_to_timer_master wires:
    wire [11:0] apb_node_wrap_i_apb_master_3_to_timer_master_PADDR;
    wire       apb_node_wrap_i_apb_master_3_to_timer_master_PENABLE;
    wire [31:0] apb_node_wrap_i_apb_master_3_to_timer_master_PRDATA;
    wire       apb_node_wrap_i_apb_master_3_to_timer_master_PREADY;
    wire       apb_node_wrap_i_apb_master_3_to_timer_master_PSELx;
    wire       apb_node_wrap_i_apb_master_3_to_timer_master_PSLVERR;
    wire [31:0] apb_node_wrap_i_apb_master_3_to_timer_master_PWDATA;
    wire       apb_node_wrap_i_apb_master_3_to_timer_master_PWRITE;
    // apb_node_wrap_i_apb_master_4_to_event_unit_master wires:
    wire [11:0] apb_node_wrap_i_apb_master_4_to_event_unit_master_PADDR;
    wire       apb_node_wrap_i_apb_master_4_to_event_unit_master_PENABLE;
    wire [31:0] apb_node_wrap_i_apb_master_4_to_event_unit_master_PRDATA;
    wire       apb_node_wrap_i_apb_master_4_to_event_unit_master_PREADY;
    wire       apb_node_wrap_i_apb_master_4_to_event_unit_master_PSELx;
    wire       apb_node_wrap_i_apb_master_4_to_event_unit_master_PSLVERR;
    wire [31:0] apb_node_wrap_i_apb_master_4_to_event_unit_master_PWDATA;
    wire       apb_node_wrap_i_apb_master_4_to_event_unit_master_PWRITE;
    // apb_node_wrap_i_apb_master_5_to_i2c_master wires:
    wire [11:0] apb_node_wrap_i_apb_master_5_to_i2c_master_PADDR;
    wire       apb_node_wrap_i_apb_master_5_to_i2c_master_PENABLE;
    wire [31:0] apb_node_wrap_i_apb_master_5_to_i2c_master_PRDATA;
    wire       apb_node_wrap_i_apb_master_5_to_i2c_master_PREADY;
    wire       apb_node_wrap_i_apb_master_5_to_i2c_master_PSELx;
    wire       apb_node_wrap_i_apb_master_5_to_i2c_master_PSLVERR;
    wire [31:0] apb_node_wrap_i_apb_master_5_to_i2c_master_PWDATA;
    wire       apb_node_wrap_i_apb_master_5_to_i2c_master_PWRITE;
    // apb_node_wrap_i_apb_master_6_to_fll_master wires:
    wire [11:0] apb_node_wrap_i_apb_master_6_to_fll_master_PADDR;
    wire       apb_node_wrap_i_apb_master_6_to_fll_master_PENABLE;
    wire [31:0] apb_node_wrap_i_apb_master_6_to_fll_master_PRDATA;
    wire       apb_node_wrap_i_apb_master_6_to_fll_master_PREADY;
    wire       apb_node_wrap_i_apb_master_6_to_fll_master_PSELx;
    wire       apb_node_wrap_i_apb_master_6_to_fll_master_PSLVERR;
    wire [31:0] apb_node_wrap_i_apb_master_6_to_fll_master_PWDATA;
    wire       apb_node_wrap_i_apb_master_6_to_fll_master_PWRITE;
    // apb_node_wrap_i_apb_master_7_to_soc_ctrl_master wires:
    wire [11:0] apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PADDR;
    wire       apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PENABLE;
    wire [31:0] apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PRDATA;
    wire       apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PREADY;
    wire       apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PSELx;
    wire       apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PSLVERR;
    wire [31:0] apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PWDATA;
    wire       apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PWRITE;
    // apb_node_wrap_i_apb_master_8_to_debug_master wires:
    wire [31:0] apb_node_wrap_i_apb_master_8_to_debug_master_PADDR;
    wire       apb_node_wrap_i_apb_master_8_to_debug_master_PENABLE;
    wire [31:0] apb_node_wrap_i_apb_master_8_to_debug_master_PRDATA;
    wire       apb_node_wrap_i_apb_master_8_to_debug_master_PREADY;
    wire       apb_node_wrap_i_apb_master_8_to_debug_master_PSELx;
    wire       apb_node_wrap_i_apb_master_8_to_debug_master_PSLVERR;
    wire [31:0] apb_node_wrap_i_apb_master_8_to_debug_master_PWDATA;
    wire       apb_node_wrap_i_apb_master_8_to_debug_master_PWRITE;

    // Ad-hoc wires:
    wire       apb_node_wrap_i_clk_i_to_clk_i;
    wire       apb_node_wrap_i_rst_ni_to_rst_ni;

    // apb_node_wrap_i port wires:
    wire [11:0] apb_node_wrap_i_apb_master_0_paddr;
    wire       apb_node_wrap_i_apb_master_0_penable;
    wire [31:0] apb_node_wrap_i_apb_master_0_prdata;
    wire       apb_node_wrap_i_apb_master_0_pready;
    wire       apb_node_wrap_i_apb_master_0_psel;
    wire       apb_node_wrap_i_apb_master_0_pslverr;
    wire [31:0] apb_node_wrap_i_apb_master_0_pwdata;
    wire       apb_node_wrap_i_apb_master_0_pwrite;
    wire [11:0] apb_node_wrap_i_apb_master_1_paddr;
    wire       apb_node_wrap_i_apb_master_1_penable;
    wire [31:0] apb_node_wrap_i_apb_master_1_prdata;
    wire       apb_node_wrap_i_apb_master_1_pready;
    wire       apb_node_wrap_i_apb_master_1_psel;
    wire       apb_node_wrap_i_apb_master_1_pslverr;
    wire [31:0] apb_node_wrap_i_apb_master_1_pwdata;
    wire       apb_node_wrap_i_apb_master_1_pwrite;
    wire [11:0] apb_node_wrap_i_apb_master_2_paddr;
    wire       apb_node_wrap_i_apb_master_2_penable;
    wire [31:0] apb_node_wrap_i_apb_master_2_prdata;
    wire       apb_node_wrap_i_apb_master_2_pready;
    wire       apb_node_wrap_i_apb_master_2_psel;
    wire       apb_node_wrap_i_apb_master_2_pslverr;
    wire [31:0] apb_node_wrap_i_apb_master_2_pwdata;
    wire       apb_node_wrap_i_apb_master_2_pwrite;
    wire [11:0] apb_node_wrap_i_apb_master_3_paddr;
    wire       apb_node_wrap_i_apb_master_3_penable;
    wire [31:0] apb_node_wrap_i_apb_master_3_prdata;
    wire       apb_node_wrap_i_apb_master_3_pready;
    wire       apb_node_wrap_i_apb_master_3_psel;
    wire       apb_node_wrap_i_apb_master_3_pslverr;
    wire [31:0] apb_node_wrap_i_apb_master_3_pwdata;
    wire       apb_node_wrap_i_apb_master_3_pwrite;
    wire [11:0] apb_node_wrap_i_apb_master_4_paddr;
    wire       apb_node_wrap_i_apb_master_4_penable;
    wire [31:0] apb_node_wrap_i_apb_master_4_prdata;
    wire       apb_node_wrap_i_apb_master_4_pready;
    wire       apb_node_wrap_i_apb_master_4_psel;
    wire       apb_node_wrap_i_apb_master_4_pslverr;
    wire [31:0] apb_node_wrap_i_apb_master_4_pwdata;
    wire       apb_node_wrap_i_apb_master_4_pwrite;
    wire [11:0] apb_node_wrap_i_apb_master_5_paddr;
    wire       apb_node_wrap_i_apb_master_5_penable;
    wire [31:0] apb_node_wrap_i_apb_master_5_prdata;
    wire       apb_node_wrap_i_apb_master_5_pready;
    wire       apb_node_wrap_i_apb_master_5_psel;
    wire       apb_node_wrap_i_apb_master_5_pslverr;
    wire [31:0] apb_node_wrap_i_apb_master_5_pwdata;
    wire       apb_node_wrap_i_apb_master_5_pwrite;
    wire [11:0] apb_node_wrap_i_apb_master_6_paddr;
    wire       apb_node_wrap_i_apb_master_6_penable;
    wire [31:0] apb_node_wrap_i_apb_master_6_prdata;
    wire       apb_node_wrap_i_apb_master_6_pready;
    wire       apb_node_wrap_i_apb_master_6_psel;
    wire       apb_node_wrap_i_apb_master_6_pslverr;
    wire [31:0] apb_node_wrap_i_apb_master_6_pwdata;
    wire       apb_node_wrap_i_apb_master_6_pwrite;
    wire [11:0] apb_node_wrap_i_apb_master_7_paddr;
    wire       apb_node_wrap_i_apb_master_7_penable;
    wire [31:0] apb_node_wrap_i_apb_master_7_prdata;
    wire       apb_node_wrap_i_apb_master_7_pready;
    wire       apb_node_wrap_i_apb_master_7_psel;
    wire       apb_node_wrap_i_apb_master_7_pslverr;
    wire [31:0] apb_node_wrap_i_apb_master_7_pwdata;
    wire       apb_node_wrap_i_apb_master_7_pwrite;
    wire [31:0] apb_node_wrap_i_apb_master_8_paddr;
    wire       apb_node_wrap_i_apb_master_8_penable;
    wire [31:0] apb_node_wrap_i_apb_master_8_prdata;
    wire       apb_node_wrap_i_apb_master_8_pready;
    wire       apb_node_wrap_i_apb_master_8_psel;
    wire       apb_node_wrap_i_apb_master_8_pslverr;
    wire [31:0] apb_node_wrap_i_apb_master_8_pwdata;
    wire       apb_node_wrap_i_apb_master_8_pwrite;
    wire [31:0] apb_node_wrap_i_apb_slave_paddr;
    wire       apb_node_wrap_i_apb_slave_penable;
    wire [31:0] apb_node_wrap_i_apb_slave_prdata;
    wire       apb_node_wrap_i_apb_slave_pready;
    wire       apb_node_wrap_i_apb_slave_psel;
    wire       apb_node_wrap_i_apb_slave_pslverr;
    wire [31:0] apb_node_wrap_i_apb_slave_pwdata;
    wire       apb_node_wrap_i_apb_slave_pwrite;
    wire       apb_node_wrap_i_clk_i;
    wire       apb_node_wrap_i_rst_ni;

    // Assignments for the ports of the encompassing component:
    assign PADDR_1 = apb_node_wrap_i_apb_master_4_to_event_unit_master_PADDR;
    assign PADDR_2 = apb_node_wrap_i_apb_master_6_to_fll_master_PADDR;
    assign PADDR_3 = apb_node_wrap_i_apb_master_1_to_gpio_master_PADDR;
    assign PADDR_5 = apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PADDR;
    assign PADDR_6 = apb_node_wrap_i_apb_master_3_to_timer_master_PADDR;
    assign PADDR_7 = apb_node_wrap_i_apb_master_0_to_uart_master_PADDR;
    assign PADDR_8 = apb_node_wrap_i_apb_master_2_to_spi_master_PADDR;
    assign PENABLE_1 = apb_node_wrap_i_apb_master_4_to_event_unit_master_PENABLE;
    assign PENABLE_2 = apb_node_wrap_i_apb_master_6_to_fll_master_PENABLE;
    assign PENABLE_3 = apb_node_wrap_i_apb_master_1_to_gpio_master_PENABLE;
    assign PENABLE_5 = apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PENABLE;
    assign PENABLE_6 = apb_node_wrap_i_apb_master_3_to_timer_master_PENABLE;
    assign PENABLE_7 = apb_node_wrap_i_apb_master_0_to_uart_master_PENABLE;
    assign PENABLE_8 = apb_node_wrap_i_apb_master_2_to_spi_master_PENABLE;
    assign apb_node_wrap_i_apb_master_4_to_event_unit_master_PRDATA = PRDATA_1;
    assign apb_node_wrap_i_apb_master_6_to_fll_master_PRDATA = PRDATA_2;
    assign apb_node_wrap_i_apb_master_1_to_gpio_master_PRDATA = PRDATA_3;
    assign apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PRDATA = PRDATA_5;
    assign apb_node_wrap_i_apb_master_3_to_timer_master_PRDATA = PRDATA_6;
    assign apb_node_wrap_i_apb_master_0_to_uart_master_PRDATA = PRDATA_7;
    assign apb_node_wrap_i_apb_master_2_to_spi_master_PRDATA = PRDATA_8;
    assign apb_node_wrap_i_apb_master_4_to_event_unit_master_PREADY = PREADY_1;
    assign apb_node_wrap_i_apb_master_6_to_fll_master_PREADY = PREADY_2;
    assign apb_node_wrap_i_apb_master_1_to_gpio_master_PREADY = PREADY_3;
    assign apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PREADY = PREADY_5;
    assign apb_node_wrap_i_apb_master_3_to_timer_master_PREADY = PREADY_6;
    assign apb_node_wrap_i_apb_master_0_to_uart_master_PREADY = PREADY_7;
    assign apb_node_wrap_i_apb_master_2_to_spi_master_PREADY = PREADY_8;
    assign PSEL_1 = apb_node_wrap_i_apb_master_4_to_event_unit_master_PSELx;
    assign PSEL_2 = apb_node_wrap_i_apb_master_6_to_fll_master_PSELx;
    assign PSEL_3 = apb_node_wrap_i_apb_master_1_to_gpio_master_PSELx;
    assign PSEL_5 = apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PSELx;
    assign PSEL_6 = apb_node_wrap_i_apb_master_3_to_timer_master_PSELx;
    assign PSEL_7 = apb_node_wrap_i_apb_master_0_to_uart_master_PSELx;
    assign PSEL_8 = apb_node_wrap_i_apb_master_2_to_spi_master_PSELx;
    assign apb_node_wrap_i_apb_master_4_to_event_unit_master_PSLVERR = PSLVERR_1;
    assign apb_node_wrap_i_apb_master_6_to_fll_master_PSLVERR = PSLVERR_2;
    assign apb_node_wrap_i_apb_master_1_to_gpio_master_PSLVERR = PSLVERR_3;
    assign apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PSLVERR = PSLVERR_5;
    assign apb_node_wrap_i_apb_master_3_to_timer_master_PSLVERR = PSLVERR_6;
    assign apb_node_wrap_i_apb_master_0_to_uart_master_PSLVERR = PSLVERR_7;
    assign apb_node_wrap_i_apb_master_2_to_spi_master_PSLVERR = PSLVERR_8;
    assign PWDATA_1 = apb_node_wrap_i_apb_master_4_to_event_unit_master_PWDATA;
    assign PWDATA_2 = apb_node_wrap_i_apb_master_6_to_fll_master_PWDATA;
    assign PWDATA_3 = apb_node_wrap_i_apb_master_1_to_gpio_master_PWDATA;
    assign PWDATA_5 = apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PWDATA;
    assign PWDATA_6 = apb_node_wrap_i_apb_master_3_to_timer_master_PWDATA;
    assign PWDATA_7 = apb_node_wrap_i_apb_master_0_to_uart_master_PWDATA;
    assign PWDATA_8 = apb_node_wrap_i_apb_master_2_to_spi_master_PWDATA;
    assign PWRITE_1 = apb_node_wrap_i_apb_master_4_to_event_unit_master_PWRITE;
    assign PWRITE_2 = apb_node_wrap_i_apb_master_6_to_fll_master_PWRITE;
    assign PWRITE_3 = apb_node_wrap_i_apb_master_1_to_gpio_master_PWRITE;
    assign PWRITE_5 = apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PWRITE;
    assign PWRITE_6 = apb_node_wrap_i_apb_master_3_to_timer_master_PWRITE;
    assign PWRITE_7 = apb_node_wrap_i_apb_master_0_to_uart_master_PWRITE;
    assign PWRITE_8 = apb_node_wrap_i_apb_master_2_to_spi_master_PWRITE;
    assign apb_node_wrap_i_s_slave_to_apb_slave_PADDR = apb_slave_paddr;
    assign apb_node_wrap_i_s_slave_to_apb_slave_PENABLE = apb_slave_penable;
    assign apb_slave_prdata = apb_node_wrap_i_s_slave_to_apb_slave_PRDATA;
    assign apb_slave_pready = apb_node_wrap_i_s_slave_to_apb_slave_PREADY;
    assign apb_node_wrap_i_s_slave_to_apb_slave_PSELx = apb_slave_psel;
    assign apb_slave_pslverr = apb_node_wrap_i_s_slave_to_apb_slave_PSLVERR;
    assign apb_node_wrap_i_s_slave_to_apb_slave_PWDATA = apb_slave_pwdata;
    assign apb_node_wrap_i_s_slave_to_apb_slave_PWRITE = apb_slave_pwrite;
    assign apb_node_wrap_i_clk_i_to_clk_i = clk_i;
    assign debug_master_paddr = apb_node_wrap_i_apb_master_8_to_debug_master_PADDR;
    assign debug_master_penable = apb_node_wrap_i_apb_master_8_to_debug_master_PENABLE;
    assign apb_node_wrap_i_apb_master_8_to_debug_master_PRDATA = debug_master_prdata;
    assign apb_node_wrap_i_apb_master_8_to_debug_master_PREADY = debug_master_pready;
    assign debug_master_psel = apb_node_wrap_i_apb_master_8_to_debug_master_PSELx;
    assign apb_node_wrap_i_apb_master_8_to_debug_master_PSLVERR = debug_master_pslverr;
    assign debug_master_pwdata = apb_node_wrap_i_apb_master_8_to_debug_master_PWDATA;
    assign debug_master_pwrite = apb_node_wrap_i_apb_master_8_to_debug_master_PWRITE;
    assign i2c_master_paddr = apb_node_wrap_i_apb_master_5_to_i2c_master_PADDR;
    assign i2c_master_penable = apb_node_wrap_i_apb_master_5_to_i2c_master_PENABLE;
    assign apb_node_wrap_i_apb_master_5_to_i2c_master_PRDATA = i2c_master_prdata;
    assign apb_node_wrap_i_apb_master_5_to_i2c_master_PREADY = i2c_master_pready;
    assign i2c_master_psel = apb_node_wrap_i_apb_master_5_to_i2c_master_PSELx;
    assign apb_node_wrap_i_apb_master_5_to_i2c_master_PSLVERR = i2c_master_pslverr;
    assign i2c_master_pwdata = apb_node_wrap_i_apb_master_5_to_i2c_master_PWDATA;
    assign i2c_master_pwrite = apb_node_wrap_i_apb_master_5_to_i2c_master_PWRITE;
    assign apb_node_wrap_i_rst_ni_to_rst_ni = rst_ni;

    // apb_node_wrap_i assignments:
    assign apb_node_wrap_i_apb_master_0_to_uart_master_PADDR = apb_node_wrap_i_apb_master_0_paddr;
    assign apb_node_wrap_i_apb_master_0_to_uart_master_PENABLE = apb_node_wrap_i_apb_master_0_penable;
    assign apb_node_wrap_i_apb_master_0_prdata = apb_node_wrap_i_apb_master_0_to_uart_master_PRDATA;
    assign apb_node_wrap_i_apb_master_0_pready = apb_node_wrap_i_apb_master_0_to_uart_master_PREADY;
    assign apb_node_wrap_i_apb_master_0_to_uart_master_PSELx = apb_node_wrap_i_apb_master_0_psel;
    assign apb_node_wrap_i_apb_master_0_pslverr = apb_node_wrap_i_apb_master_0_to_uart_master_PSLVERR;
    assign apb_node_wrap_i_apb_master_0_to_uart_master_PWDATA = apb_node_wrap_i_apb_master_0_pwdata;
    assign apb_node_wrap_i_apb_master_0_to_uart_master_PWRITE = apb_node_wrap_i_apb_master_0_pwrite;
    assign apb_node_wrap_i_apb_master_1_to_gpio_master_PADDR = apb_node_wrap_i_apb_master_1_paddr;
    assign apb_node_wrap_i_apb_master_1_to_gpio_master_PENABLE = apb_node_wrap_i_apb_master_1_penable;
    assign apb_node_wrap_i_apb_master_1_prdata = apb_node_wrap_i_apb_master_1_to_gpio_master_PRDATA;
    assign apb_node_wrap_i_apb_master_1_pready = apb_node_wrap_i_apb_master_1_to_gpio_master_PREADY;
    assign apb_node_wrap_i_apb_master_1_to_gpio_master_PSELx = apb_node_wrap_i_apb_master_1_psel;
    assign apb_node_wrap_i_apb_master_1_pslverr = apb_node_wrap_i_apb_master_1_to_gpio_master_PSLVERR;
    assign apb_node_wrap_i_apb_master_1_to_gpio_master_PWDATA = apb_node_wrap_i_apb_master_1_pwdata;
    assign apb_node_wrap_i_apb_master_1_to_gpio_master_PWRITE = apb_node_wrap_i_apb_master_1_pwrite;
    assign apb_node_wrap_i_apb_master_2_to_spi_master_PADDR = apb_node_wrap_i_apb_master_2_paddr;
    assign apb_node_wrap_i_apb_master_2_to_spi_master_PENABLE = apb_node_wrap_i_apb_master_2_penable;
    assign apb_node_wrap_i_apb_master_2_prdata = apb_node_wrap_i_apb_master_2_to_spi_master_PRDATA;
    assign apb_node_wrap_i_apb_master_2_pready = apb_node_wrap_i_apb_master_2_to_spi_master_PREADY;
    assign apb_node_wrap_i_apb_master_2_to_spi_master_PSELx = apb_node_wrap_i_apb_master_2_psel;
    assign apb_node_wrap_i_apb_master_2_pslverr = apb_node_wrap_i_apb_master_2_to_spi_master_PSLVERR;
    assign apb_node_wrap_i_apb_master_2_to_spi_master_PWDATA = apb_node_wrap_i_apb_master_2_pwdata;
    assign apb_node_wrap_i_apb_master_2_to_spi_master_PWRITE = apb_node_wrap_i_apb_master_2_pwrite;
    assign apb_node_wrap_i_apb_master_3_to_timer_master_PADDR = apb_node_wrap_i_apb_master_3_paddr;
    assign apb_node_wrap_i_apb_master_3_to_timer_master_PENABLE = apb_node_wrap_i_apb_master_3_penable;
    assign apb_node_wrap_i_apb_master_3_prdata = apb_node_wrap_i_apb_master_3_to_timer_master_PRDATA;
    assign apb_node_wrap_i_apb_master_3_pready = apb_node_wrap_i_apb_master_3_to_timer_master_PREADY;
    assign apb_node_wrap_i_apb_master_3_to_timer_master_PSELx = apb_node_wrap_i_apb_master_3_psel;
    assign apb_node_wrap_i_apb_master_3_pslverr = apb_node_wrap_i_apb_master_3_to_timer_master_PSLVERR;
    assign apb_node_wrap_i_apb_master_3_to_timer_master_PWDATA = apb_node_wrap_i_apb_master_3_pwdata;
    assign apb_node_wrap_i_apb_master_3_to_timer_master_PWRITE = apb_node_wrap_i_apb_master_3_pwrite;
    assign apb_node_wrap_i_apb_master_4_to_event_unit_master_PADDR = apb_node_wrap_i_apb_master_4_paddr;
    assign apb_node_wrap_i_apb_master_4_to_event_unit_master_PENABLE = apb_node_wrap_i_apb_master_4_penable;
    assign apb_node_wrap_i_apb_master_4_prdata = apb_node_wrap_i_apb_master_4_to_event_unit_master_PRDATA;
    assign apb_node_wrap_i_apb_master_4_pready = apb_node_wrap_i_apb_master_4_to_event_unit_master_PREADY;
    assign apb_node_wrap_i_apb_master_4_to_event_unit_master_PSELx = apb_node_wrap_i_apb_master_4_psel;
    assign apb_node_wrap_i_apb_master_4_pslverr = apb_node_wrap_i_apb_master_4_to_event_unit_master_PSLVERR;
    assign apb_node_wrap_i_apb_master_4_to_event_unit_master_PWDATA = apb_node_wrap_i_apb_master_4_pwdata;
    assign apb_node_wrap_i_apb_master_4_to_event_unit_master_PWRITE = apb_node_wrap_i_apb_master_4_pwrite;
    assign apb_node_wrap_i_apb_master_5_to_i2c_master_PADDR = apb_node_wrap_i_apb_master_5_paddr;
    assign apb_node_wrap_i_apb_master_5_to_i2c_master_PENABLE = apb_node_wrap_i_apb_master_5_penable;
    assign apb_node_wrap_i_apb_master_5_prdata = apb_node_wrap_i_apb_master_5_to_i2c_master_PRDATA;
    assign apb_node_wrap_i_apb_master_5_pready = apb_node_wrap_i_apb_master_5_to_i2c_master_PREADY;
    assign apb_node_wrap_i_apb_master_5_to_i2c_master_PSELx = apb_node_wrap_i_apb_master_5_psel;
    assign apb_node_wrap_i_apb_master_5_pslverr = apb_node_wrap_i_apb_master_5_to_i2c_master_PSLVERR;
    assign apb_node_wrap_i_apb_master_5_to_i2c_master_PWDATA = apb_node_wrap_i_apb_master_5_pwdata;
    assign apb_node_wrap_i_apb_master_5_to_i2c_master_PWRITE = apb_node_wrap_i_apb_master_5_pwrite;
    assign apb_node_wrap_i_apb_master_6_to_fll_master_PADDR = apb_node_wrap_i_apb_master_6_paddr;
    assign apb_node_wrap_i_apb_master_6_to_fll_master_PENABLE = apb_node_wrap_i_apb_master_6_penable;
    assign apb_node_wrap_i_apb_master_6_prdata = apb_node_wrap_i_apb_master_6_to_fll_master_PRDATA;
    assign apb_node_wrap_i_apb_master_6_pready = apb_node_wrap_i_apb_master_6_to_fll_master_PREADY;
    assign apb_node_wrap_i_apb_master_6_to_fll_master_PSELx = apb_node_wrap_i_apb_master_6_psel;
    assign apb_node_wrap_i_apb_master_6_pslverr = apb_node_wrap_i_apb_master_6_to_fll_master_PSLVERR;
    assign apb_node_wrap_i_apb_master_6_to_fll_master_PWDATA = apb_node_wrap_i_apb_master_6_pwdata;
    assign apb_node_wrap_i_apb_master_6_to_fll_master_PWRITE = apb_node_wrap_i_apb_master_6_pwrite;
    assign apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PADDR = apb_node_wrap_i_apb_master_7_paddr;
    assign apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PENABLE = apb_node_wrap_i_apb_master_7_penable;
    assign apb_node_wrap_i_apb_master_7_prdata = apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PRDATA;
    assign apb_node_wrap_i_apb_master_7_pready = apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PREADY;
    assign apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PSELx = apb_node_wrap_i_apb_master_7_psel;
    assign apb_node_wrap_i_apb_master_7_pslverr = apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PSLVERR;
    assign apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PWDATA = apb_node_wrap_i_apb_master_7_pwdata;
    assign apb_node_wrap_i_apb_master_7_to_soc_ctrl_master_PWRITE = apb_node_wrap_i_apb_master_7_pwrite;
    assign apb_node_wrap_i_apb_master_8_to_debug_master_PADDR = apb_node_wrap_i_apb_master_8_paddr;
    assign apb_node_wrap_i_apb_master_8_to_debug_master_PENABLE = apb_node_wrap_i_apb_master_8_penable;
    assign apb_node_wrap_i_apb_master_8_prdata = apb_node_wrap_i_apb_master_8_to_debug_master_PRDATA;
    assign apb_node_wrap_i_apb_master_8_pready = apb_node_wrap_i_apb_master_8_to_debug_master_PREADY;
    assign apb_node_wrap_i_apb_master_8_to_debug_master_PSELx = apb_node_wrap_i_apb_master_8_psel;
    assign apb_node_wrap_i_apb_master_8_pslverr = apb_node_wrap_i_apb_master_8_to_debug_master_PSLVERR;
    assign apb_node_wrap_i_apb_master_8_to_debug_master_PWDATA = apb_node_wrap_i_apb_master_8_pwdata;
    assign apb_node_wrap_i_apb_master_8_to_debug_master_PWRITE = apb_node_wrap_i_apb_master_8_pwrite;
    assign apb_node_wrap_i_apb_slave_paddr = apb_node_wrap_i_s_slave_to_apb_slave_PADDR;
    assign apb_node_wrap_i_apb_slave_penable = apb_node_wrap_i_s_slave_to_apb_slave_PENABLE;
    assign apb_node_wrap_i_s_slave_to_apb_slave_PRDATA = apb_node_wrap_i_apb_slave_prdata;
    assign apb_node_wrap_i_s_slave_to_apb_slave_PREADY = apb_node_wrap_i_apb_slave_pready;
    assign apb_node_wrap_i_apb_slave_psel = apb_node_wrap_i_s_slave_to_apb_slave_PSELx;
    assign apb_node_wrap_i_s_slave_to_apb_slave_PSLVERR = apb_node_wrap_i_apb_slave_pslverr;
    assign apb_node_wrap_i_apb_slave_pwdata = apb_node_wrap_i_s_slave_to_apb_slave_PWDATA;
    assign apb_node_wrap_i_apb_slave_pwrite = apb_node_wrap_i_s_slave_to_apb_slave_PWRITE;
    assign apb_node_wrap_i_clk_i = apb_node_wrap_i_clk_i_to_clk_i;
    assign apb_node_wrap_i_rst_ni = apb_node_wrap_i_rst_ni_to_rst_ni;

    // IP-XACT VLNV: pulp-platform.org:communication.bus:apb_node_wrap:1.0
    apb_node_wrap_0     apb_node_wrap_i(
        // Interface: apb_master_0
        .apb_master_0_prdata (apb_node_wrap_i_apb_master_0_prdata),
        .apb_master_0_pready (apb_node_wrap_i_apb_master_0_pready),
        .apb_master_0_pslverr(apb_node_wrap_i_apb_master_0_pslverr),
        .apb_master_0_paddr  (apb_node_wrap_i_apb_master_0_paddr),
        .apb_master_0_penable(apb_node_wrap_i_apb_master_0_penable),
        .apb_master_0_psel   (apb_node_wrap_i_apb_master_0_psel),
        .apb_master_0_pwdata (apb_node_wrap_i_apb_master_0_pwdata),
        .apb_master_0_pwrite (apb_node_wrap_i_apb_master_0_pwrite),
        // Interface: apb_master_1
        .apb_master_1_prdata (apb_node_wrap_i_apb_master_1_prdata),
        .apb_master_1_pready (apb_node_wrap_i_apb_master_1_pready),
        .apb_master_1_pslverr(apb_node_wrap_i_apb_master_1_pslverr),
        .apb_master_1_paddr  (apb_node_wrap_i_apb_master_1_paddr),
        .apb_master_1_penable(apb_node_wrap_i_apb_master_1_penable),
        .apb_master_1_psel   (apb_node_wrap_i_apb_master_1_psel),
        .apb_master_1_pwdata (apb_node_wrap_i_apb_master_1_pwdata),
        .apb_master_1_pwrite (apb_node_wrap_i_apb_master_1_pwrite),
        // Interface: apb_master_2
        .apb_master_2_prdata (apb_node_wrap_i_apb_master_2_prdata),
        .apb_master_2_pready (apb_node_wrap_i_apb_master_2_pready),
        .apb_master_2_pslverr(apb_node_wrap_i_apb_master_2_pslverr),
        .apb_master_2_paddr  (apb_node_wrap_i_apb_master_2_paddr),
        .apb_master_2_penable(apb_node_wrap_i_apb_master_2_penable),
        .apb_master_2_psel   (apb_node_wrap_i_apb_master_2_psel),
        .apb_master_2_pwdata (apb_node_wrap_i_apb_master_2_pwdata),
        .apb_master_2_pwrite (apb_node_wrap_i_apb_master_2_pwrite),
        // Interface: apb_master_3
        .apb_master_3_prdata (apb_node_wrap_i_apb_master_3_prdata),
        .apb_master_3_pready (apb_node_wrap_i_apb_master_3_pready),
        .apb_master_3_pslverr(apb_node_wrap_i_apb_master_3_pslverr),
        .apb_master_3_paddr  (apb_node_wrap_i_apb_master_3_paddr),
        .apb_master_3_penable(apb_node_wrap_i_apb_master_3_penable),
        .apb_master_3_psel   (apb_node_wrap_i_apb_master_3_psel),
        .apb_master_3_pwdata (apb_node_wrap_i_apb_master_3_pwdata),
        .apb_master_3_pwrite (apb_node_wrap_i_apb_master_3_pwrite),
        // Interface: apb_master_4
        .apb_master_4_prdata (apb_node_wrap_i_apb_master_4_prdata),
        .apb_master_4_pready (apb_node_wrap_i_apb_master_4_pready),
        .apb_master_4_pslverr(apb_node_wrap_i_apb_master_4_pslverr),
        .apb_master_4_paddr  (apb_node_wrap_i_apb_master_4_paddr),
        .apb_master_4_penable(apb_node_wrap_i_apb_master_4_penable),
        .apb_master_4_psel   (apb_node_wrap_i_apb_master_4_psel),
        .apb_master_4_pwdata (apb_node_wrap_i_apb_master_4_pwdata),
        .apb_master_4_pwrite (apb_node_wrap_i_apb_master_4_pwrite),
        // Interface: apb_master_5
        .apb_master_5_prdata (apb_node_wrap_i_apb_master_5_prdata),
        .apb_master_5_pready (apb_node_wrap_i_apb_master_5_pready),
        .apb_master_5_pslverr(apb_node_wrap_i_apb_master_5_pslverr),
        .apb_master_5_paddr  (apb_node_wrap_i_apb_master_5_paddr),
        .apb_master_5_penable(apb_node_wrap_i_apb_master_5_penable),
        .apb_master_5_psel   (apb_node_wrap_i_apb_master_5_psel),
        .apb_master_5_pwdata (apb_node_wrap_i_apb_master_5_pwdata),
        .apb_master_5_pwrite (apb_node_wrap_i_apb_master_5_pwrite),
        // Interface: apb_master_6
        .apb_master_6_prdata (apb_node_wrap_i_apb_master_6_prdata),
        .apb_master_6_pready (apb_node_wrap_i_apb_master_6_pready),
        .apb_master_6_pslverr(apb_node_wrap_i_apb_master_6_pslverr),
        .apb_master_6_paddr  (apb_node_wrap_i_apb_master_6_paddr),
        .apb_master_6_penable(apb_node_wrap_i_apb_master_6_penable),
        .apb_master_6_psel   (apb_node_wrap_i_apb_master_6_psel),
        .apb_master_6_pwdata (apb_node_wrap_i_apb_master_6_pwdata),
        .apb_master_6_pwrite (apb_node_wrap_i_apb_master_6_pwrite),
        // Interface: apb_master_7
        .apb_master_7_prdata (apb_node_wrap_i_apb_master_7_prdata),
        .apb_master_7_pready (apb_node_wrap_i_apb_master_7_pready),
        .apb_master_7_pslverr(apb_node_wrap_i_apb_master_7_pslverr),
        .apb_master_7_paddr  (apb_node_wrap_i_apb_master_7_paddr),
        .apb_master_7_penable(apb_node_wrap_i_apb_master_7_penable),
        .apb_master_7_psel   (apb_node_wrap_i_apb_master_7_psel),
        .apb_master_7_pwdata (apb_node_wrap_i_apb_master_7_pwdata),
        .apb_master_7_pwrite (apb_node_wrap_i_apb_master_7_pwrite),
        // Interface: apb_master_8
        .apb_master_8_prdata (apb_node_wrap_i_apb_master_8_prdata),
        .apb_master_8_pready (apb_node_wrap_i_apb_master_8_pready),
        .apb_master_8_pslverr(apb_node_wrap_i_apb_master_8_pslverr),
        .apb_master_8_paddr  (apb_node_wrap_i_apb_master_8_paddr),
        .apb_master_8_penable(apb_node_wrap_i_apb_master_8_penable),
        .apb_master_8_psel   (apb_node_wrap_i_apb_master_8_psel),
        .apb_master_8_pwdata (apb_node_wrap_i_apb_master_8_pwdata),
        .apb_master_8_pwrite (apb_node_wrap_i_apb_master_8_pwrite),
        // Interface: s_slave
        .apb_slave_paddr     (apb_node_wrap_i_apb_slave_paddr),
        .apb_slave_penable   (apb_node_wrap_i_apb_slave_penable),
        .apb_slave_psel      (apb_node_wrap_i_apb_slave_psel),
        .apb_slave_pwdata    (apb_node_wrap_i_apb_slave_pwdata),
        .apb_slave_pwrite    (apb_node_wrap_i_apb_slave_pwrite),
        .apb_slave_prdata    (apb_node_wrap_i_apb_slave_prdata),
        .apb_slave_pready    (apb_node_wrap_i_apb_slave_pready),
        .apb_slave_pslverr   (apb_node_wrap_i_apb_slave_pslverr),
        // These ports are not in any interface
        .clk_i               (apb_node_wrap_i_clk_i),
        .rst_ni              (apb_node_wrap_i_rst_ni));


endmodule
