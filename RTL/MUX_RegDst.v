module MUX_Regdst #(parameter width = 32) (
    input wire [width-1 : 0] Instr,
    input wire RegDst,
    output wire [4:0] WriteReg
);

assign WriteReg = (RegDst == 1'b0) ? Instr[20:16] : Instr[15:11];

    
endmodule