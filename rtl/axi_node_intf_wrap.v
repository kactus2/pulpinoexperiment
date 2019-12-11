//-----------------------------------------------------------------------------
// File          : axi_node_intf_wrap.v
// Creation date : 13.12.2018
// Creation time : 11:53:34
// Description   : 
// Created by    : epe
// Tool : Kactus2 3.6.99 64-bit
// Plugin : Verilog generator 2.2
//-----------------------------------------------------------------------------

module axi_node_intf_wrap #(
    parameter                              AXI_ADDR_WIDTH   = 32,
    parameter                              AXI_DATA_WIDTH   = 32,
    parameter                              AXI_ID_WIDTH     = 10,
    
    parameter                              AXI_STRB_WIDTH   = AXI_DATA_WIDTH/8,
    parameter                              AXI_USER_WIDTH   = 1,
    parameter                              NB_MASTER        = 4,
    parameter                              NB_SLAVE         = 4,
    parameter                              AXI_ID_WIDTH_INIT = AXI_ID_WIDTH+$clog2(NB_SLAVE)
) (
    // Interface: master0
    input                               instr_ar_ready,
    input                               instr_aw_ready,
    input                [AXI_ID_WIDTH_INIT-1:0] instr_b_id,
    input                [1:0]          instr_b_resp,
    input                [AXI_USER_WIDTH-1:0] instr_b_user,
    input                               instr_b_valid,
    input                [AXI_DATA_WIDTH-1:0] instr_r_data,
    input                [AXI_ID_WIDTH_INIT-1:0] instr_r_id,
    input                               instr_r_last,
    input                [1:0]          instr_r_resp,
    input                [AXI_USER_WIDTH-1:0] instr_r_user,
    input                               instr_r_valid,
    input                               instr_w_ready,
    output               [AXI_ADDR_WIDTH-1:0] instr_ar_addr,
    output               [1:0]          instr_ar_burst,
    output               [3:0]          instr_ar_cache,
    output               [AXI_ID_WIDTH_INIT-1:0] instr_ar_id,
    output               [7:0]          instr_ar_len,
    output                              instr_ar_lock,
    output               [2:0]          instr_ar_prot,
    output               [3:0]          instr_ar_qos,
    output               [3:0]          instr_ar_region,
    output               [2:0]          instr_ar_size,
    output               [AXI_USER_WIDTH-1:0] instr_ar_user,
    output                              instr_ar_valid,
    output               [AXI_ADDR_WIDTH-1:0] instr_aw_addr,
    output               [1:0]          instr_aw_burst,
    output               [3:0]          instr_aw_cache,
    output               [AXI_ID_WIDTH_INIT-1:0] instr_aw_id,
    output               [7:0]          instr_aw_len,
    output                              instr_aw_lock,
    output               [2:0]          instr_aw_prot,
    output               [3:0]          instr_aw_qos,
    output               [3:0]          instr_aw_region,
    output               [2:0]          instr_aw_size,
    output               [AXI_USER_WIDTH-1:0] instr_aw_user,
    output                              instr_aw_valid,
    output                              instr_b_ready,
    output                              instr_r_ready,
    output               [AXI_DATA_WIDTH-1:0] instr_w_data,
    output                              instr_w_last,
    output               [AXI_STRB_WIDTH-1:0] instr_w_strb,
    output               [AXI_USER_WIDTH-1:0] instr_w_user,
    output                              instr_w_valid,

    // Interface: master1
    input                               data_ar_ready,
    input                               data_aw_ready,
    input                [AXI_ID_WIDTH_INIT-1:0] data_b_id,
    input                [1:0]          data_b_resp,
    input                [AXI_USER_WIDTH-1:0] data_b_user,
    input                               data_b_valid,
    input                [AXI_DATA_WIDTH-1:0] data_r_data,
    input                [AXI_ID_WIDTH_INIT-1:0] data_r_id,
    input                               data_r_last,
    input                [1:0]          data_r_resp,
    input                [AXI_USER_WIDTH-1:0] data_r_user,
    input                               data_r_valid,
    input                               data_w_ready,
    output               [AXI_ADDR_WIDTH-1:0] data_ar_addr,
    output               [1:0]          data_ar_burst,
    output               [3:0]          data_ar_cache,
    output               [AXI_ID_WIDTH_INIT-1:0] data_ar_id,
    output               [7:0]          data_ar_len,
    output                              data_ar_lock,
    output               [2:0]          data_ar_prot,
    output               [3:0]          data_ar_qos,
    output               [3:0]          data_ar_region,
    output               [2:0]          data_ar_size,
    output               [AXI_USER_WIDTH-1:0] data_ar_user,
    output                              data_ar_valid,
    output               [AXI_ADDR_WIDTH-1:0] data_aw_addr,
    output               [1:0]          data_aw_burst,
    output               [3:0]          data_aw_cache,
    output               [AXI_ID_WIDTH_INIT-1:0] data_aw_id,
    output               [7:0]          data_aw_len,
    output                              data_aw_lock,
    output               [2:0]          data_aw_prot,
    output               [3:0]          data_aw_qos,
    output               [3:0]          data_aw_region,
    output               [2:0]          data_aw_size,
    output               [AXI_USER_WIDTH-1:0] data_aw_user,
    output                              data_aw_valid,
    output                              data_b_ready,
    output                              data_r_ready,
    output               [AXI_DATA_WIDTH-1:0] data_w_data,
    output                              data_w_last,
    output               [AXI_STRB_WIDTH-1:0] data_w_strb,
    output               [AXI_USER_WIDTH-1:0] data_w_user,
    output                              data_w_valid,

    // Interface: master2
    input                               slave_ar_ready,
    input                               slave_aw_ready,
    input                [AXI_ID_WIDTH_INIT-1:0] slave_b_id,
    input                [1:0]          slave_b_resp,
    input                [AXI_USER_WIDTH-1:0] slave_b_user,
    input                               slave_b_valid,
    input                [AXI_DATA_WIDTH-1:0] slave_r_data,
    input                [AXI_ID_WIDTH_INIT-1:0] slave_r_id,
    input                               slave_r_last,
    input                [1:0]          slave_r_resp,
    input                [AXI_USER_WIDTH-1:0] slave_r_user,
    input                               slave_r_valid,
    input                               slave_w_ready,
    output               [AXI_ADDR_WIDTH-1:0] slave_ar_addr,
    output               [1:0]          slave_ar_burst,
    output               [3:0]          slave_ar_cache,
    output               [AXI_ID_WIDTH_INIT-1:0] slave_ar_id,
    output               [7:0]          slave_ar_len,
    output                              slave_ar_lock,
    output               [2:0]          slave_ar_prot,
    output               [3:0]          slave_ar_qos,
    output               [3:0]          slave_ar_region,
    output               [2:0]          slave_ar_size,
    output               [AXI_USER_WIDTH-1:0] slave_ar_user,
    output                              slave_ar_valid,
    output               [AXI_ADDR_WIDTH-1:0] slave_aw_addr,
    output               [1:0]          slave_aw_burst,
    output               [3:0]          slave_aw_cache,
    output               [AXI_ID_WIDTH_INIT-1:0] slave_aw_id,
    output               [7:0]          slave_aw_len,
    output                              slave_aw_lock,
    output               [2:0]          slave_aw_prot,
    output               [3:0]          slave_aw_qos,
    output               [3:0]          slave_aw_region,
    output               [2:0]          slave_aw_size,
    output               [AXI_USER_WIDTH-1:0] slave_aw_user,
    output                              slave_aw_valid,
    output                              slave_b_ready,
    output                              slave_r_ready,
    output               [AXI_DATA_WIDTH-1:0] slave_w_data,
    output                              slave_w_last,
    output               [AXI_STRB_WIDTH-1:0] slave_w_strb,
    output               [AXI_USER_WIDTH-1:0] slave_w_user,
    output                              slave_w_valid,

    // Interface: slave0
    input                [AXI_ADDR_WIDTH-1:0] core_master_ar_addr,
    input                [1:0]          core_master_ar_burst,
    input                [3:0]          core_master_ar_cache,
    input                [AXI_ID_WIDTH-1:0] core_master_ar_id,
    input                [7:0]          core_master_ar_len,
    input                               core_master_ar_lock,
    input                [2:0]          core_master_ar_prot,
    input                [3:0]          core_master_ar_qos,
    input                [3:0]          core_master_ar_region,
    input                [2:0]          core_master_ar_size,
    input                [AXI_USER_WIDTH-1:0] core_master_ar_user,
    input                               core_master_ar_valid,
    input                [AXI_ADDR_WIDTH-1:0] core_master_aw_addr,
    input                [1:0]          core_master_aw_burst,
    input                [3:0]          core_master_aw_cache,
    input                [AXI_ID_WIDTH-1:0] core_master_aw_id,
    input                [7:0]          core_master_aw_len,
    input                               core_master_aw_lock,
    input                [2:0]          core_master_aw_prot,
    input                [3:0]          core_master_aw_qos,
    input                [3:0]          core_master_aw_region,
    input                [2:0]          core_master_aw_size,
    input                [AXI_USER_WIDTH-1:0] core_master_aw_user,
    input                               core_master_aw_valid,
    input                               core_master_b_ready,
    input                               core_master_r_ready,
    input                [AXI_DATA_WIDTH-1:0] core_master_w_data,
    input                               core_master_w_last,
    input                [AXI_STRB_WIDTH-1:0] core_master_w_strb,
    input                [AXI_USER_WIDTH-1:0] core_master_w_user,
    input                               core_master_w_valid,
    output                              core_master_ar_ready,
    output                              core_master_aw_ready,
    output               [AXI_ID_WIDTH-1:0] core_master_b_id,
    output               [1:0]          core_master_b_resp,
    output               [AXI_USER_WIDTH-1:0] core_master_b_user,
    output                              core_master_b_valid,
    output               [AXI_DATA_WIDTH-1:0] core_master_r_data,
    output               [AXI_ID_WIDTH-1:0] core_master_r_id,
    output                              core_master_r_last,
    output               [1:0]          core_master_r_resp,
    output               [AXI_USER_WIDTH-1:0] core_master_r_user,
    output                              core_master_r_valid,
    output                              core_master_w_ready,

    // Interface: slave1
    input                [AXI_ADDR_WIDTH-1:0] dbg_ar_addr,
    input                [1:0]          dbg_ar_burst,
    input                [3:0]          dbg_ar_cache,
    input                [AXI_ID_WIDTH-1:0] dbg_ar_id,
    input                [7:0]          dbg_ar_len,
    input                               dbg_ar_lock,
    input                [2:0]          dbg_ar_prot,
    input                [3:0]          dbg_ar_qos,
    input                [3:0]          dbg_ar_region,
    input                [2:0]          dbg_ar_size,
    input                [AXI_USER_WIDTH-1:0] dbg_ar_user,
    input                               dbg_ar_valid,
    input                [AXI_ADDR_WIDTH-1:0] dbg_aw_addr,
    input                [1:0]          dbg_aw_burst,
    input                [3:0]          dbg_aw_cache,
    input                [AXI_ID_WIDTH-1:0] dbg_aw_id,
    input                [7:0]          dbg_aw_len,
    input                               dbg_aw_lock,
    input                [2:0]          dbg_aw_prot,
    input                [3:0]          dbg_aw_qos,
    input                [3:0]          dbg_aw_region,
    input                [2:0]          dbg_aw_size,
    input                [AXI_USER_WIDTH-1:0] dbg_aw_user,
    input                               dbg_aw_valid,
    input                               dbg_b_ready,
    input                               dbg_r_ready,
    input                [AXI_DATA_WIDTH-1:0] dbg_w_data,
    input                               dbg_w_last,
    input                [AXI_STRB_WIDTH-1:0] dbg_w_strb,
    input                [AXI_USER_WIDTH-1:0] dbg_w_user,
    input                               dbg_w_valid,
    output                              dbg_ar_ready,
    output                              dbg_aw_ready,
    output               [AXI_ID_WIDTH-1:0] dbg_b_id,
    output               [1:0]          dbg_b_resp,
    output               [AXI_USER_WIDTH-1:0] dbg_b_user,
    output                              dbg_b_valid,
    output               [AXI_DATA_WIDTH-1:0] dbg_r_data,
    output               [AXI_ID_WIDTH-1:0] dbg_r_id,
    output                              dbg_r_last,
    output               [1:0]          dbg_r_resp,
    output               [AXI_USER_WIDTH-1:0] dbg_r_user,
    output                              dbg_r_valid,
    output                              dbg_w_ready,

    // Interface: slave2
    input                [AXI_ADDR_WIDTH-1:0] ar_addr,
    input                [1:0]          ar_burst,
    input                [3:0]          ar_cache,
    input                [AXI_ID_WIDTH-1:0] ar_id,
    input                [7:0]          ar_len,
    input                               ar_lock,
    input                [2:0]          ar_prot,
    input                [3:0]          ar_qos,
    input                [3:0]          ar_region,
    input                [2:0]          ar_size,
    input                [AXI_USER_WIDTH-1:0] ar_user,
    input                               ar_valid,
    input                [AXI_ADDR_WIDTH-1:0] aw_addr,
    input                [1:0]          aw_burst,
    input                [3:0]          aw_cache,
    input                [AXI_ID_WIDTH-1:0] aw_id,
    input                [7:0]          aw_len,
    input                               aw_lock,
    input                [2:0]          aw_prot,
    input                [3:0]          aw_qos,
    input                [3:0]          aw_region,
    input                [2:0]          aw_size,
    input                [AXI_USER_WIDTH-1:0] aw_user,
    input                               aw_valid,
    input                               b_ready,
    input                               r_ready,
    input                [AXI_DATA_WIDTH-1:0] w_data,
    input                               w_last,
    input                [AXI_STRB_WIDTH-1:0] w_strb,
    input                [AXI_USER_WIDTH-1:0] w_user,
    input                               w_valid,
    output                              ar_ready,
    output                              aw_ready,
    output               [AXI_ID_WIDTH-1:0] b_id,
    output               [1:0]          b_resp,
    output               [AXI_USER_WIDTH-1:0] b_user,
    output                              b_valid,
    output               [AXI_DATA_WIDTH-1:0] r_data,
    output               [AXI_ID_WIDTH-1:0] r_id,
    output                              r_last,
    output               [1:0]          r_resp,
    output               [AXI_USER_WIDTH-1:0] r_user,
    output                              r_valid,
    output                              w_ready,
    // These ports are not in any interface
    input                               clk,
    input                               rst_n,
    input                               test_en_i,
    input  logic [NB_MASTER-1:0][AXI_ADDR_WIDTH-1:0]  start_addr_i,
    input  logic [NB_MASTER-1:0][AXI_ADDR_WIDTH-1:0]  end_addr_i
  );

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!

  localparam NB_REGION      = 1;

  // AXI ID WIDTHs for master and slave IPS
  localparam AXI_ID_WIDTH_TARG =   AXI_ID_WIDTH;
  //localparam AXI_ID_WIDTH_INIT =   AXI_ID_WIDTH_TARG + $clog2(NB_SLAVE);

  // Signals to slave periperhals
  logic [NB_MASTER-1:0][AXI_ID_WIDTH_INIT-1:0] s_master_aw_id;
  logic [NB_MASTER-1:0][AXI_ADDR_WIDTH-1:0]    s_master_aw_addr;
  logic [NB_MASTER-1:0][7:0]                   s_master_aw_len;
  logic [NB_MASTER-1:0][2:0]                   s_master_aw_size;
  logic [NB_MASTER-1:0][1:0]                   s_master_aw_burst;
  logic [NB_MASTER-1:0]                        s_master_aw_lock;
  logic [NB_MASTER-1:0][3:0]                   s_master_aw_cache;
  logic [NB_MASTER-1:0][2:0]                   s_master_aw_prot;
  logic [NB_MASTER-1:0][3:0]                   s_master_aw_region;
  logic [NB_MASTER-1:0][AXI_USER_WIDTH-1:0]    s_master_aw_user;
  logic [NB_MASTER-1:0][3:0]                   s_master_aw_qos;
  logic [NB_MASTER-1:0]                        s_master_aw_valid;
  logic [NB_MASTER-1:0]                        s_master_aw_ready;

  logic [NB_MASTER-1:0][AXI_ID_WIDTH_INIT-1:0] s_master_ar_id;
  logic [NB_MASTER-1:0][AXI_ADDR_WIDTH-1:0]    s_master_ar_addr;
  logic [NB_MASTER-1:0][7:0]                   s_master_ar_len;
  logic [NB_MASTER-1:0][2:0]                   s_master_ar_size;
  logic [NB_MASTER-1:0][1:0]                   s_master_ar_burst;
  logic [NB_MASTER-1:0]                        s_master_ar_lock;
  logic [NB_MASTER-1:0][3:0]                   s_master_ar_cache;
  logic [NB_MASTER-1:0][2:0]                   s_master_ar_prot;
  logic [NB_MASTER-1:0][3:0]                   s_master_ar_region;
  logic [NB_MASTER-1:0][AXI_USER_WIDTH-1:0]    s_master_ar_user;
  logic [NB_MASTER-1:0][3:0]                   s_master_ar_qos;
  logic [NB_MASTER-1:0]                        s_master_ar_valid;
  logic [NB_MASTER-1:0]                        s_master_ar_ready;

  logic [NB_MASTER-1:0][AXI_DATA_WIDTH-1:0]    s_master_w_data;
  logic [NB_MASTER-1:0][AXI_STRB_WIDTH-1:0]    s_master_w_strb;
  logic [NB_MASTER-1:0]                        s_master_w_last;
  logic [NB_MASTER-1:0][AXI_USER_WIDTH-1:0]    s_master_w_user;
  logic [NB_MASTER-1:0]                        s_master_w_valid;
  logic [NB_MASTER-1:0]                        s_master_w_ready;

  logic [NB_MASTER-1:0][AXI_ID_WIDTH_INIT-1:0] s_master_b_id;
  logic [NB_MASTER-1:0][1:0]                   s_master_b_resp;
  logic [NB_MASTER-1:0]                        s_master_b_valid;
  logic [NB_MASTER-1:0][AXI_USER_WIDTH-1:0]    s_master_b_user;
  logic [NB_MASTER-1:0]                        s_master_b_ready;

  logic [NB_MASTER-1:0][AXI_ID_WIDTH_INIT-1:0] s_master_r_id;
  logic [NB_MASTER-1:0][AXI_DATA_WIDTH-1:0]    s_master_r_data;
  logic [NB_MASTER-1:0][1:0]                   s_master_r_resp;
  logic [NB_MASTER-1:0]                        s_master_r_last;
  logic [NB_MASTER-1:0][AXI_USER_WIDTH-1:0]    s_master_r_user;
  logic [NB_MASTER-1:0]                        s_master_r_valid;
  logic [NB_MASTER-1:0]                        s_master_r_ready;

  // Signals from AXI masters
  logic [NB_SLAVE-1:0][AXI_ID_WIDTH_TARG-1:0] s_slave_aw_id;
  logic [NB_SLAVE-1:0][AXI_ADDR_WIDTH-1:0]    s_slave_aw_addr;
  logic [NB_SLAVE-1:0][7:0]                   s_slave_aw_len;
  logic [NB_SLAVE-1:0][2:0]                   s_slave_aw_size;
  logic [NB_SLAVE-1:0][1:0]                   s_slave_aw_burst;
  logic [NB_SLAVE-1:0]                        s_slave_aw_lock;
  logic [NB_SLAVE-1:0][3:0]                   s_slave_aw_cache;
  logic [NB_SLAVE-1:0][2:0]                   s_slave_aw_prot;
  logic [NB_SLAVE-1:0][3:0]                   s_slave_aw_region;
  logic [NB_SLAVE-1:0][AXI_USER_WIDTH-1:0]    s_slave_aw_user;
  logic [NB_SLAVE-1:0][3:0]                   s_slave_aw_qos;
  logic [NB_SLAVE-1:0]                        s_slave_aw_valid;
  logic [NB_SLAVE-1:0]                        s_slave_aw_ready;

  logic [NB_SLAVE-1:0][AXI_ID_WIDTH_TARG-1:0] s_slave_ar_id;
  logic [NB_SLAVE-1:0][AXI_ADDR_WIDTH-1:0]    s_slave_ar_addr;
  logic [NB_SLAVE-1:0][7:0]                   s_slave_ar_len;
  logic [NB_SLAVE-1:0][2:0]                   s_slave_ar_size;
  logic [NB_SLAVE-1:0][1:0]                   s_slave_ar_burst;
  logic [NB_SLAVE-1:0]                        s_slave_ar_lock;
  logic [NB_SLAVE-1:0][3:0]                   s_slave_ar_cache;
  logic [NB_SLAVE-1:0][2:0]                   s_slave_ar_prot;
  logic [NB_SLAVE-1:0][3:0]                   s_slave_ar_region;
  logic [NB_SLAVE-1:0][AXI_USER_WIDTH-1:0]    s_slave_ar_user;
  logic [NB_SLAVE-1:0][3:0]                   s_slave_ar_qos;
  logic [NB_SLAVE-1:0]                        s_slave_ar_valid;
  logic [NB_SLAVE-1:0]                        s_slave_ar_ready;

  logic [NB_SLAVE-1:0][AXI_DATA_WIDTH-1:0]    s_slave_w_data;
  logic [NB_SLAVE-1:0][AXI_STRB_WIDTH-1:0]    s_slave_w_strb;
  logic [NB_SLAVE-1:0]                        s_slave_w_last;
  logic [NB_SLAVE-1:0][AXI_USER_WIDTH-1:0]    s_slave_w_user;
  logic [NB_SLAVE-1:0]                        s_slave_w_valid;
  logic [NB_SLAVE-1:0]                        s_slave_w_ready;

  logic [NB_SLAVE-1:0][AXI_ID_WIDTH_TARG-1:0] s_slave_b_id;
  logic [NB_SLAVE-1:0][1:0]                   s_slave_b_resp;
  logic [NB_SLAVE-1:0]                        s_slave_b_valid;
  logic [NB_SLAVE-1:0][AXI_USER_WIDTH-1:0]    s_slave_b_user;
  logic [NB_SLAVE-1:0]                        s_slave_b_ready;

  logic [NB_SLAVE-1:0][AXI_ID_WIDTH_TARG-1:0] s_slave_r_id;
  logic [NB_SLAVE-1:0][AXI_DATA_WIDTH-1:0]    s_slave_r_data;
  logic [NB_SLAVE-1:0][1:0]                   s_slave_r_resp;
  logic [NB_SLAVE-1:0]                        s_slave_r_last;
  logic [NB_SLAVE-1:0][AXI_USER_WIDTH-1:0]    s_slave_r_user;
  logic [NB_SLAVE-1:0]                        s_slave_r_valid;
  logic [NB_SLAVE-1:0]                        s_slave_r_ready;

  // Signals Used to configure the AXI node
  logic [NB_REGION-1:0][NB_MASTER-1:0][AXI_ADDR_WIDTH-1:0] s_start_addr;
  logic [NB_REGION-1:0][NB_MASTER-1:0][AXI_ADDR_WIDTH-1:0] s_end_addr;
  logic [NB_REGION-1:0][NB_MASTER-1:0]                     s_valid_rule;
  logic [NB_SLAVE-1:0][NB_MASTER-1:0]                      s_connectivity_map;

  // Master 0
  assign                        instr_aw_id[AXI_ID_WIDTH_INIT-1:0] = s_master_aw_id[0];
  assign                        instr_aw_addr                      = s_master_aw_addr[0];
  assign                        instr_aw_len                       = s_master_aw_len[0];
  assign                        instr_aw_size                      = s_master_aw_size[0];
  assign                        instr_aw_burst                     = s_master_aw_burst[0];
  assign                        instr_aw_lock                      = s_master_aw_lock[0];
  assign                        instr_aw_cache                     = s_master_aw_cache[0];
  assign                        instr_aw_prot                      = s_master_aw_prot[0];
  assign                        instr_aw_region                    = s_master_aw_region[0];
  assign                        instr_aw_user                      = s_master_aw_user[0];
  assign                        instr_aw_qos                       = s_master_aw_qos[0];
  assign                        instr_aw_valid                     = s_master_aw_valid[0];
  assign 						s_master_aw_ready[0] 			   = instr_aw_ready;

  assign                        instr_ar_id[AXI_ID_WIDTH_INIT-1:0] = s_master_ar_id[0];
  assign                        instr_ar_addr                      = s_master_ar_addr[0];
  assign                        instr_ar_len                       = s_master_ar_len[0];
  assign                        instr_ar_size                      = s_master_ar_size[0];
  assign                        instr_ar_burst                     = s_master_ar_burst[0];
  assign                        instr_ar_lock                      = s_master_ar_lock[0];
  assign                        instr_ar_cache                     = s_master_ar_cache[0];
  assign                        instr_ar_prot                      = s_master_ar_prot[0];
  assign                        instr_ar_region                    = s_master_ar_region[0];
  assign                        instr_ar_user                      = s_master_ar_user[0];
  assign                        instr_ar_qos                       = s_master_ar_qos[0];
  assign                        instr_ar_valid                     = s_master_ar_valid[0];
  assign 						s_master_ar_ready[0] 			   = instr_ar_ready;

  assign                        instr_w_data  = s_master_w_data[0];
  assign                        instr_w_strb  = s_master_w_strb[0];
  assign                        instr_w_last  = s_master_w_last[0];
  assign                        instr_w_user  = s_master_w_user[0];
  assign                        instr_w_valid = s_master_w_valid[0];
  assign 						s_master_w_ready[0]  = instr_w_ready;

  assign s_master_b_id[0]     = instr_b_id[AXI_ID_WIDTH_INIT-1:0];
  assign s_master_b_resp[0]   = instr_b_resp;
  assign s_master_b_valid[0]  = instr_b_valid;
  assign s_master_b_user[0]   = instr_b_user;
  assign instr_b_ready 		  = s_master_b_ready[0];

  assign s_master_r_id[0]     = instr_r_id[AXI_ID_WIDTH_INIT-1:0];
  assign s_master_r_data[0]   = instr_r_data;
  assign s_master_r_resp[0]   = instr_r_resp;
  assign s_master_r_last[0]   = instr_r_last;
  assign s_master_r_user[0]   = instr_r_user;
  assign s_master_r_valid[0]  = instr_r_valid;
  assign instr_r_ready 		  = s_master_r_ready[0];

  assign s_start_addr[0][0] = start_addr_i[0];
  assign s_end_addr[0][0]   = end_addr_i[0];

  // Master 1
  assign                        data_aw_id[AXI_ID_WIDTH_INIT-1:0] = s_master_aw_id[1];
  assign                        data_aw_addr                      = s_master_aw_addr[1];
  assign                        data_aw_len                       = s_master_aw_len[1];
  assign                        data_aw_size                      = s_master_aw_size[1];
  assign                        data_aw_burst                     = s_master_aw_burst[1];
  assign                        data_aw_lock                      = s_master_aw_lock[1];
  assign                        data_aw_cache                     = s_master_aw_cache[1];
  assign                        data_aw_prot                      = s_master_aw_prot[1];
  assign                        data_aw_region                    = s_master_aw_region[1];
  assign                        data_aw_user                      = s_master_aw_user[1];
  assign                        data_aw_qos                       = s_master_aw_qos[1];
  assign                        data_aw_valid                     = s_master_aw_valid[1];
  assign 						s_master_aw_ready[1] 			  = data_aw_ready;

  assign                        data_ar_id[AXI_ID_WIDTH_INIT-1:0] = s_master_ar_id[1];
  assign                        data_ar_addr                      = s_master_ar_addr[1];
  assign                        data_ar_len                       = s_master_ar_len[1];
  assign                        data_ar_size                      = s_master_ar_size[1];
  assign                        data_ar_burst                     = s_master_ar_burst[1];
  assign                        data_ar_lock                      = s_master_ar_lock[1];
  assign                        data_ar_cache                     = s_master_ar_cache[1];
  assign                        data_ar_prot                      = s_master_ar_prot[1];
  assign                        data_ar_region                    = s_master_ar_region[1];
  assign                        data_ar_user                      = s_master_ar_user[1];
  assign                        data_ar_qos                       = s_master_ar_qos[1];
  assign                        data_ar_valid                     = s_master_ar_valid[1];
  assign 						s_master_ar_ready[1] 			  = data_ar_ready;

  assign                        data_w_data  = s_master_w_data[1];
  assign                        data_w_strb  = s_master_w_strb[1];
  assign                        data_w_last  = s_master_w_last[1];
  assign                        data_w_user  = s_master_w_user[1];
  assign                        data_w_valid = s_master_w_valid[1];
  assign 						s_master_w_ready[1]  = data_w_ready;

  assign s_master_b_id[1]     = data_b_id[AXI_ID_WIDTH_INIT-1:0];
  assign s_master_b_resp[1]   = data_b_resp;
  assign s_master_b_valid[1]  = data_b_valid;
  assign s_master_b_user[1]   = data_b_user;
  assign                        data_b_ready = s_master_b_ready[1];

  assign s_master_r_id[1]     = data_r_id[AXI_ID_WIDTH_INIT-1:0];
  assign s_master_r_data[1]   = data_r_data;
  assign s_master_r_resp[1]   = data_r_resp;
  assign s_master_r_last[1]   = data_r_last;
  assign s_master_r_user[1]   = data_r_user;
  assign s_master_r_valid[1]  = data_r_valid;
  assign                        data_r_ready = s_master_r_ready[1];

  assign s_start_addr[0][1] = start_addr_i[1];
  assign s_end_addr[0][1]   = end_addr_i[1];

  // Master 2
  assign                        slave_aw_id[AXI_ID_WIDTH_INIT-1:0] = s_master_aw_id[2];
  assign                        slave_aw_addr                      = s_master_aw_addr[2];
  assign                        slave_aw_len                       = s_master_aw_len[2];
  assign                        slave_aw_size                      = s_master_aw_size[2];
  assign                        slave_aw_burst                     = s_master_aw_burst[2];
  assign                        slave_aw_lock                      = s_master_aw_lock[2];
  assign                        slave_aw_cache                     = s_master_aw_cache[2];
  assign                        slave_aw_prot                      = s_master_aw_prot[2];
  assign                        slave_aw_region                    = s_master_aw_region[2];
  assign                        slave_aw_user                      = s_master_aw_user[2];
  assign                        slave_aw_qos                       = s_master_aw_qos[2];
  assign                        slave_aw_valid                     = s_master_aw_valid[2];
  assign s_master_aw_ready[2] = slave_aw_ready;

  assign                        slave_ar_id[AXI_ID_WIDTH_INIT-1:0] = s_master_ar_id[2];
  assign                        slave_ar_addr                      = s_master_ar_addr[2];
  assign                        slave_ar_len                       = s_master_ar_len[2];
  assign                        slave_ar_size                      = s_master_ar_size[2];
  assign                        slave_ar_burst                     = s_master_ar_burst[2];
  assign                        slave_ar_lock                      = s_master_ar_lock[2];
  assign                        slave_ar_cache                     = s_master_ar_cache[2];
  assign                        slave_ar_prot                      = s_master_ar_prot[2];
  assign                        slave_ar_region                    = s_master_ar_region[2];
  assign                        slave_ar_user                      = s_master_ar_user[2];
  assign                        slave_ar_qos                       = s_master_ar_qos[2];
  assign                        slave_ar_valid                     = s_master_ar_valid[2];
  assign s_master_ar_ready[2] = slave_ar_ready;

  assign                        slave_w_data  = s_master_w_data[2];
  assign                        slave_w_strb  = s_master_w_strb[2];
  assign                        slave_w_last  = s_master_w_last[2];
  assign                        slave_w_user  = s_master_w_user[2];
  assign                        slave_w_valid = s_master_w_valid[2];
  assign s_master_w_ready[2]  = slave_w_ready;

  assign s_master_b_id[2]     = slave_b_id[AXI_ID_WIDTH_INIT-1:0];
  assign s_master_b_resp[2]   = slave_b_resp;
  assign s_master_b_valid[2]  = slave_b_valid;
  assign s_master_b_user[2]   = slave_b_user;
  assign                        slave_b_ready = s_master_b_ready[2];

  assign s_master_r_id[2]     = slave_r_id[AXI_ID_WIDTH_INIT-1:0];
  assign s_master_r_data[2]   = slave_r_data;
  assign s_master_r_resp[2]   = slave_r_resp;
  assign s_master_r_last[2]   = slave_r_last;
  assign s_master_r_user[2]   = slave_r_user;
  assign s_master_r_valid[2]  = slave_r_valid;
  assign                        slave_r_ready = s_master_r_ready[2];

  assign s_start_addr[0][2] = start_addr_i[2];
  assign s_end_addr[0][2]   = end_addr_i[2];

  // Slave 0
  assign s_slave_aw_id[0]     = core_master_aw_id[AXI_ID_WIDTH_TARG-1:0];
  assign s_slave_aw_addr[0]   = core_master_aw_addr;
  assign s_slave_aw_len[0]    = core_master_aw_len;
  assign s_slave_aw_size[0]   = core_master_aw_size;
  assign s_slave_aw_burst[0]  = core_master_aw_burst;
  assign s_slave_aw_lock[0]   = core_master_aw_lock;
  assign s_slave_aw_cache[0]  = core_master_aw_cache;
  assign s_slave_aw_prot[0]   = core_master_aw_prot;
  assign s_slave_aw_region[0] = core_master_aw_region;
  assign s_slave_aw_user[0]   = core_master_aw_user;
  assign s_slave_aw_qos[0]    = core_master_aw_qos;
  assign s_slave_aw_valid[0]  = core_master_aw_valid;
  assign                        core_master_aw_ready = s_slave_aw_ready[0];

  assign s_slave_ar_id[0]     = core_master_ar_id[AXI_ID_WIDTH_TARG-1:0];
  assign s_slave_ar_addr[0]   = core_master_ar_addr;
  assign s_slave_ar_len[0]    = core_master_ar_len;
  assign s_slave_ar_size[0]   = core_master_ar_size;
  assign s_slave_ar_burst[0]  = core_master_ar_burst;
  assign s_slave_ar_lock[0]   = core_master_ar_lock;
  assign s_slave_ar_cache[0]  = core_master_ar_cache;
  assign s_slave_ar_prot[0]   = core_master_ar_prot;
  assign s_slave_ar_region[0] = core_master_ar_region;
  assign s_slave_ar_user[0]   = core_master_ar_user;
  assign s_slave_ar_qos[0]    = core_master_ar_qos;
  assign s_slave_ar_valid[0]  = core_master_ar_valid;
  assign                        core_master_ar_ready = s_slave_ar_ready[0];

  assign s_slave_w_data[0]    = core_master_w_data;
  assign s_slave_w_strb[0]    = core_master_w_strb;
  assign s_slave_w_last[0]    = core_master_w_last;
  assign s_slave_w_user[0]    = core_master_w_user;
  assign s_slave_w_valid[0]   = core_master_w_valid;
  assign                        core_master_w_ready = s_slave_w_ready[0];

  assign                        core_master_b_id[AXI_ID_WIDTH_TARG-1:0] = s_slave_b_id[0];
  assign                        core_master_b_resp                      = s_slave_b_resp[0];
  assign                        core_master_b_valid                     = s_slave_b_valid[0];
  assign                        core_master_b_user                      = s_slave_b_user[0];
  assign s_slave_b_ready[0]   = core_master_b_ready;

  assign                        core_master_r_id[AXI_ID_WIDTH_TARG-1:0] = s_slave_r_id[0];
  assign                        core_master_r_data                      = s_slave_r_data[0];
  assign                        core_master_r_resp                      = s_slave_r_resp[0];
  assign                        core_master_r_last                      = s_slave_r_last[0];
  assign                        core_master_r_user                      = s_slave_r_user[0];
  assign                        core_master_r_valid                     = s_slave_r_valid[0];
  assign s_slave_r_ready[0]   = core_master_r_ready;

  // Slave 1
  assign s_slave_aw_id[1]     = dbg_aw_id[AXI_ID_WIDTH_TARG-1:0];
  assign s_slave_aw_addr[1]   = dbg_aw_addr;
  assign s_slave_aw_len[1]    = dbg_aw_len;
  assign s_slave_aw_size[1]   = dbg_aw_size;
  assign s_slave_aw_burst[1]  = dbg_aw_burst;
  assign s_slave_aw_lock[1]   = dbg_aw_lock;
  assign s_slave_aw_cache[1]  = dbg_aw_cache;
  assign s_slave_aw_prot[1]   = dbg_aw_prot;
  assign s_slave_aw_region[1] = dbg_aw_region;
  assign s_slave_aw_user[1]   = dbg_aw_user;
  assign s_slave_aw_qos[1]    = dbg_aw_qos;
  assign s_slave_aw_valid[1]  = dbg_aw_valid;
  assign                        dbg_aw_ready = s_slave_aw_ready[1];

  assign s_slave_ar_id[1]     = dbg_ar_id[AXI_ID_WIDTH_TARG-1:0];
  assign s_slave_ar_addr[1]   = dbg_ar_addr;
  assign s_slave_ar_len[1]    = dbg_ar_len;
  assign s_slave_ar_size[1]   = dbg_ar_size;
  assign s_slave_ar_burst[1]  = dbg_ar_burst;
  assign s_slave_ar_lock[1]   = dbg_ar_lock;
  assign s_slave_ar_cache[1]  = dbg_ar_cache;
  assign s_slave_ar_prot[1]   = dbg_ar_prot;
  assign s_slave_ar_region[1] = dbg_ar_region;
  assign s_slave_ar_user[1]   = dbg_ar_user;
  assign s_slave_ar_qos[1]    = dbg_ar_qos;
  assign s_slave_ar_valid[1]  = dbg_ar_valid;
  assign                        dbg_ar_ready = s_slave_ar_ready[1];

  assign s_slave_w_data[1]    = dbg_w_data;
  assign s_slave_w_strb[1]    = dbg_w_strb;
  assign s_slave_w_last[1]    = dbg_w_last;
  assign s_slave_w_user[1]    = dbg_w_user;
  assign s_slave_w_valid[1]   = dbg_w_valid;
  assign                        dbg_w_ready = s_slave_w_ready[1];

  assign                        dbg_b_id[AXI_ID_WIDTH_TARG-1:0] = s_slave_b_id[1];
  assign                        dbg_b_resp                      = s_slave_b_resp[1];
  assign                        dbg_b_valid                     = s_slave_b_valid[1];
  assign                        dbg_b_user                      = s_slave_b_user[1];
  assign s_slave_b_ready[1]   = dbg_b_ready;

  assign                        dbg_r_id[AXI_ID_WIDTH_TARG-1:0] = s_slave_r_id[1];
  assign                        dbg_r_data                      = s_slave_r_data[1];
  assign                        dbg_r_resp                      = s_slave_r_resp[1];
  assign                        dbg_r_last                      = s_slave_r_last[1];
  assign                        dbg_r_user                      = s_slave_r_user[1];
  assign                        dbg_r_valid                     = s_slave_r_valid[1];
  assign s_slave_r_ready[1]   = dbg_r_ready;

  // Master 2
  assign s_slave_aw_id[2]     = aw_id[AXI_ID_WIDTH_TARG-1:0];
  assign s_slave_aw_addr[2]   = aw_addr;
  assign s_slave_aw_len[2]    = aw_len;
  assign s_slave_aw_size[2]   = aw_size;
  assign s_slave_aw_burst[2]  = aw_burst;
  assign s_slave_aw_lock[2]   = aw_lock;
  assign s_slave_aw_cache[2]  = aw_cache;
  assign s_slave_aw_prot[2]   = aw_prot;
  assign s_slave_aw_region[2] = aw_region;
  assign s_slave_aw_user[2]   = aw_user;
  assign s_slave_aw_qos[2]    = aw_qos;
  assign s_slave_aw_valid[2]  = aw_valid;
  assign aw_ready = s_slave_aw_ready[2];

  assign s_slave_ar_id[2]     = ar_id[AXI_ID_WIDTH_TARG-1:0];
  assign s_slave_ar_addr[2]   = ar_addr;
  assign s_slave_ar_len[2]    = ar_len;
  assign s_slave_ar_size[2]   = ar_size;
  assign s_slave_ar_burst[2]  = ar_burst;
  assign s_slave_ar_lock[2]   = ar_lock;
  assign s_slave_ar_cache[2]  = ar_cache;
  assign s_slave_ar_prot[2]   = ar_prot;
  assign s_slave_ar_region[2] = ar_region;
  assign s_slave_ar_user[2]   = ar_user;
  assign s_slave_ar_qos[2]    = ar_qos;
  assign s_slave_ar_valid[2]  = ar_valid;
  assign                        ar_ready = s_slave_ar_ready[2];

  assign s_slave_w_data[2]    = w_data;
  assign s_slave_w_strb[2]    = w_strb;
  assign s_slave_w_last[2]    = w_last;
  assign s_slave_w_user[2]    = w_user;
  assign s_slave_w_valid[2]   = w_valid;
  assign                        w_ready = s_slave_w_ready[2];

  assign                        b_id[AXI_ID_WIDTH_TARG-1:0] = s_slave_b_id[2];
  assign                        b_resp                      = s_slave_b_resp[2];
  assign                        b_valid                     = s_slave_b_valid[2];
  assign                        b_user                      = s_slave_b_user[2];
  assign s_slave_b_ready[2]   = b_ready;

  assign                        r_id[AXI_ID_WIDTH_TARG-1:0] = s_slave_r_id[2];
  assign                        r_data                      = s_slave_r_data[2];
  assign                        r_resp                      = s_slave_r_resp[2];
  assign                        r_last                      = s_slave_r_last[2];
  assign                        r_user                      = s_slave_r_user[2];
  assign                        r_valid                     = s_slave_r_valid[2];
  assign s_slave_r_ready[2]   = r_ready;

  axi_node
  #(
    .AXI_ADDRESS_W      ( AXI_ADDR_WIDTH    ),
    .AXI_DATA_W         ( AXI_DATA_WIDTH    ),
    .N_MASTER_PORT      ( NB_MASTER         ),
    .N_SLAVE_PORT       ( NB_SLAVE          ),
    .AXI_ID_IN          ( AXI_ID_WIDTH_TARG ),
    .AXI_USER_W         ( AXI_USER_WIDTH    ),
    .N_REGION           ( NB_REGION         )
  )
  axi_node_i
  (
    .clk                    ( clk                ),
    .rst_n                  ( rst_n              ),
    .test_en_i              ( test_en_i          ),

    .slave_awid_i           ( s_slave_aw_id      ),
    .slave_awaddr_i         ( s_slave_aw_addr    ),
    .slave_awlen_i          ( s_slave_aw_len     ),
    .slave_awsize_i         ( s_slave_aw_size    ),
    .slave_awburst_i        ( s_slave_aw_burst   ),
    .slave_awlock_i         ( s_slave_aw_lock    ),
    .slave_awcache_i        ( s_slave_aw_cache   ),
    .slave_awprot_i         ( s_slave_aw_prot    ),
    .slave_awregion_i       ( s_slave_aw_region  ),
    .slave_awqos_i          ( s_slave_aw_qos     ),
    .slave_awuser_i         ( s_slave_aw_user    ),
    .slave_awvalid_i        ( s_slave_aw_valid   ),
    .slave_awready_o        ( s_slave_aw_ready   ),

    .slave_wdata_i          ( s_slave_w_data     ),
    .slave_wstrb_i          ( s_slave_w_strb     ),
    .slave_wlast_i          ( s_slave_w_last     ),
    .slave_wuser_i          ( s_slave_w_user     ),
    .slave_wvalid_i         ( s_slave_w_valid    ),
    .slave_wready_o         ( s_slave_w_ready    ),

    .slave_bid_o            ( s_slave_b_id       ),
    .slave_bresp_o          ( s_slave_b_resp     ),
    .slave_buser_o          ( s_slave_b_user     ),
    .slave_bvalid_o         ( s_slave_b_valid    ),
    .slave_bready_i         ( s_slave_b_ready    ),

    .slave_arid_i           ( s_slave_ar_id      ),
    .slave_araddr_i         ( s_slave_ar_addr    ),
    .slave_arlen_i          ( s_slave_ar_len     ),
    .slave_arsize_i         ( s_slave_ar_size    ),
    .slave_arburst_i        ( s_slave_ar_burst   ),
    .slave_arlock_i         ( s_slave_ar_lock    ),
    .slave_arcache_i        ( s_slave_ar_cache   ),
    .slave_arprot_i         ( s_slave_ar_prot    ),
    .slave_arregion_i       ( s_slave_ar_region  ),
    .slave_aruser_i         ( s_slave_ar_user    ),
    .slave_arqos_i          ( s_slave_ar_qos     ),
    .slave_arvalid_i        ( s_slave_ar_valid   ),
    .slave_arready_o        ( s_slave_ar_ready   ),

    .slave_rid_o            ( s_slave_r_id       ),
    .slave_rdata_o          ( s_slave_r_data     ),
    .slave_rresp_o          ( s_slave_r_resp     ),
    .slave_rlast_o          ( s_slave_r_last     ),
    .slave_ruser_o          ( s_slave_r_user     ),
    .slave_rvalid_o         ( s_slave_r_valid    ),
    .slave_rready_i         ( s_slave_r_ready    ),

    .master_awid_o          ( s_master_aw_id     ),
    .master_awaddr_o        ( s_master_aw_addr   ),
    .master_awlen_o         ( s_master_aw_len    ),
    .master_awsize_o        ( s_master_aw_size   ),
    .master_awburst_o       ( s_master_aw_burst  ),
    .master_awlock_o        ( s_master_aw_lock   ),
    .master_awcache_o       ( s_master_aw_cache  ),
    .master_awprot_o        ( s_master_aw_prot   ),
    .master_awregion_o      ( s_master_aw_region ),
    .master_awqos_o         ( s_master_aw_qos    ),
    .master_awuser_o        ( s_master_aw_user   ),
    .master_awvalid_o       ( s_master_aw_valid  ),
    .master_awready_i       ( s_master_aw_ready  ),

    .master_wdata_o         ( s_master_w_data    ),
    .master_wstrb_o         ( s_master_w_strb    ),
    .master_wlast_o         ( s_master_w_last    ),
    .master_wuser_o         ( s_master_w_user    ),
    .master_wvalid_o        ( s_master_w_valid   ),
    .master_wready_i        ( s_master_w_ready   ),

    .master_bid_i           ( s_master_b_id      ),
    .master_bresp_i         ( s_master_b_resp    ),
    .master_buser_i         ( s_master_b_user    ),
    .master_bvalid_i        ( s_master_b_valid   ),
    .master_bready_o        ( s_master_b_ready   ),

    .master_arid_o          ( s_master_ar_id     ),
    .master_araddr_o        ( s_master_ar_addr   ),
    .master_arlen_o         ( s_master_ar_len    ),
    .master_arsize_o        ( s_master_ar_size   ),
    .master_arburst_o       ( s_master_ar_burst  ),
    .master_arlock_o        ( s_master_ar_lock   ),
    .master_arcache_o       ( s_master_ar_cache  ),
    .master_arprot_o        ( s_master_ar_prot   ),
    .master_arregion_o      ( s_master_ar_region ),
    .master_aruser_o        ( s_master_ar_user   ),
    .master_arqos_o         ( s_master_ar_qos    ),
    .master_arvalid_o       ( s_master_ar_valid  ),
    .master_arready_i       ( s_master_ar_ready  ),

    .master_rid_i           ( s_master_r_id      ),
    .master_rdata_i         ( s_master_r_data    ),
    .master_rresp_i         ( s_master_r_resp    ),
    .master_rlast_i         ( s_master_r_last    ),
    .master_ruser_i         ( s_master_r_user    ),
    .master_rvalid_i        ( s_master_r_valid   ),
    .master_rready_o        ( s_master_r_ready   ),

    .cfg_START_ADDR_i       ( s_start_addr       ),
    .cfg_END_ADDR_i         ( s_end_addr         ),
    .cfg_valid_rule_i       ( s_valid_rule       ),
    .cfg_connectivity_map_i ( s_connectivity_map )
  );


  assign s_valid_rule       = '1;
  assign s_connectivity_map = '1;

endmodule

