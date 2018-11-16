//-----------------------------------------------------------------------------
// File          : axi_mem_if_SP.v
// Creation date : 12.11.2018
// Creation time : 12:31:03
// Description   : 
// Created by    : epe
// Tool : Kactus2 3.6.91 64-bit
// Plugin : Verilog generator 2.2
// This file was generated based on IP-XACT component pulp-platform.org:communication:axi_mem_if_SP:1.0
// whose XML file is /home/epe/pulpino/ip-xact/pulp-platform.org/communication/axi_mem_if_SP/1.0/axi_mem_if_SP.1.0.xml
//-----------------------------------------------------------------------------

module axi_mem_if_SP #(
    parameter                              AXI4_ADDRESS_WIDTH = 32,
    parameter                              AXI4_ID_WIDTH    = 16,
    parameter                              AXI4_RDATA_WIDTH = 32,
    parameter                              AXI4_USER_WIDTH  = 10,
    parameter                              AXI4_WDATA_WIDTH = 32,
    parameter                              AXI_NUMBYTES     = 4,
    parameter                              BUFF_DEPTH_SLAVE = 4,
    parameter                              MEM_ADDR_WIDTH   = 13
) (
    // Interface: mem
    input  logic   [31:0]               Q_i,
    output logic   [12:0]               A_o,
    output logic   [3:0]                BE_o,
    output logic                        CEN_o,
    output logic   [31:0]               D_o,
    output logic                        WEN_o,

    // Interface: slave
    input  logic   [31:0]               ARADDR_i,
    input  logic   [1:0]                ARBURST_i,
    input  logic   [3:0]                ARCACHE_i,
    input  logic   [15:0]               ARID_i,
    input  logic   [7:0]                ARLEN_i,
    input  logic                        ARLOCK_i,
    input  logic   [2:0]                ARPROT_i,
    input  logic   [3:0]                ARQOS_i,
    input  logic   [3:0]                ARREGION_i,
    input  logic   [2:0]                ARSIZE_i,
    input  logic   [9:0]                ARUSER_i,
    input  logic                        ARVALID_i,
    input  logic   [31:0]               AWADDR_i,
    input  logic   [1:0]                AWBURST_i,
    input  logic   [3:0]                AWCACHE_i,
    input  logic   [15:0]               AWID_i,
    input  logic   [7:0]                AWLEN_i,
    input  logic                        AWLOCK_i,
    input  logic   [2:0]                AWPROT_i,
    input  logic   [3:0]                AWQOS_i,
    input  logic   [3:0]                AWREGION_i,
    input  logic   [2:0]                AWSIZE_i,
    input  logic   [9:0]                AWUSER_i,
    input  logic                        AWVALID_i,
    input  logic                        BREADY_i,
    input  logic                        RREADY_i,
    input  logic   [7:0]          [3:0] WDATA_i,
    input  logic                        WLAST_i,
    input  logic   [3:0]                WSTRB_i,
    input  logic   [9:0]                WUSER_i,
    input  logic                        WVALID_i,
    output logic                        ARREADY_o,
    output logic                        AWREADY_o,
    output logic   [15:0]               BID_o,
    output logic   [1:0]                BRESP_o,
    output logic   [9:0]                BUSER_o,
    output logic                        BVALID_o,
    output logic   [31:0]               RDATA_o,
    output logic   [15:0]               RID_o,
    output logic                        RLAST_o,
    output logic   [1:0]                RRESP_o,
    output logic   [9:0]                RUSER_o,
    output logic                        RVALID_o,
    output logic                        WREADY_o,

    // These ports are not in any interface
    input  logic                        ACLK,
    input  logic                        ARESETn,
    input  logic                        test_en_i
);

    // WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master wires:
    wire [31:0]  WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_ADDR;
    wire [1:0]  WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_BURST;
    wire [3:0]  WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_CACHE;
    wire [15:0]  WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_ID;
    wire [7:0]  WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_LEN;
    wire        WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_LOCK;
    wire [2:0]  WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_PROT;
    wire [3:0]  WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_QOS;
    wire        WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_READY;
    wire [3:0]  WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_REGION;
    wire [2:0]  WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_SIZE;
    wire [5:0]  WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_USER;
    wire        WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_VALID;
    // Slave_w_buffer_LP_w_master_to_WRITE_CTRL_w wires:
    wire [31:0]  Slave_w_buffer_LP_w_master_to_WRITE_CTRL_w_W_DATA;
    wire        Slave_w_buffer_LP_w_master_to_WRITE_CTRL_w_W_LAST;
    wire        Slave_w_buffer_LP_w_master_to_WRITE_CTRL_w_W_READY;
    wire [3:0]  Slave_w_buffer_LP_w_master_to_WRITE_CTRL_w_W_STRB;
    wire [9:0]  Slave_w_buffer_LP_w_master_to_WRITE_CTRL_w_W_USER;
    wire        Slave_w_buffer_LP_w_master_to_WRITE_CTRL_w_W_VALID;
    // WRITE_CTRL_b_to_Slave_b_buffer_LP_b_slave wires:
    wire [3:0]  WRITE_CTRL_b_to_Slave_b_buffer_LP_b_slave_B_ID;
    wire        WRITE_CTRL_b_to_Slave_b_buffer_LP_b_slave_B_READY;
    wire [1:0]  WRITE_CTRL_b_to_Slave_b_buffer_LP_b_slave_B_RESP;
    wire [5:0]  WRITE_CTRL_b_to_Slave_b_buffer_LP_b_slave_B_USER;
    wire        WRITE_CTRL_b_to_Slave_b_buffer_LP_b_slave_B_VALID;
    // READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master wires:
    wire [31:0]  READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_ADDR;
    wire [1:0]  READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_BURST;
    wire [3:0]  READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_CACHE;
    wire [15:0]  READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_ID;
    wire [7:0]  READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_LEN;
    wire        READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_LOCK;
    wire [2:0]  READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_PROT;
    wire [3:0]  READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_QOS;
    wire        READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_READY;
    wire [3:0]  READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_REGION;
    wire [2:0]  READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_SIZE;
    wire [5:0]  READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_USER;
    wire        READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_VALID;
    // Slave_r_buffer_LP_r_slave_to_READ_CTRL_r wires:
    wire [31:0]  Slave_r_buffer_LP_r_slave_to_READ_CTRL_r_R_DATA;
    wire [3:0]  Slave_r_buffer_LP_r_slave_to_READ_CTRL_r_R_ID;
    wire        Slave_r_buffer_LP_r_slave_to_READ_CTRL_r_R_LAST;
    wire        Slave_r_buffer_LP_r_slave_to_READ_CTRL_r_R_READY;
    wire [1:0]  Slave_r_buffer_LP_r_slave_to_READ_CTRL_r_R_RESP;
    wire [5:0]  Slave_r_buffer_LP_r_slave_to_READ_CTRL_r_R_USER;
    wire        Slave_r_buffer_LP_r_slave_to_READ_CTRL_r_R_VALID;
    // MUX_MEM_mem_to_mem wires:
    wire [12:0]  MUX_MEM_mem_to_mem_ADDR;
    wire [3:0]  MUX_MEM_mem_to_mem_BE;
    wire [31:0]  MUX_MEM_mem_to_mem_RDATA;
    wire        MUX_MEM_mem_to_mem_REQ;
    wire [31:0]  MUX_MEM_mem_to_mem_WDATA;
    wire        MUX_MEM_mem_to_mem_WE;
    // MUX_MEM_read_to_WRITE_CTRL_mem wires:
    wire [12:0]  MUX_MEM_read_to_WRITE_CTRL_mem_ADDR;
    wire [3:0]  MUX_MEM_read_to_WRITE_CTRL_mem_BE;
    wire        MUX_MEM_read_to_WRITE_CTRL_mem_REQ;
    wire [31:0]  MUX_MEM_read_to_WRITE_CTRL_mem_WDATA;
    wire        MUX_MEM_read_to_WRITE_CTRL_mem_WE;
    // READ_CTRL_mem_to_MUX_MEM_write wires:
    wire [12:0]  READ_CTRL_mem_to_MUX_MEM_write_ADDR;
    wire [3:0]  READ_CTRL_mem_to_MUX_MEM_write_BE;
    wire        READ_CTRL_mem_to_MUX_MEM_write_REQ;
    wire [31:0]  READ_CTRL_mem_to_MUX_MEM_write_WDATA;
    wire        READ_CTRL_mem_to_MUX_MEM_write_WE;

    // Ad-hoc wires:
    wire        Slave_aw_buffer_LP_clk_i_to_ACLK;
    wire        Slave_aw_buffer_LP_rst_ni_to_ARESETn;
    wire        Slave_aw_buffer_LP_test_en_i_to_test_en_i;
    wire [31:0]  Slave_aw_buffer_LP_slave_addr_i_to_AWADDR_i;
    wire [1:0]  Slave_aw_buffer_LP_slave_burst_i_to_AWBURST_i;
    wire [3:0]  Slave_aw_buffer_LP_slave_cache_i_to_AWCACHE_i;
    wire [15:0]  Slave_aw_buffer_LP_slave_id_i_to_AWID_i;
    wire [7:0]  Slave_aw_buffer_LP_slave_len_i_to_AWLEN_i;
    wire        Slave_aw_buffer_LP_slave_lock_i_to_AWLOCK_i;
    wire [2:0]  Slave_aw_buffer_LP_slave_prot_i_to_AWPROT_i;
    wire [3:0]  Slave_aw_buffer_LP_slave_qos_i_to_AWQOS_i;
    wire        Slave_aw_buffer_LP_slave_ready_o_to_AWREADY_o;
    wire [3:0]  Slave_aw_buffer_LP_slave_region_i_to_AWREGION_i;
    wire [2:0]  Slave_aw_buffer_LP_slave_size_i_to_AWSIZE_i;
    wire [9:0]  Slave_aw_buffer_LP_slave_user_i_to_AWUSER_i;
    wire        Slave_aw_buffer_LP_slave_valid_i_to_AWVALID_i;
    wire        Slave_w_buffer_LP_clk_i_to_ACLK;
    wire        Slave_w_buffer_LP_rst_ni_to_ARESETn;
    wire        Slave_w_buffer_LP_test_en_i_to_test_en_i;
    wire [31:0]  Slave_w_buffer_LP_slave_data_i_to_WDATA_i;
    wire        Slave_w_buffer_LP_slave_ready_o_to_WREADY_o;
    wire        Slave_w_buffer_LP_slave_last_i_to_WLAST_i;
    wire [3:0]  Slave_w_buffer_LP_slave_strb_i_to_WSTRB_i;
    wire [9:0]  Slave_w_buffer_LP_slave_user_i_to_WUSER_i;
    wire        Slave_w_buffer_LP_slave_valid_i_to_WVALID_i;
    wire        Slave_b_buffer_LP_clk_i_to_ACLK;
    wire        Slave_b_buffer_LP_rst_ni_to_ARESETn;
    wire        Slave_b_buffer_LP_test_en_i_to_test_en_i;
    wire [15:0]  Slave_b_buffer_LP_master_id_o_to_BID_o;
    wire        Slave_b_buffer_LP_master_ready_i_to_BREADY_i;
    wire [1:0]  Slave_b_buffer_LP_master_resp_o_to_BRESP_o;
    wire [9:0]  Slave_b_buffer_LP_master_user_o_to_BUSER_o;
    wire        Slave_b_buffer_LP_master_valid_o_to_BVALID_o;
    wire        WRITE_CTRL_clk_to_ACLK;
    wire        WRITE_CTRL_rst_n_to_ARESETn;
    wire        Slave_ar_buffer_LP_clk_i_to_ACLK;
    wire        Slave_ar_buffer_LP_rst_ni_to_ARESETn;
    wire        Slave_ar_buffer_LP_test_en_i_to_test_en_i;
    wire [31:0]  Slave_ar_buffer_LP_slave_addr_i_to_ARADDR_i;
    wire [1:0]  Slave_ar_buffer_LP_slave_burst_i_to_ARBURST_i;
    wire [3:0]  Slave_ar_buffer_LP_slave_cache_i_to_ARCACHE_i;
    wire [15:0]  Slave_ar_buffer_LP_slave_id_i_to_ARID_i;
    wire [7:0]  Slave_ar_buffer_LP_slave_len_i_to_ARLEN_i;
    wire        Slave_ar_buffer_LP_slave_lock_i_to_ARLOCK_i;
    wire [2:0]  Slave_ar_buffer_LP_slave_prot_i_to_ARPROT_i;
    wire [3:0]  Slave_ar_buffer_LP_slave_qos_i_to_ARQOS_i;
    wire        Slave_ar_buffer_LP_slave_ready_o_to_ARREADY_o;
    wire [3:0]  Slave_ar_buffer_LP_slave_region_i_to_ARREGION_i;
    wire [2:0]  Slave_ar_buffer_LP_slave_size_i_to_ARSIZE_i;
    wire [9:0]  Slave_ar_buffer_LP_slave_user_i_to_ARUSER_i;
    wire        Slave_ar_buffer_LP_slave_valid_i_to_ARVALID_i;
    wire        READ_CTRL_clk_to_ACLK;
    wire        READ_CTRL_rst_n_to_ARESETn;
    wire        Slave_r_buffer_LP_clk_i_to_ACLK;
    wire        Slave_r_buffer_LP_rst_ni_to_ARESETn;
    wire        Slave_r_buffer_LP_test_en_i_to_test_en_i;
    wire [31:0]  Slave_r_buffer_LP_master_data_o_to_RDATA_o;
    wire [15:0]  Slave_r_buffer_LP_master_id_o_to_RID_o;
    wire        Slave_r_buffer_LP_master_last_o_to_RLAST_o;
    wire        Slave_r_buffer_LP_master_ready_i_to_RREADY_i;
    wire [1:0]  Slave_r_buffer_LP_master_resp_o_to_RRESP_o;
    wire [9:0]  Slave_r_buffer_LP_master_user_o_to_RUSER_o;
    wire        Slave_r_buffer_LP_master_valid_o_to_RVALID_o;
    wire        MUX_MEM_ACLK_to_ACLK;
    wire        MUX_MEM_ARESETn_to_ARESETn;
    wire [31:0]  READ_CTRL_MEM_Q_i_to_Q_i;
    wire        MUX_MEM_grant_R_to_READ_CTRL_grant_i;
    wire        MUX_MEM_valid_R_to_READ_CTRL_valid_o;
    wire        WRITE_CTRL_valid_o_to_MUX_MEM_valid_W;
    wire        WRITE_CTRL_grant_i_to_MUX_MEM_grant_W;

    // MUX_MEM port wires:
    wire        MUX_MEM_ACLK;
    wire        MUX_MEM_ARESETn;
    wire        MUX_MEM_A_o;
    wire [3:0]  MUX_MEM_BE_o;
    wire        MUX_MEM_CEN_o;
    wire        MUX_MEM_D_o;
    wire [12:0]  MUX_MEM_R_addr;
    wire [3:0]  MUX_MEM_R_be;
    wire        MUX_MEM_R_cen;
    wire [31:0]  MUX_MEM_R_wdata;
    wire        MUX_MEM_WEN_o;
    wire [12:0]  MUX_MEM_W_addr;
    wire [3:0]  MUX_MEM_W_be;
    wire        MUX_MEM_W_cen;
    wire [31:0]  MUX_MEM_W_wdata;
    wire        MUX_MEM_grant_R;
    wire        MUX_MEM_grant_W;
    wire        MUX_MEM_valid_R;
    wire        MUX_MEM_valid_W;
    // READ_CTRL port wires:
    wire [31:0]  READ_CTRL_ARADDR_i;
    wire [1:0]  READ_CTRL_ARBURST_i;
    wire [3:0]  READ_CTRL_ARCACHE_i;
    wire [15:0]  READ_CTRL_ARID_i;
    wire [7:0]  READ_CTRL_ARLEN_i;
    wire        READ_CTRL_ARLOCK_i;
    wire [2:0]  READ_CTRL_ARPROT_i;
    wire [3:0]  READ_CTRL_ARQOS_i;
    wire        READ_CTRL_ARREADY_o;
    wire [3:0]  READ_CTRL_ARREGION_i;
    wire [2:0]  READ_CTRL_ARSIZE_i;
    wire [9:0]  READ_CTRL_ARUSER_i;
    wire        READ_CTRL_ARVALID_i;
    wire [12:0]  READ_CTRL_MEM_A_o;
    wire [3:0]  READ_CTRL_MEM_BE_o;
    wire        READ_CTRL_MEM_CEN_o;
    wire [31:0]  READ_CTRL_MEM_D_o;
    wire [31:0]  READ_CTRL_MEM_Q_i;
    wire        READ_CTRL_MEM_WEN_o;
    wire [31:0]  READ_CTRL_RDATA_o;
    wire [15:0]  READ_CTRL_RID_o;
    wire        READ_CTRL_RLAST_o;
    wire        READ_CTRL_RREADY_i;
    wire [1:0]  READ_CTRL_RRESP_o;
    wire [9:0]  READ_CTRL_RUSER_o;
    wire        READ_CTRL_RVALID_o;
    wire        READ_CTRL_clk;
    wire        READ_CTRL_grant_i;
    wire        READ_CTRL_rst_n;
    wire        READ_CTRL_valid_o;
    // Slave_ar_buffer_LP port wires:
    wire        Slave_ar_buffer_LP_clk_i;
    wire [31:0]  Slave_ar_buffer_LP_master_addr_o;
    wire [1:0]  Slave_ar_buffer_LP_master_burst_o;
    wire [3:0]  Slave_ar_buffer_LP_master_cache_o;
    wire [15:0]  Slave_ar_buffer_LP_master_id_o;
    wire [7:0]  Slave_ar_buffer_LP_master_len_o;
    wire        Slave_ar_buffer_LP_master_lock_o;
    wire [2:0]  Slave_ar_buffer_LP_master_prot_o;
    wire [3:0]  Slave_ar_buffer_LP_master_qos_o;
    wire        Slave_ar_buffer_LP_master_ready_i;
    wire [3:0]  Slave_ar_buffer_LP_master_region_o;
    wire [2:0]  Slave_ar_buffer_LP_master_size_o;
    wire [9:0]  Slave_ar_buffer_LP_master_user_o;
    wire        Slave_ar_buffer_LP_master_valid_o;
    wire        Slave_ar_buffer_LP_rst_ni;
    wire [31:0]  Slave_ar_buffer_LP_slave_addr_i;
    wire [1:0]  Slave_ar_buffer_LP_slave_burst_i;
    wire [3:0]  Slave_ar_buffer_LP_slave_cache_i;
    wire [15:0]  Slave_ar_buffer_LP_slave_id_i;
    wire [7:0]  Slave_ar_buffer_LP_slave_len_i;
    wire        Slave_ar_buffer_LP_slave_lock_i;
    wire [2:0]  Slave_ar_buffer_LP_slave_prot_i;
    wire [3:0]  Slave_ar_buffer_LP_slave_qos_i;
    wire        Slave_ar_buffer_LP_slave_ready_o;
    wire [3:0]  Slave_ar_buffer_LP_slave_region_i;
    wire [2:0]  Slave_ar_buffer_LP_slave_size_i;
    wire [9:0]  Slave_ar_buffer_LP_slave_user_i;
    wire        Slave_ar_buffer_LP_slave_valid_i;
    wire        Slave_ar_buffer_LP_test_en_i;
    // Slave_aw_buffer_LP port wires:
    wire        Slave_aw_buffer_LP_clk_i;
    wire [31:0]  Slave_aw_buffer_LP_master_addr_o;
    wire [1:0]  Slave_aw_buffer_LP_master_burst_o;
    wire [3:0]  Slave_aw_buffer_LP_master_cache_o;
    wire [15:0]  Slave_aw_buffer_LP_master_id_o;
    wire [7:0]  Slave_aw_buffer_LP_master_len_o;
    wire        Slave_aw_buffer_LP_master_lock_o;
    wire [2:0]  Slave_aw_buffer_LP_master_prot_o;
    wire [3:0]  Slave_aw_buffer_LP_master_qos_o;
    wire        Slave_aw_buffer_LP_master_ready_i;
    wire [3:0]  Slave_aw_buffer_LP_master_region_o;
    wire [2:0]  Slave_aw_buffer_LP_master_size_o;
    wire [9:0]  Slave_aw_buffer_LP_master_user_o;
    wire        Slave_aw_buffer_LP_master_valid_o;
    wire        Slave_aw_buffer_LP_rst_ni;
    wire [31:0]  Slave_aw_buffer_LP_slave_addr_i;
    wire [1:0]  Slave_aw_buffer_LP_slave_burst_i;
    wire [3:0]  Slave_aw_buffer_LP_slave_cache_i;
    wire [15:0]  Slave_aw_buffer_LP_slave_id_i;
    wire [7:0]  Slave_aw_buffer_LP_slave_len_i;
    wire        Slave_aw_buffer_LP_slave_lock_i;
    wire [2:0]  Slave_aw_buffer_LP_slave_prot_i;
    wire [3:0]  Slave_aw_buffer_LP_slave_qos_i;
    wire        Slave_aw_buffer_LP_slave_ready_o;
    wire [3:0]  Slave_aw_buffer_LP_slave_region_i;
    wire [2:0]  Slave_aw_buffer_LP_slave_size_i;
    wire [9:0]  Slave_aw_buffer_LP_slave_user_i;
    wire        Slave_aw_buffer_LP_slave_valid_i;
    wire        Slave_aw_buffer_LP_test_en_i;
    // Slave_b_buffer_LP port wires:
    wire        Slave_b_buffer_LP_clk_i;
    wire [15:0]  Slave_b_buffer_LP_master_id_o;
    wire        Slave_b_buffer_LP_master_ready_i;
    wire [1:0]  Slave_b_buffer_LP_master_resp_o;
    wire [9:0]  Slave_b_buffer_LP_master_user_o;
    wire        Slave_b_buffer_LP_master_valid_o;
    wire        Slave_b_buffer_LP_rst_ni;
    wire [15:0]  Slave_b_buffer_LP_slave_id_i;
    wire        Slave_b_buffer_LP_slave_ready_o;
    wire [1:0]  Slave_b_buffer_LP_slave_resp_i;
    wire [9:0]  Slave_b_buffer_LP_slave_user_i;
    wire        Slave_b_buffer_LP_slave_valid_i;
    wire        Slave_b_buffer_LP_test_en_i;
    // Slave_r_buffer_LP port wires:
    wire        Slave_r_buffer_LP_clk_i;
    wire [31:0]  Slave_r_buffer_LP_master_data_o;
    wire [15:0]  Slave_r_buffer_LP_master_id_o;
    wire        Slave_r_buffer_LP_master_last_o;
    wire        Slave_r_buffer_LP_master_ready_i;
    wire [1:0]  Slave_r_buffer_LP_master_resp_o;
    wire [9:0]  Slave_r_buffer_LP_master_user_o;
    wire        Slave_r_buffer_LP_master_valid_o;
    wire        Slave_r_buffer_LP_rst_ni;
    wire [31:0]  Slave_r_buffer_LP_slave_data_i;
    wire [15:0]  Slave_r_buffer_LP_slave_id_i;
    wire        Slave_r_buffer_LP_slave_last_i;
    wire        Slave_r_buffer_LP_slave_ready_o;
    wire [1:0]  Slave_r_buffer_LP_slave_resp_i;
    wire [9:0]  Slave_r_buffer_LP_slave_user_i;
    wire        Slave_r_buffer_LP_slave_valid_i;
    wire        Slave_r_buffer_LP_test_en_i;
    // Slave_w_buffer_LP port wires:
    wire        Slave_w_buffer_LP_clk_i;
    wire [31:0]  Slave_w_buffer_LP_master_data_o;
    wire        Slave_w_buffer_LP_master_last_o;
    wire        Slave_w_buffer_LP_master_ready_i;
    wire [3:0]  Slave_w_buffer_LP_master_strb_o;
    wire [9:0]  Slave_w_buffer_LP_master_user_o;
    wire        Slave_w_buffer_LP_master_valid_o;
    wire        Slave_w_buffer_LP_rst_ni;
    wire [31:0]  Slave_w_buffer_LP_slave_data_i;
    wire        Slave_w_buffer_LP_slave_last_i;
    wire        Slave_w_buffer_LP_slave_ready_o;
    wire [3:0]  Slave_w_buffer_LP_slave_strb_i;
    wire [9:0]  Slave_w_buffer_LP_slave_user_i;
    wire        Slave_w_buffer_LP_slave_valid_i;
    wire        Slave_w_buffer_LP_test_en_i;
    // WRITE_CTRL port wires:
    wire [31:0]  WRITE_CTRL_AWADDR_i;
    wire [1:0]  WRITE_CTRL_AWBURST_i;
    wire [3:0]  WRITE_CTRL_AWCACHE_i;
    wire [15:0]  WRITE_CTRL_AWID_i;
    wire [7:0]  WRITE_CTRL_AWLEN_i;
    wire        WRITE_CTRL_AWLOCK_i;
    wire [2:0]  WRITE_CTRL_AWPROT_i;
    wire [3:0]  WRITE_CTRL_AWQOS_i;
    wire        WRITE_CTRL_AWREADY_o;
    wire [3:0]  WRITE_CTRL_AWREGION_i;
    wire [2:0]  WRITE_CTRL_AWSIZE_i;
    wire [9:0]  WRITE_CTRL_AWUSER_i;
    wire        WRITE_CTRL_AWVALID_i;
    wire [15:0]  WRITE_CTRL_BID_o;
    wire        WRITE_CTRL_BREADY_i;
    wire [1:0]  WRITE_CTRL_BRESP_o;
    wire [9:0]  WRITE_CTRL_BUSER_o;
    wire        WRITE_CTRL_BVALID_o;
    wire [12:0]  WRITE_CTRL_MEM_A_o;
    wire [3:0]  WRITE_CTRL_MEM_BE_o;
    wire        WRITE_CTRL_MEM_CEN_o;
    wire [31:0]  WRITE_CTRL_MEM_D_o;
    wire [31:0]  WRITE_CTRL_MEM_Q_i;
    wire        WRITE_CTRL_MEM_WEN_o;
    wire [31:0]  WRITE_CTRL_WDATA_i;
    wire        WRITE_CTRL_WLAST_i;
    wire        WRITE_CTRL_WREADY_o;
    wire [3:0]  WRITE_CTRL_WSTRB_i;
    wire [9:0]  WRITE_CTRL_WUSER_i;
    wire        WRITE_CTRL_WVALID_i;
    wire        WRITE_CTRL_clk;
    wire        WRITE_CTRL_grant_i;
    wire        WRITE_CTRL_rst_n;
    wire        WRITE_CTRL_valid_o;

    // Assignments for the ports of the encompassing component:
    assign MUX_MEM_ACLK_to_ACLK = ACLK;
    assign READ_CTRL_clk_to_ACLK = ACLK;
    assign Slave_ar_buffer_LP_clk_i_to_ACLK = ACLK;
    assign Slave_aw_buffer_LP_clk_i_to_ACLK = ACLK;
    assign Slave_b_buffer_LP_clk_i_to_ACLK = ACLK;
    assign Slave_r_buffer_LP_clk_i_to_ACLK = ACLK;
    assign Slave_w_buffer_LP_clk_i_to_ACLK = ACLK;
    assign WRITE_CTRL_clk_to_ACLK = ACLK;
    assign Slave_ar_buffer_LP_slave_addr_i_to_ARADDR_i = ARADDR_i;
    assign Slave_ar_buffer_LP_slave_burst_i_to_ARBURST_i = ARBURST_i;
    assign Slave_ar_buffer_LP_slave_cache_i_to_ARCACHE_i = ARCACHE_i;
    assign MUX_MEM_ARESETn_to_ARESETn = ARESETn;
    assign READ_CTRL_rst_n_to_ARESETn = ARESETn;
    assign Slave_ar_buffer_LP_rst_ni_to_ARESETn = ARESETn;
    assign Slave_aw_buffer_LP_rst_ni_to_ARESETn = ARESETn;
    assign Slave_b_buffer_LP_rst_ni_to_ARESETn = ARESETn;
    assign Slave_r_buffer_LP_rst_ni_to_ARESETn = ARESETn;
    assign Slave_w_buffer_LP_rst_ni_to_ARESETn = ARESETn;
    assign WRITE_CTRL_rst_n_to_ARESETn = ARESETn;
    assign Slave_ar_buffer_LP_slave_id_i_to_ARID_i = ARID_i;
    assign Slave_ar_buffer_LP_slave_len_i_to_ARLEN_i = ARLEN_i;
    assign Slave_ar_buffer_LP_slave_lock_i_to_ARLOCK_i = ARLOCK_i;
    assign Slave_ar_buffer_LP_slave_prot_i_to_ARPROT_i = ARPROT_i;
    assign Slave_ar_buffer_LP_slave_qos_i_to_ARQOS_i = ARQOS_i;
    assign ARREADY_o = Slave_ar_buffer_LP_slave_ready_o_to_ARREADY_o;
    assign Slave_ar_buffer_LP_slave_region_i_to_ARREGION_i = ARREGION_i;
    assign Slave_ar_buffer_LP_slave_size_i_to_ARSIZE_i = ARSIZE_i;
    assign Slave_ar_buffer_LP_slave_user_i_to_ARUSER_i = ARUSER_i;
    assign Slave_ar_buffer_LP_slave_valid_i_to_ARVALID_i = ARVALID_i;
    assign Slave_aw_buffer_LP_slave_addr_i_to_AWADDR_i = AWADDR_i;
    assign Slave_aw_buffer_LP_slave_burst_i_to_AWBURST_i = AWBURST_i;
    assign Slave_aw_buffer_LP_slave_cache_i_to_AWCACHE_i = AWCACHE_i;
    assign Slave_aw_buffer_LP_slave_id_i_to_AWID_i = AWID_i;
    assign Slave_aw_buffer_LP_slave_len_i_to_AWLEN_i = AWLEN_i;
    assign Slave_aw_buffer_LP_slave_lock_i_to_AWLOCK_i = AWLOCK_i;
    assign Slave_aw_buffer_LP_slave_prot_i_to_AWPROT_i = AWPROT_i;
    assign Slave_aw_buffer_LP_slave_qos_i_to_AWQOS_i = AWQOS_i;
    assign AWREADY_o = Slave_aw_buffer_LP_slave_ready_o_to_AWREADY_o;
    assign Slave_aw_buffer_LP_slave_region_i_to_AWREGION_i = AWREGION_i;
    assign Slave_aw_buffer_LP_slave_size_i_to_AWSIZE_i = AWSIZE_i;
    assign Slave_aw_buffer_LP_slave_user_i_to_AWUSER_i = AWUSER_i;
    assign Slave_aw_buffer_LP_slave_valid_i_to_AWVALID_i = AWVALID_i;
    assign A_o = MUX_MEM_mem_to_mem_ADDR;
    assign BE_o = MUX_MEM_mem_to_mem_BE;
    assign BID_o = Slave_b_buffer_LP_master_id_o_to_BID_o;
    assign Slave_b_buffer_LP_master_ready_i_to_BREADY_i = BREADY_i;
    assign BRESP_o = Slave_b_buffer_LP_master_resp_o_to_BRESP_o;
    assign BUSER_o = Slave_b_buffer_LP_master_user_o_to_BUSER_o;
    assign BVALID_o = Slave_b_buffer_LP_master_valid_o_to_BVALID_o;
    assign CEN_o = ~MUX_MEM_mem_to_mem_REQ;
    assign D_o = MUX_MEM_mem_to_mem_WDATA;
    assign READ_CTRL_MEM_Q_i_to_Q_i = Q_i;
    assign RDATA_o = Slave_r_buffer_LP_master_data_o_to_RDATA_o;
    assign RID_o = Slave_r_buffer_LP_master_id_o_to_RID_o;
    assign RLAST_o = Slave_r_buffer_LP_master_last_o_to_RLAST_o;
    assign Slave_r_buffer_LP_master_ready_i_to_RREADY_i = RREADY_i;
    assign RRESP_o = Slave_r_buffer_LP_master_resp_o_to_RRESP_o;
    assign RUSER_o = Slave_r_buffer_LP_master_user_o_to_RUSER_o;
    assign RVALID_o = Slave_r_buffer_LP_master_valid_o_to_RVALID_o;
    assign Slave_w_buffer_LP_slave_data_i_to_WDATA_i[7:0] = WDATA_i;
    assign WEN_o = ~MUX_MEM_mem_to_mem_WE;
    assign Slave_w_buffer_LP_slave_last_i_to_WLAST_i = WLAST_i;
    assign WREADY_o = Slave_w_buffer_LP_slave_ready_o_to_WREADY_o;
    assign Slave_w_buffer_LP_slave_strb_i_to_WSTRB_i = WSTRB_i;
    assign Slave_w_buffer_LP_slave_user_i_to_WUSER_i = WUSER_i;
    assign Slave_w_buffer_LP_slave_valid_i_to_WVALID_i = WVALID_i;
    assign Slave_ar_buffer_LP_test_en_i_to_test_en_i = test_en_i;
    assign Slave_aw_buffer_LP_test_en_i_to_test_en_i = test_en_i;
    assign Slave_b_buffer_LP_test_en_i_to_test_en_i = test_en_i;
    assign Slave_r_buffer_LP_test_en_i_to_test_en_i = test_en_i;
    assign Slave_w_buffer_LP_test_en_i_to_test_en_i = test_en_i;

    // MUX_MEM assignments:
    assign MUX_MEM_ACLK = MUX_MEM_ACLK_to_ACLK;
    assign MUX_MEM_ARESETn = MUX_MEM_ARESETn_to_ARESETn;
    assign MUX_MEM_mem_to_mem_ADDR[0] = MUX_MEM_A_o;
    assign MUX_MEM_mem_to_mem_BE = MUX_MEM_BE_o;
    assign MUX_MEM_mem_to_mem_REQ = MUX_MEM_CEN_o;
    assign MUX_MEM_mem_to_mem_WDATA[0] = MUX_MEM_D_o;
    assign MUX_MEM_R_addr = MUX_MEM_read_to_WRITE_CTRL_mem_ADDR;
    assign MUX_MEM_R_be = MUX_MEM_read_to_WRITE_CTRL_mem_BE;
    assign MUX_MEM_R_cen = MUX_MEM_read_to_WRITE_CTRL_mem_REQ;
    assign MUX_MEM_R_wdata = MUX_MEM_read_to_WRITE_CTRL_mem_WDATA;
    assign MUX_MEM_mem_to_mem_WE = MUX_MEM_WEN_o;
    assign MUX_MEM_W_addr = READ_CTRL_mem_to_MUX_MEM_write_ADDR;
    assign MUX_MEM_W_be = READ_CTRL_mem_to_MUX_MEM_write_BE;
    assign MUX_MEM_W_cen = READ_CTRL_mem_to_MUX_MEM_write_REQ;
    assign MUX_MEM_W_wdata = READ_CTRL_mem_to_MUX_MEM_write_WDATA;
    assign MUX_MEM_grant_R_to_READ_CTRL_grant_i = MUX_MEM_grant_R;
    assign WRITE_CTRL_grant_i_to_MUX_MEM_grant_W = MUX_MEM_grant_W;
    assign MUX_MEM_valid_R = MUX_MEM_valid_R_to_READ_CTRL_valid_o;
    assign MUX_MEM_valid_W = WRITE_CTRL_valid_o_to_MUX_MEM_valid_W;
    // READ_CTRL assignments:
    assign READ_CTRL_ARADDR_i = READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_ADDR;
    assign READ_CTRL_ARBURST_i = READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_BURST;
    assign READ_CTRL_ARCACHE_i = READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_CACHE;
    assign READ_CTRL_ARID_i = READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_ID;
    assign READ_CTRL_ARLEN_i = READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_LEN;
    assign READ_CTRL_ARLOCK_i = READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_LOCK;
    assign READ_CTRL_ARPROT_i = READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_PROT;
    assign READ_CTRL_ARQOS_i = READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_QOS;
    assign READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_READY = READ_CTRL_ARREADY_o;
    assign READ_CTRL_ARREGION_i = READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_REGION;
    assign READ_CTRL_ARSIZE_i = READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_SIZE;
    assign READ_CTRL_ARUSER_i[5:0] = READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_USER;
    assign READ_CTRL_ARVALID_i = READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_VALID;
    assign READ_CTRL_mem_to_MUX_MEM_write_ADDR = READ_CTRL_MEM_A_o;
    assign READ_CTRL_mem_to_MUX_MEM_write_BE = READ_CTRL_MEM_BE_o;
    assign READ_CTRL_mem_to_MUX_MEM_write_REQ = READ_CTRL_MEM_CEN_o;
    assign READ_CTRL_mem_to_MUX_MEM_write_WDATA = READ_CTRL_MEM_D_o;
    assign READ_CTRL_MEM_Q_i = READ_CTRL_MEM_Q_i_to_Q_i;
    assign Slave_r_buffer_LP_r_slave_to_READ_CTRL_r_R_DATA = READ_CTRL_RDATA_o;
    assign Slave_r_buffer_LP_r_slave_to_READ_CTRL_r_R_ID = READ_CTRL_RID_o[3:0];
    assign Slave_r_buffer_LP_r_slave_to_READ_CTRL_r_R_LAST = READ_CTRL_RLAST_o;
    assign READ_CTRL_RREADY_i = Slave_r_buffer_LP_r_slave_to_READ_CTRL_r_R_READY;
    assign Slave_r_buffer_LP_r_slave_to_READ_CTRL_r_R_RESP = READ_CTRL_RRESP_o;
    assign Slave_r_buffer_LP_r_slave_to_READ_CTRL_r_R_USER = READ_CTRL_RUSER_o[5:0];
    assign Slave_r_buffer_LP_r_slave_to_READ_CTRL_r_R_VALID = READ_CTRL_RVALID_o;
    assign READ_CTRL_clk = READ_CTRL_clk_to_ACLK;
    assign READ_CTRL_grant_i = MUX_MEM_grant_R_to_READ_CTRL_grant_i;
    assign READ_CTRL_rst_n = READ_CTRL_rst_n_to_ARESETn;
    assign MUX_MEM_valid_R_to_READ_CTRL_valid_o = READ_CTRL_valid_o;
    // Slave_ar_buffer_LP assignments:
    assign Slave_ar_buffer_LP_clk_i = Slave_ar_buffer_LP_clk_i_to_ACLK;
    assign READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_ADDR = Slave_ar_buffer_LP_master_addr_o;
    assign READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_BURST = Slave_ar_buffer_LP_master_burst_o;
    assign READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_CACHE = Slave_ar_buffer_LP_master_cache_o;
    assign READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_ID[3:0] = Slave_ar_buffer_LP_master_id_o[3:0];
    assign READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_LEN = Slave_ar_buffer_LP_master_len_o;
    assign READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_LOCK = Slave_ar_buffer_LP_master_lock_o;
    assign READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_PROT = Slave_ar_buffer_LP_master_prot_o;
    assign READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_QOS = Slave_ar_buffer_LP_master_qos_o;
    assign Slave_ar_buffer_LP_master_ready_i = READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_READY;
    assign READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_REGION = Slave_ar_buffer_LP_master_region_o;
    assign READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_SIZE = Slave_ar_buffer_LP_master_size_o;
    assign READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_USER = Slave_ar_buffer_LP_master_user_o[5:0];
    assign READ_CTRL_ar_to_Slave_ar_buffer_LP_ar_master_AR_VALID = Slave_ar_buffer_LP_master_valid_o;
    assign Slave_ar_buffer_LP_rst_ni = Slave_ar_buffer_LP_rst_ni_to_ARESETn;
    assign Slave_ar_buffer_LP_slave_addr_i = Slave_ar_buffer_LP_slave_addr_i_to_ARADDR_i;
    assign Slave_ar_buffer_LP_slave_burst_i = Slave_ar_buffer_LP_slave_burst_i_to_ARBURST_i;
    assign Slave_ar_buffer_LP_slave_cache_i = Slave_ar_buffer_LP_slave_cache_i_to_ARCACHE_i;
    assign Slave_ar_buffer_LP_slave_id_i = Slave_ar_buffer_LP_slave_id_i_to_ARID_i;
    assign Slave_ar_buffer_LP_slave_len_i = Slave_ar_buffer_LP_slave_len_i_to_ARLEN_i;
    assign Slave_ar_buffer_LP_slave_lock_i = Slave_ar_buffer_LP_slave_lock_i_to_ARLOCK_i;
    assign Slave_ar_buffer_LP_slave_prot_i = Slave_ar_buffer_LP_slave_prot_i_to_ARPROT_i;
    assign Slave_ar_buffer_LP_slave_qos_i = Slave_ar_buffer_LP_slave_qos_i_to_ARQOS_i;
    assign Slave_ar_buffer_LP_slave_ready_o_to_ARREADY_o = Slave_ar_buffer_LP_slave_ready_o;
    assign Slave_ar_buffer_LP_slave_region_i = Slave_ar_buffer_LP_slave_region_i_to_ARREGION_i;
    assign Slave_ar_buffer_LP_slave_size_i = Slave_ar_buffer_LP_slave_size_i_to_ARSIZE_i;
    assign Slave_ar_buffer_LP_slave_user_i = Slave_ar_buffer_LP_slave_user_i_to_ARUSER_i;
    assign Slave_ar_buffer_LP_slave_valid_i = Slave_ar_buffer_LP_slave_valid_i_to_ARVALID_i;
    assign Slave_ar_buffer_LP_test_en_i = Slave_ar_buffer_LP_test_en_i_to_test_en_i;
    // Slave_aw_buffer_LP assignments:
    assign Slave_aw_buffer_LP_clk_i = Slave_aw_buffer_LP_clk_i_to_ACLK;
    assign WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_ADDR = Slave_aw_buffer_LP_master_addr_o;
    assign WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_BURST = Slave_aw_buffer_LP_master_burst_o;
    assign WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_CACHE = Slave_aw_buffer_LP_master_cache_o;
    assign WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_ID[3:0] = Slave_aw_buffer_LP_master_id_o[3:0];
    assign WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_LEN = Slave_aw_buffer_LP_master_len_o;
    assign WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_LOCK = Slave_aw_buffer_LP_master_lock_o;
    assign WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_PROT = Slave_aw_buffer_LP_master_prot_o;
    assign WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_QOS = Slave_aw_buffer_LP_master_qos_o;
    assign Slave_aw_buffer_LP_master_ready_i = WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_READY;
    assign WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_REGION = Slave_aw_buffer_LP_master_region_o;
    assign WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_SIZE = Slave_aw_buffer_LP_master_size_o;
    assign WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_USER = Slave_aw_buffer_LP_master_user_o[5:0];
    assign WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_VALID = Slave_aw_buffer_LP_master_valid_o;
    assign Slave_aw_buffer_LP_rst_ni = Slave_aw_buffer_LP_rst_ni_to_ARESETn;
    assign Slave_aw_buffer_LP_slave_addr_i = Slave_aw_buffer_LP_slave_addr_i_to_AWADDR_i;
    assign Slave_aw_buffer_LP_slave_burst_i = Slave_aw_buffer_LP_slave_burst_i_to_AWBURST_i;
    assign Slave_aw_buffer_LP_slave_cache_i = Slave_aw_buffer_LP_slave_cache_i_to_AWCACHE_i;
    assign Slave_aw_buffer_LP_slave_id_i = Slave_aw_buffer_LP_slave_id_i_to_AWID_i;
    assign Slave_aw_buffer_LP_slave_len_i = Slave_aw_buffer_LP_slave_len_i_to_AWLEN_i;
    assign Slave_aw_buffer_LP_slave_lock_i = Slave_aw_buffer_LP_slave_lock_i_to_AWLOCK_i;
    assign Slave_aw_buffer_LP_slave_prot_i = Slave_aw_buffer_LP_slave_prot_i_to_AWPROT_i;
    assign Slave_aw_buffer_LP_slave_qos_i = Slave_aw_buffer_LP_slave_qos_i_to_AWQOS_i;
    assign Slave_aw_buffer_LP_slave_ready_o_to_AWREADY_o = Slave_aw_buffer_LP_slave_ready_o;
    assign Slave_aw_buffer_LP_slave_region_i = Slave_aw_buffer_LP_slave_region_i_to_AWREGION_i;
    assign Slave_aw_buffer_LP_slave_size_i = Slave_aw_buffer_LP_slave_size_i_to_AWSIZE_i;
    assign Slave_aw_buffer_LP_slave_user_i = Slave_aw_buffer_LP_slave_user_i_to_AWUSER_i;
    assign Slave_aw_buffer_LP_slave_valid_i = Slave_aw_buffer_LP_slave_valid_i_to_AWVALID_i;
    assign Slave_aw_buffer_LP_test_en_i = Slave_aw_buffer_LP_test_en_i_to_test_en_i;
    // Slave_b_buffer_LP assignments:
    assign Slave_b_buffer_LP_clk_i = Slave_b_buffer_LP_clk_i_to_ACLK;
    assign Slave_b_buffer_LP_master_id_o_to_BID_o = Slave_b_buffer_LP_master_id_o;
    assign Slave_b_buffer_LP_master_ready_i = Slave_b_buffer_LP_master_ready_i_to_BREADY_i;
    assign Slave_b_buffer_LP_master_resp_o_to_BRESP_o = Slave_b_buffer_LP_master_resp_o;
    assign Slave_b_buffer_LP_master_user_o_to_BUSER_o = Slave_b_buffer_LP_master_user_o;
    assign Slave_b_buffer_LP_master_valid_o_to_BVALID_o = Slave_b_buffer_LP_master_valid_o;
    assign Slave_b_buffer_LP_rst_ni = Slave_b_buffer_LP_rst_ni_to_ARESETn;
    assign Slave_b_buffer_LP_slave_id_i[3:0] = WRITE_CTRL_b_to_Slave_b_buffer_LP_b_slave_B_ID;
    assign WRITE_CTRL_b_to_Slave_b_buffer_LP_b_slave_B_READY = Slave_b_buffer_LP_slave_ready_o;
    assign Slave_b_buffer_LP_slave_resp_i = WRITE_CTRL_b_to_Slave_b_buffer_LP_b_slave_B_RESP;
    assign Slave_b_buffer_LP_slave_user_i[5:0] = WRITE_CTRL_b_to_Slave_b_buffer_LP_b_slave_B_USER;
    assign Slave_b_buffer_LP_slave_valid_i = WRITE_CTRL_b_to_Slave_b_buffer_LP_b_slave_B_VALID;
    assign Slave_b_buffer_LP_test_en_i = Slave_b_buffer_LP_test_en_i_to_test_en_i;
    // Slave_r_buffer_LP assignments:
    assign Slave_r_buffer_LP_clk_i = Slave_r_buffer_LP_clk_i_to_ACLK;
    assign Slave_r_buffer_LP_master_data_o_to_RDATA_o = Slave_r_buffer_LP_master_data_o;
    assign Slave_r_buffer_LP_master_id_o_to_RID_o = Slave_r_buffer_LP_master_id_o;
    assign Slave_r_buffer_LP_master_last_o_to_RLAST_o = Slave_r_buffer_LP_master_last_o;
    assign Slave_r_buffer_LP_master_ready_i = Slave_r_buffer_LP_master_ready_i_to_RREADY_i;
    assign Slave_r_buffer_LP_master_resp_o_to_RRESP_o = Slave_r_buffer_LP_master_resp_o;
    assign Slave_r_buffer_LP_master_user_o_to_RUSER_o = Slave_r_buffer_LP_master_user_o;
    assign Slave_r_buffer_LP_master_valid_o_to_RVALID_o = Slave_r_buffer_LP_master_valid_o;
    assign Slave_r_buffer_LP_rst_ni = Slave_r_buffer_LP_rst_ni_to_ARESETn;
    assign Slave_r_buffer_LP_slave_data_i = Slave_r_buffer_LP_r_slave_to_READ_CTRL_r_R_DATA;
    assign Slave_r_buffer_LP_slave_id_i[3:0] = Slave_r_buffer_LP_r_slave_to_READ_CTRL_r_R_ID;
    assign Slave_r_buffer_LP_slave_last_i = Slave_r_buffer_LP_r_slave_to_READ_CTRL_r_R_LAST;
    assign Slave_r_buffer_LP_r_slave_to_READ_CTRL_r_R_READY = Slave_r_buffer_LP_slave_ready_o;
    assign Slave_r_buffer_LP_slave_resp_i = Slave_r_buffer_LP_r_slave_to_READ_CTRL_r_R_RESP;
    assign Slave_r_buffer_LP_slave_user_i[5:0] = Slave_r_buffer_LP_r_slave_to_READ_CTRL_r_R_USER;
    assign Slave_r_buffer_LP_slave_valid_i = Slave_r_buffer_LP_r_slave_to_READ_CTRL_r_R_VALID;
    assign Slave_r_buffer_LP_test_en_i = Slave_r_buffer_LP_test_en_i_to_test_en_i;
    // Slave_w_buffer_LP assignments:
    assign Slave_w_buffer_LP_clk_i = Slave_w_buffer_LP_clk_i_to_ACLK;
    assign Slave_w_buffer_LP_w_master_to_WRITE_CTRL_w_W_DATA = Slave_w_buffer_LP_master_data_o;
    assign Slave_w_buffer_LP_w_master_to_WRITE_CTRL_w_W_LAST = Slave_w_buffer_LP_master_last_o;
    assign Slave_w_buffer_LP_master_ready_i = Slave_w_buffer_LP_w_master_to_WRITE_CTRL_w_W_READY;
    assign Slave_w_buffer_LP_w_master_to_WRITE_CTRL_w_W_STRB = Slave_w_buffer_LP_master_strb_o;
    assign Slave_w_buffer_LP_w_master_to_WRITE_CTRL_w_W_USER = Slave_w_buffer_LP_master_user_o;
    assign Slave_w_buffer_LP_w_master_to_WRITE_CTRL_w_W_VALID = Slave_w_buffer_LP_master_valid_o;
    assign Slave_w_buffer_LP_rst_ni = Slave_w_buffer_LP_rst_ni_to_ARESETn;
    assign Slave_w_buffer_LP_slave_data_i = Slave_w_buffer_LP_slave_data_i_to_WDATA_i;
    assign Slave_w_buffer_LP_slave_last_i = Slave_w_buffer_LP_slave_last_i_to_WLAST_i;
    assign Slave_w_buffer_LP_slave_ready_o_to_WREADY_o = Slave_w_buffer_LP_slave_ready_o;
    assign Slave_w_buffer_LP_slave_strb_i = Slave_w_buffer_LP_slave_strb_i_to_WSTRB_i;
    assign Slave_w_buffer_LP_slave_user_i = Slave_w_buffer_LP_slave_user_i_to_WUSER_i;
    assign Slave_w_buffer_LP_slave_valid_i = Slave_w_buffer_LP_slave_valid_i_to_WVALID_i;
    assign Slave_w_buffer_LP_test_en_i = Slave_w_buffer_LP_test_en_i_to_test_en_i;
    // WRITE_CTRL assignments:
    assign WRITE_CTRL_AWADDR_i = WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_ADDR;
    assign WRITE_CTRL_AWBURST_i = WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_BURST;
    assign WRITE_CTRL_AWCACHE_i = WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_CACHE;
    assign WRITE_CTRL_AWID_i = WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_ID;
    assign WRITE_CTRL_AWLEN_i = WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_LEN;
    assign WRITE_CTRL_AWLOCK_i = WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_LOCK;
    assign WRITE_CTRL_AWPROT_i = WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_PROT;
    assign WRITE_CTRL_AWQOS_i = WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_QOS;
    assign WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_READY = WRITE_CTRL_AWREADY_o;
    assign WRITE_CTRL_AWREGION_i = WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_REGION;
    assign WRITE_CTRL_AWSIZE_i = WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_SIZE;
    assign WRITE_CTRL_AWUSER_i[5:0] = WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_USER;
    assign WRITE_CTRL_AWVALID_i = WRITE_CTRL_aw_to_Slave_aw_buffer_LP_aw_master_AW_VALID;
    assign WRITE_CTRL_b_to_Slave_b_buffer_LP_b_slave_B_ID = WRITE_CTRL_BID_o[3:0];
    assign WRITE_CTRL_BREADY_i = WRITE_CTRL_b_to_Slave_b_buffer_LP_b_slave_B_READY;
    assign WRITE_CTRL_b_to_Slave_b_buffer_LP_b_slave_B_RESP = WRITE_CTRL_BRESP_o;
    assign WRITE_CTRL_b_to_Slave_b_buffer_LP_b_slave_B_USER = WRITE_CTRL_BUSER_o[5:0];
    assign WRITE_CTRL_b_to_Slave_b_buffer_LP_b_slave_B_VALID = WRITE_CTRL_BVALID_o;
    assign MUX_MEM_read_to_WRITE_CTRL_mem_ADDR = WRITE_CTRL_MEM_A_o;
    assign MUX_MEM_read_to_WRITE_CTRL_mem_BE = WRITE_CTRL_MEM_BE_o;
    assign MUX_MEM_read_to_WRITE_CTRL_mem_REQ = WRITE_CTRL_MEM_CEN_o;
    assign MUX_MEM_read_to_WRITE_CTRL_mem_WDATA = WRITE_CTRL_MEM_D_o;
    assign WRITE_CTRL_MEM_Q_i = '0;
    assign WRITE_CTRL_WDATA_i = Slave_w_buffer_LP_w_master_to_WRITE_CTRL_w_W_DATA;
    assign WRITE_CTRL_WLAST_i = Slave_w_buffer_LP_w_master_to_WRITE_CTRL_w_W_LAST;
    assign Slave_w_buffer_LP_w_master_to_WRITE_CTRL_w_W_READY = WRITE_CTRL_WREADY_o;
    assign WRITE_CTRL_WSTRB_i = Slave_w_buffer_LP_w_master_to_WRITE_CTRL_w_W_STRB;
    assign WRITE_CTRL_WUSER_i[5:0] = Slave_w_buffer_LP_w_master_to_WRITE_CTRL_w_W_USER[5:0];
    assign WRITE_CTRL_WVALID_i = Slave_w_buffer_LP_w_master_to_WRITE_CTRL_w_W_VALID;
    assign WRITE_CTRL_clk = WRITE_CTRL_clk_to_ACLK;
    assign WRITE_CTRL_grant_i = WRITE_CTRL_grant_i_to_MUX_MEM_grant_W;
    assign WRITE_CTRL_rst_n = WRITE_CTRL_rst_n_to_ARESETn;
    assign WRITE_CTRL_valid_o_to_MUX_MEM_valid_W = WRITE_CTRL_valid_o;

    // IP-XACT VLNV: pulp-platform.org:communication.logic:mux_mem:1.0
    mux_mem #(
        .MEM_ADDR_WIDTH      (13),
        .AXI_NUM_BYTES       (4),
        .AXI4_WDATA_WIDTH    (32))
    MUX_MEM(
        // Interface: mem
        .A_o                 (MUX_MEM_A_o),
        .BE_o                (MUX_MEM_BE_o),
        .CEN_o               (MUX_MEM_CEN_o),
        .D_o                 (MUX_MEM_D_o),
        .WEN_o               (MUX_MEM_WEN_o),
        // Interface: read
        .R_addr              (MUX_MEM_R_addr),
        .R_be                (MUX_MEM_R_be),
        .R_cen               (MUX_MEM_R_cen),
        .R_wdata             (MUX_MEM_R_wdata),
        // Interface: write
        .W_addr              (MUX_MEM_W_addr),
        .W_be                (MUX_MEM_W_be),
        .W_cen               (MUX_MEM_W_cen),
        .W_wdata             (MUX_MEM_W_wdata),
        // These ports are not in any interface
        .ACLK                (MUX_MEM_ACLK),
        .ARESETn             (MUX_MEM_ARESETn),
        .valid_R             (MUX_MEM_valid_R),
        .valid_W             (MUX_MEM_valid_W),
        .grant_R             (MUX_MEM_grant_R),
        .grant_W             (MUX_MEM_grant_W));

    // IP-XACT VLNV: pulp-platform.org:communication:axi_read_only_ctrl:1.0
    axi_read_only_ctrl #(
        .AXI4_ADDRESS_WIDTH  (32),
        .AXI4_RDATA_WIDTH    (32),
        .AXI4_WDATA_WIDTH    (32),
        .AXI4_ID_WIDTH       (16),
        .AXI4_USER_WIDTH     (10),
        .AXI_NUMBYTES        (4),
        .MEM_ADDR_WIDTH      (13))
    READ_CTRL(
        // Interface: ar
        .ARADDR_i            (READ_CTRL_ARADDR_i),
        .ARBURST_i           (READ_CTRL_ARBURST_i),
        .ARCACHE_i           (READ_CTRL_ARCACHE_i),
        .ARID_i              (READ_CTRL_ARID_i),
        .ARLEN_i             (READ_CTRL_ARLEN_i),
        .ARLOCK_i            (READ_CTRL_ARLOCK_i),
        .ARPROT_i            (READ_CTRL_ARPROT_i),
        .ARQOS_i             (READ_CTRL_ARQOS_i),
        .ARREGION_i          (READ_CTRL_ARREGION_i),
        .ARSIZE_i            (READ_CTRL_ARSIZE_i),
        .ARUSER_i            (READ_CTRL_ARUSER_i),
        .ARVALID_i           (READ_CTRL_ARVALID_i),
        .ARREADY_o           (READ_CTRL_ARREADY_o),
        // Interface: mem
        .MEM_A_o             (READ_CTRL_MEM_A_o),
        .MEM_BE_o            (READ_CTRL_MEM_BE_o),
        .MEM_CEN_o           (READ_CTRL_MEM_CEN_o),
        .MEM_D_o             (READ_CTRL_MEM_D_o),
        .MEM_WEN_o           (READ_CTRL_MEM_WEN_o),
        // Interface: r
        .RREADY_i            (READ_CTRL_RREADY_i),
        .RDATA_o             (READ_CTRL_RDATA_o),
        .RID_o               (READ_CTRL_RID_o),
        .RLAST_o             (READ_CTRL_RLAST_o),
        .RRESP_o             (READ_CTRL_RRESP_o),
        .RUSER_o             (READ_CTRL_RUSER_o),
        .RVALID_o            (READ_CTRL_RVALID_o),
        // These ports are not in any interface
        .clk                 (READ_CTRL_clk),
        .grant_i             (READ_CTRL_grant_i),
        .MEM_Q_i             (READ_CTRL_MEM_Q_i),
        .rst_n               (READ_CTRL_rst_n),
        .valid_o             (READ_CTRL_valid_o));

    // IP-XACT VLNV: pulp-platform.org:communication:axi_ar_buffer:1.0
    axi_ar_buffer #(
        .ID_WIDTH            (16),
        .ADDR_WIDTH          (32),
        .USER_WIDTH          (10),
        .BUFFER_DEPTH        (4))
    Slave_ar_buffer_LP(
        // Interface: ar_master
        .master_ready_i      (Slave_ar_buffer_LP_master_ready_i),
        .master_addr_o       (Slave_ar_buffer_LP_master_addr_o),
        .master_burst_o      (Slave_ar_buffer_LP_master_burst_o),
        .master_cache_o      (Slave_ar_buffer_LP_master_cache_o),
        .master_id_o         (Slave_ar_buffer_LP_master_id_o),
        .master_len_o        (Slave_ar_buffer_LP_master_len_o),
        .master_lock_o       (Slave_ar_buffer_LP_master_lock_o),
        .master_prot_o       (Slave_ar_buffer_LP_master_prot_o),
        .master_qos_o        (Slave_ar_buffer_LP_master_qos_o),
        .master_region_o     (Slave_ar_buffer_LP_master_region_o),
        .master_size_o       (Slave_ar_buffer_LP_master_size_o),
        .master_user_o       (Slave_ar_buffer_LP_master_user_o),
        .master_valid_o      (Slave_ar_buffer_LP_master_valid_o),
        // Interface: ar_slave
        .slave_addr_i        (Slave_ar_buffer_LP_slave_addr_i),
        .slave_burst_i       (Slave_ar_buffer_LP_slave_burst_i),
        .slave_cache_i       (Slave_ar_buffer_LP_slave_cache_i),
        .slave_id_i          (Slave_ar_buffer_LP_slave_id_i),
        .slave_len_i         (Slave_ar_buffer_LP_slave_len_i),
        .slave_lock_i        (Slave_ar_buffer_LP_slave_lock_i),
        .slave_prot_i        (Slave_ar_buffer_LP_slave_prot_i),
        .slave_qos_i         (Slave_ar_buffer_LP_slave_qos_i),
        .slave_region_i      (Slave_ar_buffer_LP_slave_region_i),
        .slave_size_i        (Slave_ar_buffer_LP_slave_size_i),
        .slave_user_i        (Slave_ar_buffer_LP_slave_user_i),
        .slave_valid_i       (Slave_ar_buffer_LP_slave_valid_i),
        .slave_ready_o       (Slave_ar_buffer_LP_slave_ready_o),
        // These ports are not in any interface
        .clk_i               (Slave_ar_buffer_LP_clk_i),
        .rst_ni              (Slave_ar_buffer_LP_rst_ni),
        .test_en_i           (Slave_ar_buffer_LP_test_en_i));

    // IP-XACT VLNV: pulp-platform.org:communication:axi_aw_buffer:1.0
    axi_aw_buffer #(
        .ID_WIDTH            (16),
        .ADDR_WIDTH          (32),
        .USER_WIDTH          (10),
        .BUFFER_DEPTH        (4))
    Slave_aw_buffer_LP(
        // Interface: aw_master
        .master_ready_i      (Slave_aw_buffer_LP_master_ready_i),
        .master_addr_o       (Slave_aw_buffer_LP_master_addr_o),
        .master_burst_o      (Slave_aw_buffer_LP_master_burst_o),
        .master_cache_o      (Slave_aw_buffer_LP_master_cache_o),
        .master_id_o         (Slave_aw_buffer_LP_master_id_o),
        .master_len_o        (Slave_aw_buffer_LP_master_len_o),
        .master_lock_o       (Slave_aw_buffer_LP_master_lock_o),
        .master_prot_o       (Slave_aw_buffer_LP_master_prot_o),
        .master_qos_o        (Slave_aw_buffer_LP_master_qos_o),
        .master_region_o     (Slave_aw_buffer_LP_master_region_o),
        .master_size_o       (Slave_aw_buffer_LP_master_size_o),
        .master_user_o       (Slave_aw_buffer_LP_master_user_o),
        .master_valid_o      (Slave_aw_buffer_LP_master_valid_o),
        // Interface: aw_slave
        .slave_addr_i        (Slave_aw_buffer_LP_slave_addr_i),
        .slave_burst_i       (Slave_aw_buffer_LP_slave_burst_i),
        .slave_cache_i       (Slave_aw_buffer_LP_slave_cache_i),
        .slave_id_i          (Slave_aw_buffer_LP_slave_id_i),
        .slave_len_i         (Slave_aw_buffer_LP_slave_len_i),
        .slave_lock_i        (Slave_aw_buffer_LP_slave_lock_i),
        .slave_prot_i        (Slave_aw_buffer_LP_slave_prot_i),
        .slave_qos_i         (Slave_aw_buffer_LP_slave_qos_i),
        .slave_region_i      (Slave_aw_buffer_LP_slave_region_i),
        .slave_size_i        (Slave_aw_buffer_LP_slave_size_i),
        .slave_user_i        (Slave_aw_buffer_LP_slave_user_i),
        .slave_valid_i       (Slave_aw_buffer_LP_slave_valid_i),
        .slave_ready_o       (Slave_aw_buffer_LP_slave_ready_o),
        // These ports are not in any interface
        .clk_i               (Slave_aw_buffer_LP_clk_i),
        .rst_ni              (Slave_aw_buffer_LP_rst_ni),
        .test_en_i           (Slave_aw_buffer_LP_test_en_i));

    // IP-XACT VLNV: pulp-platform.org:communication:axi_b_buffer:1.0
    axi_b_buffer #(
        .ID_WIDTH            (16),
        .USER_WIDTH          (10),
        .BUFFER_DEPTH        (4))
    Slave_b_buffer_LP(
        // Interface: b_master
        .master_ready_i      (Slave_b_buffer_LP_master_ready_i),
        .master_id_o         (Slave_b_buffer_LP_master_id_o),
        .master_resp_o       (Slave_b_buffer_LP_master_resp_o),
        .master_user_o       (Slave_b_buffer_LP_master_user_o),
        .master_valid_o      (Slave_b_buffer_LP_master_valid_o),
        // Interface: b_slave
        .slave_id_i          (Slave_b_buffer_LP_slave_id_i),
        .slave_resp_i        (Slave_b_buffer_LP_slave_resp_i),
        .slave_user_i        (Slave_b_buffer_LP_slave_user_i),
        .slave_valid_i       (Slave_b_buffer_LP_slave_valid_i),
        .slave_ready_o       (Slave_b_buffer_LP_slave_ready_o),
        // These ports are not in any interface
        .clk_i               (Slave_b_buffer_LP_clk_i),
        .rst_ni              (Slave_b_buffer_LP_rst_ni),
        .test_en_i           (Slave_b_buffer_LP_test_en_i));

    // IP-XACT VLNV: pulp-platform.org:communication:axi_r_buffer:1.0
    axi_r_buffer #(
        .ID_WIDTH            (16),
        .DATA_WIDTH          (32),
        .USER_WIDTH          (10),
        .BUFFER_DEPTH        (4))
    Slave_r_buffer_LP(
        // Interface: r_master
        .master_ready_i      (Slave_r_buffer_LP_master_ready_i),
        .master_data_o       (Slave_r_buffer_LP_master_data_o),
        .master_id_o         (Slave_r_buffer_LP_master_id_o),
        .master_last_o       (Slave_r_buffer_LP_master_last_o),
        .master_resp_o       (Slave_r_buffer_LP_master_resp_o),
        .master_user_o       (Slave_r_buffer_LP_master_user_o),
        .master_valid_o      (Slave_r_buffer_LP_master_valid_o),
        // Interface: r_slave
        .slave_data_i        (Slave_r_buffer_LP_slave_data_i),
        .slave_id_i          (Slave_r_buffer_LP_slave_id_i),
        .slave_last_i        (Slave_r_buffer_LP_slave_last_i),
        .slave_resp_i        (Slave_r_buffer_LP_slave_resp_i),
        .slave_user_i        (Slave_r_buffer_LP_slave_user_i),
        .slave_valid_i       (Slave_r_buffer_LP_slave_valid_i),
        .slave_ready_o       (Slave_r_buffer_LP_slave_ready_o),
        // These ports are not in any interface
        .clk_i               (Slave_r_buffer_LP_clk_i),
        .rst_ni              (Slave_r_buffer_LP_rst_ni),
        .test_en_i           (Slave_r_buffer_LP_test_en_i));

    // IP-XACT VLNV: pulp-platform.org:communication:axi_w_buffer:1.0
    axi_w_buffer #(
        .DATA_WIDTH          (32),
        .USER_WIDTH          (10),
        .BUFFER_DEPTH        (4))
    Slave_w_buffer_LP(
        // Interface: w_master
        .master_ready_i      (Slave_w_buffer_LP_master_ready_i),
        .master_data_o       (Slave_w_buffer_LP_master_data_o),
        .master_last_o       (Slave_w_buffer_LP_master_last_o),
        .master_strb_o       (Slave_w_buffer_LP_master_strb_o),
        .master_user_o       (Slave_w_buffer_LP_master_user_o),
        .master_valid_o      (Slave_w_buffer_LP_master_valid_o),
        // Interface: w_slave
        .slave_data_i        (Slave_w_buffer_LP_slave_data_i),
        .slave_last_i        (Slave_w_buffer_LP_slave_last_i),
        .slave_strb_i        (Slave_w_buffer_LP_slave_strb_i),
        .slave_user_i        (Slave_w_buffer_LP_slave_user_i),
        .slave_ready_o       (Slave_w_buffer_LP_slave_ready_o),
        // These ports are not in any interface
        .clk_i               (Slave_w_buffer_LP_clk_i),
        .rst_ni              (Slave_w_buffer_LP_rst_ni),
        .slave_valid_i       (Slave_w_buffer_LP_slave_valid_i),
        .test_en_i           (Slave_w_buffer_LP_test_en_i));

    // IP-XACT VLNV: pulp-platform.org:communication:axi_write_only_ctrl:1.0
    axi_write_only_ctrl #(
        .AXI4_ADDRESS_WIDTH  (32),
        .AXI4_RDATA_WIDTH    (32),
        .AXI4_WDATA_WIDTH    (32),
        .AXI4_ID_WIDTH       (16),
        .AXI4_USER_WIDTH     (10),
        .AXI_NUMBYTES        (4),
        .MEM_ADDR_WIDTH      (13))
    WRITE_CTRL(
        // Interface: aw
        .AWADDR_i            (WRITE_CTRL_AWADDR_i),
        .AWBURST_i           (WRITE_CTRL_AWBURST_i),
        .AWCACHE_i           (WRITE_CTRL_AWCACHE_i),
        .AWID_i              (WRITE_CTRL_AWID_i),
        .AWLEN_i             (WRITE_CTRL_AWLEN_i),
        .AWLOCK_i            (WRITE_CTRL_AWLOCK_i),
        .AWPROT_i            (WRITE_CTRL_AWPROT_i),
        .AWQOS_i             (WRITE_CTRL_AWQOS_i),
        .AWREGION_i          (WRITE_CTRL_AWREGION_i),
        .AWSIZE_i            (WRITE_CTRL_AWSIZE_i),
        .AWUSER_i            (WRITE_CTRL_AWUSER_i),
        .AWVALID_i           (WRITE_CTRL_AWVALID_i),
        .AWREADY_o           (WRITE_CTRL_AWREADY_o),
        // Interface: b
        .BREADY_i            (WRITE_CTRL_BREADY_i),
        .BID_o               (WRITE_CTRL_BID_o),
        .BRESP_o             (WRITE_CTRL_BRESP_o),
        .BUSER_o             (WRITE_CTRL_BUSER_o),
        .BVALID_o            (WRITE_CTRL_BVALID_o),
        // Interface: mem
        .MEM_A_o             (WRITE_CTRL_MEM_A_o),
        .MEM_BE_o            (WRITE_CTRL_MEM_BE_o),
        .MEM_CEN_o           (WRITE_CTRL_MEM_CEN_o),
        .MEM_D_o             (WRITE_CTRL_MEM_D_o),
        .MEM_WEN_o           (WRITE_CTRL_MEM_WEN_o),
        // Interface: w
        .WDATA_i             (WRITE_CTRL_WDATA_i),
        .WLAST_i             (WRITE_CTRL_WLAST_i),
        .WSTRB_i             (WRITE_CTRL_WSTRB_i),
        .WUSER_i             (WRITE_CTRL_WUSER_i),
        .WVALID_i            (WRITE_CTRL_WVALID_i),
        .WREADY_o            (WRITE_CTRL_WREADY_o),
        // These ports are not in any interface
        .clk                 (WRITE_CTRL_clk),
        .grant_i             (WRITE_CTRL_grant_i),
        .MEM_Q_i             (WRITE_CTRL_MEM_Q_i),
        .rst_n               (WRITE_CTRL_rst_n),
        .valid_o             (WRITE_CTRL_valid_o));


endmodule
