// Copyright 2015 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License”); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

module axi_mem_if_SP_mem_mux
#(
    parameter AXI4_RDATA_WIDTH   = 32,
    parameter AXI4_WDATA_WIDTH   = 32,
    parameter AXI_NUMBYTES       = AXI4_WDATA_WIDTH/8,
    parameter MEM_ADDR_WIDTH     = 13
)
(
    input logic                                     clk,
    input logic                                     rst_n,

    output logic                                    CEN_o        ,
    output logic                                    WEN_o        ,
    output logic  [MEM_ADDR_WIDTH-1:0]              A_o          ,
    output logic  [AXI4_WDATA_WIDTH-1:0]            D_o          ,
    output logic  [AXI_NUMBYTES-1:0]                BE_o         ,
    input  logic  [AXI4_RDATA_WIDTH-1:0]            Q_i          ,

    input  logic                                    valid_R      ,
    input  logic                                    valid_W      ,
    output logic                                    grant_R      ,
    output logic                                    grant_W      ,

    
    input  logic                                    W_cen        ,
    input  logic                                    W_wen        ,
    input  logic   [MEM_ADDR_WIDTH-1:0]             W_addr       ,
    input  logic   [AXI4_WDATA_WIDTH-1:0]           W_wdata      ,
    output logic   [AXI4_RDATA_WIDTH-1:0]           W_rdata      ,
    input  logic   [AXI_NUMBYTES-1:0]               W_be         ,
                                          
    input  logic                                    R_cen        ,
    input  logic                                    R_wen        ,
    input  logic   [MEM_ADDR_WIDTH-1:0]             R_addr       ,
    input  logic   [AXI4_WDATA_WIDTH-1:0]           R_wdata      ,
    output logic   [AXI4_RDATA_WIDTH-1:0]           R_rdata      ,
    input  logic   [AXI_NUMBYTES-1:0]               R_be           
    
    );

    logic RR_FLAG;
    
    // pass Q_i through
    assign R_rdata = Q_i;
    assign W_rdata = Q_i;

	always_comb
	begin : _MUX_MEM_
		  if(valid_R & grant_R)
		  begin
		    CEN_o   = R_cen   ;
		    WEN_o   = 1'b1    ;
		    A_o     = R_addr  ;
		    D_o     = R_wdata ;
		    BE_o    = R_be    ;
		  end
		  else
		  begin
		    CEN_o   = W_cen   ;
		    WEN_o   = 1'b0    ;
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
                
    always_ff @(posedge clk or negedge rst_n)
        begin
            if(~rst_n) begin
                RR_FLAG <= 0;
        end
        else
        begin
                if(CEN_o == 1'b0)
                RR_FLAG  <= ~RR_FLAG;
        end
    end

endmodule // axi_mem_if_SP_mem_mux