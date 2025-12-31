onerror {resume}
quietly virtual signal -install /MIPS_TB { (context /MIPS_TB )&{inst_Instruction_Memory/PC ,DUT/inst_Datapath/PCPlus4 ,DUT/inst_Datapath/PCBranch }} PC_signals
quietly WaveActivateNextPane {} 0
add wave -noupdate /MIPS_TB/DUT/clk
add wave -noupdate /MIPS_TB/DUT/rst_n
add wave -noupdate /MIPS_TB/DUT/Instr
add wave -noupdate /MIPS_TB/DUT/ReadData
add wave -noupdate /MIPS_TB/DUT/ALUOut
add wave -noupdate /MIPS_TB/DUT/WriteData
add wave -noupdate /MIPS_TB/DUT/PC
add wave -noupdate /MIPS_TB/DUT/MemWrite
add wave -noupdate /MIPS_TB/DUT/MemtoReg
add wave -noupdate -color Cyan /MIPS_TB/DUT/PCSrc
add wave -noupdate /MIPS_TB/DUT/ALUControl
add wave -noupdate /MIPS_TB/DUT/ALUSrc
add wave -noupdate /MIPS_TB/DUT/RegDst
add wave -noupdate /MIPS_TB/DUT/RegWrite
add wave -noupdate /MIPS_TB/DUT/Jump
add wave -noupdate /MIPS_TB/DUT/zero
add wave -noupdate /MIPS_TB/inst_Data_Memory/clk
add wave -noupdate /MIPS_TB/inst_Data_Memory/WE
add wave -noupdate /MIPS_TB/inst_Data_Memory/Address
add wave -noupdate /MIPS_TB/inst_Data_Memory/WriteData
add wave -noupdate /MIPS_TB/inst_Data_Memory/ReadData
add wave -noupdate /MIPS_TB/inst_Instruction_Memory/Instr
add wave -noupdate /MIPS_TB/PC_signals
add wave -noupdate /MIPS_TB/inst_Instruction_Memory/PC
add wave -noupdate /MIPS_TB/DUT/inst_Datapath/PCPlus4
add wave -noupdate /MIPS_TB/DUT/inst_Datapath/PCBranch
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {75164 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {424200 ps}
