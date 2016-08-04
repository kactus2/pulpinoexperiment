// Copyright 2015 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License”); you may not use this file except in
// compliance with the License. You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

module core_region_demux
(
  // Clock and Reset
  input  logic         clk,
  input  logic         rst_n,

  // signals from/to core
  input  logic         core_lsu_req,
  output logic         core_lsu_gnt,
  output logic         core_lsu_rvalid,
  input  logic [31:0]  core_lsu_addr,
  input  logic         core_lsu_we,
  input  logic [3:0]   core_lsu_be,
  output logic [31:0]  core_lsu_rdata,
  input  logic [31:0]  core_lsu_wdata,

  output logic         core_data_req,
  input  logic         core_data_gnt,
  input  logic         core_data_rvalid,
  output logic [31:0]  core_data_addr,
  output logic         core_data_we,
  output logic [3:0]   core_data_be,
  input  logic [31:0]  core_data_rdata,
  output logic [31:0]  core_data_wdata,

  // signals to/from core2axi
  output logic         core_axi_req,
  input  logic         core_axi_gnt,
  input  logic         core_axi_rvalid,
  output logic [31:0]  core_axi_addr,
  output logic         core_axi_we,
  output logic [3:0]   core_axi_be,
  input  logic [31:0]  core_axi_rdata,
  output logic [31:0]  core_axi_wdata

  );



  enum logic [0:0] { AXI, RAM } lsu_resp_CS, lsu_resp_NS;


  //----------------------------------------------------------------------------//
  // DEMUX
  //----------------------------------------------------------------------------//
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
