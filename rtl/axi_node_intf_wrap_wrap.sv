//-----------------------------------------------------------------------------
// File          : axi_node_intf_wrap.v
// Creation date : 12.08.2016
// Creation time : 11:49:25
// Description   : 
// Created by    : Arto Oinonen
// Tool : Kactus2 3.1.13 32-bit
// Plugin : Verilog generator 1.4
// This file was generated based on IP-XACT component pulpino-project.org:ip.hwp.wrap:axi_node_intf_wrap:1.0
// whose XML file is P:/pulpinoexperiment/ip-xact/pulp-platform/ip.hwp.wrap/axi_node_intf_wrap/1.0/axi_node_intf_wrap.1.0.xml
//-----------------------------------------------------------------------------

// TODO: will be replaced by Kactus2
`include "axi_bus.sv"

module axi_node_intf_wrap_wrap #(
    parameter                              NB_MASTER           = 4,
    parameter                              NB_SLAVE            = 4,
    parameter                              AXI_ADDR_WIDTH      = 32,
    parameter                              AXI_DATA_WIDTH      = 32,
    parameter                              AXI_MASTER_ID_WIDTH = 10,
    parameter                              AXI_SLAVE_ID_WIDTH  = 10,
    parameter                              AXI_USER_WIDTH      = 1
) (
    // Interface: axi_core_slave
    input  logic   [AXI_ADDR_WIDTH-1:0] ARADDR_core_in,
    input  logic   [1:0]                ARBURST_core_in,
    input  logic   [3:0]                ARCACHE_core_in,
    input  logic   [AXI_MASTER_ID_WIDTH-1:0]   ARID_core_in,
    input  logic   [7:0]                ARLEN_core_in,
    input  logic                        ARLOCK_core_in,
    input  logic   [2:0]                ARPROT_core_in,
    input  logic   [3:0]                ARQOS_core_in,
    input  logic   [3:0]                ARREGION_core_in,
    input  logic   [2:0]                ARSIZE_core_in,
    input  logic   [AXI_USER_WIDTH-1:0] ARUSER_core_in,
    input  logic                        ARVALID_core_in,
    input  logic   [AXI_ADDR_WIDTH-1:0] AWADDR_core_in,
    input  logic   [1:0]                AWBURST_core_in,
    input  logic   [3:0]                AWCACHE_core_in,
    input  logic   [AXI_MASTER_ID_WIDTH-1:0]   AWID_core_in,
    input  logic   [7:0]                AWLEN_core_in,
    input  logic                        AWLOCK_core_in,
    input  logic   [2:0]                AWPROT_core_in,
    input  logic   [3:0]                AWQOS_core_in,
    input  logic   [3:0]                AWREGION_core_in,
    input  logic   [2:0]                AWSIZE_core_in,
    input  logic   [AXI_USER_WIDTH-1:0] AWUSER_core_in,
    input  logic                        AWVALID_core_in,
    input  logic                        BREADY_core_in,
    input  logic                        RREADY_core_in,
    input  logic   [AXI_DATA_WIDTH-1:0] WDATA_core_in,
    input  logic                        WLAST_core_in,
    input  logic   [AXI_DATA_WIDTH/8-1:0] WSTRB_core_in,
    input  logic   [AXI_USER_WIDTH-1:0] WUSER_core_in,
    input  logic                        WVALID_core_in,
    output logic                        ARREADY_core_out,
    output logic                        AWREADY_core_out,
    output logic   [AXI_MASTER_ID_WIDTH-1:0]   BID_core_out,
    output logic   [1:0]                BRESP_core_out,
    output logic   [AXI_USER_WIDTH-1:0] BUSER_core_out,
    output logic                        BVALID_core_out,
    output logic   [AXI_DATA_WIDTH-1:0] RDATA_core_out,
    output logic   [AXI_MASTER_ID_WIDTH-1:0]   RID_core_out,
    output logic                        RLAST_core_out,
    output logic   [1:0]                RRESP_core_out,
    output logic   [AXI_USER_WIDTH-1:0] RUSER_core_out,
    output logic                        RVALID_core_out,
    output logic                        WREADY_core_out,

    // Interface: axi_data_master
    input  logic                        ARREADY_data_in,
    input  logic                        AWREADY_data_in,
    input  logic   [AXI_SLAVE_ID_WIDTH-1:0]   BID_data_in,
    input  logic   [1:0]                BRESP_data_in,
    input  logic   [AXI_USER_WIDTH-1:0] BUSER_data_in,
    input  logic                        BVALID_data_in,
    input  logic   [AXI_DATA_WIDTH-1:0] RDATA_data_in,
    input  logic   [AXI_SLAVE_ID_WIDTH-1:0]   RID_data_in,
    input  logic                        RLAST_data_in,
    input  logic   [1:0]                RRESP_data_in,
    input  logic   [AXI_USER_WIDTH-1:0] RUSER_data_in,
    input  logic                        RVALID_data_in,
    input  logic                        WREADY_data_in,
    output logic   [AXI_ADDR_WIDTH-1:0] ARADDR_data_out,
    output logic   [1:0]                ARBURST_data_out,
    output logic   [3:0]                ARCACHE_data_out,
    output logic   [AXI_SLAVE_ID_WIDTH-1:0]   ARID_data_out,
    output logic   [7:0]                ARLEN_data_out,
    output logic                        ARLOCK_data_out,
    output logic   [2:0]                ARPROT_data_out,
    output logic   [3:0]                ARQOS_data_out,
    output logic   [3:0]                ARREGION_data_out,
    output logic   [2:0]                ARSIZE_data_out,
    output logic   [AXI_USER_WIDTH-1:0] ARUSER_data_out,
    output logic                        ARVALID_data_out,
    output logic   [AXI_ADDR_WIDTH-1:0] AWADDR_data_out,
    output logic   [1:0]                AWBURST_data_out,
    output logic   [3:0]                AWCACHE_data_out,
    output logic   [AXI_SLAVE_ID_WIDTH-1:0]   AWID_data_out,
    output logic   [7:0]                AWLEN_data_out,
    output logic                        AWLOCK_data_out,
    output logic   [2:0]                AWPROT_data_out,
    output logic   [3:0]                AWQOS_data_out,
    output logic   [3:0]                AWREGION_data_out,
    output logic   [2:0]                AWSIZE_data_out,
    output logic   [AXI_USER_WIDTH-1:0] AWUSER_data_out,
    output logic                        AWVALID_data_out,
    output logic                        BREADY_data_out,
    output logic                        RREADY_data_out,
    output logic   [AXI_DATA_WIDTH-1:0] WDATA_data_out,
    output logic                        WLAST_data_out,
    output logic   [AXI_DATA_WIDTH/8-1:0] WSTRB_data_out,
    output logic   [AXI_USER_WIDTH-1:0] WUSER_data_out,
    output logic                        WVALID_data_out,

    // Interface: axi_dbg_slave
    input  logic   [AXI_ADDR_WIDTH-1:0] ARADDR_dbg_in,
    input  logic   [1:0]                ARBURST_dbg_in,
    input  logic   [3:0]                ARCACHE_dbg_in,
    input  logic   [AXI_MASTER_ID_WIDTH-1:0]   ARID_dbg_in,
    input  logic   [7:0]                ARLEN_dbg_in,
    input  logic                        ARLOCK_dbg_in,
    input  logic   [2:0]                ARPROT_dbg_in,
    input  logic   [3:0]                ARQOS_dbg_in,
    input  logic   [3:0]                ARREGION_dbg_in,
    input  logic   [2:0]                ARSIZE_dbg_in,
    input  logic   [AXI_USER_WIDTH-1:0] ARUSER_dbg_in,
    input  logic                        ARVALID_dbg_in,
    input  logic   [AXI_ADDR_WIDTH-1:0] AWADDR_dbg_in,
    input  logic   [1:0]                AWBURST_dbg_in,
    input  logic   [3:0]                AWCACHE_dbg_in,
    input  logic   [AXI_MASTER_ID_WIDTH-1:0]   AWID_dbg_in,
    input  logic   [7:0]                AWLEN_dbg_in,
    input  logic                        AWLOCK_dbg_in,
    input  logic   [2:0]                AWPROT_dbg_in,
    input  logic   [3:0]                AWQOS_dbg_in,
    input  logic   [3:0]                AWREGION_dbg_in,
    input  logic   [2:0]                AWSIZE_dbg_in,
    input  logic   [AXI_USER_WIDTH-1:0] AWUSER_dbg_in,
    input  logic                        AWVALID_dbg_in,
    input  logic                        BREADY_dbg_in,
    input  logic                        RREADY_dbg_in,
    input  logic   [AXI_DATA_WIDTH-1:0] WDATA_dbg_in,
    input  logic                        WLAST_dbg_in,
    input  logic   [AXI_DATA_WIDTH/8-1:0] WSTRB_dbg_in,
    input  logic   [AXI_USER_WIDTH-1:0] WUSER_dbg_in,
    input  logic                        WVALID_dbg_in,
    output logic                        ARREADY_dbg_out,
    output logic                        AWREADY_dbg_out,
    output logic   [AXI_MASTER_ID_WIDTH-1:0]   BID_dbg_out,
    output logic   [1:0]                BRESP_dbg_out,
    output logic   [AXI_USER_WIDTH-1:0] BUSER_dbg_out,
    output logic                        BVALID_dbg_out,
    output logic   [AXI_DATA_WIDTH-1:0] RDATA_dbg_out,
    output logic   [AXI_MASTER_ID_WIDTH-1:0]   RID_dbg_out,
    output logic                        RLAST_dbg_out,
    output logic   [1:0]                RRESP_dbg_out,
    output logic   [AXI_USER_WIDTH-1:0] RUSER_dbg_out,
    output logic                        RVALID_dbg_out,
    output logic                        WREADY_dbg_out,

    // Interface: axi_instr_master
    input  logic                        ARREADY_instr_in,
    input  logic                        AWREADY_instr_in,
    input  logic   [AXI_SLAVE_ID_WIDTH-1:0]   BID_instr_in,
    input  logic   [1:0]                BRESP_instr_in,
    input  logic   [AXI_USER_WIDTH-1:0] BUSER_instr_in,
    input  logic                        BVALID_instr_in,
    input  logic   [AXI_DATA_WIDTH-1:0] RDATA_instr_in,
    input  logic   [AXI_SLAVE_ID_WIDTH-1:0]   RID_instr_in,
    input  logic                        RLAST_instr_in,
    input  logic   [1:0]                RRESP_instr_in,
    input  logic   [AXI_USER_WIDTH-1:0] RUSER_instr_in,
    input  logic                        RVALID_instr_in,
    input  logic                        WREADY_instr_in,
    output logic   [AXI_ADDR_WIDTH-1:0] ARADDR_instr_out,
    output logic   [1:0]                ARBURST_instr_out,
    output logic   [3:0]                ARCACHE_instr_out,
    output logic   [AXI_SLAVE_ID_WIDTH-1:0]   ARID_instr_out,
    output logic   [7:0]                ARLEN_instr_out,
    output logic                        ARLOCK_instr_out,
    output logic   [2:0]                ARPROT_instr_out,
    output logic   [3:0]                ARQOS_instr_out,
    output logic   [3:0]                ARREGION_instr_out,
    output logic   [2:0]                ARSIZE_instr_out,
    output logic   [AXI_USER_WIDTH-1:0] ARUSER_instr_out,
    output logic                        ARVALID_instr_out,
    output logic   [AXI_ADDR_WIDTH-1:0] AWADDR_instr_out,
    output logic   [1:0]                AWBURST_instr_out,
    output logic   [3:0]                AWCACHE_instr_out,
    output logic   [AXI_SLAVE_ID_WIDTH-1:0]   AWID_instr_out,
    output logic   [7:0]                AWLEN_instr_out,
    output logic                        AWLOCK_instr_out,
    output logic   [2:0]                AWPROT_instr_out,
    output logic   [3:0]                AWQOS_instr_out,
    output logic   [3:0]                AWREGION_instr_out,
    output logic   [2:0]                AWSIZE_instr_out,
    output logic   [AXI_USER_WIDTH-1:0] AWUSER_instr_out,
    output logic                        AWVALID_instr_out,
    output logic                        BREADY_instr_out,
    output logic                        RREADY_instr_out,
    output logic   [AXI_DATA_WIDTH-1:0] WDATA_instr_out,
    output logic                        WLAST_instr_out,
    output logic   [AXI_DATA_WIDTH/8-1:0] WSTRB_instr_out,
    output logic   [AXI_USER_WIDTH-1:0] WUSER_instr_out,
    output logic                        WVALID_instr_out,

    // Interface: axi_periph_master
    input  logic                        ARREADY_periph_in,
    input  logic                        AWREADY_periph_in,
    input  logic   [AXI_SLAVE_ID_WIDTH-1:0]   BID_periph_in,
    input  logic   [1:0]                BRESP_periph_in,
    input  logic   [AXI_USER_WIDTH-1:0] BUSER_periph_in,
    input  logic                        BVALID_periph_in,
    input  logic   [AXI_DATA_WIDTH-1:0] RDATA_periph_in,
    input  logic   [AXI_SLAVE_ID_WIDTH-1:0]   RID_periph_in,
    input  logic                        RLAST_periph_in,
    input  logic   [1:0]                RRESP_periph_in,
    input  logic   [AXI_USER_WIDTH-1:0] RUSER_periph_in,
    input  logic                        RVALID_periph_in,
    input  logic                        WREADY_periph_in,
    output logic   [AXI_ADDR_WIDTH-1:0] ARADDR_periph_out,
    output logic   [1:0]                ARBURST_periph_out,
    output logic   [3:0]                ARCACHE_periph_out,
    output logic   [AXI_SLAVE_ID_WIDTH-1:0]   ARID_periph_out,
    output logic   [7:0]                ARLEN_periph_out,
    output logic                        ARLOCK_periph_out,
    output logic   [2:0]                ARPROT_periph_out,
    output logic   [3:0]                ARQOS_periph_out,
    output logic   [3:0]                ARREGION_periph_out,
    output logic   [2:0]                ARSIZE_periph_out,
    output logic   [AXI_USER_WIDTH-1:0] ARUSER_periph_out,
    output logic                        ARVALID_periph_out,
    output logic   [AXI_ADDR_WIDTH-1:0] AWADDR_periph_out,
    output logic   [1:0]                AWBURST_periph_out,
    output logic   [3:0]                AWCACHE_periph_out,
    output logic   [AXI_SLAVE_ID_WIDTH-1:0]   AWID_periph_out,
    output logic   [7:0]                AWLEN_periph_out,
    output logic                        AWLOCK_periph_out,
    output logic   [2:0]                AWPROT_periph_out,
    output logic   [3:0]                AWQOS_periph_out,
    output logic   [3:0]                AWREGION_periph_out,
    output logic   [2:0]                AWSIZE_periph_out,
    output logic   [AXI_USER_WIDTH-1:0] AWUSER_periph_out,
    output logic                        AWVALID_periph_out,
    output logic                        BREADY_periph_out,
    output logic                        RREADY_periph_out,
    output logic   [AXI_DATA_WIDTH-1:0] WDATA_periph_out,
    output logic                        WLAST_periph_out,
    output logic   [AXI_DATA_WIDTH/8-1:0] WSTRB_periph_out,
    output logic   [AXI_USER_WIDTH-1:0] WUSER_periph_out,
    output logic                        WVALID_periph_out,

    // Interface: axi_spi_slave
    input  logic   [AXI_ADDR_WIDTH-1:0] ARADDR_spi_in,
    input  logic   [1:0]                ARBURST_spi_in,
    input  logic   [3:0]                ARCACHE_spi_in,
    input  logic   [AXI_MASTER_ID_WIDTH-1:0]   ARID_spi_in,
    input  logic   [7:0]                ARLEN_spi_in,
    input  logic                        ARLOCK_spi_in,
    input  logic   [2:0]                ARPROT_spi_in,
    input  logic   [3:0]                ARQOS_spi_in,
    input  logic   [3:0]                ARREGION_spi_in,
    input  logic   [2:0]                ARSIZE_spi_in,
    input  logic   [AXI_USER_WIDTH-1:0] ARUSER_spi_in,
    input  logic                        ARVALID_spi_in,
    input  logic   [AXI_ADDR_WIDTH-1:0] AWADDR_spi_in,
    input  logic   [1:0]                AWBURST_spi_in,
    input  logic   [3:0]                AWCACHE_spi_in,
    input  logic   [AXI_MASTER_ID_WIDTH-1:0]   AWID_spi_in,
    input  logic   [7:0]                AWLEN_spi_in,
    input  logic                        AWLOCK_spi_in,
    input  logic   [2:0]                AWPROT_spi_in,
    input  logic   [3:0]                AWQOS_spi_in,
    input  logic   [3:0]                AWREGION_spi_in,
    input  logic   [2:0]                AWSIZE_spi_in,
    input  logic   [AXI_USER_WIDTH-1:0] AWUSER_spi_in,
    input  logic                        AWVALID_spi_in,
    input  logic                        BREADY_spi_in,
    input  logic                        RREADY_spi_in,
    input  logic   [AXI_DATA_WIDTH-1:0] WDATA_spi_in,
    input  logic                        WLAST_spi_in,
    input  logic   [AXI_DATA_WIDTH/8-1:0] WSTRB_spi_in,
    input  logic   [AXI_USER_WIDTH-1:0] WUSER_spi_in,
    input  logic                        WVALID_spi_in,
    output logic                        ARREADY_spi_out,
    output logic                        AWREADY_spi_out,
    output logic   [AXI_MASTER_ID_WIDTH-1:0]   BID_spi_out,
    output logic   [1:0]                BRESP_spi_out,
    output logic   [AXI_ADDR_WIDTH-1:0] BUSER_spi_out,
    output logic                        BVALID_spi_out,
    output logic   [AXI_DATA_WIDTH-1:0] RDATA_spi_out,
    output logic   [AXI_MASTER_ID_WIDTH-1:0]   RID_spi_out,
    output logic                        RLAST_spi_out,
    output logic   [1:0]                RRESP_spi_out,
    output logic   [AXI_USER_WIDTH-1:0] RUSER_spi_out,
    output logic                        RVALID_spi_out,
    output logic                        WREADY_spi_out,

    // These ports are not in any interface
    input  logic                        clk,
    input  logic   [NB_MASTER-1:0][AXI_ADDR_WIDTH-1:0] end_addr_i,
    input  logic                        rst_n,
    input  logic   [NB_MASTER-1:0][AXI_ADDR_WIDTH-1:0] start_addr_i,
    input  logic                        test_en_i
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!

  //----------------------------------------------------------------------------//
  // Axi node
  //----------------------------------------------------------------------------//
  AXI_BUS
    #(
      .AXI_ADDR_WIDTH ( AXI_ADDR_WIDTH      ),
      .AXI_DATA_WIDTH ( AXI_DATA_WIDTH      ),
      .AXI_ID_WIDTH   ( AXI_SLAVE_ID_WIDTH  ),
      .AXI_USER_WIDTH ( AXI_USER_WIDTH      )
    )
    masters[2:0]();
  
    AXI_BUS
    #(
      .AXI_ADDR_WIDTH ( AXI_ADDR_WIDTH      ),
      .AXI_DATA_WIDTH ( AXI_DATA_WIDTH      ),
      .AXI_ID_WIDTH   ( AXI_MASTER_ID_WIDTH ),
      .AXI_USER_WIDTH ( AXI_USER_WIDTH      )
    )
    slaves[2:0]();
  

  //----------------------------------------------------------------------------//
  // Connect internal buses to module ports
  //----------------------------------------------------------------------------//

  // Interface: slaves[0]     = axi_core_slave
  
  assign slaves[0].aw_addr    = AWADDR_core_in;
  assign slaves[0].aw_prot    = AWPROT_core_in;
  assign slaves[0].aw_region  = AWREGION_core_in;
  assign slaves[0].aw_len     = AWLEN_core_in;
  assign slaves[0].aw_size    = AWSIZE_core_in;
  assign slaves[0].aw_burst   = AWBURST_core_in;
  assign slaves[0].aw_lock    = AWLOCK_core_in;
  assign slaves[0].aw_cache   = AWCACHE_core_in;
  assign slaves[0].aw_qos     = AWQOS_core_in;
  assign slaves[0].aw_id      = AWID_core_in;
  assign slaves[0].aw_user    = AWUSER_core_in;
  assign slaves[0].aw_ready   = AWREADY_core_out;
  assign slaves[0].aw_valid   = AWVALID_core_in;

  assign slaves[0].ar_addr    = ARADDR_core_in;
  assign slaves[0].ar_prot    = ARPROT_core_in;
  assign slaves[0].ar_region  = ARREGION_core_in;
  assign slaves[0].ar_len     = ARLEN_core_in;
  assign slaves[0].ar_size    = ARSIZE_core_in;
  assign slaves[0].ar_burst   = ARBURST_core_in;
  assign slaves[0].ar_lock    = ARLOCK_core_in;
  assign slaves[0].ar_cache   = ARCACHE_core_in;
  assign slaves[0].ar_qos     = ARQOS_core_in; 
  assign slaves[0].ar_id      = ARID_core_in;
  assign slaves[0].ar_user    = ARUSER_core_in;
  assign slaves[0].ar_ready   = ARREADY_core_out;
  assign slaves[0].ar_valid   = ARVALID_core_in;

  assign slaves[0].w_valid    = WVALID_core_in;
  assign slaves[0].w_data     = WDATA_core_in;
  assign slaves[0].w_strb     = WSTRB_core_in;
  assign slaves[0].w_user     = WUSER_core_in;
  assign slaves[0].w_last     = WLAST_core_in;
  assign slaves[0].w_ready    = WREADY_core_out;
  
  assign slaves[0].r_data     = RDATA_core_out;
  assign slaves[0].r_resp     = RRESP_core_out;
  assign slaves[0].r_last     = RLAST_core_out;
  assign slaves[0].r_id       = RID_core_out;
  assign slaves[0].r_user     = RUSER_core_out;
  assign slaves[0].r_ready    = RREADY_core_in;
  assign slaves[0].r_valid    = RVALID_core_out;

  assign slaves[0].b_resp     = BRESP_core_out;
  assign slaves[0].b_id       = BID_core_out;
  assign slaves[0].b_user     = BUSER_core_out;
  assign slaves[0].b_ready    = BREADY_core_in;
  assign slaves[0].b_valid    = BVALID_core_out;

  // Interface: slaves[1]     = axi_dbg_slave
  
  assign slaves[1].aw_addr    = AWADDR_dbg_in;
  assign slaves[1].aw_prot    = AWPROT_dbg_in;
  assign slaves[1].aw_region  = AWREGION_dbg_in;
  assign slaves[1].aw_len     = AWLEN_dbg_in;
  assign slaves[1].aw_size    = AWSIZE_dbg_in;
  assign slaves[1].aw_burst   = AWBURST_dbg_in;
  assign slaves[1].aw_lock    = AWLOCK_dbg_in;
  assign slaves[1].aw_cache   = AWCACHE_dbg_in;
  assign slaves[1].aw_qos     = AWQOS_dbg_in;
  assign slaves[1].aw_id      = AWID_dbg_in;
  assign slaves[1].aw_user    = AWUSER_dbg_in;
  assign slaves[1].aw_ready   = AWREADY_dbg_out;
  assign slaves[1].aw_valid   = AWVALID_dbg_in;
                 
  assign slaves[1].ar_addr    = ARADDR_dbg_in;
  assign slaves[1].ar_prot    = ARPROT_dbg_in;
  assign slaves[1].ar_region  = ARREGION_dbg_in;
  assign slaves[1].ar_len     = ARLEN_dbg_in;
  assign slaves[1].ar_size    = ARSIZE_dbg_in;
  assign slaves[1].ar_burst   = ARBURST_dbg_in;
  assign slaves[1].ar_lock    = ARLOCK_dbg_in;
  assign slaves[1].ar_cache   = ARCACHE_dbg_in;
  assign slaves[1].ar_qos     = ARQOS_dbg_in; 
  assign slaves[1].ar_id      = ARID_dbg_in;
  assign slaves[1].ar_user    = ARUSER_dbg_in;
  assign slaves[1].ar_ready   = ARREADY_dbg_out;
  assign slaves[1].ar_valid   = ARVALID_dbg_in;
                 
  assign slaves[1].w_valid    = WVALID_dbg_in;
  assign slaves[1].w_data     = WDATA_dbg_in;
  assign slaves[1].w_strb     = WSTRB_dbg_in;
  assign slaves[1].w_user     = WUSER_dbg_in;
  assign slaves[1].w_last     = WLAST_dbg_in;
  assign slaves[1].w_ready    = WREADY_dbg_out;
                 
  assign slaves[1].r_data     = RDATA_dbg_out;
  assign slaves[1].r_resp     = RRESP_dbg_out;
  assign slaves[1].r_last     = RLAST_dbg_out;
  assign slaves[1].r_id       = RID_dbg_out;
  assign slaves[1].r_user     = RUSER_dbg_out;
  assign slaves[1].r_ready    = RREADY_dbg_in;
  assign slaves[1].r_valid    = RVALID_dbg_out;
                 
  assign slaves[1].b_resp     = BRESP_dbg_out;
  assign slaves[1].b_id       = BID_dbg_out;
  assign slaves[1].b_user     = BUSER_dbg_out;
  assign slaves[1].b_ready    = BREADY_dbg_in;
  assign slaves[1].b_valid    = BVALID_dbg_out;

  // Interface: slaves[2]     = axi_spi_slave
  
  assign slaves[2].aw_addr    = AWADDR_spi_in;
  assign slaves[2].aw_prot    = AWPROT_spi_in;
  assign slaves[2].aw_region  = AWREGION_spi_in;
  assign slaves[2].aw_len     = AWLEN_spi_in;
  assign slaves[2].aw_size    = AWSIZE_spi_in;
  assign slaves[2].aw_burst   = AWBURST_spi_in;
  assign slaves[2].aw_lock    = AWLOCK_spi_in;
  assign slaves[2].aw_cache   = AWCACHE_spi_in;
  assign slaves[2].aw_qos     = AWQOS_spi_in;
  assign slaves[2].aw_id      = AWID_spi_in;
  assign slaves[2].aw_user    = AWUSER_spi_in;
  assign slaves[2].aw_ready   = AWREADY_spi_out;
  assign slaves[2].aw_valid   = AWVALID_spi_in;
                 
  assign slaves[2].ar_addr    = ARADDR_spi_in;
  assign slaves[2].ar_prot    = ARPROT_spi_in;
  assign slaves[2].ar_region  = ARREGION_spi_in;
  assign slaves[2].ar_len     = ARLEN_spi_in;
  assign slaves[2].ar_size    = ARSIZE_spi_in;
  assign slaves[2].ar_burst   = ARBURST_spi_in;
  assign slaves[2].ar_lock    = ARLOCK_spi_in;
  assign slaves[2].ar_cache   = ARCACHE_spi_in;
  assign slaves[2].ar_qos     = ARQOS_spi_in; 
  assign slaves[2].ar_id      = ARID_spi_in;
  assign slaves[2].ar_user    = ARUSER_spi_in;
  assign slaves[2].ar_ready   = ARREADY_spi_out;
  assign slaves[2].ar_valid   = ARVALID_spi_in;
                 
  assign slaves[2].w_valid    = WVALID_spi_in;
  assign slaves[2].w_data     = WDATA_spi_in;
  assign slaves[2].w_strb     = WSTRB_spi_in;
  assign slaves[2].w_user     = WUSER_spi_in;
  assign slaves[2].w_last     = WLAST_spi_in;
  assign slaves[2].w_ready    = WREADY_spi_out;
                 
  assign slaves[2].r_data     = RDATA_spi_out;
  assign slaves[2].r_resp     = RRESP_spi_out;
  assign slaves[2].r_last     = RLAST_spi_out;
  assign slaves[2].r_id       = RID_spi_out;
  assign slaves[2].r_user     = RUSER_spi_out;
  assign slaves[2].r_ready    = RREADY_spi_in;
  assign slaves[2].r_valid    = RVALID_spi_out;
                 
  assign slaves[2].b_resp     = BRESP_spi_out;
  assign slaves[2].b_id       = BID_spi_out;
  assign slaves[2].b_user     = BUSER_spi_out;
  assign slaves[2].b_ready    = BREADY_spi_in;
  assign slaves[2].b_valid    = BVALID_spi_out;

  // Interface: masters[0]     = axi_instr_master
  
  assign masters[0].aw_addr    = AWADDR_instr_out;
  assign masters[0].aw_prot    = AWPROT_instr_out;
  assign masters[0].aw_region  = AWREGION_instr_out;
  assign masters[0].aw_len     = AWLEN_instr_out;
  assign masters[0].aw_size    = AWSIZE_instr_out;
  assign masters[0].aw_burst   = AWBURST_instr_out;
  assign masters[0].aw_lock    = AWLOCK_instr_out;
  assign masters[0].aw_cache   = AWCACHE_instr_out;
  assign masters[0].aw_qos     = AWQOS_instr_out;
  assign masters[0].aw_id      = AWID_instr_out;
  assign masters[0].aw_user    = AWUSER_instr_out;
  assign masters[0].aw_ready   = AWREADY_instr_in;
  assign masters[0].aw_valid   = AWVALID_instr_out;
         
  assign masters[0].ar_addr    = ARADDR_instr_out;
  assign masters[0].ar_prot    = ARPROT_instr_out;
  assign masters[0].ar_region  = ARREGION_instr_out;
  assign masters[0].ar_len     = ARLEN_instr_out;
  assign masters[0].ar_size    = ARSIZE_instr_out;
  assign masters[0].ar_burst   = ARBURST_instr_out;
  assign masters[0].ar_lock    = ARLOCK_instr_out;
  assign masters[0].ar_cache   = ARCACHE_instr_out;
  assign masters[0].ar_qos     = ARQOS_instr_out; 
  assign masters[0].ar_id      = ARID_instr_out;
  assign masters[0].ar_user    = ARUSER_instr_out;
  assign masters[0].ar_ready   = ARREADY_instr_in;
  assign masters[0].ar_valid   = ARVALID_instr_out;
         
  assign masters[0].w_valid    = WVALID_instr_out;
  assign masters[0].w_data     = WDATA_instr_out;
  assign masters[0].w_strb     = WSTRB_instr_out;
  assign masters[0].w_user     = WUSER_instr_out;
  assign masters[0].w_last     = WLAST_instr_out;
  assign masters[0].w_ready    = WREADY_instr_in;
         
  assign masters[0].r_data     = RDATA_instr_in;
  assign masters[0].r_resp     = RRESP_instr_in;
  assign masters[0].r_last     = RLAST_instr_in;
  assign masters[0].r_id       = RID_instr_in;
  assign masters[0].r_user     = RUSER_instr_in;
  assign masters[0].r_ready    = RREADY_instr_out;
  assign masters[0].r_valid    = RVALID_instr_in;
         
  assign masters[0].b_resp     = BRESP_instr_in;
  assign masters[0].b_id       = BID_instr_in;
  assign masters[0].b_user     = BUSER_instr_in;
  assign masters[0].b_ready    = BREADY_instr_out;
  assign masters[0].b_valid    = BVALID_instr_in;

  // Interface: masters[1]     = axi_data_master
  
  assign masters[1].aw_addr    = AWADDR_data_out;
  assign masters[1].aw_prot    = AWPROT_data_out;
  assign masters[1].aw_region  = AWREGION_data_out;
  assign masters[1].aw_len     = AWLEN_data_out;
  assign masters[1].aw_size    = AWSIZE_data_out;
  assign masters[1].aw_burst   = AWBURST_data_out;
  assign masters[1].aw_lock    = AWLOCK_data_out;
  assign masters[1].aw_cache   = AWCACHE_data_out;
  assign masters[1].aw_qos     = AWQOS_data_out;
  assign masters[1].aw_id      = AWID_data_out;
  assign masters[1].aw_user    = AWUSER_data_out;
  assign masters[1].aw_ready   = AWREADY_data_in;
  assign masters[1].aw_valid   = AWVALID_data_out;
         
  assign masters[1].ar_addr    = ARADDR_data_out;
  assign masters[1].ar_prot    = ARPROT_data_out;
  assign masters[1].ar_region  = ARREGION_data_out;
  assign masters[1].ar_len     = ARLEN_data_out;
  assign masters[1].ar_size    = ARSIZE_data_out;
  assign masters[1].ar_burst   = ARBURST_data_out;
  assign masters[1].ar_lock    = ARLOCK_data_out;
  assign masters[1].ar_cache   = ARCACHE_data_out;
  assign masters[1].ar_qos     = ARQOS_data_out; 
  assign masters[1].ar_id      = ARID_data_out;
  assign masters[1].ar_user    = ARUSER_data_out;
  assign masters[1].ar_ready   = ARREADY_data_in;
  assign masters[1].ar_valid   = ARVALID_data_out;
         
  assign masters[1].w_valid    = WVALID_data_out;
  assign masters[1].w_data     = WDATA_data_out;
  assign masters[1].w_strb     = WSTRB_data_out;
  assign masters[1].w_user     = WUSER_data_out;
  assign masters[1].w_last     = WLAST_data_out;
  assign masters[1].w_ready    = WREADY_data_in;
         
  assign masters[1].r_data     = RDATA_data_in;
  assign masters[1].r_resp     = RRESP_data_in;
  assign masters[1].r_last     = RLAST_data_in;
  assign masters[1].r_id       = RID_data_in;
  assign masters[1].r_user     = RUSER_data_in;
  assign masters[1].r_ready    = RREADY_data_out;
  assign masters[1].r_valid    = RVALID_data_in;
         
  assign masters[1].b_resp     = BRESP_data_in;
  assign masters[1].b_id       = BID_data_in;
  assign masters[1].b_user     = BUSER_data_in;
  assign masters[1].b_ready    = BREADY_data_out;
  assign masters[1].b_valid    = BVALID_data_in;

  // Interface: masters[2]     = axi_periph_master
  
  assign masters[2].aw_addr    = AWADDR_periph_out;
  assign masters[2].aw_prot    = AWPROT_periph_out;
  assign masters[2].aw_region  = AWREGION_periph_out;
  assign masters[2].aw_len     = AWLEN_periph_out;
  assign masters[2].aw_size    = AWSIZE_periph_out;
  assign masters[2].aw_burst   = AWBURST_periph_out;
  assign masters[2].aw_lock    = AWLOCK_periph_out;
  assign masters[2].aw_cache   = AWCACHE_periph_out;
  assign masters[2].aw_qos     = AWQOS_periph_out;
  assign masters[2].aw_id      = AWID_periph_out;
  assign masters[2].aw_user    = AWUSER_periph_out;
  assign masters[2].aw_ready   = AWREADY_periph_in;
  assign masters[2].aw_valid   = AWVALID_periph_out;
         
  assign masters[2].ar_addr    = ARADDR_periph_out;
  assign masters[2].ar_prot    = ARPROT_periph_out;
  assign masters[2].ar_region  = ARREGION_periph_out;
  assign masters[2].ar_len     = ARLEN_periph_out;
  assign masters[2].ar_size    = ARSIZE_periph_out;
  assign masters[2].ar_burst   = ARBURST_periph_out;
  assign masters[2].ar_lock    = ARLOCK_periph_out;
  assign masters[2].ar_cache   = ARCACHE_periph_out;
  assign masters[2].ar_qos     = ARQOS_periph_out; 
  assign masters[2].ar_id      = ARID_periph_out;
  assign masters[2].ar_user    = ARUSER_periph_out;
  assign masters[2].ar_ready   = ARREADY_periph_in;
  assign masters[2].ar_valid   = ARVALID_periph_out;
         
  assign masters[2].w_valid    = WVALID_periph_out;
  assign masters[2].w_data     = WDATA_periph_out;
  assign masters[2].w_strb     = WSTRB_periph_out;
  assign masters[2].w_user     = WUSER_periph_out;
  assign masters[2].w_last     = WLAST_periph_out;
  assign masters[2].w_ready    = WREADY_periph_in;
        
  assign masters[2].r_data     = RDATA_periph_in;
  assign masters[2].r_resp     = RRESP_periph_in;
  assign masters[2].r_last     = RLAST_periph_in;
  assign masters[2].r_id       = RID_periph_in;
  assign masters[2].r_user     = RUSER_periph_in;
  assign masters[2].r_ready    = RREADY_periph_out;
  assign masters[2].r_valid    = RVALID_periph_in;
         
  assign masters[2].b_resp     = BRESP_periph_in;
  assign masters[2].b_id       = BID_periph_in;
  assign masters[2].b_user     = BUSER_periph_in;
  assign masters[2].b_ready    = BREADY_periph_out;
  assign masters[2].b_valid    = BVALID_periph_in;


  //----------------------------------------------------------------------------//
  // Axi node wrapper
  //----------------------------------------------------------------------------//

  axi_node_intf_wrap
  #(
    .NB_MASTER      ( NB_MASTER           ),
    .NB_SLAVE       ( NB_SLAVE            ),
    .AXI_ADDR_WIDTH ( AXI_ADDR_WIDTH      ),
    .AXI_DATA_WIDTH ( AXI_DATA_WIDTH      ),
    .AXI_ID_WIDTH   ( AXI_MASTER_ID_WIDTH ),
    .AXI_USER_WIDTH ( AXI_USER_WIDTH      )
  )
  axi_interconnect_i
  (
    .clk       ( clk        ),
    .rst_n     ( rst_n      ),
    .test_en_i ( test_en_i  ),

    .master    ( masters    ),
    .slave     ( slaves     ),

    .start_addr_i ( start_addr_i ),
    .end_addr_i   ( end_addr_i   )
  );

endmodule
