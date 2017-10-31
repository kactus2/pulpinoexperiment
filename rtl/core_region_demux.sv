//-----------------------------------------------------------------------------
// File          : core_region_demux.v
// Creation date : 21.08.2017
// Creation time : 10:09:24
// Description   : 
// Created by    : pekkarie
// Tool : Kactus2 3.4.174 32-bit
// Plugin : Verilog generator 2.0e
// This file was generated based on IP-XACT component pulp-platform.org:core.wrapper:core_region_demux:1.0
// whose XML file is C:/Users/pekkarie/Local/Data/pulpino/ip-xact/pulp-platform.org/core.wrapper/core_region_demux/1.0/core_region_demux.1.0.xml
//-----------------------------------------------------------------------------

module core_region_demux(
    // Interface: data_axi_master
    input                               core_axi_gnt,
    input                               core_axi_rdata,
    input                               core_axi_rvalid,
    output                              core_axi_addr,
    output                              core_axi_be,
    output                              core_axi_req,
    output                              core_axi_wdata,
    output                              core_axi_we,

    // Interface: data_core_master
    input                               core_data_gnt,
    input                               core_data_rdata,
    input                               core_data_rvalid,
    output                              core_data_addr,
    output                              core_data_be,
    output                              core_data_req,
    output                              core_data_wdata,
    output                              core_data_we,

    // Interface: lsu_data_slave
    input                               core_lsu_addr,
    input                               core_lsu_be,
    input                               core_lsu_req,
    input                               core_lsu_wdata,
    input                               core_lsu_we,
    output                              core_lsu_gnt,
    output                              core_lsu_rdata,
    output                              core_lsu_rvalid,

    // These ports are not in any interface
    input                               clk,
    input                               rst_n
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!

  logic                        is_axi_addr;
  enum logic [0:0] { AXI, RAM } lsu_resp_CS, lsu_resp_NS;
  
  assign is_axi_addr     = (core_lsu_addr[31:20] != 12'h001);
  assign core_data_req   = (~is_axi_addr) & core_lsu_req;
  assign core_axi_req    =   is_axi_addr  & core_lsu_req;

  assign core_data_addr  = core_lsu_addr;
  assign core_data_we    = core_lsu_we;
  assign core_data_be    = core_lsu_be;
  assign core_data_wdata = core_lsu_wdata;

  assign core_axi_addr   = core_lsu_addr;
  assign core_axi_we     = core_lsu_we;
  assign core_axi_be     = core_lsu_be;
  assign core_axi_wdata  = core_lsu_wdata;

  always_ff @(posedge clk, negedge rst_n)
  begin
    if (rst_n == 1'b0)
      lsu_resp_CS <= RAM;
    else
      lsu_resp_CS <= lsu_resp_NS;
  end

  // figure out where the next response will be coming from
  always_comb
  begin
    lsu_resp_NS = lsu_resp_CS;
    core_lsu_gnt = 1'b0;

    if (core_axi_req)
    begin
      core_lsu_gnt = core_axi_gnt;
      lsu_resp_NS = AXI;
    end
    else if (core_data_req)
    begin
      core_lsu_gnt = core_data_gnt;
      lsu_resp_NS = RAM;
    end
  end

  // route response back to LSU
  assign core_lsu_rdata  = (lsu_resp_CS == AXI) ? core_axi_rdata : core_data_rdata;
  assign core_lsu_rvalid = core_axi_rvalid | core_data_rvalid;

endmodule
