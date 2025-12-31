`timescale 1ns/1ps

module MIPS_TB #(parameter width = 32) (
);
    reg clk;
    reg rst_n;

    wire [width-1 : 0] Instr;
    wire [width-1 : 0] ReadData;
    wire [width-1 : 0] ALUOut;
    wire [width-1 : 0] WriteData;
    wire [width-1 : 0] PC;
    wire               MemWrite;

    localparam clk_period = 5 ;

    MIPS DUT (
        .clk      (clk),
        .rst_n    (rst_n),
        .Instr    (Instr),
        .ReadData (ReadData),
        .MemWrite (MemWrite),
        .ALUOut   (ALUOut),
        .WriteData(WriteData),
        .PC       (PC)
    );

    Data_Memory inst_Data_Memory (
        .clk      (clk),
        .rst_n    (rst_n),
        .WE       (MemWrite),
        .Address  (ALUOut),
        .WriteData(WriteData),
        .ReadData (ReadData)
    );

    Instrustion_Memory inst_Instruction_Memory(
        .PC   (PC),
        .Instr(Instr)
        
    );

always #(clk_period / 2)  clk = ~clk;

initial begin
    clk = 0;
end
initial begin
    $dumpfile("MIPS.vcd");
    $dumpvars(MIPS_TB.DUT);

    rst_n = 0;
    @(negedge clk) ;
    rst_n = 1;
    repeat (100)  @(negedge clk);
    $stop;
    
end
endmodule