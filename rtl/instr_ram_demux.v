//-----------------------------------------------------------------------------
// File          : inst_ram_demux.v
// Creation date : 22.08.2017
// Creation time : 12:18:40
// Description   : 
// Created by    : pekkarie
// Tool : Kactus2 3.4.172 32-bit
// Plugin : Verilog generator 2.0e
// This file was generated based on IP-XACT component pulp-platform.org:core.logic:inst_ram_demux:1.0
// whose XML file is C:/Users/pekkarie/Local/Data/pulpino/ip-xact/pulp-platform.org/core.logic/inst_ram_demux/1.0/inst_ram_demux.1.0.xml
//-----------------------------------------------------------------------------

module inst_ram_demux #(
    parameter                              RAM_SIZE         = 32768,
    parameter                              ADDR_WIDTH       = $clog2(RAM_SIZE),
    parameter                              ROM_ADDR_WIDTH   = 12
) (
    // Interface: boot_rom
    input  logic   [31:0]               rdata_boot,

    // Interface: inst
    input  logic   [15:0]               addr_i,
    input  logic   [3:0]                be_i,
    input  logic   [31:0]               wdata_i,
    input  logic                        we_i,
    output logic   [31:0]               rdata_o,

    // Interface: inst_ram
    input  logic   [31:0]               rdata_ram,
    output logic   [3:0]                be_out,
    output logic   [31:0]               wdata_out,
    output logic                        we_out,

    // There ports are contained in many interfaces
    output logic   [15:0]               addr_out,

    // These ports are not in any interface
    input  logic                        clk,
    input                               en_i,
    input  logic                        rst_n,
    output                              enable_boot,
    output                              enable_ram
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
  logic is_boot, is_boot_q;
  
  assign is_boot = (addr_i[ADDR_WIDTH-1] == 1'b1);
  assign rdata_o = (is_boot_q == 1'b1) ? rdata_boot : rdata_ram;

  // Delay the boot signal for one clock cycle to correctly select the rdata
  // from boot rom vs normal ram
  always_ff @(posedge clk, negedge rst_n)
  begin
    if (rst_n == 1'b0)
      is_boot_q <= 1'b0;
    else
      is_boot_q <= is_boot;
  end
  
  assign enable_boot = en_i & is_boot;
  assign enable_rom = en_i &~is_boot;

endmodule
