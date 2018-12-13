//-----------------------------------------------------------------------------
// File          : instr_ram_demux.v
// Creation date : 08.10.2018
// Creation time : 12:47:06
// Description   : Container for glue logic in instr_ram_wrap.
// Created by    : epe
// Tool : Kactus2 3.6.50 64-bit
// Plugin : Verilog generator 2.2
// This file was generated based on IP-XACT component pulp-platform.org:core.logic:instr_ram_demux:1.0
// whose XML file is /home/epe/pulpino/ip-xact/pulp-platform.org/core.logic/instr_ram_demux/1.0/instr_ram_demux.1.0.xml
//-----------------------------------------------------------------------------

module instr_ram_demux #(
    parameter                              ADDR_WIDTH       = $clog2(RAM_SIZE),
    parameter                              RAM_SIZE         = 32768,
    parameter                              ROM_ADDR_WIDTH   = 12
) (
    // Interface: boot_rom
    input  logic   [31:0]               rdata_boot,
    output                              enable_boot,

    // Interface: inst
    input  logic   [15:0]               addr_i,
    input  logic   [3:0]                be_i,
    input                               en_i,
    input  logic   [31:0]               wdata_i,
    input  logic                        we_i,
    output logic   [31:0]               rdata_o,

    // Interface: inst_ram
    input  logic   [31:0]               rdata_ram,
    output logic   [3:0]                be_out,
    output                              enable_ram,
    output logic   [31:0]               wdata_out,
    output logic                        we_out,

    // There ports are contained in many interfaces
    output logic   [15:0]               addr_out,

    // These ports are not in any interface
    input  logic                        clk,
    input  logic                        rst_n
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
  logic is_boot, is_boot_q;
  
  assign is_boot = (addr_i[ADDR_WIDTH-1] == 1'b1);
  assign rdata_o = (is_boot_q == 1'b1) ? rdata_boot : rdata_ram;
  assign be_out = be_i;
  assign we_out = we_i;
  assign wdata_out = wdata_i;

  // Delay the boot signal for one clock cycle to correctly select the rdata
  // from boot rom vs normal ram
  always_ff @(posedge clk, negedge rst_n)
  begin
    if (rst_n == 1'b0)
      is_boot_q <= 1'b0;
    else
      is_boot_q <= is_boot;
  end
  
  assign addr_out = addr_i;
  assign enable_boot = en_i & is_boot;
  assign enable_ram = en_i & ~is_boot;

endmodule
