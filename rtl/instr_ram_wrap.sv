// Copyright 2017 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License”); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.


`include "config.sv"

module instr_ram_wrap
  #(
    parameter RAM_SIZE   = 32768,                // in bytes
    parameter ADDR_WIDTH = $clog2(RAM_SIZE) + 1, // one bit more than necessary, for the boot rom
    parameter DATA_WIDTH = 32
  )(
    // Clock and Reset
    input  logic                    clk,
    input  logic                    rst_n,

    input  logic                    en_i,
    input  logic [ADDR_WIDTH-1:0]   addr_i,
    input  logic [DATA_WIDTH-1:0]   wdata_i,
    output logic [DATA_WIDTH-1:0]   rdata_o,
    input  logic                    we_i,
    input  logic [DATA_WIDTH/8-1:0] be_i,
    input  logic                    bypass_en_i
  );

  logic enable_boot, enable_ram, we_ram;
  logic [DATA_WIDTH-1:0] rdata_boot;
  logic [DATA_WIDTH-1:0] rdata_ram;
  logic [DATA_WIDTH/8-1:0] be_ram;
  logic [DATA_WIDTH-1:0]   wdata_ram;
  logic [ADDR_WIDTH-1:0]   addr_int;
  
  // IP-XACT VLNV: pulp-platform.org:core.logic:inst_ram_demux:1.0
  inst_ram_demux     inst_ram_demux(
    // Interface: boot_rom
    .rdata_boot          (rdata_boot),
    .enable_boot         (enable_boot),
    // Interface: inst
    .addr_i              (addr_i),
    .be_i                (be_i),
    .wdata_i             (wdata_i),
    .we_i                (we_i),
    .rdata_o             (rdata_o),
    // Interface: inst_ram
    .rdata_ram           (rdata_ram),
    .be_out              (be_ram),
    .enable_ram          (enable_ram),
    .wdata_out           (wdata_ram),
    .we_out              (we_ram),
    // There ports are contained in many interfaces
    .addr_out            (addr_int),
    // These ports are not in any interface
    .clk                 (clk),
    .en_i                (en_i),
    .rst_n               (rst_n)
);

  sp_ram_wrap
  #(
    .RAM_SIZE   ( RAM_SIZE   ),
    .DATA_WIDTH ( DATA_WIDTH )
  )
  sp_ram_wrap_i
  (
    .clk         ( clk                        ),
    .rstn_i      ( rst_n                      ),

    .en_i        ( enable_ram                 ),
    .addr_i      ( addr_int[ADDR_WIDTH-2:0]     ),
    .wdata_i     ( wdata_ram                  ),
    .rdata_o     ( rdata_ram                  ),
    .we_i        ( we_ram                     ),
    .be_i        ( be_ram                     ),
    .bypass_en_i ( bypass_en_i                )
  );

  boot_rom_wrap
  #(
    .DATA_WIDTH ( DATA_WIDTH )
  )
  boot_rom_wrap_i
  (
    .clk     ( clk                         ),
    .rst_n   ( rst_n                       ),
    .en_i    ( enable_boot                 ),
    .addr_i  ( addr_int[`ROM_ADDR_WIDTH-1:0] ),
    .rdata_o ( rdata_boot                  )
  );

endmodule
