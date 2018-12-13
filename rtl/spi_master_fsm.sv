//-----------------------------------------------------------------------------
// File          : spi_master_fsm.sv
// Creation date : 28.08.2017
// Creation time : 09:14:06
// Description   : 
// Created by    : pekkarie
// Tool : Kactus2 3.4.189 32-bit
// Plugin : Verilog generator 2.0e
// This file was generated based on IP-XACT component pulp-platform.org:peripheral.logic:spi_master_fsm:1.0
// whose XML file is C:/Users/pekkarie/Local/Data/pulpino/ip-xact/pulp-platform.org/peripheral.logic/spi_master_fsm/1.0/spi_master_fsm.1.0.xml
//-----------------------------------------------------------------------------

module spi_master_fsm #(
    parameter                              BUFFER_DEPTH     = 10,
    parameter                              LOG_BUFFER_DEPTH = $clog2(BUFFER_DEPTH)+1
) (
    // These ports are not in any interface
    input          [LOG_BUFFER_DEPTH:0]       cnt_rx,
    input          [LOG_BUFFER_DEPTH:0]       cnt_tx,
    input          [LOG_BUFFER_DEPTH:0]       elements_rx,
    input          [LOG_BUFFER_DEPTH:0]       elements_tx,
    input                               HCLK,
    input                               HRESETn,
    input                               int_cnt_en,
    input                               int_en,
    input                               int_rd_sta,
    input                               spi_ctrl_data_rx_ready,
    input                               spi_ctrl_data_rx_valid,
    input                               spi_ctrl_data_tx_ready,
    input                               spi_ctrl_data_tx_valid,
    input          [6:0]                spi_ctrl_status,
    input          [LOG_BUFFER_DEPTH:0]       th_rx,
    input          [LOG_BUFFER_DEPTH:0]       th_tx,
    output                              events_o,
    output         [31:0]               spi_status
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
    logic [LOG_BUFFER_DEPTH:0] r_counter_tx;
    logic [LOG_BUFFER_DEPTH:0] r_counter_rx;

    logic                      s_rise_int_tx;
    logic                      s_rise_int_rx;

    logic                      s_int_tx;
    logic                      s_int_rx;

    enum logic [1:0] { INT_RX_ACTIVE, GEN_INT_RX, INT_RX_INACTIVE } r_state_rx,s_state_rx_next;
    enum logic [1:0] { INT_TX_ACTIVE, GEN_INT_TX, INT_TX_INACTIVE } r_state_tx,s_state_tx_next;

    localparam FILL_BITS = 7-LOG_BUFFER_DEPTH;

    assign s_rise_int_tx = (elements_tx <= th_tx);
    assign s_rise_int_rx = (elements_rx >= th_rx);

    assign spi_status = {{FILL_BITS{1'b0}},elements_tx,{FILL_BITS{1'b0}},elements_rx,9'h0,spi_ctrl_status};

    assign events_o = s_int_tx | s_int_rx;

    always_ff @(posedge HCLK, negedge HRESETn)
    begin
        if(~HRESETn)
        begin
            r_state_tx <= INT_TX_ACTIVE;
            r_state_rx <= INT_RX_ACTIVE;
        end
        else
        begin
            r_state_tx <= s_state_tx_next;
            r_state_rx <= s_state_rx_next;
        end
    end

    always_ff @(posedge INT_TX_ACTIVE, negedge HRESETn)
    begin
        if(~HRESETn)
        begin
            r_counter_tx <= 'h0;
            r_counter_rx <= 'h0;
        end
        else
        begin
            if (int_cnt_en)
            begin
                if (spi_ctrl_data_tx_valid && spi_ctrl_data_tx_ready)
                begin
                    if (r_counter_tx == cnt_tx-1)
                        r_counter_tx <= 'h0;
                    else
                        r_counter_tx <= r_counter_tx + 1;
                end
                if (spi_ctrl_data_rx_valid && spi_ctrl_data_rx_ready)
                begin
                    if (r_counter_rx == cnt_rx-1)
                        r_counter_rx <= 'h0;
                    else
                        r_counter_rx <= r_counter_rx + 1;
                end
            end
            else
            begin
                r_counter_tx <= 'h0;
                r_counter_rx <= 'h0;
            end
        end
    end

    always_comb
    begin
        s_state_tx_next = r_state_tx;
        s_int_tx        = 1'b0;

        case(r_state_tx)
        INT_TX_ACTIVE:
        begin
            if (s_rise_int_tx && int_en)
                s_state_tx_next = GEN_INT_TX;
        end

        GEN_INT_TX:
        begin
            s_int_tx = 1'b1;
            s_state_tx_next = INT_TX_INACTIVE;
        end

        INT_TX_INACTIVE:
        begin
            if (int_cnt_en)
            begin
                if ((spi_ctrl_data_tx_valid && spi_ctrl_data_tx_ready) && (r_counter_tx == cnt_tx-1))
                    s_state_tx_next = INT_TX_ACTIVE;
            end
            else
            begin
                if (int_rd_sta)
                    s_state_tx_next = INT_TX_ACTIVE;
            end
        end

        default :
        begin
            s_state_tx_next = r_state_tx;
            s_int_tx        = 1'b0;
        end
        endcase
    end


    always_comb
    begin
        s_state_rx_next = r_state_rx;
        s_int_rx        = 1'b0;

        case(r_state_rx)
        INT_RX_ACTIVE:
        begin
            if (s_rise_int_rx && int_en)
                s_state_rx_next = GEN_INT_RX;
        end

        GEN_INT_RX:
        begin
            s_int_rx = 1'b1;
            s_state_rx_next = INT_RX_INACTIVE;
        end

        INT_RX_INACTIVE:
        begin
            if (int_cnt_en)
            begin
                if ((spi_ctrl_data_rx_valid && spi_ctrl_data_rx_ready) && (r_counter_rx == cnt_rx-1))
                    s_state_rx_next = INT_RX_ACTIVE;
            end
            else
            begin
              if (int_rd_sta)
                  s_state_rx_next = INT_RX_ACTIVE;
            end
        end
        endcase
    end
endmodule
