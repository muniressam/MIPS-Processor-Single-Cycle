module Data_Memory #(parameter width = 32) (
    input wire clk,
    input wire rst_n,
    input wire WE,
    input wire [width-1 : 0] Address,
    input wire [width-1 : 0] WriteData,

    output wire [width-1 : 0] ReadData
);

reg [width-1 : 0] ROM [0: 255];
integer i;
always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
        for(i=0 ; i<256 ; i= i+1 ) begin
           ROM[i] = {width{1'b0}}; 
        end
    end
    else if(WE) begin
        ROM[Address] <= WriteData;
    end
end

assign ReadData = ROM[Address];
endmodule