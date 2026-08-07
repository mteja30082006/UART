`timescale 1ns/1ps

module uart_tx_tb;

reg clk;
reg reset;
reg tx_start;
reg [7:0] tx_data;

wire tx;
wire busy;

uart_tx uut(
    .clk(clk),
    .reset(reset),
    .tx_start(tx_start),
    .tx_data(tx_data),
    .tx(tx),
    .busy(busy)
);

always #5 clk = ~clk;

initial
begin
    clk = 0;
    reset = 1;
    tx_start = 0;
    tx_data = 8'h00;

    #20;
    reset = 0;

    #20;
    tx_data = 8'hA5;
    tx_start = 1;

    #10;
    tx_start = 0;

    #150;

    tx_data = 8'h3C;
    tx_start = 1;

    #10;
    tx_start = 0;

    #150;

    $finish;
end

initial
begin
    $monitor("Time=%0t reset=%b start=%b data=%h tx=%b busy=%b",
              $time, reset, tx_start, tx_data, tx, busy);
end

endmodule