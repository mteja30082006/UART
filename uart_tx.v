module uart_tx(
    input clk,
    input reset,
    input tx_start,
    input [7:0] tx_data,
    output reg tx,
    output reg busy
);

reg [3:0] bit_count;
reg [9:0] shift_reg;

always @(posedge clk or posedge reset)
begin
    if(reset)
    begin
        tx <= 1'b1;
        busy <= 0;
        bit_count <= 0;
        shift_reg <= 10'b1111111111;
    end
    else
    begin
        if(tx_start && !busy)
        begin
            busy <= 1;
            shift_reg <= {1'b1, tx_data, 1'b0}; // Stop, Data, Start
            bit_count <= 10;
        end
        else if(busy)
        begin
            tx <= shift_reg[0];
            shift_reg <= {1'b1, shift_reg[9:1]};
            bit_count <= bit_count - 1;

            if(bit_count == 1)
            begin
                busy <= 0;
                tx <= 1'b1;
            end
        end
    end
end

endmodule