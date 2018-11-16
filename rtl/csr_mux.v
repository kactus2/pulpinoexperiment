//-----------------------------------------------------------------------------
// File          : csr_mux.v
// Creation date : 13.11.2018
// Creation time : 13:27:49
// Description   : 
// Created by    : pekkarie
// Tool : Kactus2 3.6.91 64-bit
// Plugin : Verilog generator 2.2
// This file was generated based on IP-XACT component pulp-platform.org:core.logic:csr_mux:1.0
// whose XML file is /home/epe/pulpino/ip-xact/pulp-platform.org/core.logic/csr_mux/1.0/csr_mux.1.0.xml
//-----------------------------------------------------------------------------

import zeroriscy_defines::*;

module csr_mux(
    // These ports are not in any interface
    input          [31:0]               alu_operand_a_ex,
    input          [11:0]               alu_operand_b_ex,
    input                               csr_access_ex,
    input          [1:0]                csr_op_ex,
    input          [11:0]               dbg_csr_addr,
    input                               dbg_csr_req,
    input                               dbg_csr_wdata,
    input                               dbg_csr_we,
    output                              csr_access,
    output         [11:0]               csr_addr,
    output         [1:0]                csr_op,
    output         [31:0]               csr_wdata
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!

  logic [11:0] csr_addr_int;
  
  // Mux for CSR access through Debug Unit
  assign csr_access   = (dbg_csr_req == 1'b0) ? csr_access_ex : 1'b1;
  assign csr_addr     = (dbg_csr_req == 1'b0) ? csr_addr_int     : dbg_csr_addr;
  assign csr_wdata    = (dbg_csr_req == 1'b0) ? alu_operand_a_ex : dbg_csr_wdata;
  assign csr_op       = (dbg_csr_req == 1'b0) ? csr_op_ex
                                              : (dbg_csr_we == 1'b1 ? CSR_OP_WRITE
                                                                    : CSR_OP_NONE );
  assign csr_addr_int = csr_access_ex ? alu_operand_b_ex[11:0] : '0;
  
endmodule
