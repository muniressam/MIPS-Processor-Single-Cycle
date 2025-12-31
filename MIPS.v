module MIPS #(parameter width = 32) (
    input wire clk,
    input wire rst_n,
    input wire [width-1 : 0] Instr,
    input wire [width-1 : 0] ReadData,

    output wire [width-1 : 0] ALUOut,
    output wire [width-1 : 0] WriteData,
    output wire [width-1 : 0] PC,
    output wire               MemWrite
);

wire MemtoReg;
wire PCSrc;
wire [2:0] ALUControl;
wire ALUSrc;
wire RegDst;
wire RegWrite;
wire Jump;
wire zero;

Control_Unit inst_Control_Unit (
    .Jump      (Jump),
    .RegDst    (RegDst),
    .ALUControl(ALUControl),
    .MemWrite  (MemWrite),
    .Funct     (Instr[5:0]),
    .PCSrc     (PCSrc),
    .ALUSrc    (ALUSrc),
    .MemtoReg  (MemtoReg),
    .RegWrite  (RegWrite),
    .zero      (zero),
    .Opcode    (Instr[31:26])
);

Datapath inst_Datapath (
    .Jump      (Jump),
    .RegDst    (RegDst),
    .ALUControl(ALUControl),
    .zero      (zero),
    .Instr     (Instr),
    .PCSrc     (PCSrc),
    .rst_n     (rst_n),
    .clk       (clk),
    .MemtoReg  (MemtoReg),
    .ALUSrc    (ALUSrc),
    .ReadData  (ReadData),
    .RegWrite  (RegWrite),
    .ALUResult (ALUOut),
    .WriteData (WriteData),
    .PC        (PC)
    

);
    
endmodule