//-----------------------------------------------------------------------------
// File          : zero.riscy.logic.v
// Creation date : 09.11.2018
// Creation time : 09:48:55
// Description   : 
// Created by    : pekkarie
// Tool : Kactus2 3.6.90 64-bit
// Plugin : Verilog generator 2.2
// This file was generated based on IP-XACT component pulp-platform.org:core.logic:zero.riscy.logic:1.0
// whose XML file is D:/Data/kactus_test_libraries/pulpinoexperiment/pulp-platform.org/core.logic/zero.riscy.logic/1.0/zero.riscy.logic.1.0.xml
//-----------------------------------------------------------------------------

module zero_riscy_logic(
    // These ports are not in any interface
    input                               clk,
    input                               clk_en_i,
    input                               core_ctrl_firstfetch,
    input                               ctrl_busy,
    input                               data_load_event_ex,
    input                               data_req_i,
    input                               dbg_csr_req,
    input                               dbg_jump_req,
    input                               dbg_reg_wreq,
    input                               dbg_req,
    input                               debug_req_i,
    input                               fetch_enable,
    input                               if_busy,
    input                               lsu_busy,
    input                               rst_ni,
    output                              clk_en,
    output                              core_busy_o,
    output                              sleeping
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!

  //core busy signals
  logic        core_ctrl_firstfetch, core_busy_int, core_busy_q;
  logic        dbg_busy;

  assign core_busy_int = (data_load_event_ex & data_req_i) ? if_busy : (if_busy | ctrl_busy | lsu_busy);

  always_ff @(posedge clk, negedge rst_ni)
  begin
    if (rst_ni == 1'b0) begin
      core_busy_q <= 1'b0;
    end else begin
      core_busy_q <= core_busy_int;
    end
  end

  assign core_busy_o = core_ctrl_firstfetch ? 1'b1 : core_busy_q;

  assign dbg_busy    = dbg_req | dbg_csr_req | dbg_jump_req | dbg_reg_wreq | debug_req_i;

  assign clock_en    = clk_en_i | core_busy_o | dbg_busy;

  assign sleeping    = (~fetch_enable) & (~core_busy_o);

  
endmodule
