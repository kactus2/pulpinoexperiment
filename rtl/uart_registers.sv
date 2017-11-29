//-----------------------------------------------------------------------------
// File          : uart_registers.sv
// Creation date : 25.08.2017
// Creation time : 12:18:59
// Description   : Contains glue logic from apb_uart.
// Created by    : pekkarie
// Tool : Kactus2 3.4.189 32-bit
// Plugin : Verilog generator 2.0e
// This file was generated based on IP-XACT component pulp-platform.org:peripheral.logic:uart_registers:1.0
// whose XML file is C:/Users/pekkarie/Local/Data/pulpino/ip-xact/pulp-platform.org/peripheral.logic/uart_registers/1.0/uart_registers.1.0.xml
//-----------------------------------------------------------------------------

module uart_registers #(
    parameter                              APB_ADDR_WIDTH   = 12,
    parameter                              TX_FIFO_DEPTH    = 16
) (
    // Interface: apb
    input          [APB_ADDR_WIDTH-1:0] PADDR,
    input                               PENABLE,
    input                               PRESETn,
    input                               PSEL,
    input          [31:0]               PWDATA,
    input                               PWRITE,
    output         [31:0]               PRDATA,
    output                              PREADY,
    output                              PSLVERR,

    // These ports are not in any interface
    input                               clk,
    input                               rst_n,
    input          [8:0]                fifo_rx_data,
    input                               fifo_rx_valid,
    input                               tx_elements,
    input                               tx_ready,
    input                               IIR_i,
    output                              cfg_bits_o,
    output         [15:0]               cfg_div_o,
    output                              cfg_parity_en_o,
    output                              cfg_stop_bits_o,
    output         [3:0]                clr_int,
    output                              fifo_rx_ready,
    output         [7:0]                fifo_tx_data,
    output                              fifo_tx_valid,
    output                              rx_fifo_clr_q,
    output         [1:0]                trigger_level_q,
    output                              tx_fifo_clr_q,
    output         [2:0]                IER_o,
    output                              RDA_o,
    output                              error_int
);

