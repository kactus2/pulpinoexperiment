//-----------------------------------------------------------------------------
// File          : mux_mem.v
// Creation date : 13.11.2018
// Creation time : 12:35:19
// Description   : Wrapper for mux logic.
// Created by    : epe
// Tool : Kactus2 3.6.91 64-bit
// Plugin : Verilog generator 2.2
// This file was generated based on IP-XACT component pulp-platform.org:communication.logic:mux_mem:1.0
// whose XML file is /home/epe/pulpino/ip-xact/pulp-platform.org/communication.logic/mux_mem/1.0/mux_mem.1.0.xml
//-----------------------------------------------------------------------------

module mux_mem #(
    parameter                              AXI4_WDATA_WIDTH = 32,
    parameter                              AXI_NUM_BYTES    = AXI4_WDATA_WIDTH/8,
    parameter                              MEM_ADDR_WIDTH   = 32
) (
    // Interface: mem
    output logic   [MEM_ADDR_WIDTH-1:0]       A_o,
    output logic   [AXI_NUM_BYTES-1:0]       BE_o,
    output logic                        CEN_o,
    output logic   [AXI4_WDATA_WIDTH-1:0]                     D_o,
    output logic                        WEN_o,

    // Interface: read
    input          [MEM_ADDR_WIDTH-1:0]       R_addr,
    input          [AXI_NUM_BYTES-1:0]       R_be,
    input                               R_cen,
    input          [AXI4_WDATA_WIDTH-1:0]       R_wdata,

    // Interface: write
    input          [MEM_ADDR_WIDTH-1:0]       W_addr,
    input          [AXI_NUM_BYTES-1:0]       W_be,
    input                               W_cen,
    input          [AXI4_WDATA_WIDTH-1:0]       W_wdata,

    // These ports are not in any interface
    input                               ACLK,
    input                               ARESETn,
    input                               valid_R,
    input                               valid_W,
    output logic                        grant_R,
    output logic                        grant_W
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
    logic RR_FLAG;

	always_comb
	_MUX_MEM_ : begin
		  if(valid_R & grant_R)
		  begin
		    CEN_o   = R_cen   ;
		    WEN_o   = 1'b1       ;
		    A_o     = R_addr  ;
		    D_o     = R_wdata ;
		    BE_o    = R_be    ;
		  end
		  else
		  begin
		    CEN_o   = W_cen   ;
		    WEN_o   = 1'b0       ;
		    A_o     = W_addr  ;
		    D_o     = W_wdata ;
		    BE_o    = W_be    ;
		  end
	end


//Low Priority RR Arbiter
always_comb
begin
  grant_R = 1'b0;
  grant_W = 1'b0;

  case (RR_FLAG)

  1'b0: //Priority on Write
  begin
    if(valid_W)
      begin
        grant_W = 1'b1;
      end
    else
      begin
        grant_R = 1'b1;
      end
  end


  1'b1: //Priority on Read
  begin
    if(valid_R)
      grant_R = 1'b1;
    else
      grant_W = 1'b1;
  end
  endcase
end


always_ff @(posedge ACLK or negedge ARESETn)
begin
  if(~ARESETn) begin
     RR_FLAG <= 0;
  end
  else
  begin
  		if(CEN_o == 1'b0)
      	   RR_FLAG  <= ~RR_FLAG;
  end
end

endmodule
