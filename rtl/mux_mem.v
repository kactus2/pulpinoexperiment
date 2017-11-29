//-----------------------------------------------------------------------------
// File          : mux_mem.v
// Creation date : 18.09.2017
// Creation time : 16:51:11
// Description   : 
// Created by    : pekkarie
// Tool : Kactus2 3.4.436 32-bit
// Plugin : Verilog generator 2.0e
// This file was generated based on IP-XACT component pulp-platform.org:communication.logic:mux_mem:1.0
// whose XML file is C:/Users/pekkarie/Local/Data/pulpino/ip-xact/pulp-platform.org/communication.logic/mux_mem/1.0/mux_mem.1.0.xml
//-----------------------------------------------------------------------------

module mux_mem #(
    parameter                              MEM_ADDR_WIDTH   = 32,
    parameter                              AXI4_WDATA_WIDTH = 32,
    parameter                              AXI_NUM_BYTES    = AXI4_WDATA_WIDTH/8
) (
    // Interface: mem
    output                              A_o,
    output         [AXI_NUM_BYTES-1:0]  BE_o,
    output                              CEN_o,
    output                              D_o,
    output                              WEN_o,

    // Interface: read
    input          [MEM_ADDR_WIDTH-1:0] R_addr,
    input          [AXI_NUM_BYTES-1:0]  R_be,
    input                               R_cen,
    input          [AXI4_WDATA_WIDTH-1:0] R_wdata,

    // Interface: write
    input          [MEM_ADDR_WIDTH-1:0] W_addr,
    input          [AXI_NUM_BYTES-1:0]  W_be,
    input                               W_cen,
    input          [AXI4_WDATA_WIDTH-1:0] W_wdata,

    // These ports are not in any interface
    input                               ACLK,
    input                               ARESETn,
    input                               valid_R,
    input                               valid_W,
    output                              grant_R,
    output                              grant_W
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
    logic RR_FLAG;

	always_comb
	begin : _MUX_MEM_
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
      grant_W = 1'b1;
    else
      grant_R = 1'b1;
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
