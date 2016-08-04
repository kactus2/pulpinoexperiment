// Copyright 2015 ETH Zurich and University of Bologna.
// Copyright and related rights are licensed under the Solderpad Hardware
// License, Version 0.51 (the “License”); you may not use this file except in
// compliance with the License.  You may obtain a copy of the License at
// http://solderpad.org/licenses/SHL-0.51. Unless required by applicable law
// or agreed to in writing, software, hardware and materials distributed under
// this License is distributed on an “AS IS” BASIS, WITHOUT WARRANTIES OR
// CONDITIONS OF ANY KIND, either express or implied. See the License for the
// specific language governing permissions and limitations under the License.

`define HP 1'b1
`define LP 1'b0

module axi_mem_if_DP
#(
    parameter AXI4_RDATA_WIDTH   = 64,
    parameter AXI4_WDATA_WIDTH   = 64,
    parameter AXI_NUMBYTES       = AXI4_WDATA_WIDTH/8,
    parameter MEM_ADDR_WIDTH     = 13
)
(
    input logic                                     clk,
    input logic                                     rst_n,

    output logic                                    CEN         ,
    output logic                                    WEN         ,
    output logic  [MEM_ADDR_WIDTH-1:0]              A           ,
    output logic  [AXI4_WDATA_WIDTH-1:0]            D           ,
    output logic  [AXI_NUMBYTES-1:0]                BE          ,
    input  logic  [AXI4_RDATA_WIDTH-1:0]            Q           ,
    
    input  logic                                    valid_R_HP  ,
    input  logic                                    valid_W_HP  ,
    input  logic                                    valid_R_LP  ,
    input  logic                                    valid_W_LP  ,
                                                                
    output logic                                    grant_R_HP  ,
    output logic                                    grant_W_HP  ,
    output logic                                    grant_R_LP  ,
    output logic                                    grant_W_LP  ,
                                                                
    input  logic                                    HP_W_cen    ,
    input  logic                                    HP_W_wen    ,
    input  logic  [MEM_ADDR_WIDTH-1:0]              HP_W_addr   ,
    input  logic  [AXI4_WDATA_WIDTH-1:0]            HP_wdata    ,
    input  logic  [AXI_NUMBYTES-1:0]                HP_be       ,
                                                                
    input  logic                                    HP_R_cen    ,
    input  logic                                    HP_R_wen    ,
    input  logic  [MEM_ADDR_WIDTH-1:0]              HP_R_addr   ,
    output logic  [AXI4_RDATA_WIDTH-1:0]            HP_rdata    ,
                                                                
    input  logic                                    LP_W_cen    ,
    input  logic                                    LP_W_wen    ,
    input  logic  [MEM_ADDR_WIDTH-1:0]              LP_W_addr   ,
    input  logic  [AXI4_WDATA_WIDTH-1:0]            LP_wdata    ,
    input  logic  [AXI_NUMBYTES-1:0]                LP_be       ,
                                                                
    input  logic                                    LP_R_cen    ,
    input  logic                                    LP_R_wen    ,
    input  logic  [MEM_ADDR_WIDTH-1:0]              LP_R_addr   ,
    output logic  [AXI4_RDATA_WIDTH-1:0]            LP_rdata    
  


);
  logic                         LP_cen    , HP_cen            ;
  logic                         LP_wen    , HP_wen            ;
  logic [MEM_ADDR_WIDTH-1:0]    LP_addr   , HP_addr           ;
  


  logic RR_FLAG_HP, RR_FLAG_LP;
  logic main_grant_LP, main_grant_HP;
  logic destination;

  assign LP_rdata = Q;
  assign HP_rdata = Q;

always_comb
begin : _MUX_MEM_

  if(valid_R_HP & grant_R_HP)
  begin
    HP_cen   = HP_R_cen   ;
    HP_wen   = 1'b1       ;
    HP_addr  = HP_R_addr  ;
  end
  else
  begin
    HP_cen   = HP_W_cen   ;
    HP_wen   = 1'b0       ;
    HP_addr  = HP_W_addr  ;
  end


  if(valid_R_LP & grant_R_LP)
  begin
    LP_cen   = LP_R_cen   ;
    LP_wen   = 1'b1       ;
    LP_addr  = LP_R_addr  ;
  end
  else
  begin
    LP_cen   = LP_W_cen   ;
    LP_wen   = 1'b0       ;
    LP_addr  = LP_W_addr  ;
  end


  if( (valid_R_HP | valid_W_HP) & main_grant_HP )
  begin
    CEN = HP_cen   ;
    WEN = HP_wen   ;
    A   = HP_addr  ;
    D   = HP_wdata ;
    BE  = HP_be    ;
  end
  else
  begin
    CEN = LP_cen   ;
    WEN = LP_wen   ;
    A   = LP_addr  ;
    D   = LP_wdata ;
    BE  = LP_be    ;
  end

end



always_ff @(posedge clk or negedge rst_n)
begin : MUX_RDATA_MEM
  if(~rst_n)
  begin
     destination <= '0;
  end
  else
  begin
      if(valid_R_HP & main_grant_HP)
          destination <= `HP;
      else
          destination <= `LP;
  end
end


always_ff @(posedge clk or negedge rst_n)
begin
  if(~rst_n) begin
     RR_FLAG_HP <= 0;
  end
  else
  begin
    RR_FLAG_HP  <= ~RR_FLAG_HP;
  end
end


always_ff @(posedge clk or negedge rst_n)
begin
  if(~rst_n) begin
     RR_FLAG_LP <= 0;
  end
  else
  begin
      RR_FLAG_LP  <= ~RR_FLAG_LP;
  end
end



//High Priority RR Arbiter
always_comb
begin
  grant_R_HP = 1'b0;
  grant_W_HP = 1'b0;

  case (RR_FLAG_HP)

  1'b0: //Priority on Write
  begin
    if(valid_W_HP)
      grant_W_HP = main_grant_HP;
    else
      grant_R_HP = main_grant_HP;
  end


  1'b1: //Priority on Read
  begin
    if(valid_R_HP)
      grant_R_HP = main_grant_HP;
    else
      grant_W_HP = main_grant_HP;
  end
  endcase
end


//Low Priority RR Arbiter
always_comb
begin
  grant_R_LP = 1'b0;
  grant_W_LP = 1'b0;

  case (RR_FLAG_LP)

  1'b0: //Priority on Write
  begin
    if(valid_W_LP)
      grant_W_LP = main_grant_LP;
    else
      grant_R_LP = main_grant_LP;
  end


  1'b1: //Priority on Read
  begin
    if(valid_R_LP)
      grant_R_LP = main_grant_LP;
    else
      grant_W_LP = main_grant_LP;
  end
  endcase
end



//MAIN FIXED PRIORITY Arbiter
always_comb
begin
  main_grant_LP = 1'b0;
  main_grant_HP = 1'b0;


  if(valid_R_HP | valid_W_HP )
  begin
      main_grant_HP = 1'b1;
  end
  else
  begin
      main_grant_LP = 1'b1;
  end
end


endmodule // axi_mem_if_DP
