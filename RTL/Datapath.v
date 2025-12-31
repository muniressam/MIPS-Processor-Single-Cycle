module Datapath #(parameter width = 32) (
    input  wire                 clk,
    input  wire                 rst_n,
    input  wire [width-1 : 0]   ReadData,
    input  wire [width-1 : 0]   Instr,

    input  wire [2:0]           ALUControl,
    input  wire                 PCSrc,
    input  wire                 MemtoReg,
    input  wire                 ALUSrc,
    input  wire                 RegDst,
    input  wire                 RegWrite,
    input  wire                 Jump,

    output wire                 zero,
    output wire [width-1 : 0]   ALUResult,
    output wire [width-1 : 0]   WriteData,
    output wire [width-1 : 0]   PC

);

wire [width-1 : 0] PCPlus4;
wire [4:0]         WriteReg;
wire [width-1 : 0] Result;
wire [width-1 : 0] RD1;
wire [width-1 : 0] SignImm;
wire [width-1 : 0] PCBranch;
wire [width-1 : 0] SrcB;


PC_MUX_flip inst_PC_MUX_flip(
    .clk     (clk),
    .rst_n   (rst_n),
    .Jump    (Jump),
    .PCSrc   (PCSrc),
    .PCBranch(PCBranch),
    .PCPlus4 (PCPlus4),
    .Instr   (Instr),
    .PC      (PC)
);

PCPlus4 inst_PCPlus4 (
    .PC (PC),
    .PCPlus4(PCPlus4)
    
);

MUX inst_MUX_Result(
    .SEL(MemtoReg),
    .IN1(ALUResult),
    .IN2(ReadData),
    .OUT(Result)
);

Register_File inst_Register_File(
    .clk  (clk),
    .rst_n(rst_n),
    .WE3  (RegWrite),
    .A1   (Instr[25:21]),
    .A2   (Instr[20:16]),
    .A3   (WriteReg),
    .WD3  (Result),
    .RD1  (RD1), 
    .RD2  (WriteData)
);

Sign_Extend inst_Sign_Extend (
    .Instr  (Instr),
    .SignImm(SignImm)
);

MUX_Regdst inst_MUX_WriteReg (
    .Instr   (Instr),
    .RegDst  (RegDst),
    .WriteReg(WriteReg)
);

PCBranch inst_PCBranch (
    .SignImm (SignImm),
    .PCPlus4 (PCPlus4),
    .PCBranch(PCBranch)
);

MUX inst_MUX_ALU (
    .SEL(ALUSrc),
    .IN1(WriteData),
    .IN2(SignImm),
    .OUT(SrcB)
);

ALU inst_ALU (
    .ALUControl(ALUControl),
    .SrcB      (SrcB),
    .zero      (zero),
    .SrcA      (RD1),
    .ALUResult (ALUResult)
);

endmodule