// WARNING: EVERYTHING ON AND ABOVE THIS LINE MAY BE OVERWRITTEN BY KACTUS2!!!
    // register addresses
    parameter RBR = 3'h0, THR = 3'h0, DLL = 3'h0, IER = 3'h1, DLM = 3'h1, IIR = 3'h2,
              FCR = 3'h2, LCR = 3'h3, MCR = 3'h4, LSR = 3'h5, MSR = 3'h6, SCR = 3'h7;

    logic [9:0][7:0]  regs_q, regs_n;
    logic             tx_fifo_clr_n; 
    logic             rx_fifo_clr_n;
    logic [2:0]       register_adr;
    logic [1:0]       trigger_level_n;
    logic             [$clog2(TX_FIFO_DEPTH):0] tx_elements;

    // register write and update logic
    always_comb
    begin
        regs_n          = regs_q;
        trigger_level_n = trigger_level_q;

        fifo_tx_valid   = 1'b0;
        tx_fifo_clr_n   = 1'b0; // self clearing
        rx_fifo_clr_n   = 1'b0; // self clearing

        // rx status
        regs_n[LSR][0] = fifo_rx_valid; // fifo is empty

        // parity error on receiving part has occured
        regs_n[LSR][2] = fifo_rx_data[8]; // parity error is detected when element is retrieved

        // tx status register
        regs_n[LSR][5] = ~ (|tx_elements); // fifo is empty
        regs_n[LSR][6] = tx_ready & ~ (|tx_elements); // shift register and fifo are empty

        if (PSEL && PENABLE && PWRITE)
        begin
            case (register_adr)

                THR: // either THR or DLL
                begin
                    if (regs_q[LCR][7]) // Divisor Latch Access Bit (DLAB)
                    begin
                        regs_n[DLL + 'd8] = PWDATA[7:0];
                    end
                    else
                    begin
                        fifo_tx_data = PWDATA[7:0];
                        fifo_tx_valid = 1'b1;
                    end
                end

                IER: // either IER or DLM
                begin
                    if (regs_q[LCR][7]) // Divisor Latch Access Bit (DLAB)
                        regs_n[DLM + 'd8] = PWDATA[7:0];
                    else
                        regs_n[IER] = PWDATA[7:0];
                end

                LCR:
                    regs_n[LCR] = PWDATA[7:0];

                FCR: // write only register, fifo control register
                begin
                    rx_fifo_clr_n   = PWDATA[1];
                    tx_fifo_clr_n   = PWDATA[2];
                    trigger_level_n = PWDATA[7:6];
                end

                default: ;
            endcase

        end

    end

    // register read logic
    always_comb
    begin
        PRDATA = 'b0;
        apb_rx_ready = 1'b0;
        fifo_rx_ready = 1'b0;
        clr_int      = 4'b0;

        if (PSEL && PENABLE && !PWRITE)
        begin
            case (register_adr)
                RBR: // either RBR or DLL
                begin
                    if (regs_q[LCR][7]) // Divisor Latch Access Bit (DLAB)
                        PRDATA = {24'b0, regs_q[DLL + 'd8]};
                    else
                    begin

                        fifo_rx_ready = 1'b1;

                        PRDATA = {24'b0, fifo_rx_data[7:0]};

                        clr_int = 4'b1000; // clear Received Data Available interrupt
                    end
                end

                LSR: // Line Status Register
                begin
                    PRDATA = {24'b0, regs_q[LSR]};
                    clr_int = 4'b1100; // clear parrity interrupt error
                end

                LCR: // Line Control Register
                    PRDATA = {24'b0, regs_q[LCR]};

                IER: // either IER or DLM
                begin
                    if (regs_q[LCR][7]) // Divisor Latch Access Bit (DLAB)
                        PRDATA = {24'b0, regs_q[DLM + 'd8]};
                    else
                        PRDATA = {24'b0, regs_q[IER]};
                end

                IIR: // interrupt identification register read only
                begin
                    PRDATA = {24'b0, 1'b1, 1'b1, 2'b0, IIR_i};
                    clr_int = 4'b0100; // clear Transmitter Holding Register Empty
                end

                default: ;
            endcase
        end
    end

    // synchronouse part
    always_ff @(posedge CLK, negedge RSTN)
    begin
        if(~RSTN)
        begin

            regs_q[IER]       <= 8'h0;
            regs_q[IIR]       <= 8'h1;
            regs_q[LCR]       <= 8'h0;
            regs_q[MCR]       <= 8'h0;
            regs_q[LSR]       <= 8'h60;
            regs_q[MSR]       <= 8'h0;
            regs_q[SCR]       <= 8'h0;
            regs_q[DLM + 'd8] <= 8'h0;
            regs_q[DLL + 'd8] <= 8'h0;

            trigger_level_q <= 2'b00;
            tx_fifo_clr_q   <= 1'b0;
            rx_fifo_clr_q   <= 1'b0;
        end
        else
        begin
            regs_q <= regs_n;
            
            trigger_level_q <= trigger_level_n;
            tx_fifo_clr_q   <= tx_fifo_clr_n;
            rx_fifo_clr_q   <= rx_fifo_clr_n;
        end

        cfg_div_o <= {regs_q[DLM + 'd8], regs_q[DLL + 'd8]};
        cfg_stop_bits_o <= regs_q[LCR][2];
        cfg_parity_en_o <= regs_q[LCR][3];
        cfg_bits_o <= regs_q[LCR][1:0];

        IER_o <= regs_q[IER][2:0];
        RDA_o <= regs_n[LSR][5];
        error_int <= regs_n[LSR][2];
    end

    assign register_adr = {PADDR[2:0]};
    // APB logic: we are always ready to capture the data into our regs
    // not supporting transfare failure
    assign PREADY  = 1'b1;
    assign PSLVERR = 1'b0;

endmodule
