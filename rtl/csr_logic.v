//-----------------------------------------------------------------------------
// File          : csr_logic.v
// Creation date : 09.11.2018
// Creation time : 12:48:42
// Description   : 
// Created by    : pekkarie
// Tool : Kactus2 3.6.90 64-bit
// Plugin : Verilog generator 2.2
// This file was generated based on IP-XACT component pulp-platform.org:core.logic:csr_logic:1.0
// whose XML file is D:/Data/kactus_test_libraries/pulpinoexperiment/pulp-platform.org/core.logic/csr_logic/1.0/csr_logic.1.0.xml
//-----------------------------------------------------------------------------

module csr_logic(
    // These ports are not in any interface
    input                               data_gnt_i,
    input                               data_req_i,
    input                               data_we_i,
    output                              mem_load,
    output                              mem_store
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!

    assign mem_load  = data_req_i & data_gnt_i & (~data_we_i); 
    assign mem_store = data_req_i & data_gnt_i & data_we_i;

endmodule
